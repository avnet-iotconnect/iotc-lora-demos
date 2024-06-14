# STM32MP157 LoRa Basicstation Gateway Setup Guide

## Download, Extract, and Program

1. **Download** the STM32MP157 Kirkstone image:
   - [Download the image](https://saleshosted.z13.web.core.windows.net/quickstart/yocto/lorabasics/stm32mp157-kirkstone-05282024.zip)

2. **Extract** the downloaded zip file.

3. **Program** the image to your STM32MP157 device using your preferred method.

## Install Basicstation on Yocto Target

### Clone the Repository

```bash
git clone https://github.com/avnet-iotconnect/iotc-lora-demos.git
```
### Navigate to the Specific Directory

```bash
cd iotc-lora-demos/basicstation/stm32mp157/basicstation
```

### Transfer the Directory to the Yocto Target

```bash
scp -r basicstation/stm32mp157/basicstation root@<target-ip>:/home/
```
Notes:
    Ensure that SSH and SCP are enabled and correctly configured on your Yocto target.
    Adjust the target directory paths as necessary to fit your file structure and permissions on the Yocto target.
    Replace <target-ip> with the IP address of your Yocto device.

## Configure Gateway to IoTConnect

These steps are adapted from the IoTConnect Documentation.

1) From the left navigation, mouse over the Devices module. Click Wireless Device.
2) Towards the bottom left, select LoRaWAN Gateway.
3) Enter data in the following fields:
        Gateway Name: Enter a display name for the Gateway device.
        EUI Code: Provide the gateway EUI (the EUI can be found by running ./start-station.sh briefly and stopping it with ctrl+c. The EUI is output in the form 2024-05-29 12:22:17.945 [SYS:INFO] Station EUI : 10e7:7aff:fee1:92eb).
        Frequency Band: Choose the frequency band appropriate for your geographic region, e.g., US915 for North America, EU868 for Europe.
4) Download the CUPS certificate files:
        <gateway id>.cert.pem: Gateway device certificate file.
        <gateway id>.private.key: Gateway device private key file.

    Image

5) Transfer the certificate files to the target:

``` bash
scp Downloads/certificate.pem.crt root@<target-ip>:/home/basicstation/projects/iotc/lns-iotc/cups.crt
scp Downloads/private.key root@<target-ip>:/home/basicstation/projects/iotc/lns-iotc/cups.key
```

6) Create and configure CUPS and LNS URIs from the IoTConnect Key Vault:

``` bash
cd /home/basicstation/projects/iotc/lns-iotc
vi tc.uri
# Enter the LNS (LoRaWAN Network Server endpoint) URL in the file
# Press ESC and then :wq to save and quit

vi cups.uri
# Enter the CUPS (Configuration and Update Server) URL in the file
# Press ESC and then :wq to save and quit
```

Image

7) Download Server Trust Certificates and transfer them to the target:

``` bash

scp Downloads/cups.trust root@<target-ip>:/home/basicstation/projects/iotc/lns-iotc/cups.trust
scp Downloads/lns.trust root@<target-ip>:/home/basicstation/projects/iotc/lns-iotc/tc.trust
```
Image
The lns-iotc directory should now contain:

    station.conf
    cups.crt
    cups.key
    cups.trust
    cups.uri
    tc.trust
    tc.uri
    
## Run The Station

Ensure all scripts are executable and start the gateway:

```bash

cd /home/basicstation/projects/iotc/
chmod +x *.sh
./start-station.sh -l lns-iotc
```
Check the connection at IoTConnect.

## Optional: Add or Change WiFi Credentials

    Unplug Ethernet (if necessary).
    Run the WiFi setup script:

```bash

cd /home/basicstation/projects/iotc
chmod +x wifi-setup.sh
./wifi-setup.sh
```

## Optional: Configure Gateway to Run at Startup

    Create a systemd service file:

``` bash

vi /etc/systemd/system/start-gateway.service
```
    Add the following content:

```
[Unit]
Description=Start Gateway Service
After=network.target

[Service]
ExecStart=/home/root/basicstation/projects/iotc/check_and_start.sh
StandardOutput=journal+console
StandardError=journal+console
Restart=always
User=root

[Install]
WantedBy=multi-user.target
```

###    Enable and start the service:

``` bash

systemctl daemon-reload
systemctl enable start-gateway.service
systemctl start start-gateway.service
```

With these steps, you should have a functioning STM32MP157 LoRa Basicstation gateway connected to IoTConnect. If you encounter any issues, please refer to the IoTConnect documentation or seek assistance from the community.
