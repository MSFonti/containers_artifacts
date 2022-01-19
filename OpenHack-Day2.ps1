az group create --location northeurope --resource-group teamawesome

# az aks create -g teamResources --name myCluster --node-count 1 --generate-ssh-keys
az aks create -g teamawesome --name myCluster --node-count 1 --generate-ssh-keys

kubectl create namespace web
kubectl create namespace api

az aks update -n myCluster -g teamawesome --attach-acr registryrnr9881


az account set --subscription ede43ea8-2169-4c98-b245-311bbb2b78dc
az aks get-credentials --resource-group teamawesome --name myCluster
kubectl apply -f .\deployment.yaml