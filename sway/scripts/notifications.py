import subprocess

bins    = ["swaync", "mako", "dunst"]
binArgs = ["", "-c ~/.config/sway/subconfigs/mako", ""]

## Killall existing processes
for i in bins:
    subprocess.run(["killall", i])

##
for i in len(bins):
    subprocess.run([bins[i], binArgs[i]])