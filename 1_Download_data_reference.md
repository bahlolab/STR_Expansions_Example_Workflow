# Downloading Example Data and Reference Genome

The `scripts` directory contains two scripts which run all of the steps described below for downloading the example data and downloading the required reference genome:

1. [`1a_download_bams.sh`](scripts/1a_download_bams.sh)
2. [`1b_download_reference.sh`](scripts/1b_download_reference.sh)


Note: this example workflow assumes that the `STR_Expansions_Example_Workflow` directory is in your home directory.
If it is located elsewhere, you should only need to modify the following line to point to the correct directory:
```bash
WORK_DIR=~/STR_Expansions_Example_Workflow
```

---

## Example data: WGS samples with known expansions

We use 10 publicly available samples, nine of which have known expansions for this example workflow.

These samples are described in the paper: [Dashnow et al. 2018. Genome Biology. _STRetch: Detecting and Discovering Pathogenic Short Tandem Repeat Expansions_](https://doi.org/10.1186/s13059-018-1505-2)

**WARNING: these samples are ~30Gb each and may take days to download**

We recommend using the "mini" BAM files in the `minibam` folder.
These have been filtered to only contain data for regions surrounding STR loci known to be associated with disease.

Follow the steps below, if you wish to download the full BAMs.

1. Install [samtools]((http://www.htslib.org)) and [SRA Toolkit](https://github.com/ncbi/sra-tools)

2. Download BAM files from the Sequence Read Archive (SRA)

```bash
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
```

3. Index BAM files

```bash
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
```


## Download reference genome

To run the STR Expansion Example workflow using the provided "mini" BAMs (or the full BAMs) you need to download the hg38 reference genome and index files:

1. `Homo_sapiens_assembly38.fasta`
2. `Homo_sapiens_assembly38.fasta.fai`

These files can be downloaded manually [here](https://console.cloud.google.com/storage/browser/genomics-public-data/resources/broad/hg38/v0)

Alternatively, they can be downloaded using [Google Cloud SDK](https://cloud.google.com/sdk) by running the following commands:
```bash
mkdir -p $WORK_DIR/reference

gsutil cp gs://genomics-public-data/resources/broad/hg38/v0/Homo_sapiens_assembly38.fasta $WORK_DIR/reference/
gsutil cp gs://genomics-public-data/resources/broad/hg38/v0/Homo_sapiens_assembly38.fasta.fai $WORK_DIR/reference/
```

