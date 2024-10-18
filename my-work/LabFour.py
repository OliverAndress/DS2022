#!/Library/Frameworks/Python.framework/Versions/3.12/bin/python3

import requests
import boto3
import os

# Define the necessary variables
bucket_name = "ds2022-csg7su"
file_url = "https://thumbs.dreamstime.com/b/image-depicts-vibrant-dynamic-scene-featuring-variety-sports-balls-including-basketball-soccer-ball-football-floating-330218035.jpg"
local_file_name = "sports.jpg"
expires_in = 604800  # 7 days (expiration time)


response = requests.get(file_url)
if response.status_code == 200:
    with open(local_file_name, 'wb') as file:
        file.write(response.content)
    print(f"File downloaded: {local_file_name}")
else:
    print(f"Failed to download file from {file_url}, status code: {response.status_code}")
    exit(1)
 
s3 = boto3.client('s3', region_name='us-east-1')

try:
    s3.upload_file(local_file_name, bucket_name, local_file_name)
    print(f"File uploaded to S3: s3://{bucket_name}/{local_file_name}")
except Exception as e:
    print(f"Error uploading file: {e}")
    exit(1)

try:
    presigned_url = s3.generate_presigned_url(
        'get_object',
        Params={'Bucket': bucket_name, 'Key': local_file_name},
        ExpiresIn=expires_in
    )
    print(f"Presigned URL: {presigned_url}")
except Exception as e:
    print(f"Error generating presigned URL: {e}")
    exit(1)

os.remove(local_file_name)
print(f"Local file {local_file_name} deleted.")

