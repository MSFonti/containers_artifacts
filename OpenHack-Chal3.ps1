az network vnet subnet create --address-prefixes 10.2.1.0/24 --name aks-subnet --resource-group teamawesome2 --vnet-name vnet
Get the ID of the subnet:
az network vnet subnet list --resource-group teamawesome2 --vnet-name vnet --query "[0].id" --output tsv

az aks create `
    --resource-group teamResources `
    --name team7Cluster `
    --network-plugin azure `
    --vnet-subnet-id /subscriptions/ede43ea8-2169-4c98-b245-311bbb2b78dc/resourceGroups/teamawesome2/providers/Microsoft.Network/virtualNetworks/vnet/subnets/vm-subnet `
    --docker-bridge-address 172.17.0.1/16 `
    --dns-service-ip 192.168.1.10 `
    --service-cidr 192.168.1.0/24 `
    --generate-ssh-keys `
    --enable-aad `
    --enable-azure-rbac `
    --enable-managed-identity `
    --assign-identity /subscriptions/ede43ea8-2169-4c98-b245-311bbb2b78dc/resourceGroups/teamawesome2/providers/Microsoft.ManagedIdentity/userAssignedIdentities/awesome


    az aks update -n myCluster -g teamawesome2 --attach-acr registryrnr9881