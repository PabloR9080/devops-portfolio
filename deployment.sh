killall ngrok
systemctl stop nginx
git pull origin main
systemctl start nginx
ngrok http 80 >> /dev/null &
sleep 5
url=$(curl -s localhost:4040/api/tunnels | jq .tunnels[0].public_url)
echo "Application served in $url"

