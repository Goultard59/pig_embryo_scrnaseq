# pig_embryo_scrnaseq

## Generating matrices

Contains the codes needed to make the pig reference for CellRanger and the code to make the count matrice from the FASTQ file.

## Preprocessing

Contains the Jupyter Notebook used in order to make the quality controls of each embryos states.

# Scenic

Contains the different steps needed to have a SCENIC pigs database :

1. The Transcription Factor list
    - First run the script `transcription_factor.bash` with given matrice and the peptidique FASTA sequence.
    - Second run the script `hmmer_filtering.R` with given output from previous script.

2. The motif to Transcription Factor annotation
    - Run the script `orthologue_gene.bash` with the peptidique FASTA sequence from human and pigs.

3. The gene motif ranking file
    - First run the script `get_gene_fasta_ensembl.bash` with FASTA, annotation and karyotype from pigs.
    - Second run the script `generate_feather.bash` Following [this instruction](https://github.com/aertslab/create_cisTarget_databases) Generate the gene motif ranking file from a database of motif and a database of FASTA sequence.