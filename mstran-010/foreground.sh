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

kind create cluster --config kind-config.yaml

# Put a test to make sure the cluster is up and running here

echo Installing MetalLB

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.4/manifests/namespace.yaml

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.4/manifests/metallb.yaml

kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

cat > metallb-config.yaml << "EOF"
apiVersion: v1
kind: ConfigMap
metadata:
  namespace: metallb-system
  name: config
data:
  config: |
    address-pools:
    - name: default
      protocol: layer2
      addresses:
      - 172.19.255.1-172.19.255.250
EOF

kubectl apply -f metallb-config.yaml

kubectl create deploy nginx --replicas=3 --image nginx

kubectl expose deploy nginx --port 80 --type LoadBalancer

# Put a test to make sure the cluster is up and running here

kubectl get service

# curl 172.19.255.1

echo "You are go to go!"