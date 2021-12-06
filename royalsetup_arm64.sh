sudo apt-get update
sudo apt install -y python3-pip python3-venv python3-dev python3-pandas git
git clone https://github.com/freqtrade/freqtrade.git 
cd freqtrade
git checkout stable
sudo apt-get install libhdf5-serial-dev
sudo ./setup.sh -i
cd ../codename313
sudo cp config.json ../freqtrade
sudo cp NFIXMod1.3_TraNz.py ../freqtrade/user_data/strategies
sudo cp BB_RPB_TSL.py ../freqtrade/user_data/strategies
sudo cp Combined_NFIv7_SMA.py ../freqtrade/user_data/strategies
sudo cp BB_RPB_TSL_ClucHAnix_BB_RPB_MOD_CTT_Dynamic_Offsets_COMBINED_MOD_TraNz.py ../freqtrade/user_data/strategies
sudo apt update
sudo apt install nano
sudo apt-get install screen
cd ../freqtrade
sudo python3 -m venv .env
source .env/bin/activate
sudo python3 -m pip install — upgrade pip
sudo python3 -m pip install -e .
pip install pandas_ta
sudo timedatectl set-timezone Asia/Tokyo
sudo ulimit -s unlimited
wget https://github.com/mikekonan/freqtrade-proxy/releases/download/v1.0.12/freqtrade-proxy-linux-arm64
sudo chmod +x freqtrade-proxy-linux-arm64
cd /etc/systemd/system
echo "[Unit]
Description=proxy autostart for freqtrade kucoin
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
cd 
cd freqtrade
sudo systemctl daemon-reload
sudo systemctl enable prox.service
sudo systemctl start prox.service
