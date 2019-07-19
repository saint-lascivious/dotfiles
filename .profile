# Everything from ~/.profile is now in ~/.profile.d

#  - Make your ~/.profile edits there in 00-default.sh or (preferably)
#    as individual shell scripts in ~/.profile.d/**-script-name.sh
#  - Execution of ~/.profile.d/ scripts is numerically ordered.

# Source the individual ~/.profile.d/* scripts.
for f in ~/.profile.d/*.sh; do
  source $f
done