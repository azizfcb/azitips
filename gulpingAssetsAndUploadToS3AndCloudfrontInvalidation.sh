#!/bin/bash

# Prior to excuting this script you must have jq installed in your system
# Find out more here https://stedolan.github.io/jq/

#This is the file containg different config variables
. /home/ubuntu/.env
export AWS_CONFIG_FILE="/home/ubuntu/.aws/credentials"
export AWS_DEFAULT_REGION="us-west-2"
aws configure set preview.cloudfront true

echo "Gulping assets ..."
gulp && \
echo "Gulping assets ================> Done" && \
echo "Uplaoding assets/admin ..." && \
aws s3 cp public/assets/admin s3://${AWS_PUBLIC_BUCKET_S3}/${FODLER}/assets/admin --recursive && \
echo "Uplaoding assets/admin ==========> Done" && \
echo "Uplaoding assets/common ..." && \
aws s3 cp public/assets/common s3://${AWS_PUBLIC_BUCKET_S3}/${FODLER}/assets/common --recursive && \
echo "Uplaoding assets/common =========> Done" && \
echo "Uplaoding assets/dist/js ..." && \
aws s3 cp public/assets/dist/js s3://${AWS_PUBLIC_BUCKET_S3}/${FODLER}/assets/dist/js --recursive --content-type application/javascript && \
echo "Uplaoding assets/js =========> Done" && \
echo "Uplaoding assets/dist/css ..." && \
aws s3 cp public/assets/dist/css s3://${AWS_PUBLIC_BUCKET_S3}/${FODLER}/assets/dist/css --recursive --content-type text/css && \
echo "Uplaoding assets/dist/css =======> Done " && \
echo "Invalidationg the cloudfront distribution "
cdnId=$(aws cloudfront list-distributions | jq --arg AWS_PUBLIC_BUCKET_S3 $AWS_PUBLIC_BUCKET_S3 '.DistributionList.Items[] | select(.Origins.Items[0].Id | contains($AWS_PUBLIC_BUCKET_S3)) .Id')
echo "Invalidating the cloudfront distrubtion ===========> Done"
echo "Waiting for the effect to take place ..."
INVALIDATION_ID=$(date +"%S")
INVALIDATION_JSON="{
    \"DistributionId\":$cdnId,
    \"InvalidationBatch\": {
        \"Paths\": {
            \"Quantity\": 1,
            \"Items\": [
                \"/*\"
            ]
        },
        \"CallerReference\": \"$INVALIDATION_ID\"
    }
}"

invalidationId=$(aws cloudfront create-invalidation --cli-input-json "$INVALIDATION_JSON" | jq '.Invalidation.Id')
aws cloudfront wait invalidation-completed --distribution-id $(eval echo $cdnId) --id $(eval echo $invalidationId)
echo "===============================================> Done"
echo "Finished executing the script with success! Enjoy :-)"