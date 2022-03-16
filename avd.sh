# Notice!
# before start script you must add 
# your '../SDK/emulator/' path to environments

in=$(emulator -list-avds)
devices=(${in//\r\n/})

for i in "${!devices[@]}"; do
    printf "%s- %s\n" "$i" "${devices[$i]}"
done

printf "select: "
read index

# remove newline & spaces
device=${devices[$index]//[$'\t\r\n ']}
printf "starting $device ..."

emulator -avd $device & disown
sleep 5s
#read nop