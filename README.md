# Download & Patch Kobo Firmware Automatically

This simple shell script helps you download Rakuten Kobo's firmware and apply patches using [pgaskin's kobopatch](https://github.com/pgaskin/kobopatch-patches).

With this tool, it's unnecessary to manually copy kobopatch.yaml and download stock firmware for each Kobo firmware releases.

## Usage

1. Edit `kobopatch_template.yaml` as you wish and save as `kobopatch.yaml`

    (Keep from editing `{{TARGETVAR}}` in the template file)

2. Execute the script with specific device revision and hardware version

    ```{shell}
    ./kobopatch.sh <hardware revision> <firmware version>
    ```

    E.g. for Kobo Clara HD (hardware revision `kobo7`) with firmware `4.35.20400`, run `./kobopatch.sh kobo7 4.35.20400`

    Check your device’s hardware revision below.

3. Stock firmware would be located at `output/<firmware version>/stock` and patched firmware at `output/<firmware version>/patched`

## Hardware Revision

Courtesy of [pgaskin’s firmware download page](https://pgaskin.net/KoboStuff/kobofirmware.html)

| Model                         | Hardware Revision |
| ----------------------------- | ----------------- |
| Kobo Touch A/B                | kobo3             |
| Kobo Touch C                  | kobo4             |
| Kobo Mini                     | kobo4             |
| Kobo Glo                      | kobo4             |
| Kobo Glo HD                   | kobo6             |
| Kobo Touch 2.0                | kobo6             |
| Kobo Aura                     | kobo5             |
| Kobo Aura HD                  | kobo4             |
| Kobo Aura H2O                 | kobo5             |
| Kobo Aura H2O Edition 2 v1    | kobo6             |
| Kobo Aura H2O Edition 2 v2    | kobo7             |
| Kobo Aura ONE                 | kobo6             |
| Kobo Aura ONE Limited Edition | kobo6             |
| Kobo Aura Edition 2 v1        | kobo6             |
| Kobo Aura Edition 2 v2        | kobo7             |
| Kobo Nia                      | kobo7             |
| Kobo Clara HD                 | kobo7             |
| Kobo Forma                    | kobo7             |
| Kobo Libra H2O                | kobo7             |
| Kobo Elipsa                   | kobo8             |
| Kobo Sage                     | kobo8             |
| Kobo Libra 2                  | kobo9             |
| Kobo Clara 2E                 | kobo10            |
