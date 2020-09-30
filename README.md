## Spark History Server Docker Image

This repo contains Spark history server docker image for paytmlabs which supports only s3 filesystem. It accepts event log directory path (e.g. s3a://s3-bucket/sub-dir) and server side encryption algorithm. AWS credentials should be exposed as environment variable. 

### S3

The [hadoop-aws](https://hadoop.apache.org/docs/current/hadoop-aws/tools/hadoop-aws/index.html) is included in the image to support AWS S3 integration

