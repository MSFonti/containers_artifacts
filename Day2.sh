

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

<<<<<<< HEAD
kubectl apply -f ./src/poi/deployment.yaml
kubectl apply -f ./src/user-java/deployment.yaml
kubectl apply -f ./src/tripviewer/deployment.yaml
kubectl apply -f ./src/trips/deployment.yaml
kubectl apply -f ./src/userprofile/deployment.yaml

kubectl apply -f userjavaService.yaml
kubectl apply -f userProfileService.yaml
kubectl apply -f poiService.yaml
kubectl apply -f tripService.yaml
kubectl apply -f tripViewerService.yaml

#kubectl create secret generic test-secret --from-literal=User=sqladminrNr9881 --from-literal=password=uZ0qe1Kp3
kubectl create secret generic test-secret --namespace=api --from-literal=User=sqladminrNr9881 --from-literal=password=uZ0qe1Kp3 

10.244.0.24

curl -i -X GET 'http://10.244.0.24:8080/api/poi/healthcheck'

kubectl get secret test-secret 
kubectl describe  secrets/test-secret
Server=tcp:sqlserverrnr9881.database.windows.net,1433;Initial Catalog=mydrivingDB;Persist Security Info=False;User ID=sqladminrNr9881;Password={your_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;

10.244.0.221

# az aks browse -g $RG --name $clusterName
# az aks browse --resource-group $RG --name $clusterName
# kubectl create clusterrolebinding kubernetes-dashboard --clusterrole=cluster-admin --serviceaccount=kube-system:kubernetes-dashboard

kubectl attach poi-deployment-858f684d77-rrfbs -c curl 'http://10.244.0.38:8080/api/poi/healthcheck' -i -t --namespace api

kubectl attach trips-deployment-75f44b84f7-5qrzs -c curl 'http://localhost:8080/api/trips/ea2f7ae0-3cef-49cb-b7d1-ce972113120c' -i -t --namespace api





=======
##login into AKS
az account set --subscription ede43ea8-2169-4c98-b245-311bbb2b78dc
az aks get-credentials --resource-group teamawesome --name myCluster


az aks update -n myAKSCluster -g myResourceGroup --attach-acr <acr-resource-id>
##Deploy yaml
kubectl apply -f .\deployment.yaml


#Template yaml ###########################################
apiVersion: apps/v1
kind: Deployment
metadata:
  name: poi-deployment
  namespace: api
  labels:
    app: poi
spec:
  replicas: 1
  selector:
    matchLabels:
      app: poi
  template:
    metadata:
      labels:
        app: poi
    spec:
      containers:
      - name: poi
        image: registryrnr9881.azurecr.io/poi:v1
        ports:
        - containerPort: 8080

###########END


sqlserverrnr9881
SQL Server Username: sqladminrNr9881
SQL Server Password: uZ0qe1Kp3
>>>>>>> c69bac548d99eb1223415ef80374e483eed75043
