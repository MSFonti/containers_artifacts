RG=teamawesome2
MYACR='/subscriptions/ede43ea8-2169-4c98-b245-311bbb2b78dc/resourceGroups/teamResources/providers/Microsoft.ContainerRegistry/registries/registryrnr9881'
subid=ede43ea8-2169-4c98-b245-311bbb2b78dc
clusterName=team2cluster
echo $MYACR

az network vnet subnet create --address-prefixes 10.2.1.0/24 --name aks-subnet --resource-group $RG --vnet-name vnet
az network vnet subnet list --resource-group $RG --vnet-name vnet --query "[0].id" --output tsv

az aks create `
    --resource-group $RG `
    --name $clusterName `
    --network-plugin azure `
    --vnet-subnet-id /subscriptions/$subid/resourceGroups/teamResources/providers/Microsoft.Network/virtualNetworks/vnet/subnets/aks-subnet `
    --docker-bridge-address 172.17.0.1/16 `
    --dns-service-ip 192.168.1.10 `
    --service-cidr 192.168.1.0/24 `
    --generate-ssh-keys `
    --enable-aad `
    --enable-azure-rbac `
    --enable-managed-identity `
    --assign-identity /subscriptions/$subid/resourceGroups/$RG `
    --attach-acr $MYACR `

az account set --subscription $subid
az aks get-credentials --resource-group $RG --name $clusterName
kubectl get deployments --all-namespaces=true
kubectl create namespace web
kubectl create namespace api

kubectl create secret generic test-secret --namespace=api --from-literal=User=sqladminrNr9881 --from-literal=password=uZ0qe1Kp3 

kubectl apply -f ./src/poi/deployment.yaml
kubectl apply -f ./src/user-java/deployment.yaml
kubectl apply -f ./src/tripviewer/deployment.yaml
kubectl apply -f ./src/trips/deployment.yaml
kubectl apply -f ./src/userprofile/deployment.yaml

kubectl apply -f userjavaService.yaml
kubectl apply -f userProfileService.yaml
kubectl apply -f poiService.yaml
kubectl apply -f tripsService.yaml
kubectl apply -f tripViewerService.yaml