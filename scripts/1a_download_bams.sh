#!/usr/bin/env bash

set -euxo pipefail

WORK_DIR=~/STR_Expansions_Example_Workflow

# Download SAM files from SRA and convert to BAM format (to save space)
# - requires SRA Toolkit (https://github.com/ncbi/sra-tools)
# - requires samtools    (http://www.htslib.org)

# *** WARNING ***
# This will take a long time (days) and download a large amount of data (~30 GB per sample)
# 
# We recommend using the provided "mini" bam files in the `minibam` folder which are
# the same set of samples, filtered down to regions around known repeat expansions

mkdir -p $WORK_DIR/bam

sam-dump --unaligned SRR7205167 | samtools view -b -o $WORK_DIR/bam/sample10.bam -
sam-dump --unaligned SRR7205168 | samtools view -b -o $WORK_DIR/bam/sample9.bam -
sam-dump --unaligned SRR7205169 | samtools view -b -o $WORK_DIR/bam/sample6.bam -
sam-dump --unaligned SRR7205170 | samtools view -b -o $WORK_DIR/bam/sample5.bam -
sam-dump --unaligned SRR7205171 | samtools view -b -o $WORK_DIR/bam/sample8.bam -
sam-dump --unaligned SRR7205172 | samtools view -b -o $WORK_DIR/bam/sample7.bam -
sam-dump --unaligned SRR7205173 | samtools view -b -o $WORK_DIR/bam/sample2.bam -
sam-dump --unaligned SRR7205174 | samtools view -b -o $WORK_DIR/bam/sample1.bam -
sam-dump --unaligned SRR7205175 | samtools view -b -o $WORK_DIR/bam/sample4.bam -
sam-dump --unaligned SRR7205176 | samtools view -b -o $WORK_DIR/bam/sample3.bam -

# Index BAM files
samtools index $WORK_DIR/bam/sample10.bam
samtools index $WORK_DIR/bam/sample9.bam
samtools index $WORK_DIR/bam/sample6.bam
samtools index $WORK_DIR/bam/sample5.bam
samtools index $WORK_DIR/bam/sample8.bam
samtools index $WORK_DIR/bam/sample7.bam
samtools index $WORK_DIR/bam/sample2.bam
samtools index $WORK_DIR/bam/sample1.bam
samtools index $WORK_DIR/bam/sample4.bam
samtools index $WORK_DIR/bam/sample3.bam


