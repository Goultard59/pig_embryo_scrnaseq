#!/bin/bash
#SBATCH -J cistarget_db
#SBATCH -c 44
#SBATCH --time=10:00:00
#SBATCH --constraint=broadwell
#SBATCH --output=~/work/cistarget_db.log

#initialize variables
version=Sus_scrofa.Sscrofa11.1.103
fasta=~/work/cistargetdb/file_feather_generation/fasta_gene_ensembl_$version.fasta
motif_dir=~/work/cistargetdb/singletons
motif2tf=~/work/cistargetdb/motif2tf_orthologuous.tbl
motif_list=~/work/cistargetdb/motif_list.txt
output=~/work/cistargetdb/feather_ensembl_v2/Sus_scrofa

#initialize environment
source /home/adufour/.bashrc
conda activate create_cistarget_databases
create_cistarget_databases_dir="/home/adufour/work/create_cisTarget_databases"

#fetch motif name from motif folder
ls $motif_dir | sed -e 's/.cb//' > $motif_list

#feather base creation
/home/adufour/work/create_cisTarget_databases/create_cistarget_motif_databases.py --fasta $fasta \
--motifs_dir $motif_dir \
--motifs $motif_list \
--genes "#[0-9]+$" \
--threads 44 \
--output $output