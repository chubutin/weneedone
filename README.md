Esta aplicación cuenta con 3 partes para funcionar. Por ahora solo existen dos:
- Base de Datos Postgres
- Backend Python
- Aplicación Mobile

En el Archivo docker-compose están especificadas las 3 (por ahora 2) contenerdores que hacen del backend un servicio. Con el comando (1) se puede inicializar todo el backend. 

Para probar los servicios rest que el backend publica se adjunta una colección de POSTMAN junto con las variables de ambientes para el testeo local


Consideraciones:

- El Backend funciona en el puerto 5000 del contenedor, el cual está exportado a la maquina anfitriona. Esa variable del puerto está tanto en el Dockerfile del backend como en el archivo app.py del mismo.
- La base de datos funciona en el puerto 5432 original y default de postgres, pero es exportada al puerto 5405 del host el cual también se conecta el backend. Quizás esto debería hacerse con una variable global del docker compose (TODO)


TODO:
- Crear aplicación en Flutter y agregarla al docker compose
- Crear SQL para inicialización de la BBDD con entidades correspondientes
- Lograr que ande el hot reload de la aplicación Python


Docker Comandos ultiles


-- Borrar todas las imagenes no taggeadas

`docker rmi $(docker images --filter "dangling=true" -q --no-trunc) 2>/dev/null`

-- Conectar a bash de container remoto

`docker exec -ti 2a863aa5ea99 /bin/sh`

-- Listado de containers

`docker container list`

-- Docker Compose Crear, correr y borrar

`docker-compose up --build && docker docker-compose rm -fsv` (1)


