## Cell specification and functional interactions in the pig blastocyst inferred from single-cell transcriptomics and uterine fluids proteomics

**Adrien Dufour<sup>1,2,\*</sup> Cyril Kurylo<sup>3,*</sup>, Jan B. Stöckl<sup>2</sup>, Denis Laloë<sup>4</sup>, Yoann Bailly<sup>5</sup>, Patrick Manceau<sup>5</sup>, Frédéric Martins<sup>2</sup>, Ali G. Turhan<sup>6</sup>, Stéphane Ferchaud<sup>7</sup>, Bertrand Pain<sup>2</sup>, Thomas Fröhlich<sup>3</sup>, Sylvain Foissac<sup>7,8,9</sup>, Jérôme Artus<sup>1,2</sup>, Hervé Acloque<sup>1,2</sup>** 


Available on Gennomics - [https://doi.org/10.1016/j.ygeno.2023.110780](https://doi.org/10.1016/j.ygeno.2023.110780).


### Table of Contents

1. [Paper abstract](#Abstract)

2. [Data availability](#data)

3. [Explore the data](#explore)

4. [Code availability](#code)

5. [Contact](#contact)

6. [Other links](#other)

   

### Abstract

The embryonic development of the pig comprises a long in utero pre- and peri-implantation development, which dramatically differs from mice and humans. During this peri-implantation period, a complex series of paracrine signals establishes an intimate dialogue between the embryo and the uterus. To better understand the biology of the pig blastocyst during this period, we generated a large dataset of single-cell RNAseq from early and hatched blastocysts, spheroid and ovoid conceptus and proteomic datasets from corresponding uterine fluids. Our results confirm the molecular specificity and functionality of the three main cell populations. We also discovered two previously unknown subpopulations of the trophectoderm, one characterised by the expression of LRP2, which could represent progenitor cells, and the other, expressing pro-apoptotic markers, which could correspond to the Rauber's layer. Our work provides new insights into the biology of these populations, their reciprocal functional interactions, and the molecular dialogue with the maternal uterine environment.


## Data availability<a name="data" />


### RNA-seq data<a name="rna" />


Various forms of the transcriptomics data are available [here](https://zenodo.org) for loading into R and python. 

| File name                                                    | Description                                                  |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| `r_anndata.h5ad`                                                | AnnData object for processing with [scanpy](https://scanpy.readthedocs.io/en/stable/index.html). |
| `r_sce.rds`                                                  | Contains a `SingleCellExperiment` object for processing in R. |
| `r_counts.mtx`                                               | Counts matrix in MatrixMarket format                         |
| `r_logcounts.mtx`                                            | Normalised logcounts in MatrixMarket format                  |
| `r_meta.tsv`                                                 | Per-cell observations (e.g. sample, cell type annotation, stage) |
| `r_genes.tsv`                                                | Ensembl codes and gene names for the scRNA-seq features.     |
| `r_sizefactors.tsv`                                          | Normalisation size factors computed for each cell using scran. |
| `r_corrected_pcs.tsv`                                        | The top 50 principal components resulting from fastMNN batch correction. |
| `r_reducedDims.rds` `r_umap.tsv` `r_tsne.tsv` `r_fa.tsv` `r_umap3d.tsv` | List of DataFrames containing coordinates for reduced dimensionality representations (e.g. UMAP, TSNE, PCA). |
| `oc_mm_orthologs.tsv`                                        | DataFrame of one-to-one orthologs between the rabbit (*Oryctolagus cuniculus*) and mouse (*Mus musculus*) obtained through Ensembl. |
| `oc_train_mf.rds` `oc_train_hs.rds` `mm_train_mf.rds` `mm_train_hs.rds` | SingleR models trained on rabbit (*oc*) and mouse (*mm*) datasets for predicting cell types in macaque (*mf*) and human (*hs*) data. |


Raw FASTQ files are available through ENA under accession [PRJEB60517](https://www.ebi.ac.uk/biostudies/arrayexpress/studies/E-MTAB-11836) and PRIDE  under accession [PRJEB60517](https://www.ebi.ac.uk/biostudies/arrayexpress/studies/E-MTAB-11836)



### ATAC-seq data<a name="atac" />

Fragment files for each of the samples can be found [here](https://content.cruk.cam.ac.uk/jmlab/RabbitGastrulation2022/data/ATAC/fragment_files/). 

Raw FASTQ files for the ATAC-seq data is available through ArrayExpress under accession [E-MTAB-11804](https://www.ebi.ac.uk/biostudies/arrayexpress/studies/E-MTAB-11804).


### Other<a name="other" />
The modified genome annotation (GTF) file used to process the RNA-seq data has been deposited [here](https://content.cruk.cam.ac.uk/jmlab/RabbitGastrulation2022/data/RNA/genome_annotation/). The original OryCun 2.0 reference and extended 3' annotations are also provided. 

For details of the other, externally generated datasets used in our analysis, see the methods section of the paper.


### Code availability<a name="code" />

The code used to process and analyse and the rabbit transcriptomics data is available through the [pig_embryo_scrnaseq](https://github.com/Goultard59/pig_embryo_scrnaseq) github repository.


### Support or Contact<a name="contact" />

General queries can be directed to [Hervé Acloque](herve.acloque@inrae.fr). For issues relating to the data, code or shiny app, you can file an issue on the most relevant github repository or email Adrien Dufour at [adrien.dufour@inrae.fr](mailto:adrien.dufour@inrae.fr). 


###### Affiliations

1. *Department of Haematology, University of Cambridge, Cambridge, UK*

2. *Wellcome-Medical Research Council Cambridge Stem Cell Institute, University of Cambridge, Cambridge, UK*

3. *Department of Zoology, University of Cambridge, Cambridge, UK*

4. *Department of Microbiology and Immunology, University of Gothenburg, Gothenburg, Sweden*

5. *Department of Pathology & Imaging, Novo Nordisk, Måløv, Denmark*

6. *Medical Research Council Laboratory of Molecular Biology, Cambridge, UK*

7. *Genome Biology Unit, European Molecular Biology Laboratory (EMBL), Heidelberg, Germany*

8. *Wellcome Sanger Institute, Wellcome Genome Campus, Cambridge, UK*

9. *European Molecular Biology Laboratory European Bioinformatics Institute, Cambridge, UK*

10. Cancer Research UK Cambridge Institute, University of Cambridge Cambridge, UK

   \* Authors contributed equally