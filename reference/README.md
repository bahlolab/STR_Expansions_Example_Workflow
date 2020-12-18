# Reference genome

To run the STR Expansion Example workflow, you need ot download the hg38 reference genome and index files:

1. `Homo_sapiens_assembly38.fasta`
2. `Homo_sapiens_assembly38.fasta.fai`

These files can be downloaded manually [here](https://console.cloud.google.com/storage/browser/genomics-public-data/resources/broad/hg38/v0)

They can also be downloaded using [Google Cloud SDK](https://cloud.google.com/sdk) by running the following commands:
```bash
gsutil cp gs://genomics-public-data/resources/broad/hg38/v0/Homo_sapiens_assembly38.fasta .
gsutil cp gs://genomics-public-data/resources/broad/hg38/v0/Homo_sapiens_assembly38.fasta.fai .
```

