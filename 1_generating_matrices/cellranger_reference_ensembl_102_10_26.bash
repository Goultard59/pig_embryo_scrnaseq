#!/bin/bash
#SBATCH -J cellranger
#SBATCH -o output.out
#SBATCH -e error.out
#SBATCH --mem=16G
#SBATCH --export=ALL
##SBATCH --nodes=1 --ntasks-per-node=8
#SBATCH --signal=2
#SBATCH --no-requeue
#Purge any previous modules
module purge

#Load the application
module load bioinfo/cellranger-6.0.1
module load bioinfo/bcl2fastq-2.20.0

cd /home/adufour/work/10x_reference_genome

#Filter GTF following 10x genomics usage
cellranger mkgtf /home/adufour/work/genome_and_annotation/Sus_scrofa.Sscrofa11.1.102_10_26.gtf /home/adufour/work/genome_and_annotation/Sus_scrofa.Sscrofa11.1.102_10_26.filtered.gtf \
                   --attribute=gene_biotype:protein_coding \
                   --attribute=gene_biotype:lincRNA \
                   --attribute=gene_biotype:antisense \
                   --attribute=gene_biotype:IG_LV_gene \
                   --attribute=gene_biotype:IG_V_gene \
                   --attribute=gene_biotype:IG_V_pseudogene \
                   --attribute=gene_biotype:IG_D_gene \
                   --attribute=gene_biotype:IG_J_gene \
                   --attribute=gene_biotype:IG_J_pseudogene \
                   --attribute=gene_biotype:IG_C_gene \
                   --attribute=gene_biotype:IG_C_pseudogene \
                   --attribute=gene_biotype:TR_V_gene \
                   --attribute=gene_biotype:TR_V_pseudogene \
                   --attribute=gene_biotype:TR_D_gene \
                   --attribute=gene_biotype:TR_J_gene \
                   --attribute=gene_biotype:TR_J_pseudogene \
                   --attribute=gene_biotype:TR_C_gene

#making reference
cellranger mkref --genome=sus.scrofa.11.1.ensembl_102_2021_10_newgenes \
--fasta=/home/adufour/work/genome_and_annotation/Sus_scrofa.Sscrofa11.1.dna.toplevel.fa \
--genes=/home/adufour/work/genome_and_annotation/Sus_scrofa.Sscrofa11.1.102_10_26.filtered.gtf