#!/bin/bash
set -e

spark-submit \
  --master yarn \
  --deploy-mode client \
  --name my_demo_app \
  --conf spark.app.name=my_demo_app \
  \
  --num-executors 2 \
  --executor-cores 2 \
  --executor-memory 4g \
  --driver-cores 2 \
  --driver-memory 4g \
  \
  --conf spark.executor.memoryOverhead=512 \
  --conf spark.sql.shuffle.partitions=32 \
  \
  --conf spark.port.maxRetries=50 \
  --conf spark.dynamicAllocation.enabled=false \
  --conf hive.exec.dynamic.partition=true \
  --conf hive.exec.dynamic.partition.mode=nonstrict \
  \
  --conf spark.sql.legacy.parquet.datetimeRebaseModeInWrite=LEGACY \
  --conf spark.sql.legacy.parquet.int96RebaseModeInWrite=LEGACY \
  --conf spark.sql.legacy.parquet.datetimeRebaseModeInRead=LEGACY \
  --files \
  s3://spark-bucket/my_demo_app/load_source_data.sql \
  --py-files \
  s3://spark-bucket/build/libs.zip \
  s3://spark-bucket/jobs/my_demo_job.py \
  \
  --my_demo_job_argument1 value1 \
  --my_demo_job_argument2 value2 \
  --my_demo_job_argument3 value3
