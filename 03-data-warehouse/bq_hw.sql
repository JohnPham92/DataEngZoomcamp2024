CREATE OR REPLACE EXTERNAL TABLE `green_taxi_rides.trip_data`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://ny_green_taxi_2022/green_tripdata_2022-*.parquet']
);

select count(*) from `green_taxi_rides.trip_data`;

create table green_taxi_rides.trip_data_materialized as select * from green_taxi_rides.trip_data;

select count(distinct PULocationID) from green_taxi_rides.trip_data;
select count(distinct PULocationID) from green_taxi_rides.trip_data_materialized;



select count(*) from green_taxi_rides.trip_data_materialized where fare_amount = 0

CREATE OR REPLACE TABLE `green_taxi_rides.trip_data_clustered_partitioned`
PARTITION BY DATE(lpep_pickup_datetime)
CLUSTER BY PUlocationID AS (
  SELECT * FROM green_taxi_rides.trip_data_materialized
);

select distinct PUlocationID from green_taxi_rides.trip_data_clustered_partitioned
where date(lpep_pickup_datetime) between '2022-06-01' and '2022-06-30';

select distinct PUlocationID from green_taxi_rides.trip_data_materialized
where date(lpep_pickup_datetime) between '2022-06-01' and '2022-06-30';