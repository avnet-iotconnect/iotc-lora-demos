
## Using Renesas LoRaWAN Boards

This section guides you through using **Renesas RA series boards** with LoRaWAN and /IOTCONNECT. You can onboard the following boards with supported precompiled demos:

### Supported Renesas Boards

| Board             | Product Page |
|------------------|--------------|
| FPB-RA2E1        | [FPB-RA2E1](https://www.renesas.com/ra/fpb-ra2e1) |
| EK-RA2L1         | [EK-RA2L1](https://www.renesas.com/ra/ek-ra2l1) |
| FPB-RA0E1        | [FPB-RA0E1](https://www.renesas.com/ra/fpb-ra0e1) |
| FPB-RA0E2        | [FPB-RA0E2](https://www.renesas.com/ra/fpb-ra0e2) |

## Hardware Required

- One of the supported boards above
- [SX1261 Shield](https://www.semtech.com/products/wireless-rf/lora-transceivers/sx1261) or [SX1262 Shield](https://www.semtech.com/products/wireless-rf/lora-transceivers/sx1262)
- [Digilent Pmod USBUART](https://reference.digilentinc.com/reference/pmod/pmodusbuart/start) (not required for RA0E2)
- [HS3001 Sensor](https://www.renesas.com/us/en/products/sensor-products/humidity-sensors/us082-hs3001evz-relative-humidity-sensor-pmod-board-renesas-quick-connect-iot) (optional)
- 1–2 USB cables (SX1262 requires 2)

## Hardware Setup

Each board has slightly different jumper and PMOD configurations.

### FPB-RA2E1 Setup  
![FPB-RA2E1 Setup](https://github.com/avnet-iotconnect/iotc-lora-demos/assets/ra2e1-setup.jpg)  
- Use PMOD2 for UART.
- Use `CN1` 1-2 short for programming, 2-3 short to run.
- Cut/short jumper pins to enable Sub Clock and I2C if using the sensor.  
**Ref:** [RA2E1 Setup Diagram, R11AN0596EJ0470](https://www.renesas.com/us/en/document/apn/r11an0596ej0470-ra-lora.pdf) page 4

### EK-RA2L1 Setup  
![EK-RA2L1 Setup](https://github.com/avnet-iotconnect/iotc-lora-demos/assets/ra2l1-setup.jpg)  
- UART on PMOD2; sensor on PMOD1 (optional).
- Sub Clock enabled with cuts/shorts on jumpers E1, E8–E10.  
**Ref:** [RA2L1 Setup Diagram, R11AN0596EJ0470](https://www.renesas.com/us/en/document/apn/r11an0596ej0470-ra-lora.pdf) page 5

### FPB-RA0E1 Setup  
![FPB-RA0E1 Setup](https://github.com/avnet-iotconnect/iotc-lora-demos/assets/ra0e1-setup.jpg)  
- UART on PMOD1.
- Wire J5-2 to J5-6 to route DIO1 interrupt.
- Optional sensor on PMOD2.  
**Ref:** [RA0E1 Setup Diagram, R11AN0596EJ0470](https://www.renesas.com/us/en/document/apn/r11an0596ej0470-ra-lora.pdf) page 6

### FPB-RA0E2 Setup  
![FPB-RA0E2 Setup](https://github.com/avnet-iotconnect/iotc-lora-demos/assets/ra0e2-setup.jpg)  
- No Pmod UART needed — uses USB directly.
- Optional sensor on PMOD2.  
**Ref:** [RA0E2 Setup Diagram, R11AN0596EJ0470](https://www.renesas.com/us/en/document/apn/r11an0596ej0470-ra-lora.pdf) page 7

## Flash and Run Applications

1. Install [Renesas Flash Programmer](https://www.renesas.com/rfp)
2. Choose the correct interface (E2 Emulator Lite or J-LINK)
3. Flash one of the sample `.hex` files:
   - `LoRaSample.hex` (LoRaWAN Class A)
   - `RadioEvalApp.hex` (manual AT command interface)
   - `LoRaSensorSample.hex` (optional sensor demo)

Path:  
```
samples/project/e2studio/{board}/{app}/{app}.hex
```

Examples:  
```
ra2e1fpb_sx126x/LoRaSample/LoRaSample.hex  
ra0e1fpb_sx126x/RadioEvalApp/RadioEvalApp.hex  
```

## AT Commands to Configure LoRaWAN

Connect with a serial terminal at `115200 8N1`, no flow control, CR+LF. Use the following command flow:

```
AT+REGION=1
AT+CLASS=0
AT+ACTMODE=1
AT+DEVEUI=xxxxFFFExxxx
AT+APPEUI=0123456701234567
AT+APPKEY=5555555555555555AAAAAAAAAAAAAAAA
AT+SAVE
AT+JOIN
AT+SENDHEX=00112233
```

US915 region only:
```
AT+CHDEFMASK=FF00,0000,0000,0000,0002
```

## Network Server Integration

Use  as shown in the rest of this guide to register your device and forward to /IOTCONNECT. You may also refer to:

- [LoRaWAN Tutorial for RA Devices (PDF)](https://www.renesas.com/us/en/document/apn/ra2e1-ra2l1-ra0e1-lorawan-sensor-demo-rev470?language=en&r=1635706)  
- [LoRaWAN Setup with LORIOT (older guide)](https://www.renesas.com/document/apn/ra2e1-ra2l1-ra0e1-lorawan-sensor-demo-rev250?language=en&r=1635706)  
