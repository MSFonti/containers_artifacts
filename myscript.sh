https://labs.skillmeup.com/labengine/modules/microsoft-open-hack-containers-v2_2d85a605ca87_3_0?isImpersonating=True&groupmode=True

docker network create ohnet



docker run --network ohnet -e SQLFQDN=localhost -e SQLUSER=SA -e SQLPASS="<YourStrong@Passw0rd>" -e SQLDB=mydrivingDB registryrnr9881.azurecr.io/dataload:1.0

docker ps -a
docker exec -it sql1 "bash"

docker kill 5fac9ed0bde7
docker rm 9780f047aeeb98013b5d0f9766b3fd8dd2183b1afe0f5849fa1bf1e811e207ba

docker run --network ohnet -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=Badanka123!" -p 1433:1433 --name sql1 -h sql1 -d mcr.microsoft.com/mssql/server:2017-latest 
docker run --network host -e SQLFQDN=localhost -e SQLUSER=SA -e SQLPASS="Badanka123!" -e SQLDB=mydrivingDB registryrnr9881.azurecr.io/dataload:1.0

docker exec -it sql1 "bash"
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "Badanka123!"
docker run --network ohnet "tripinsights/poi:1.0"

docker run --network ohnet -d -p 8080:80 --name poi -e "SQL_USER=SA" -e "SQL_PASSWORD=Badanka123!" -e "SQL_SERVER=172.18.0.2" -e "ASPNETCORE_ENVIRONMENT=Local" tripinsights/poi:1.0
curl -i -X GET 'http://localhost:8080/api/poi/264ffaa3-1fe8-4fb0-a4fb-63bdbc9999ae'
curl -i -X GET 'http://localhost:8080/api/poi/healthcheck'
curl -i -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{ "tripId": "ea2f7ae0-3cef-49cb-b7d1-ce972113120c", "latitude": 47.39026323526123, "longitude": -123.23165568111123, "poiType": 2, "timestamp": "2019-07-12T02:30:03.351Z", "deleted": false }' 'http://localhost:8080/api/poi'
CREATE DATABASE mydrivingDB
select Name from sys.DATABASE
GO

docker tag Dockerfile_3_JR registryrnr9881.azurecr.io/


docker build -f Dockerfile_0_JR -t "tripinsights/poi:1.0" .
docker build -f Dockerfile_3_JR -t "tripinsights/poi:1.0" .

docker run --network ohnet "tripinsights/poi:1.0"

docker run "tripinsights/poi:1.0"

http://localhost:8080/api/poi/healthcheck

--name tripinsights -d busybox sh -c "while true; do $(echo date); sleep 1; done"


docker login registryrnr9881.azurecr.io
docker tag tripinsights/poi:1.0 registryrnr9881.azurecr.io/userjava:v1
docker push registryrnr9881.azurecr.io/userjava:v1

