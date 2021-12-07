# setup of freqtrade with pre modded config, strategies and proxy
# ubuntu arm64 version 
# made by @liquidmind313
cd ~
sudo apt-get update
sudo apt install -y python3-pip python3-venv python3-dev python3-pandas git
sudo git clone https://github.com/freqtrade/freqtrade.git
cd ~/freqtrade/
sudo git checkout stable
sudo apt-get install libhdf5-serial-dev
sudo ./setup.sh -i
sudo cd ~/codename313/
sudo cp config.json ../freqtrade
sudo apt update
sudo apt install nano
sudo apt-get install screen
cd ~/freqtrade/
sudo python3 -m venv .env
sudo source .env/bin/activate
sudo python3 -m pip install — upgrade pip
sudo python3 -m pip install -e .
sudo pip install pandas_ta
sudo timedatectl set-timezone Asia/Tokyo
sudo ulimit -s unlimited
cd ~/freqtrade/
sudo wget https://github.com/mikekonan/freqtrade-proxy/releases/download/v1.0.11/freqtrade-proxy-linux-arm64
sudo chmod +x freqtrade-proxy-linux-arm64
cd /etc/systemd/system
echo "[Unit]
Description=proxy freq autostart
StartLimitIntervalSec=33
StartLimitBurst=3

[Service]
User=root
Type=simple
ExecStart=/home/ubuntu/freqtrade/freqtrade-proxy-linux-arm64
Restart=always
RemainAfterExit=yes
RestartSec=10
Restart=on-failure
ExecStop=/home/ubuntu/freqtrade/freqtrade-proxy-linux-arm64 stop

[Install]
WantedBy=multi-user.target" > prox.service
cd ~/freqtrade/
sudo systemctl daemon-reload
sudo systemctl enable prox.service
sudo systemctl start prox.service
cd ~
sudo chmod 777 /home/ubuntu/freqtrade/
