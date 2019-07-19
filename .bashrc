# Everything from ~/.bashrc is now in ~/.bashrc.d

#  - Make your ~/.bashrc edits there in 00-default.sh or (preferably)
#    as individual shell scripts in ~/.bashrc.d/**-script-name.sh
#  - Execution of ~/.bashrc.d/ scripts is numerically ordered.

# If not running interactively, don't do anything.
case $- in
    *i*) ;;
      *) return;;
esac

# Source the individual ~/.bashrc.d/* scripts.
for f in ~/.bashrc.d/*.sh; do
  source $f
done