#!/bin/sh

handle() {
    case $1 in
        monitoradded*)
            id=$(echo $1 | sed 's/.*>>\(.*\)/\1/');
            name=$(hyprctl monitors | grep -e "description:.*$id.*" | sed 's/\s*description:\s*//;s/\s*(HDMI-A-1).*//');
            if [ "$name" == "Beihai Century Joint Innovation Technology Co.,Ltd PGM300 0000000000000" ]; then
                if [ -z "$rep" ]; then
                    echo "FIRST ONE !";
                    rep=1
                elif [ "$rep" == "1" ]; then
                    echo "YAY!";
                    hyprctl keyword monitor "eDP-1, 1920x1080, 2560x0, 1";
                    rep=0
                fi
            fi
            ;;
        monitorremoved*)
            id=$(echo $1 | sed 's/.*>>\(.*\)/\1/');
            name=$(hyprctl monitors | grep -e "description:.*$id.*");
            if [ -z "$name" ]; then
                hyprctl keyword monitor "eDP-1, 1920x1080, 0x0, 1"
            fi
            ;;
    esac
}

socat -U - UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done

# hyprctl keyword monitor "eDP-1, 1920x1080, 2560x0, 1"
