#!/usr/bin/env bash

set -euxo pipefail

WORK_DIR=~/STR_Expansions_Example_Workflow


# Download hg38 reference genome and index from "genomics-public-data" Google Bucket
# - Homo_sapiens_assembly38.fasta
# - Homo_sapiens_assembly38.fasta.fai

# Requires Google Cloud SDK (https://cloud.google.com/sdk)

mkdir $WORK_DIR/reference/

gsutil cp gs://genomics-public-data/resources/broad/hg38/v0/Homo_sapiens_assembly38.fasta $WORK_DIR/reference/
gsutil cp gs://genomics-public-data/resources/broad/hg38/v0/Homo_sapiens_assembly38.fasta.fai $WORK_DIR/reference/


# Alternatively, these two files can be downloaded manually from the following location:
# https://console.cloud.google.com/storage/browser/genomics-public-data/resources/broad/hg38/v0


