# Discovering novel repeat expansions (without prior knowledge)

The `scripts` directory contains a script [`5_search_novel_ehdn.sh`](scripts/5_search_novel_ehdn.sh) which run all of the steps described below.

Note: this example workflow assumes that the `STR_Expansions_Example_Workflow` directory is in your home directory.
If it is located elsewhere, you should only need to modify the following line to point to the correct directory:
```bash
WORK_DIR=~/STR_Expansions_Example_Workflow
```

The targeted search example workflow can be performed using the provided "mini" BAM files, however to search genome wide for novel expansions we need to use the full BAMs.

See details on the page describing how to [download example data and reference genomes](1_Download_data_reference.md)

---


## Compute individual STR profiles

**STR profiles** are generated for each sample.

The following command generates the STR profile for `sample1`:

```bash

ExpansionHunterDenovo profile \
        --reads bamlets/sample1.bam \
        --reference reference.fasta \
        --output-prefix str-profiles/sample1 \
        --min-anchor-mapq 50 \
        --max-irr-mapq 40
```

## Merge STR profiles

We require a manifest file `manifest.tsv` describing the cohort. This is a tab separated file containing the following information.

```bash
sample1  case    str-profiles/sample1.str_profile.json
sample2  control    str-profiles/sample2.str_profile.json
sample3  case    str-profiles/sample3.str_profile.json
sample4  case str-profiles/sample4.str_profile.json
sample5  case str-profiles/sample5.str_profile.json
sample6  case str-profiles/sample6.str_profile.json
sample7  case str-profiles/sample7.str_profile.json
sample8  case str-profiles/sample8.str_profile.json
sample9  case str-profiles/sample9.str_profile.json
sample10 case str-profiles/sample10.str_profile.json
```

Next, individual STR profiles are merged together into a **multi-sample STR profile**.

```bash
ExpansionHunterDenovo merge \
        --reference reference.fasta \
        --manifest manifest.tsv \
        --output-prefix example_dataset
```

This generates a multisample STR profile named `example_dataset.multisample_profile.json`, containing information about the large repeats identified across the cohort.

## Run case-control analysis

Finally, expansions are compared between cases and controls using the Python3 script `casecontrol.py` located in the EHdn `scripts/` directory.

```bash
/path/to/scripts/casecontrol.py locus \
        --manifest manifest.tsv \
        --multisample-profile example_dataset.multisample_profile.json \
        --output example_dataset.casecontrol_locus.tsv \
        [--target-regions target_regions.bed]
```
where `--target-regions` is an optional parameter for restricting the analysis to regions in the provided a BED file, for example a region identified through linkage analysis.

