
## Kirkstone Base Image

Download
https://saleshosted.z13.web.core.windows.net/quickstart/yocto/lorabasics/stm32mp157-kirkstone-05282024.zip
Extract
Program

## Install Basicstation on Yocto Target
Clone the Repository:

bash

git clone https://github.com/avnet-iotconnect/iotc-lora-demos.git

Navigate to the Specific Directory:

bash

cd iotc-lora-demos/basicstation/stm32mp157/basicstation

Transfer the Directory to the Yocto Target:

    bash

scp -r basicstation/stm32mp157/basicstation root@<target-ip>:/home/

Notes
    Ensure that SSH and SCP are enabled and correctly configured on your Yocto target.
    Adjust the target directory paths as necessary to fit your file structure and permissions on the Yocto target.
    Replace <username> and <target-ip> with the appropriate SSH credentials and IP address for your Yocto device.

## Configure Gateway to IoTConnect
Note, this is adapted from the instructions provided from the IoTConnect Documentation:  https://docs.iotconnect.io/iotconnect/user-manuals/devices/device/lorawan/

1) From the left navigation, mouseover the Devices module. Click Wireless Device.
2) Along the bottom center toward the left, select LoRaWAN gateway.
3) Enter data in the following fields:
   - Gateway Name: Enter the display name for a Gateway device.
   - EUI Code: Provide the gateway EUI.
      note: The gateway EUI is derived from the MAC address and stays constant - there are a few ways to retrieve it, but probably the simplest way here is to run ./start-station.sh briefly and stop it with ctrl+c. The EUI will be output in the first few lines of output in the form e.g.: 2024-05-29 12:22:17.945 [SYS:INFO] Station EUI : 10e7:7aff:fee1:92eb
   - Frequency Band: Choose a frequency band for the geographic region e.g. US915 for North America, EU868 for Europe.
4) Once you create and store gateway credentials, you will can download the cups certificate files on your host machine. 
    <gateway id>.cert.pem: Gateway device certificate file.
    <gateway id>.private.key: Gateway device private key file.

   <img>(https://docs.iotconnect.io/wp-content/themes/iotconnect/assets/img/image1.png)
5) Unzip the files and transfer them to the target

```
scp <local>/ root@<target-ip>:/home/
scp Downloads/certificate.pem.crt root@192.168.68.79:/home/basicstation/projects/iotc/lns-iotc/cups.crt
scp Downloads/private.key root@192.168.68.79:/home/basicstation/projects/iotc/lns-iotc/cups.key
```
6) CUPS URI and LNS URI can be found on the Settings–>Key Vault interface.  Create files "tc.uri" and "cups.uri" that contain the links provided in the IoTConnect Key vault
   In tc.uri put LNS (LoRaWAN Network Server endpoint) endpoint. i.e.,wss:// websockets url 
   ```
   cd /home/basicstation/projects/iotc/lns-iotc
   vi cups.uri
   ```
   Enter "i" to edit
   paste URL
   Press ESC key, then ":wq" to save and quit

   In cups.uri put CUPS (Configuration and update Server) endpoint. i.e., https:// cups url 
   ```
   vi cups.uri
   ```
   Enter "i" to edit
   paste URL
   Press ESC key, then ":wq" to save and quit
       https://docs.iotconnect.io/wp-content/themes/iotconnect/assets/img/image2.png  
8) Download Server Trust Certificates, unzip the files and transfer them to the target
  
  ```
  scp Downloads/cups.trust root@<target-ip>:/home/basicstation/projects/iotc/lns-iotc/cups.trust
  scp Downloads/lns.trust root@<target-ip>:/home/basicstation/projects/iotc/lns-iotc/tc.trust
  ```
   https://docs.iotconnect.io/wp-content/themes/iotconnect/assets/img/image3.png

in lns-iotc you should have:

station.conf
cups.crt
cups.key
cups.trust
cups.uri
tc.crt
tc.trust
tc.uri

## Run The Station

Ensure all scripts are executable
```
cd basicstation/projects/iotc/
chmod +x *.sh
./start-station.sh -l lns-iotc
```

check connection at IOTC

## Optional, add wifi or change wifi credentials

Unplug Ethernet
```
cd /home/basicstation/projects/iotc
chmod +x wifi-setup.sh
./wifi-setup.sh
```

## Optional:  Configure to run at startup
create the script file:

bash

sudo nano /usr/local/bin/start_gateway.sh

Paste the script content above and save it.

Make the script executable:

bash

sudo chmod +x /usr/local/bin/start_gateway.sh

Create a systemd service file:

bash

sudo nano /etc/systemd/system/start-gateway.service

Add the following content:

ini

[Unit]
Description=Start Gateway Service
After=network.target

[Service]
ExecStart=/usr/local/bin/start_gateway.sh
StandardOutput=inherit
StandardError=inherit
Restart=always
User=root

[Install]
WantedBy=multi-user.target

Enable and start the service:

bash

sudo systemctl daemon-reload
sudo systemctl enable start-gateway.service
sudo systemctl start start-gateway.service
