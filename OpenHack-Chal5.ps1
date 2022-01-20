az aks enable-addons --addons azure-keyvault-secrets-provider --name team2cluster --resource-group teamawesome2

az keyvault create -n akst2clukvault01 -g teamawesome2 -l northeurope

az keyvault secret set --vault-name akst2clukvault01 -n ExampleSecret --value MyAKSExampleSecre

VolumeMounts:
        - name: secrets-store
          mountPath: "/secrets"
          readOnly: true
      volumes:
      - name: secrets-store
        csi:
          driver: secrets-store.csi.k8s.io
          readOnly: true
          volumeAttributes:
            secretProviderClass: kst2clukvault01

            # az aks enable-addons --resource-group teamawesome2 --name team2cluster --enable-addons http_application_routing --addons http_application_routing
            az aks enable-addons --resource-group teamawesome2 --name team2cluster --addons http_application_routing

            az aks show --resource-group teamawesome2 --name team2cluster --query addonProfiles.httpApplicationRouting.config.HTTPApplicationRoutingZoneName -o table