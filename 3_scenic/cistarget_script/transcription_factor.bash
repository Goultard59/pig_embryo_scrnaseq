#Load modules
module purge
module load bioinfo/hmmer-3.2.1
cd ~/work

#search for motif on ensembl 102 peptide sequence
/usr/local/bioinfo/src/HMMER/hmmer-3.2.1/bin/hmmsearch --tblout /home/adufour/work/cistargetdb/transcription_factor/hmmerout_108.txt --cpu 8 /home/adufour/work/cistargetdb/transcription_factor/global.hmm /home/adufour/work/genome_and_annotation/proteome/Sus_scrofa.Sscrofa11.1_108.pep.all.fa
