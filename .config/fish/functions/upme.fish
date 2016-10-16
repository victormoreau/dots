function upme
	sudo apt update; sudo apt -y dist-upgrade; sudo apt -y autoremove $argv;
end
