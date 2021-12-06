# royal setup (all in one)
1. ```git clone https://github.com/liquidmind313/codename313.git```
2. for arm x64 ```sudo bash royalsetup_arm64.sh```
4. for intel/amd x64 ```sudo bash royalsetup_x64.sh```
# environment and bot start (not tested yet)
4. run ```sudo bash run_strat_env.sh``` * mod the strategy name in it, before running it! 

--------------------------------------------------------------------------------------
# step by step install method:

# download
1. ```sudo apt-get update``` 
2. ```sudo apt install -y python3-pip python3-venv python3-dev python3-pandas git```
3. ```git clone https://github.com/freqtrade/freqtrade.git```
4. ```cd freqtrade```
5. ```git checkout stable```


# (ARM cpu only!) fix issue with hdf5 for setup.sh  
```sudo apt-get install libhdf5-serial-dev```

# install freqtrade from scratch
6. ```sudo ./setup.sh -i```

# (for update only!)
```sudo ./setup.sh --update```

# then activate your .env
7. ```source ./.env/bin/activate```

# (for raw config) creates new config *quiz
8. ```freqtrade new-config -c config.json```

# strategy installation
9. ```cd ~```
10. ```git clone https://github.com/liquidmind313/codename313.git```
11. ```cd codename_313/ XY```
12. ```sudo cp NostalgiaForInfinityNext.py ../../freqtrade/user_data/strategies/```

# install nano
13. ```sudo apt update```
14. ```sudo apt install nano```
15. ```cd```

# copy over the config file !
15. ```cd ~/codename313/```
16. ```sudo cp config.json ../freqtrade```
17. paste in your API and Telegram keys
18. ```ctrl+x,s``` 

# install screen
28. ```sudo apt-get install screen```
29. ```screen```
30. press "tab" or "enter"

# python setup
31. ```cd ~/freqtrade/```
32. ```sudo python3 -m venv .env```
33. ```source .env/bin/activate```
34. ```sudo python3 -m pip install — upgrade pip```
35. ```sudo python3 -m pip install -e .```
36. ```pip install pandas_ta```

# time zone
```sudo timedatectl set-timezone Asia/Tokyo```

# starting the bot
37. ```freqtrade trade --strategy NostalgiaForInfinityX```
38. ```freqtrade trade --strategy ClucHAnix```
39. ```freqtrade trade --strategy BB_RPB_TSL```
40. ```freqtrade trade --strategy ClucHAnix_BB_RPB_MOD```
41. ```freqtrade trade --strategy Combined_NFIv7_SMA```
42. ```freqtrade trade --strategy ClucHAnix_BB_RPB_TraNz```
43. press ```ctrl+a+d```
# check telegram for status and start

# maximum number of user processes 
```ulimit -s unlimited```

# (extra "forcebuy" function)
example telegram command:
 ```/forcebuy BTC/USDT```
 
# profit and dry-run results:
http://hippocritical.ddns.net:3000/
 
 
# freqtrade-kucoin-proxy
### download
1. ```cd ~/freqtrade/```
2. ```wget https://github.com/mikekonan/freqtrade-proxy/releases/download/v1.0.12/freqtrade-proxy-linux-arm64```
3. ```sudo chmod +x freqtrade-proxy-linux-arm64```

### making it as service for autostart
1. ```cd /etc/systemd/system``` 
2. ```sudo nano prox.service``` 
3. ```copy the text below, in it```
```
[Unit]
Description=proxy freq autostart
StartLimitIntervalSec=30
StartLimitBurst=2
FailureAction=reboot

[Service]
User=root
Type=simple
ExecStart=/home/ubuntu/freqtrade/freqtrade-proxy-linux-arm64 -port 8089
Restart=always
RemainAfterExit=yes
RestartSec=5
Restart=on-failure
ExecStop=/home/ubuntu/freqtrade/freqtrade-proxy-linux-arm64 stop

[Install]
WantedBy=multi-user.target
```
4. ```ctrl+s,ctrl+x```
5. ```sudo systemctl daemon-reload```

### starting the proxy service
6. ```sudo systemctl start prox.service```
### check for status
7. ```sudo systemctl status prox.service```


#### change config.json in root/freqtrade

```
    "exchange": {
        "name": "kucoin",
        "key": "",
        "secret": "",
        "ccxt_config": {
            "enableRateLimit": false,
            "timeout": 60000,
            "urls": {
                "api": {
                    "public": "http://127.0.0.1:8089/kucoin",
                    "private": "http://127.0.0.1:8089/kucoin"
                }
            }
        },
        "ccxt_async_config": {
            "enableRateLimit": false,
            "timeout": 60000
```
### Author of the proxy: 
https://github.com/mikekonan/freqtrade-proxy
