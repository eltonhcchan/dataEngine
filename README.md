# dataEngine

This respository helps me to learn data engineering.

# Scripts
docker network create pg-network
docker volume create --name dtc_postgres_volume_local -d local
docker run -it -e POSTGRES_USER="root" -e POSTGRES_PASSWORD="root" -e POSTGRES_DB="ny_taxi" -v dtc_postgres_volume_local:/var/lib/postgresql/data -p 5432:5432 --network=pg-network --name pg-database postgres:13

docker run -it -e PGADMIN_DEFAULT_EMAIL="xxx@admin.com" -e PGADMIN_DEFAULT_PASSWORD="root" -p 8080:80 --network=pg-network --name pgadmin dpage/pgadmin4

## docker build
1. Create a Dockerfile in the root directory with the following content:
```dockerfile
FROM ubuntu:latest
RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip3 install pandas numpy
COPY . /app
WORKDIR /app
CMD ["python3", "your_script.py"]
```
2. Build the Docker image:
```bash
docker build -t my-python-app:panda .

3. Run the Docker container:
```bash
docker run -it my-python-app:panda


## Restart docker containers
docker ps -a
docker restart pg-database
docker restart pgadmin
docker restart $(docker ps -a -q)

docker run -it ubuntu bash
