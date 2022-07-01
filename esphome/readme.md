# ESPhome + ESP32設定備忘

安裝說明影片:<br>
[Super easy! Add your ESP32 Board to Home Assistant with ESPHome.](https://www.youtube.com/watch?v=Be5zWukjV9I)


# 問題處理
## ESPhome在HA安裝後web ui無法顯示
log呈現卡在starting nginx...<br>
如果有安裝ufw, 先disable<br>
就可以顯示了<br>
Ref: [ESPHome WebUI won’t load](https://community.home-assistant.io/t/esphome-webui-wont-load/152538)


## 增加裝置時遇到訊息
```
New device
A device needs to be connected to a computer using a USB cable to be added to ESPHome. Once added, ESPHome will interact with the device wirelessly.
You are not browsing the dashboard over a secure connection (HTTPS). This prevents ESPHome from being able to install this on devices connected to this computer.
You will still be able to install ESPHome by connecting the device to the computer that runs the ESPHome dashboard.
Alternatively, you can use ESPHome Web to prepare a device for being used with ESPHome using this computer.
```


