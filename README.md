# pig_embryo_scrnaseq

## About
This repository contains all scripts to reproduce the results from the paper "Cell specification and functional interactions in the pig blastocyst inferred from single cell transcriptomics".
Preprint available at: https://www.biorxiv.org/content/10.1101/2023.05.30.542847v1

## Abstract
The early embryonic development of the pig comprises a long in utero pre- and peri-implantation development, which dramatically differs from mouse and human. During this pro-tracted peri-implantation period, an intimate dialogue between the embryo and the uterus is established through a complex series of paracrine signals. It leads to concomitant drastic changes in the embryonic morphology and uterine receptivity to implantation. From day 7 after fertilization, the spherical blastocyst elongates as ovoid, tubular and filamentous wich transforms from a 0.5-1 mm diameter sphere to a 1000 mm long filamentous blastocyst at day 16. At the same time, the inner cell mass moves up to the trophoblast as the Rauber’s layer disappears and evolves as an embryonic disc that is directly exposed to molecules present in the uterine fluids. These drastic changes occurring before implantation are driven and coordinated by interactions between embryonic cells and maternal tissues.

To better understand the biology of pig embryos before implantation, we generated a large dataset of single-cell RNAseq at different embryonic stages (early and hatched blastocyst, spheroid and ovoid conceptus) and proteomic datasets from corresponding uterine fluids. These data were cleaned, filtered and represent a total of 34,888 cells. We first characterised the embryonic and extra-embryonic cell populations and their evolution, and identified population-specific markers of the three main populations (epiblast, trophectoderm and hypoblast). Our analysis also confirmed known functions and predicted new biological functions associated with these cell populations. We then inferred gene regulatory networks working on modules of gene regulation (regulon) and selected those that were specifically active in each embryonic population. We confirmed the relevance of the identified regulons by a meta-analysis of two other scRNAseq datasets (porcine and human preimplantation embryos). We then linked these regulons to signalling pathways and biological processes. Our results confirm the molecular specificity and functionality of the three main cell populations and identify novel stage-specific subpopulations. In particular, we discovered two previously unknown subpopulations of the trophectoderm, one characterised by the expression of LRP2, which could represent a subpopulation of progenitor cells, and the other, expressing many pro-apoptotic markers, which could correspond to the cells of the Rauber’s layer. We also provide new insights into the biology of these populations, their reciprocal functional interactions and the molecular dialogue established with the maternal uterine environment.

## Repository
The repository is structured as follows:

- Ressource used for [matrice generation](1_generating_matrices)
- Jupyter Notebook used for [secondary analysis](2_preprocessing/notebook)
- Ressource used for [scenic](3_scenic)
- Jupyter Notebook used for [Supplementary data](4_Generating_plot)
- Script used for [Pathways analysis](5_Pathways_analysis)
- Environnment used in [conda](virtualEnvs)

## Data
- All raw sequencing data and associated metadata are available in FAANG Data portal (https://data.faang.org/home) and ENA under accession number PRJEB60517.
- The mass spectrometry proteomics data have been deposited to the ProteomeXchange Consortium via the PRIDE[93] partner repository with the dataset identifier PXD042421.
- Seurat objects are at available on Zenodo : https://zenodo.org/records/14185955

## Questions
For questions contact "adrien.dufour@inrae.fr"
