git config --global pager.branch false

sudo apt update -y

sudo apt-get install jq -y && clear

sudo apt install tree -y && clear

sudo docker run -d --network="host" -p 5000:5000 --restart=always --name registry registry:2 && clear

echo "You're good to go!"

