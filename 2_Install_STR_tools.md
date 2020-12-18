# Install STR Tools

The `scripts` directory contains a script [`2_install_str_tools.sh`](scripts/2_install_str_tools.sh) which run all of the steps described below.

Note: this example workflow assumes that the `STR_Expansions_Example_Workflow` directory is in your home directory.
If it is located elsewhere, you should only need to modify the following line to point to the correct directory:
```bash
WORK_DIR=~/STR_Expansions_Example_Workflow
```

---

First, we create a directory to install the two tools used in this workflow (ExpansionHunter and exSTRa)

```bash
mkdir -p $WORK_DIR/tools
cd $WORK_DIR/tools
```

## Install ExpansionHunter

Download the ExpansionHunter version 4.0.1 release (most recent version as of 18 December 2020).

```bash
wget https://github.com/Illumina/ExpansionHunter/releases/download/v4.0.1/ExpansionHunter-v4.0.1-linux_x86_64.tar.gz
tar xvzf ExpansionHunter-v4.0.1-linux_x86_64.tar.gz
ln -s ExpansionHunter-v4.0.1-linux_x86_64/bin/ExpansionHunter
```

ExpansionHunter output can (optionally) be manually inspected to help remove errors by visualising the alignments contributing to the predicted genotypes using `GraphAlignmentViewer`.

Download `GraphAlignmentViewer.py` (requires Python 3):

```bash
git clone https://github.com/Illumina/GraphAlignmentViewer.git
```


## Install exSTRa

exSTRa consists of a Perl module for raw data processing and an R package for analysis.

1. Install [htslib](http://www.htslib.org) (if not installed)

2. Install exSTRa Perl module

Download from GitHub

```bash
git clone https://github.com/bahlolab/Bio-STR-exSTRa.git
```

Install Bio::Perl (if not installed already)

```bash
cpanm 'Bio::Perl'
```

Install the exSTRa Perl package `Bio-STR-exSTRa`

```bash
cd $WORK_DIR/tools/Bio-STR-exSTRa

perl Build.PL
./Build installdeps
./Build
./Build test
./Build install
```

3. Install exSTRa R package

Install the `devtools` R package first (if not installed)

```bash
R -e 'install.packages("devtools")'  # (if devtools is not installed)
```

Install the exSTRa R package

```bash
R -e 'devtools::install_github("bahlolab/exSTRa")'
```

