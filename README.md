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

docker build -t python:data_loading

3. Run the Docker container:
```bash
docker run -it my-python-app:panda


## Restart docker containers
docker ps -a
docker restart pg-database
docker restart pgadmin
docker restart $(docker ps -a -q)

docker run -it ubuntu bash


##Ingest data

docker build -t data_ingest:v001 .
URL="https://github.com/DataTalksClub/nyc-tlc-data/releases/download/yellow/yellow_tripdata_2021-01.csv.gz"


URL="https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2025-01.parquet"

docker run -it \
  --network=pg-network \
  data_ingest:v001 \
    --user=root \
    --password=root \
    --host=pg-database \
    --port=5432 \
    --db=ny_taxi \
    --tb=yellow_taxi_trips \
    --url=${URL}


    parser.add_argument('--user', help='Username for Postgres.')
    parser.add_argument('--password', help='Password to the username for Postgres.')
    parser.add_argument('--host', help='Hostname for Postgres.')
    parser.add_argument('--port', help='Port for Postgres connection.')
    parser.add_argument('--db', help='Databse name for Postgres')
    parser.add_argument('--tb', help='Destination table name for Postgres.')
    parser.add_argument('--url', help='URL for .paraquet file.')