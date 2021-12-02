#!/bin/bash
#SBATCH -p workq
#SBATCH --mem=100G
#SBATCH -J J5_1221
#SBATCH -N 1
#SBATCH -o J5_1221_output.out
#SBATCH -e J5_1221_error.out
#Purge any previous modules
module purge

#Load the application
module load bioinfo/cellranger-6.0.1
module load bioinfo/bcl2fastq-2.20.0

#mkdir ~/work/run_cellranger_count
cd ~/work/run_cellranger_count/ensembl

cellranger count --id=J5_05122021_10_26 \
--fastqs=/work2/project/fragencode/workspace/plus4pigs/data/reads/scRNAseq/J5_1_20210512/ \
--sample=J5-1_GTGGATCAAA_AGTGTTACCT \
--transcriptome=/home/adufour/work/10x_reference_genome/sus.scrofa.11.1.ensembl_102_2021_10_newgenes \
--jobmode=slurm \
--mempercore=8 \
--maxjobs=100