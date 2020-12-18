#!/usr/bin/env bash

set -euxo pipefail

WORK_DIR=~/STR_Expansions_Example_Workflow


# Download and install two tools for STR analysis: ExpansionHunter and exSTRa

mkdir -p $WORK_DIR/tools


# Download ExpansionHunter version is 4.0.1 (latest version as of 2020-12-18)

cd $WORK_DIR/tools
wget https://github.com/Illumina/ExpansionHunter/releases/download/v4.0.1/ExpansionHunter-v4.0.1-linux_x86_64.tar.gz
tar xvzf ExpansionHunter-v4.0.1-linux_x86_64.tar.gz
ln -s ExpansionHunter-v4.0.1-linux_x86_64/bin/ExpansionHunter


# Install exSTRa (Perl module for raw data processing and R package for analysis)
# - requires htslib (http://www.htslib.org)

cd $WORK_DIR/tools
git clone https://github.com/bahlolab/Bio-STR-exSTRa.git
cd Bio-STR-exSTRa

# Install Bio::Perl (if not installed already)
cpanm 'Bio::Perl'

# Install exSTRa Perl package
perl Build.PL
./Build installdeps
./Build
./Build test
./Build install

# Install R package
# R -e 'install.packages("devtools")'  # (if devtools is not installed)
R -e 'devtools::install_github("bahlolab/exSTRa")'


