# MitoSAlt (Long-Read Adaptation) — Docker Container

## Overview

This repository contains a Dockerised build of **MitoSAlt**, adapted to support **long-read sequencing data**. Unlike the standard MitoSAlt pipeline, which takes paired-end FASTQ files as input, this adaptation accepts a single **aligned BAM file** as input, making it suitable for long-read platforms.

This work is being developed as part of a bioinformatics project with UCL, with the container intended for eventual deployment on the **Genomics England Research Environment**.

## Project Goals

- Adapt the MitoSAlt pipeline to accept aligned BAM input in place of raw FASTQ pairs
- Package all required dependencies into a reproducible Docker container
- Validate the pipeline against real sequencing data
- Prepare the container for deployment within the Genomics England Research Environment

## Current Status

### Completed

- Docker image builds successfully
- Core runtime dependencies installed:
  - Perl
  - R
  - Java
- Bioinformatics tools installed:
  - samtools
  - sambamba
  - LAST
  - bedtools
  - UCSC `bedGraphToBigWig`

### Remaining Work

- [ ] Configure runtime paths within the container
- [ ] Determine and set the location of the reference genome and associated indexes
- [ ] Test the pipeline end-to-end using real BAM data
- [ ] Validate output against expected MitoSAlt results
- [ ] Document deployment steps for the Genomics England Research Environment

## Notes

This README will be updated as the pipeline is adapted and validated. Contributions, questions, and issue reports are welcome as the project progresses.