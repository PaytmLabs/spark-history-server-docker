#!/usr/bin/env bash

set -euo pipefail

if [[ "${#}" -lt 2 ]]; then
  printf 'Usage: %s eventsDirPath serverSideEncryptionAlgorithm\n' "${BASH_SOURCE[0]##*/}" >&2
  exit 1
fi

declare SPARK_HISTORY_OPTS=""

readonly eventsDir="${1}"
readonly serverSideEncryption="${2}"

export SPARK_HISTORY_OPTS="$SPARK_HISTORY_OPTS \
  -Dspark.history.fs.logDirectory=${eventsDir} \
  -Dspark.hadoop.fs.s3a.impl=org.apache.hadoop.fs.s3a.S3AFileSystem \
  -Dspark.hadoop.fs.s3a.server-side-encryption-algorithm=${serverSideEncryption} \
  -Dspark.hadoop.fs.s3a.aws.credentials.provider=com.amazonaws.auth.EnvironmentVariableCredentialsProvider";

/opt/spark/bin/spark-class org.apache.spark.deploy.history.HistoryServer
