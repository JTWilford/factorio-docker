#!/bin/bash
if [ ! -f /saves/factorio/beefy.zip ]; then	
	echo -e "\e[33m[WARN] World files not found! Creating new world...\e[39m"
	./bin/x64/factorio --create "/saves/factorio/beefy.zip" --map-gen-settings "/run/secrets/map-gen-settings.json" --map-settings "/run/secrets/map-settings.json"
	echo -e "\e[32m[WARN] New world successfully created!\e[39m"
fi
echo -e "\e[30m[INFO]\e[39m Starting Server..."
./bin/x64/factorio --start-server "/saves/factorio/beefy.zip" --server-settings "/run/secrets/server-settings.json"