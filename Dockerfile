FROM python:3.9.1

RUN apt-get install wget
RUN pip install pandas sqlalchemy psycopg2 pyarrow fastparquet

WORKDIR /app
COPY data-loading-parquet.py data-loading-parquet.py 

ENTRYPOINT [ "python", "data-loading-parquet.py" ]