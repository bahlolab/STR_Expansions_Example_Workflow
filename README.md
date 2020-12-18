# STR Expansions Example Workflow

Written by Mark Bennett, last updated: 18 December 2020.

Please contact Mark (<mark.bennett@wehi.edu.au>) with questions, suggestions or if you would like more detailed advice about STR expansion analysis.

---

We describe an example workflow for search for STR expansions at known loci that have been previously associated with disease.

It accompanies the book chapter: **(add details and link in future when available)**

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

We describe an example workflow to perform a targeted search for STR expansions known to be associated with disease. This workflow is divided into several stages, see links below:

### Setup

- [Download example data and reference genomes](1_Download_data_reference.md)
- [Install STR expansion tools](2_Install_STR_tools.md)

### Targeted search for expansions of STRs known to be associated with disease

- [Search for expansions with ExpansionHunter and exSTRa](3_Run_ExpansionHunter_exSTRa.md)
- [Visualise STR expansion results](4_Visualise_STR_results.md)

### External resources

Direct links to external resources used in the above workflow

- [ExpansionHunter](https://github.com/Illumina/ExpansionHunter)
- [exSTRa](https://github.com/bahlolab/exSTRa)
- [GraphAlignmentViewer](https://github.com/Illumina/GraphAlignmentViewer)
- [Database of known repeat loci]() ([hg19](), [hg38](), [grch37](), [grch38]())

### Searching for novel repeat expansions

This example workflow performs a targeted search for expansions at a predefined database of STR loci.
For those individuals who remain undiagnosed, you may wish to search for genome wide for _novel_ repeat expansions.
[ExpansionHunter Denovo](https://github.com/Illumina/ExpansionHunterDenovo) is a method specifically designed to search genome wide for novel repeat expansions. 

A genome wide search is beyond the scope of this example workflow.
It requires the full WGS sample and cannot be performed using the "mini" BAMs provided here.

To get started searching for novel repeat expansions try the [quick start guides](https://github.com/Illumina/ExpansionHunterDenovo/blob/master/documentation/00_Introduction.md) provided in the ExpansionHunter Denovo documentation or contact Mark.


