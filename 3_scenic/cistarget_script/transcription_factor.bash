#Load modules
module purge
module load bioinfo/hmmer-3.2.1
cd ~/work

#search for motif on ensembl 102 peptide sequence
/usr/local/bioinfo/src/HMMER/hmmer-3.2.1/bin/hmmersearch --tblout /home/adufour/work/cistargetdb/hmmerout.txt --cpu 8 /home/adufour/work/cistargetdb/global.hmm /home/adufour/work/proteome/Sus_scrofa.Sscrofa11.1.pep.all.fa