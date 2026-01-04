# DBUserService
Base de datos para el microservicio de autenticacion de usuarios, base de datos utilizada ```Mysql```


# Contenido de la base de datos

## Tablas
- Usuarios
- Rol 
- Distrito
- Departamento


## Estructura

```text
DBUserService/
│── docker-compose.yml
│── .env
│── mysql/
│   └── data/
```

## Comandos de docker

Para levantar el servicio

```docker
docker compose up -d
```

Detener el contenedor 

```docker
docker compose stop
```

Para volverlo a iniciar

```docker
docker compose start
````

Mostrar los logs

```docker
docker logs mysql_db_user_service
```

Cuando se usa services_default asegurarse de que ya exita

```docker
docker network ls

NETWORK ID     NAME                        DRIVER    SCOPE
242342525232   service_default             bridge    local
```

Pero si no exite

```docker
docker network creaate service_default
```

Eliminar el contenedor

```docker
docker compose down -v
```


## Crear archivo ```.env```

```bash
cp .env.example .env
```