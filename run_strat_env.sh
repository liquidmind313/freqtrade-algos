sudo systemctl start prox.service
screen
cd ~/freqtrade/
sudo python3 -m venv .env
source .env/bin/activate
freqtrade trade --strategy NostalgiaForInfinityX
