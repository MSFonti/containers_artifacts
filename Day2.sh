

RG=teamawesome
MYACR='/subscriptions/ede43ea8-2169-4c98-b245-311bbb2b78dc/resourceGroups/teamResources/providers/Microsoft.ContainerRegistry/registries/registryrnr9881'
subid=ede43ea8-2169-4c98-b245-311bbb2b78dc
clusterName=myCluster
echo $MYACR

az login
# az group create --location northeurope --ressource-group $RG
az aks create -g $RG --name $clusterName --node-count 1 --generate-ssh-keys --attach-acr $MYACR
#ssh key
# ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCYryjgY513+kcnKqEFKw7sg6IHXmt9uJzVTJwAm7zC3tbgEqxCgAEE5g3qd4iEfFM1cz9EUsB+hF7c+PYZv8yIUX/jB9SE0YW4AbVN+w0tFAQj5hrjr/uDg9xkItCBS3YiSZaV7xY2WoTZ6dFMdYCaN53QdbDAMyv5uyeyoWsVuNjmiSqb0gPj/Se+lcvnZprpRz4k1aL6lOy2hLUyXrfJawGhXYJCU1ru9Cf3DJpBQeskCaBO5iqyW49FteTtRWfBiNzCe3+rHRKRfGkznRgsT0MbR8VCAIj7L1yzgppnz4OKPCa4Ijxjkt+02v9Rxp7oMJn/nCZdM3sDxOPae8A3

az account set --subscription $subid
az aks get-credentials --resource-group $RG --name $clusterName
kubectl get deployments --all-namespaces=true
kubectl create namespace web
kubectl create namespace api

