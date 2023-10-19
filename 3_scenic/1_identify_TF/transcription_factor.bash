#Load modules
module purge
module load bioinfo/hmmer-3.2.1

HMMER_output="/home/adufour/work/cistargetdb/transcription_factor/hmmerout.txt"
HMMER_result="/home/adufour/work/cistargetdb/transcription_factor/hmmerout.txt"
HMMER_HMM="/pig_embryo_scrnaseq/3_scenic/1_identify_TF/global.hmm"
PROT_SEQ="/home/adufour/work/genome_and_annotation/proteome/Sus_scrofa.Sscrofa11.1.pep.all.fa"

#search for motif on ensembl 102 peptide sequence
/usr/local/bioinfo/src/HMMER/hmmer-3.2.1/bin/hmmsearch \
--tblout $HMMER_output \
--cpu 8 \
$HMMER_HMM \
$PROT_SEQ

awk '{split($0,a,"pep"); split(a[1],b," ");print b[1]"\t"b[2]"\t"b[3]"\t"b[4]"\t"b[5]"\t"b[6]"\t"b[7]"\t"b[8]"\t"b[9]"\t"b[10]"\t"b[11]"\t"b[12]"\t"b[13]"\t"b[14]"\t"b[15]"\t"b[16]"\t"b[17]"\t"b[18]"\t"a[2]}' $HMMER_output > $HMMER_result
rm $HMMER_output
