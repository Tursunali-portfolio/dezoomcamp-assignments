wget https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2019-01.csv.gz &
wget https://s3.amazonaws.com/nyc-tlc/misc/taxi+_zone_lookup.csv &&
gunzip ./dataset/green_tripdata_2019-01.csv.gz &&
python ingest_green_taxi_data.py -f ./dataset/green_tripdata_2019-01.csv -u postgres -P YWxpeGFuMjIK --db nytaxi &&
python ingest_lookup_table.py -f ./dataset/taxi+_zone_lookup.csv -u postgres -P YWxpeGFuMjIK --db nytaxi