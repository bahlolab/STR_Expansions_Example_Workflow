#!/usr/bin/env bash

set -euxo pipefail

WORK_DIR=~/STR_Expansions_Example_Workflow


# Required input (default choices for example workflow listed below):
# - bam files to analyse
# - reference genome 
# - database of repeats to search for expansions for ExpansionHunter and exSTRa
# - directory to store results

BAMS=`ls $WORK_DIR/minibam/*.bam`

REFERENCE=$WORK_DIR/minibam/Homo_sapiens_assembly38.fasta

REPEATDB_EH=$WORK_DIR/repeats/ExpansionHunter_known_hg38.json
REPEATDB_EXSTRA=$WORK_DIR/repeats/exSTRa_known_hg38.txt

RESULTS_DIR=$WORK_DIR/results


# Create results directories and ensure ExpansionHunter binary is in PATH

mkdir -p $RESULTS_DIR/ExpansionHunter
mkdir -p $RESULTS_DIR/exSTRa

export PATH=$PATH:$WORK_DIR/tools


# Run ExpansionHunter (looping over all BAMs)
for BAM in BAMS
do
  ExpansionHunter \
    --reads $BAM \
    --reference $REFERENCE \
    --variant-catalog $REPEATDB_EH \
    --output-prefix $RESULTS_DIR/ExpansionHunter/$(basename $BAM ".bam")
done


# Run exSTRa
exSTRa_score.pl $REFERENCE $REPEATDB_EXSTRA $BAMS \
    > $RESULTS_DIR/exSTRa/exSTRa_scores.txt 2> $RESULTS_DIR/exSTRa/exSTRa.log


