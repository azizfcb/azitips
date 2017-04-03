#!/bin/bash
file=$(date +%Y-%B-%d).sql
mysqldump \
  --host localhost \
  --port 3306 \
  -u root \
  --password="${MYSQL_PASS}" \
  ${DB_name} > ${file}
if [ "${?}" -eq 0 ]; then
  gzip ${file} && aws s3 cp ${file}.gz s3://${S3_BUCKET} && rm ${file}.gz
else
  echo "Thhis"
  exit 255
fi