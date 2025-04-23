# AWS

export AWS_ACCESS_KEY_ID=admin
export AWS_SECRET_ACCESS_KEY=admin123

aws s3api list-buckets --endpoint-url http://localhost:9000 

### Create a Storega Bucket

BUCKET=veleromarcel
REGION=ap-southeast-2
aws s3api create-bucket --bucket $BUCKET --region $REGION --create-bucket-configuration LocationConstraint=$REGION --endpoint-url http://localhost:9000

### Create  IAM User

aws iam create-user --user-name velero --endpoint-url http://localhost:9000

``` json
cat > velero-policy.json <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeVolumes",
                "ec2:DescribeSnapshots",
                "ec2:CreateTags",
                "ec2:CreateVolume",
                "ec2:CreateSnapshot",
                "ec2:DeleteSnapshot"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:DeleteObject",
                "s3:PutObject",
                "s3:AbortMultipartUpload",
                "s3:ListMultipartUploadParts"
            ],
            "Resource": [
                "arn:aws:s3:::${BUCKET}/*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::${BUCKET}"
            ]
        }
    ]
}
EOF
```

**Agregar la política personalizada en minio**

old:

``` bash
mc admin policy add local velero-policy velero-policy.json
```

new
``` bash
mc admin policy create local velero-policy velero-policy.json
```

```result
```

Asignar la política al usuario:










