# General 

Source Device Name: `CITYSPORTS-Linker`

Endianness: `Little`

# Sending Commands

UUID: `2AD9` (Fitness Machine Control Point)

ATT OPCODE: `0x012` (Write Request)

| Operation | Value |
| --------- | ----- |
| Wakeup | `00` |
| Start  | '07e |
| Stop | `08 01` |
| Set Speed | `02 XX XX` |

`XX XX` is Speed in 100 x kmh

# Receiving Data

UUID: `2ACD` (Treadmill Data)

ATT OPCODE: `0x1b` (Received Handle Value Notification)

| `84 24` | `XX XX` | `XX XX`  | `XX XX`    | `00 ff` | `ff ff` | `XX XX` | `XX XX` | `00`  |
| ----- | ----- | ------ | -------- | ----- | ----- | ------- | ----- | --- |
| Start | Speed | Metres | Calories | ?     | ?     | Seconds | Steps | END |


Note: 
Calories are in big endian for some bloody reason.
Don't trust the calorie measurement anyway, the treadmill doesn't know your weight.
