
# LoRa Device Onboarding into IoTConnect

*Inspired by[IoTConnect Docs](https://docs.iotconnect.io/iotconnect)*

<img src="https://docs.iotconnect.io/wp-content/uploads/2023/12/image3-1.png" width="300"/>  

## Device-Specific Information
**STMicroelectronics [ASTRA1B](https://www.st.com/en/evaluation-tools/steval-astra1b.html)**
<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuUvwhUi2eIfRwAxsZLPgo0tNGBRt2WQ2Z-A&s" height="60"/>  

|--------**Attribute**------|--------**Data Type** -----|---**Object Properties(type)**----|


|-------temperature----|---------decimal-------|---------------------------------|

|--------pressure--------|--------  decimal-------|---------------------------------|

|--------humidity--------|---------decimal------|---------------------------------|

|-----accelerometer-----|---------object--------|--x(dec)--|--y(dec)--|--z(dec)--|

|---------location--------|---------object--------|--lat_lon(latlong)--|--alt(dec)--|

|--------analogInput-----|-------decimal--------|---------------------------------|

|--------digitalInput------|-------boolean-------|---------------------------------|

|-------digitalOutput-----|-------boolean-------|---------------------------------|

|----------status----------|--------integer-------|---------------------------------|

|-----decoder_name-----|--------string---------|---------------------------------|


**STMicroelectronics [NUCLEO-WL55JC](https://www.st.com/en/evaluation-tools/nucleo-wl55jc.html)** 

<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrhG19rSOKs0jSERjxYrv5qBlnB6VIhseXfQ&s" height="60"/>

|--------**Attribute**------|--------**Data Type** -----|


|-------temperature----|---------decimal-------|

|--------pressure--------|--------  decimal-------|

|--------humidity--------|---------decimal------|

|-----battery_value------|---------decimal------|

|----------led-------------|-------boolean-------|

|----------status----------|--------integer-------|

|-----decoder_name-----|-------string----------|

## Device Templates

A template is a pre-defined structure required to manage LoRaWAN devices and their associated properties. The structure helps you to provision your IoT system to take care of the entire device management system with the seamless data flow.

A template is a pre-defined structure required to manage LoRaWAN devices and their associated properties. The structure helps you to provision your IoT system to take care of the entire device management system with the seamless data flow.

IoTConnect’s template feature will help you with the following:

 - Add and manage devices. 
 - Define associated data captured by the device in the form of attributes. 
 - Set commands to allocate the actions you
   want the device to perform.

### Create Template
<strong>To create a template:</strong>
<li>Go to <strong>Devices &gt; Wireless Device &gt; Templates.</strong></li>

<li>Click <strong>Create Template.</strong></li>
<li>Complete the required fields:</li>

<p class="mb-0" align="center"><img decoding="async" class="aligncenter size-full wp-image-1570" src="https://docs.iotconnect.io/wp-content/uploads/2023/12/Create-Template.png" alt="img" /></p>

<p class="pimgbottom" align="center"><i>(Screen: Create Template)</i></p>

Create at least one attribute of your choice, which will leads to create template for your LoRaWAN deices. The same attribute must exist in your device source code explain in below topics.

<p class="mb-0" align="center"><img decoding="async" class="aligncenter size-full wp-image-1570" src="https://docs.iotconnect.io/wp-content/uploads/2023/12/reate-Attribute.png" alt="img" /></p>
<p class="pimgbottom" align="center"><i>(Screen: Create Attribute)</i></p>

## Create an IoTConnect LoRaWAN device
<p>To create a LoRaWAN device for your organization:</p>
<ol>
<li>From the left navigation, mouseover the <strong>Devices</strong> module. Click <strong>Wireless Device</strong>.</li>
<li>Along the top and toward the right, select Create <strong>Device</strong>.</li>
<li>Enter data in the following fields:</li>
</ol>
<p class="mb-0" align="center"><img decoding="async" class="aligncenter size-full wp-image-1570" src="https://docs.iotconnect.io/wp-content/uploads/2023/12/Create-Device.png" alt="img"></p>
<p class="pimgbottom" align="center"><i>(Screen: Create Device)
<li><strong>Transmission type:</strong> Select for LoRaWAN.</li>
<li><strong>Unique ID:</strong> Enter the unique ID of a device.</li>
<li><strong>Display Name:</strong> Enter the display name for a device.</li>
<li><strong>Device Profile Name:</strong> A descriptive name of your choice for this profile, e.g. “Workshop device profile of “.</li>
<li><strong>DevEUI:</strong> Unique identifier assigned by the manufacturer.</li>
<li><strong>AppEUI:</strong> Shared secret between device and the application.</li>
<li><strong>AppKey:</strong> Uniquely identifies a join server (was renamed to JoinEUI in OTAA v.1.1).</li>
<li><strong>Max EIRP:</strong> Please enter the default value 15.</li>
<li><strong>Class Specification:</strong> Select your choice of Class A, Class B, Class C.</li>
<li><strong>Gateway:</strong> Select the associate gateway.</li>
<li><strong>Mac version:</strong> This parameter should specify the most recent version of LoRaWAN specification supported by your device. Unless device documentation states otherwise, please select 1.0.3.</li>
<li><strong>Regional Parameters Version:</strong> Please select RP002-1.0.1, unless specified otherwise in your device documentation.</li>
<li><strong>Device Manufacturer:</strong>Select your device OEM.</li>
<li><strong>Entity:</strong> Select the entity for your device.</li>
<li><strong>Template:</strong> Select the template for your device.</li>
<li><strong>Notes:</strong>&nbsp;You can add required notes for a device.</li>
</ul>
</li>
</ul>
<h4>LoRaWAN Telemetry</h4>
<p>Messages that a device sends are visible in the live data section. While sending telemetry data, devices can send a few or all sensor (Template attribute) values. It is not required to send all sensor (Template attributes) values.
<h4>LoRaWAN Command</h4>
<p>Each device command has facility to make sure that command is reached and executed on device. In this case json property “ack” will be true. That means IoTConnect is expecting acknowledgement back, for that you must send acknowledgement message with a status success/failed.

  
	


