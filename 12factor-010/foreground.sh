git config --global pager.branch false

sudo apt update -y

sudo apt-get install jq -y && clear

sudo apt install tree -y && clear

sudo docker run -d --network="host" -p 5000:5000 --restart=always --name registry registry:2 && clear

echo "installing Jenkins"

wget -qO - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add -

sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo apt update -y

sudo apt install jenkins -y

echo "usermod -aG sudo jenkins"

sudo usermod -aG sudo jenkins

sudo systemctl start jenkins

sudo ufw allow 8080

sudo ufw status

sudo mount -o remount,exec /var


echo "Installed Jenkins"


echo "You're good to go!"

