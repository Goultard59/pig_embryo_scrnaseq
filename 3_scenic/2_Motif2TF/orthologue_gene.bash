####
# ORTHOLOGUE
####
module purge
module load bioinfo/ncbi-blast-2.10.0+ bioinfo/fastme-2.1.6.1 bioinfo/dlcpar-1.0 bioinfo/mcl-14-137 bioinfo/diamond-v0.9.19
module load bioinfo/OrthoFinder-2.5.2

cd /pig_embryo_scrnaseq/2_Motif2TF/peptide_fasta

#search for orthologuous genes
for f in *fa ; do python /usr/local/bioinfo/src/OrthoFinder/OrthoFinder-2.5.2/tools/primary_transcript.py $f ; done
/usr/local/bioinfo/src/OrthoFinder/OrthoFinder-2.5.2/orthofinder -f primary_transcripts/

#Script to add orthologue to motif2TF
R script /pig_embryo_scrnaseq/2_Motif2TF/orthologuous.R