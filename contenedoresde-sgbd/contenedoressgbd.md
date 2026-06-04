## CONTENEDORES DE SISTEMAS GESTORES DE DATOS ##
![ImagenDocker](./img/doker.png)
## COMANDOS DOCKER CON DESCRIPCCION ##
| COMANDO | DESCRIPCCION |
| ;--- | ;--- |
| **DOCKER  -- VERSION**| _VERIFICA LA VERSION DE DOCKER_|
| **DOCKER PULL NOMBRE_IMAGEN** |_DESCARGA UNA IMAGEN DE DOCKER HUB_ [DOCKERHUB] (https://hub.docker.com/)|
| **DOCKER IMAGES** | _VISUALIZA LAS IMAGENES_ |
| **DOCKER RUN** | _CREAUN CONTEBNEDOR_ |
| **DOCKER ps** | _VISUALIZA LOS CONTENEDORES EN EJECUCION_ |
| **DOCKER CONTAINER LS** | _VISUALIZA TODOS LOS CONTENEDORES EN EJECUCION_ |
| **DOCKER  PS -A** | _VISUALIZA TODOS LOS CONTENEDORES EN EJECUCION_ |
| **DOCKER  CONTAINER LS -A** | _VISUALIZA TODOS LOS CONTENEDORES EN EJECUCION_ |
| **DOCKER  stop nombre _contenedor o id** | _detiene un contenedor_ |
| **DOCKER  start nombre _contenedor o id** | _inicia un contenedor_ |
| **DOCKER  rm nombre _contenedor o id** | _elimina un contenedor que no esta en ejecucion_ |
| **DOCKER  rm -f nombre _contenedor o id** | _elimina un contenedor que esta en  en ejecucion_ |
| **DOCKER  volume ls** | _lista los volumenes que tiene docker_ |
| **DOCKER  volume create nombre_volumen** | _crea un volumen_ |
| **DOCKER  volume rm nombre_volumen** | _elimina un volumen_ |





## COMANDOS DE CONTENEDORES 
```
docker pull docker/getting-started
```

## CONTENEDOR DE TUTORIAL DE DOCKER 

```
docker run -d --name tutorial-docker -p 80:80 d79336f4812b

docker run -d --name tutorial-docker -p 80:80 docker/getting-started:latest
```

## contenedor de maria db sin volumen 

```
docker run -d --name server-MariaDBG3 -p 3342:3306 -e MYSQL_ROOT_PASSWORD=12345 d8e96f
```

## contenedor de maria db con volumen 

```
docker run -d --name server-MariaDBG3 \
-p 3342:3306 -e MARIADB_ROOT_PASSWORD=12345 \
-v vol-MariaDBG3:/var/lib/mysql d8e96f
```
## contenedor de posgres con volumen 

```
docker run -d --name server-PosgresG3 \
-e POSTGRES_PASSWORD=123456 \
-p 5432:5432 -v vol-PosgresG3:/var/lib/postgresql/data \
eba8dd
```


## contenedor de sql server  con volumen 

```
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=P@ssw0rd" \
   -u 0 \
   -p 1451:1433 --name SQLServerG1 \
   -d -v vol-SQLserverG3:/var/opt/mssql/data \
   d01cc
```

