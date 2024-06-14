
## Kirkstone Base Image

Download
https://saleshosted.z13.web.core.windows.net/quickstart/yocto/lorabasics/stm32mp157-kirkstone-05282024.zip
Extract
Program

Install Basicstation
Download at: https://saleshosted.z13.web.core.windows.net/quickstart/yocto/lorabasics/stm32mp157-kirkstone-05282024.zip

Optional, add wifi

Optional:  Configure to run at startup
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
