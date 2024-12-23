declare -A stats
stats["cpu"]="lscpu | grep 'Model name' | cut -d ':' -f 2 | sed 's/^[[:space:]]*//g'"
stats["desktop"]="echo $XDG_SESSION_DESKTOP, $XDG_SESSION_TYPE"
stats["gpu"]="lspci | grep -i vga | cut -d':' -f3 | xargs"
stats["host"]="cat /etc/hostname"
stats["kernel"]="uname -rmo"
stats["loadavg"]="cat /proc/loadavg"
stats["modules"]="cat /proc/modules | uniq | wc -l"
stats["os"]="cat /etc/os-release | grep PRETTY_NAME | cut -d'\"' -f 2"
stats["packages"]="pacman -Q | wc -l"
stats["processes"]="ps ax | wc -l"
stats["ram"]="grep MemTotal /proc/meminfo | cut -d ':' -f 2 | xargs"
stats["shell"]="echo $SHELL"
stats["term"]="echo $TERM"
stats["uptime"]="uptime -p"

for key in ${!stats[@]}; do
	echo -n ${key}": " ; eval ${stats[${key}]} 
done | sort -n 

