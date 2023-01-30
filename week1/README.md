# Week1 homework solutions

## Question 1: Knowing docker tags
Run the following code in bash to find the answer:
```
docker build --help | grep "Write the image ID to the file"
```
result:
```
      --iidfile string          Write the image ID to the file
```

## Question 2: Understanding docker first run
Run the following command first:
```bash
docker run -it python:3.9 bash
```
New bash opens. And execute the following command to list the installed packages:
```bash
pip list
```
result:
```
Package    Version
---------- -------
pip        22.0.4
setuptools 58.1.0
wheel      0.38.4
```

## Preparation:
First we need to set up database.
1. Run Postgresql in docker.
```bash
docker-compose up
```
2. Ingest data into the db.
```bash
./ingest.sh
```

## Question 3: Count records
command:
```sql
select
  count(1)
from
  green_taxi_data
where
  lpep_pickup_datetime :: date = '2019-01-15' :: date
  and lpep_dropoff_datetime :: date = '2019-01-15' :: date;
```
result:
```
20530
```

## Question 4: Largest trip for each day
command:
```sql
select
  lpep_pickup_datetime :: date,
  max(trip_distance)
from
  green_taxi_data
group by
  lpep_pickup_datetime :: date
order by
  max(trip_distance) desc
limit
  1;
```
result:
```
2019-01-15 | 117.99
```

## Question 5: The number of passengers
command:
```sql
select
  2 as num_pass,
  count(1)
from
  green_taxi_data
where
  lpep_pickup_datetime :: date = '2019-01-01' :: date
  and passenger_count = 2
union
select
  3 as num_pass,
  count(1)
from
  green_taxi_data
where
  lpep_pickup_datetime :: date = '2019-01-01' :: date
  and passenger_count = 3;
```
result:
```
2 | 1282
3 | 254
```

## Question 6: Largest tip
command:
```sql
select
  zdo."Zone" as zone,
  max(t.tip_amount) as max_tip
from
  green_taxi_data t
  join zone_lookup zpu on t."PULocationID" = zpu."LocationID"
  join zone_lookup zdo on t."DOLocationID" = zdo."LocationID"
where
  zpu."Zone" = 'Astoria'
group by
  zdo."Zone"
order by
  max_tip desc
limit
  1;
```
result:
```
Long Island City/Queens Plaza | 88
```