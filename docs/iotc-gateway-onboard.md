# LoRaWAN Gateway Setup and Onboarding into IoTConnect

## Create a LoRaWAN Gateway
To create a LoRaWAN gateway device for your organization, follow these steps:

1.  **Access the Gateway Configuration:**
    
    -   From the left navigation menu in IoTConnect, hover over the **Devices** module.
    -   Click on **Wireless Device**.
2.  **Create a Gateway:**
    
    -   Towards the bottom center of the interface, select **LoRaWAN gateway**.
    -   Enter the following details:
        -   **Gateway Name:** Provide a display name for the gateway.
        -   **EUI Code:** Enter the gateway EUI identified in your setup.
        -   **Frequency Band:** Choose the frequency band appropriate for your region (e.g., US915 for North America, EU868 for Europe).
    ![enter image description here](https://docs.iotconnect.io/wp-content/themes/iotconnect/assets/img/image1.png)
    _(Screen: Create Gateway)_
    
3.  **Upload Gateway Credentials:**
    
    -   Once you create and store the gateway credentials, download the certificate files provided in a zip package.
    -   Upload these files to your gateway:
        -   **`<gateway_id>.cert.pem`**: Gateway device certificate file.
        -   **`<gateway_id>.private.key`**: Gateway device private key file.
    ![enter image description here](https://docs.iotconnect.io/wp-content/themes/iotconnect/assets/img/image1.png)
    _(Screen: LoRaWAN Gateways)_
    
4.  **Configure CUPS and LNS URIs:**
    
    -   Retrieve the CUPS (Configuration and Update Server) URI and LNS (LoRaWAN Network Server) URI from the **Settings > Key Vault** interface in IoTConnect.
    -   Download the server trust certificates and configure your gateway with these URIs and certificates.
![enter image description here](https://docs.iotconnect.io/wp-content/themes/iotconnect/assets/img/image2.png)
![enter image description here](https://docs.iotconnect.io/wp-content/themes/iotconnect/assets/img/image3.png)

		_(Screen: LoRaWAN Certificates)_
    
## Available LoRaWAN Gateways
- Advantech
	- [WISE-6610](https://partners.amazonaws.com/devices/a3G8a00000E2okZEAR/Advantech%20WISE-6610) <img src="https://github.com/user-attachments/assets/29b606c8-731a-4482-b70e-1798e963d6ae" height="60"/>
- Dragino
	- [LPS8 Gateway](https://partners.amazonaws.com/devices/a3G0h00000AjwBrEAJ/LPS8%20LoRaWAN%20Gateway) <img src="https://c.na65.content.force.com/servlet/servlet.ImageServer?id=0150h000004xExrAAE&oid=00DE0000000c48tMAA" height="60"/>
 	- [DLOS8 Outdoor Gateway](https://partners.amazonaws.com/devices/a3G0h00000AjwC1EAJ/DLOS8%20Outdoor%20LoRaWAN%20Gateway) <img src="https://c.na65.content.force.com/servlet/servlet.ImageServer?id=0150h000004xEyGAAU&oid=00DE0000000c48tMAA" height="60"/>
	- [LG308 Pico Gateway](https://partners.amazonaws.com/devices/a3G0h00000AjwBwEAJ/LoRaWAN%20Indoor%20Gateway) <img src="https://c.na65.content.force.com/servlet/servlet.ImageServer?id=0150h000004xEy9AAE&oid=00DE0000000c48tMAA" height="60"/>
 	- [LIG16 Indoor Gateway](https://partners.amazonaws.com/devices/a3G0h00000EU2PLEA1/LIG16) <img src="https://c.na65.content.force.com/servlet/servlet.ImageServer?id=0150h0000056D67AAE&oid=00DE0000000c48tMAA" height="60"/>
- Ezurio
	- [Sentrius RG1xx Indoor Gateway](https://partners.amazonaws.com/devices/a3G0h000007dhzqEAA/Sentrius%20RG1xx%20LoRaWAN%20Gateway) <img src="https://github.com/user-attachments/assets/ee4064b4-58f6-4dd5-904d-88885ca7d668" height="60"/>
- Kerlink
	- [Wirnet iFemtoCell-evolution](https://partners.amazonaws.com/devices/a3G0h000007dhxwEAA/Wirnet%20iFemtoCell-evolution) <img src="https://c.na65.content.force.com/servlet/servlet.ImageServer?id=0150h000005634kAAA&oid=00DE0000000c48tMAA" height="60"/>
	- [Wirnet iFemtoCell](https://partners.amazonaws.com/devices/a3G0h000007dhy1EAA/Wirnet%20iFemtoCell) <img src="https://c.na65.content.force.com/servlet/servlet.ImageServer?id=0150h000005634zAAA&oid=00DE0000000c48tMAA" height="60"/>
	- [Wirnet iStation Outdoor Gateway](https://partners.amazonaws.com/devices/a3G0h000007dhxwEAA/Wirnet%20iFemtoCell-evolution) <img src="https://c.na65.content.force.com/servlet/servlet.ImageServer?id=0150h000005635JAAQ&oid=00DE0000000c48tMAA" height="60"/> 
- MultiTech
	- [Conduit® AP Indoor Gateway](https://partners.amazonaws.com/devices/a3G0h000007di1wEAA/MultiTech%20Conduit%C2%AE%20AP) <img src="https://github.com/user-attachments/assets/336a017b-99ff-4790-b44f-f01960f71a19" height="60"/>
	- [Conduit Conduit® LTE Cat-4 Gateway](https://partners.amazonaws.com/devices/a3G0h000007di1wEAA/MultiTech%20Conduit%C2%AE%20AP) <img src="https://c.na65.content.force.com/servlet/servlet.ImageServer?id=0150h00000563DXAAY&oid=00DE0000000c48tMAA" height="60"/>
	- [Conduit® 300 Series Gateway](https://partners.amazonaws.com/devices/a3G0h000007di0tEAA/MultiTech%20Conduit%C2%AE%20300%20Gateway) <img src="https://c.na65.content.force.com/servlet/servlet.ImageServer?id=0150h00000563CoAAI&oid=00DE0000000c48tMAA" height="60"/>
 - Discrete Gateway Reference Designs
	- STMicroelectronics STM32MP157 LoRa Basicstation Gateway
 <details> <summary><img src="https://wiki.st.com/stm32mpu-ecosystem-v3/nsfr_img_auth.php/1/13/RAKModule_4a.png" height="60"/></summary>
	 
	 #### Assemble the Gateway

This sample uses the STM32MP157 DK and RAK5146 Concentrator stack board with USB. Follow section 2.2, [Hardware Prerequisites](https://wiki.st.com/stm32mpu-ecosystem-v3/wiki/How_to_integrate_LoRaWAN_gateway#Hardware_prerequisites), and section 3, [Hardware Setup](https://wiki.st.com/stm32mpu-ecosystem-v3/wiki/How_to_integrate_LoRaWAN_gateway#Hardware_setup) of the application blog, "How to integrate LoRaWAN gateway" from STMicroelectronics.

#### Download, Extract, and Program

1.  **Download the STM32MP157 Kirkstone Image:**
    
    -   Download the image from the provided link.
    -   Extract the downloaded zip file.
2.  **Program the Image:**
    
    -   Program the image to your STM32MP157 device using your preferred method.

#### Install Basic Station on Yocto Target

1.  **Clone the Repository to your build machine:**
  ```  
  git clone https://github.com/avnet-iotconnect/iotc-lora-demos.git`
```
2.  **Navigate to the Specific Directory:**
 ```
cd iotc-lora-demos/basicstation/stm32mp157/basicstation` 
```

4.  **Transfer the Directory to the Yocto Target:**

 ```
    scp -r basicstation/stm32mp157/basicstation root@<target-ip>:/home/
```
**Note:** Ensure SSH and SCP are enabled on your Yocto target. Adjust the target directory paths as necessary to fit your file structure and permissions. Replace `<target-ip>` with the IP address of your Yocto device.

#### Configure Gateway to IoTConnect

1.  **Configure Gateway in IoTConnect:**
    
    -   Navigate to **Devices > Wireless Device**.
    -   Select **LoRaWAN Gateway**.
2.  **Enter Configuration Details:**
    
    -   **Gateway Name:** Enter a display name for the gateway device.
    -   **EUI Code:** Find the EUI by running `./start-station.sh` briefly and stopping it. The EUI is displayed in the log as `Station EUI: xxxx:xxxx:xxxx:xxxx`.
    -   **Frequency Band:** Select the appropriate frequency band for your region.
3.  **Download and Transfer CUPS and LNS Certificates:**
    
    -   Download the CUPS certificate files (`.cert.pem` and `.private.key`).
    -   Transfer these files to the target:
 ``` 
 scp Downloads/certificate.pem.crt root@<target-ip>:/home/basicstation/projects/iotc/lns-iotc/cups.crt
 scp Downloads/private.key root@<target-ip>:/home/basicstation/projects/iotc/lns-iotc/cups.key` 
 ```
         
4.  **Configure URIs:**
    
    -   Change to the LNS directory and edit the URI files:
 ```
        cd /home/basicstation/projects/iotc/lns-iotc
        vi tc.uri
        # Enter the LNS URL and save the file
        vi cups.uri
        # Enter the CUPS URL and save the file` 
```
        
5.  **Transfer Server Trust Certificates:**
    
    -   Download and transfer the trust certificates:
        
```
scp Downloads/cups.trust root@<target-ip>:/home/basicstation/projects/iotc/lns-iotc/cups.trust
scp Downloads/lns.trust root@<target-ip>:/home/basicstation/projects/iotc/lns-iotc/tc.trust` 
````


        
6.  **Directory Structure:**
    
    -   Ensure the `lns-iotc` directory contains the following files:
        -   `station.conf`
        -   `cups.crt`
        -   `cups.key`
        -   `cups.trust`
        -   `cups.uri`
        -   `tc.trust`
        -   `tc.uri`
7.  **Run The Station:**
    
    -   Make sure all scripts are executable and start the gateway
```
cd /home/basicstation/projects/iotc/
chmod +x *.sh
./start-station.sh -l lns-iotc` 
```
-   Check the connection status in IoTConnect.

#### Optional Configurations

1.  **Add or Change WiFi Credentials:**
    
    -   Run the WiFi setup script if necessary:
```
	cd /home/basicstation/projects/iotc
        chmod +x wifi-setup.sh
        ./wifi-setup.sh` 
 ```       
2.  **Configure Gateway to Run at Startup:**
    
    -   Create a systemd service file to start the gateway automatically on boot:
```
vi /etc/systemd/system/start-gateway.service
```
- Add the following content to the makefile
```
[Unit]
Description=Start Gateway Service
After=network.target

[Service]
ExecStart=/home/root/basicstation/check_and_start.sh
StandardOutput=journal+console
StandardError=journal+console
Restart=always
User=root

[Install]
WantedBy=multi-user.target
```        
 -   Enable and start the service:
        ```
        systemctl daemon-reload
        systemctl enable start-gateway.service
        systemctl start start-gateway.service
        ```
   </details>         

With these steps, you should have a fully functional STM32MP157 LoRa Basicstation gateway connected to IoTConnect. For any issues, refer to the [IoTConnect Documentation](https://docs.iotconnect.io/iotconnect) or seek assistance from the IoTConnect Ticket System.
