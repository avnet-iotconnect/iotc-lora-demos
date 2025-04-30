# LoRa Device Onboarding into IOTCONNECT

_Inspired by [IOTCONNECT Docs](https://docs.iotconnect.io/iotconnect)_

![IOTCONNECT Logo](https://docs.iotconnect.io/wp-content/uploads/2023/12/image3-1.png)

## Device Attributes

Add telemetry attributes specific to your device. These attributes should match the data points you plan to collect from your device. Below are two examples of device-specific attributes for the STMicroelectronics ASTRA1B and NUCLEO-WL55JC.

### Examples:


## Device-Specific Information
<details> <summary> STMicroelectronics ASTRA1B <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuUvwhUi2eIfRwAxsZLPgo0tNGBRt2WQ2Z-A&s" height="60"/>   </summary>

[Product Site](https://www.st.com/en/evaluation-tools/steval-astra1b.html)

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

</details> 

<details> <summary> STMicroelectronics NUCLEO-WL55JC <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrhG19rSOKs0jSERjxYrv5qBlnB6VIhseXfQ&s" height="60"/>   </summary>

[Product Site](https://www.st.com/en/evaluation-tools/nucleo-wl55jc.html)


|--------**Attribute**------|--------**Data Type** -----|


|-------temperature----|---------decimal-------|

|--------pressure--------|--------  decimal-------|

|--------humidity--------|---------decimal------|

|-----battery_value------|---------decimal------|

|----------led-------------|-------boolean-------|

|----------status----------|--------integer-------|

|-----decoder_name-----|-------string----------|

</details>

### Creating a Template

A template in IOTCONNECT is a predefined structure that helps manage LoRaWAN devices and their properties. Templates streamline device management by allowing seamless data flow and provision of associated attributes.

#### Benefits of Using Templates:

-   Simplify the addition and management of devices.
-   Define data attributes that the device captures.
-   Set up commands to control device actions.

### Steps to Create a Template

1.  **Navigate to Templates:**
    
    -   Go to **Devices > Wireless Device > Templates** in IOTCONNECT.
2.  **Create a New Template:**
    
    -   Click **Create Template**.
    -   Fill in the required fields for the template, including a descriptive name and the data attributes you want to include.
    
    ![Create Template](https://docs.iotconnect.io/wp-content/uploads/2023/12/Create-Template.png) _(Screen: Create Template)_
    
3.  **Add Device Attributes:**
    
    -   Using the examples provided above as a reference, add telemetry attributes specific to your device. These attributes should align with the data you plan to collect from your device and must be included in your device's source code.
    
    ![Create Attribute](https://docs.iotconnect.io/wp-content/uploads/2023/12/reate-Attribute.png) _(Screen: Create Attribute)_
    

## Create an /IOTCONNECT LoRaWAN Device

To set up a LoRaWAN device for your organization on IOTCONNECT:

1.  **Access Device Creation:**
    
    -   Navigate to the **Devices** module and click on **Wireless Device**.
    -   Click **Create Device**.
    
    ![Create Device](https://docs.iotconnect.io/wp-content/uploads/2023/12/Create-Device.png) _(Screen: Create Device)_
    
2.  **Enter Device Information:**
    
    -   Fill in the necessary fields such as Transmission Type, Unique ID, Display Name, DevEUI, AppEUI, and AppKey.
    -   Select the relevant device profile, class specification, gateway, and template for your device.
3.  **Specify Device Parameters:**
    
    -   **Transmission Type:** Select **LoRaWAN**.
    -   **Unique ID:** Enter the device's unique identifier.
    -   **Display Name:** Provide a user-friendly name for the device.
    -   **Device Profile Name:** Describe the device profile.
    -   **DevEUI:** This is the unique identifier from the manufacturer.
    -   **AppEUI and AppKey:** Provide these keys for secure device communication.
    -   **Max EIRP:** Set the default to 15.
    -   **Class Specification:** Choose between Class A, B, or C based on your device's capabilities.
    -   **Gateway:** Select the associated gateway.
    -   **Mac Version:** Usually, select version 1.0.3 unless specified otherwise.
    -   **Regional Parameters Version:** Typically, select RP002-1.0.1 unless your device documentation specifies otherwise.
    -   **Device Manufacturer:** Choose the OEM of your device.
    -   **Entity:** Select the entity for your device.
    -   **Template:** Choose the relevant template.
    -   **Notes:** Add any additional notes for the device.

### LoRaWAN Telemetry

Telemetry messages sent by a device can be viewed in the live data section. Devices can send either a few or all defined sensor (template attribute) values. Sending all attributes is not mandatory.

### LoRaWAN Command

Each command sent to the device can require an acknowledgment. If the `ack` JSON property is set to true, IOTCONNECT expects a status message (success/failed) in response.

----------

For more detailed guidance, refer to the [IOTCONNECT Documentation](https://docs.iotconnect.io/iotconnect).

This guide helps you understand how to manage and configure your LoRaWAN devices within the IOTCONNECT platform efficiently.
