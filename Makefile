iso_path = /Users/disarra/Downloads/ubuntu-24.04.1-desktop-amd64.iso
dmg_path = /Users/disarra/Downloads/ubuntu-24.04.1-desktop-amd64.dmg
cd_path = /dev/disk2

all: format dmg unmount move

format:
	diskutil partitionDisk $(cd_path) GPT JHFS+ SDGPT 0B


move:
	sudo dd if=$(dmg_path) of=$(cd_path)

unmount:
	sudo diskutil umountDisk $(cd_path)

dmg:
	sudo hdiutil convert -format UDRW -o $(dmg_path) $(iso_path) 
