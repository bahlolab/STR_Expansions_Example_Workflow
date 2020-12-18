# STR Expansions Example Workflow

This GitHub repository provides an example workflow for search for STR expansions at known loci that have been previously associated with disease.

It accompanies the book chapter: **(add details and link in future)**

## Getting started

To begin, download this example workflow to your home directory:

```bash
cd ~
git clone https://github.com/bahlolab/STR_Expansions_Example_Workflow.git
```

Note: this example workflow assumes that the `STR_Expansions_Example_Workflow` directory is in your home directory.
If it is located elsewhere, you should only need to modify a single line at the top of each example script:

```bash
WORK_DIR=~/STR_Expansions_Example_Workflow
```

## Example workflow

The example workflow is divided into several stages

### Setup

- [Download example data and reference genomes](1_Download_data_reference.md)
- [Install STR expansion tools](2_Install_STR_tools.md)

### Targeted search for expansions of STRs known to be associated with disease

- [Search for expansions with ExpansionHunter and exSTRa](3_Run_ExpansionHunter_exSTRa.md)
- [Visualise STR expansion results](4_Visualise_STR_results.md)

### Searching for novel repeat expansions (with no prior knowledge)

- [Searching for novel repeat expansions with ExpansionHunter Denovo](5_Novel_expansions.md)


## External resources

Below is a list of direct links to external resources used in the above workflow

Searching for STRs expansions at known disease loci:

- [ExpansionHunter](https://github.com/Illumina/ExpansionHunter)
- [exSTRa](https://github.com/bahlolab/exSTRa)
- [Database of known repeat loci]() ([hg19](), [hg38](), [grch37](), [grch38]())

Searching for novel repeat expansions:

- [ExpansionHunter Denovo](https://github.com/Illumina/ExpansionHunterDenovo)

