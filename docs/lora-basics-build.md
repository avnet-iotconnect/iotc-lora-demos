# Setting Up Lora Basics Station on STM32MP157DK

These instructions should enable a working system to be created. The setup is based on a Dunfell build that will run on a HAL-patched Kirkstone.
  
### Step 1: Create Environment 
<details> <summary>Click to expand</summary>
Follow the instructions to build a Yocto image at STM32MP1 Distribution Package:

```
mkdir openstlinux-5.10-dunfell-mp1-21-11-17
cd openstlinux-5.10-dunfell-mp1-21-11-17
repo init -u https://github.com/STMicroelectronics/oe-manifest.git -b refs/tags/openstlinux-5.10-dunfell-mp1-21-11-17
repo sync
DISTRO=openstlinux-weston MACHINE=stm32mp1 source layers/meta-st/scripts/envsetup.sh
```

Append build tools in ./build-openstlinuxweston-stm32mp1/conf/bblayers.conf:

```
EXTRA_IMAGE_FEATURES += " tools-sdk tools-debug debug-tweaks"
IMAGE_INSTALL:append = "git"
```

These tools are large; the default maximum filesystem size must be increased. Edit STM32MP_ROOTFS_MAXSIZE_NAND in ./layers/meta-st/meta-st-stm32mp/conf/machine/include/st-machine-common-stm32mp.inc replacing the set value with a larger number (>800000 ... 1232896?).

Now you can build:

```
bitbake st-image-weston
```
</details> 

### Step 2: Flash Target Device
<details> <summary>Click to expand</summary>
Follow the instructions at Flashing the built image:

```
STM32_Programmer_CLI -c port=usb1 -w flashlayout_st-image-weston/trusted/FlashLayout_sdcard_stm32mp157c-dk2-trusted.tsv
```
</details>

### Step 3: Compile Lora Basics Station on Dunfell Host
<details> <summary>Click to expand</summary>
SSH into root@stm32mp1.local (or by IP).

Obtain and compile basicstation:
```
git clone https://github.com/lorabasics/basicstation.git
cd basicstation
```

RAK5146 is CoreCell compliant. The build is based closely on the corecell platform example. Create a symlink for the STM32 platform to arm-ostl-linux-gnueabi-gcc:

```
ln -s /usr ~/toolchain-stm32
```

Edit ./setup.gmk echoing corecell setup for RAK5146 on STM32 platform:

```
ARCH.stm32 = arm-ostl-linux-gnueabi
CFG.stm32 = linux lgw1 no_leds sx1302
DEPS.stm32 = mbedtls lgw1302
CFLAGS.stm32.debug = -g O0
LIBS.stm32 = -llgw1302  ${MBEDLIBS} -lpthread -lrt
```

Duplicate the corecell patch:
```
cp ./deps/lgw1302/V2.1.0-corecell.patch ./deps/lgw1302/V2.1.0-stm32.patch
```

Edit line 239 of ./src/ral_lgw.c replacing: ***if( err != LGW_LBT_ISSUE ) {*** with:
```
if( err != 1) { //LGW_LBT_ISSUE ) {
```
Make Lora Basics Station:
```
make platform=stm32 variant=std
make platform=stm32 variant=debug
```

Copy ~/basicstation to a local filesystem.
</details>

### Step 4: Build Patched Kirkstone Image
<details> <summary>Click to expand</summary>
Create the build environment:

bash
Copy code
mkdir iotconnect-stm32mp17-kirkstone
cd iotconnect-stm32mp17-kirkstone
repo init -u https://github.com/STMicroelectronics/oe-manifest.git -b refs/tags/openstlinux-5.15-yocto-kirkstone-mp1-v23.07.26
repo sync
Get Makefile and Dockerfile:

```
wget https://raw.githubusercontent.com/avnet-iotconnect/iotc-lora-gateway-example/master/Makefile
wget https://raw.githubusercontent.com/avnet-iotconnect/iotc-lora-gateway-example/master/Dockerfile
```
Clone the necessary repository and initialize submodules:
```
git clone git@github.com:avnet-iotconnect/iotc-lora-gateway-example.git -b master ./layers/iotconnect-lora-demo
cd ./layers/iotconnect-lora-demo
git submodule update --init
cd -
```
Build the Docker environment:
```
make docker
```
Set up the environment:
```
DISTRO=openstlinux-weston MACHINE=stm32mp1 source layers/meta-st/scripts/envsetup.sh
```
Accept all EULAs
```
exit
make env
bitbake-layers add-layer ../layers/iotconnect-lora-demo/meta-st-stm32mpu-app-lorawan/
exit
```
Remove unnecessary layers and configurations:
```
rm -rf meta-iotconnect-lora-demo/
rm -rf recipes-framework recipes-st
```

Comment out all the IMAGE_INSTALL:append content in ./layers/iotconnect-lora-demo/meta-st-stm32mpu-app-lorawan/conf/layer.conf.

Now you can build:
```
make build
```

Flash the device:
```
STM32_Programmer_CLI -c port=usb1 -w flashlayout_st-image-weston/trusted/FlashLayout_sdcard_stm32mp157c-dk2-trusted.tsv
```
</details>

### Step 5: Configure and Run Lora Basics Station
<details> <summary>Click to expand</summary>
Return to the local folder where you stored the basicstation build and copy it to the target device:
```
scp -r ./basicstation root@stm32mp1.local:
```

SSH into the target device and set up the necessary scripts:
```
ssh root@stm32mp1.local
cd basicstation/projects/iotc/
cp ../../examples/corecell/start-station.sh ./
sed -i 's/corecell/stm32/g' start-station.sh
```
Create concentrator-reset.sh using libgpiod:
```
#!/bin/bash

gpioset gpiochip6 8=1
sleep 0.1
gpioset gpiochip6 8=0
sleep 0.1
gpioget gpiochip6 8
sleep 0.5
```

Create rinit.sh:
```
#!/bin/bash
./concentrator-reset.sh
```

Configure LNS:
```
mkdir lns-iotc
cd lns-iotc
cp ../../examples/corecell/lns-ttn/station.conf ./
```

Set pulse per second to true to mitigate clock drifts. Edit station.conf and add "pps": true in "SX1302_conf":{}.

Import certificates from IOTC and set the URLs in tc.uri and cups.uri.

Rename the certificate files:
```
mv certificate.pem.crt cups.crt
mv private.key cups.key
```
In lns-iotc you should have:

 - station.conf
 - cups.crt
 - cups.key
 - cups.trust
 - cups.uri
 - tc.crt
 - tc.key
 - tc.trust
 - tc.uri

Run the station:
```
ssh root@stm32
```
</details>
