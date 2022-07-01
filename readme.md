# Readme



https://iotechonline.com/home-assistant-install-with-docker-compose/?cn-reloaded=1
https://github.com/FezVrasta/rpi4-docker-compose-home-assistant
https://chrisschuld.com/2019/09/running-home-assistant-with-docker/

# HA docker with supervisor

下面這樣安裝可以讓不是安裝HAOS也可以有supervised (add-on/附加元件)可以用

[Refereence 1 How to Install Home Assistant Supervised – OFFICIAL WAY](https://peyanski.com/how-to-install-home-assistant-supervised-official-way/)
設定網路static IP (network-manager會調整ip) <br>
 <br>
```
sudo nano /etc/NetworkManager/conf.d/100-disable-wifi-mac-randomization.conf
```
加入
```
[connection]
wifi.mac-address-randomization=1
[device]
wifi.scan-rand-mac-address=no
```

```

sudo apt-get install jq wget curl avahi-daemon udisks2 libglib2.0-bin network-manager dbus apparmor apparmor-utils python3-apparmor  -y

# apparmor-utils最後裝

# fix broken
sudo apt --fix-broken install

sudo reboot now
```

然後要install docker
```
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker pi
sudo reboot now
```
or if not in raspberry pi
```
curl -fsSL get.docker.com | sh
```

[Reference 2: Install Supervised/Supervisor on Raspberry Pi4 with Docker installation](https://community.home-assistant.io/t/install-supervised-supervisor-on-raspberry-pi4-with-docker-installation/291186/27)

### Install Agent for Home Assistant OS


Install last agent version (currently 1.2.2): Release 1.2.2 · home-assistant/os-agent · GitHub 1
[https://github.com/home-assistant/os-agent/releases/latest](https://github.com/home-assistant/os-agent/releases/latest)

Install the downloaded .deb. 

```
wget https://github.com/home-assistant/os-agent/releases/download/1.2.2/os-agent_1.2.2_linux_aarch64.deb
sudo dpkg -i os-agent_1.2.2_linux_aarch64.deb
```
Check if is os-agent correctly installed: 
```
gdbus introspect --system --dest io.hass.os --object-path /io/hass/os
```

### Download and install HA package

```
wget https://github.com/home-assistant/supervised-installer/releases/latest/download/homeassistant-supervised.deb

sudo dpkg -i homeassistant-supervised.deb
```
### Fix errors
1.1.1 version will finish in an error related with grub: 
[Switch to cgroupv1 by ikifar2012 · Pull Request #201 · home-assistant/supervised-installer · GitHub 10](https://github.com/home-assistant/supervised-installer/pull/201)

```
sudo nano /boot/cmdline.txt 
```
加入
```
systemd.unified_cgroup_hierarchy=false
lsm=apparmor
```
再去/etc/default/grub
```
sudo nano /etc/default/grub
```
加入
```
systemd.unified_cgroup_hierarchy=false
```

To fix, after the first installation, change: 
/var/lib/dpkg/info/homeassistant-supervised.postinst
```
sudo nano /var/lib/dpkg/info/homeassistant-supervised.postinst
```
Comment the lines at the end of file. See the github comment.

```
sudo apt autoremove
 ```
In this case, the installation will end without error.
Now we need to activate AppArmor:
```
sudo apt install apparmor-utils python3-apparmor 
```

Fix
```
sudo nano /boot/cmdline.txt

Add lsm=apparmor
```
```
sudo reboot now
```

### Check AppArmor

下面這個沒有很像也還是可以運作
```
aa-status
```

Need to print a result like: apparmor module is loaded.

```
aa-enable
```
Need to print a result like: Yes




重開機
```
sudo reboot now
```

開機後等一陣子就可以進入HA起始畫面了
