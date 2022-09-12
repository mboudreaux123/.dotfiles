import os, subprocess
## Check if battery is less that threshold
## Turn on power saving mode if so

## Check if charger is plugged in
## If not, turn on balanced mode

## if battery at 1005 and charger plugged in, turn on performance mode

lowPowerMode="False"
lowPowerModeThreshhold="50"

def getBatPercent():
    return subprocess.check_output(["cat", "/sys/class/power_supply/BAT0/capacity"])

bat = getBatPercent()
print(bat)