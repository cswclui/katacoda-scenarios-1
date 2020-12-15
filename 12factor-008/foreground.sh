git config --global pager.branch false

sudo apt update -y

sudo apt-get install jq -y

sudo apt install tree -y && clear

docker run -d --network="host" -p 5000:5000 --restart=always --name registry registry:2 && clear

#Add KinD

curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"

sudo chmod +x ./kubectl

sudo mv ./kubectl /usr/local/bin/kubectl

curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.9.0/kind-linux-amd64

sudo chmod +x ./kind

sudo mv ./kind /usr/local/bin/kind

cat > kind-config.yaml << "EOF"
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
  - role: control-plane
  - role: worker
  - role: worker
EOF

kind create cluster --config kind-config.yaml && clear

kubectl get nodes

echo "You're good to go!"

