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

 	Check your device’s revision at [pgaskin’s firmware download page](https://pgaskin.net/KoboStuff/kobofirmware.html)

3. Stock firmware would be located at `output/stock` and patched firmware at `output/patched`
