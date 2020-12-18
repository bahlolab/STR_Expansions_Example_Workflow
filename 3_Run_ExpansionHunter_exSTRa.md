# Targeted search for expansions of STRs known to be associated with disease

The `scripts` directory contains a script [`3_search_targeted.sh`](scripts/3_search_targeted.sh) which run all of the steps described below.

Note: this example workflow assumes that the `STR_Expansions_Example_Workflow` directory is in your home directory.
If it is located elsewhere, you should only need to modify the following line to point to the correct directory:
```bash
WORK_DIR=~/STR_Expansions_Example_Workflow
```

---

## Required input

The targeted repeat expansion methods require the following input information:

- list of BAM files to search for expansions
- reference genome that BAM files were aligned to
- database of known repeats to search for expansions (separate file for each method)
- output directory to store results

For the example workflow, we specify the following:

```bash
BAMS=`ls $WORK_DIR/minibam/*.bam`

REFERENCE=$WORK_DIR/minibam/Homo_sapiens_assembly38.fasta

REPEATDB_EH=$WORK_DIR/repeats/ExpansionHunter_known_hg38.json
REPEATDB_EXSTRA=$WORK_DIR/repeats/exSTRa_known_hg38.txt

RESULTS_DIR=$WORK_DIR/results
```

## Running ExpansionHunter

Create directory to store results

```bash
mkdir -p $RESULTS_DIR/ExpansionHunter
```

Run ExpansionHunter: process each BAM file individually (looping over all BAMs)

```bash
for BAM in BAMS
do
  ExpansionHunter \
    --reads $BAM \
    --reference $REFERENCE \
    --variant-catalog $REPEATDB_EH \
    --output-prefix $RESULTS_DIR/ExpansionHunter/$(basename $BAM ".bam")
done
```

## Running exSTRa

Create directory to store results

```bash
mkdir -p $RESULTS_DIR/exSTRa
```

Run ExpansionHunter: process each BAM file individually (looping over all BAMs)

```bash
exSTRa_score.pl $REFERENCE $REPEATDB_EXSTRA $BAMS \
    > $RESULTS_DIR/exSTRa/exSTRa_scores.txt 2> $RESULTS_DIR/exSTRa/exSTRa.log
```

