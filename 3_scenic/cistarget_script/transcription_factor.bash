####
# Facteur de transcription
####

awk -F "\t" '{
    if ($2 ~ '-' || $2 ~ \description:\)
        print $3;
    else
        print $2;
    }' /home/adufour/work/tfdb/Sus_scrofa_TF | sed '/^Symbol$/d' > /home/adufour/work/cistargetdb/tf_list.txt


module purge
module load bioinfo/hmmer-3.2.1
cd ~/work
/usr/local/bioinfo/src/HMMER/hmmer-3.2.1/bin/hmmersearch --tblout /home/adufour/work/cistargetdb/hmmerout.txt --cpu 8 /home/adufour/work/cistargetdb/global.hmm /home/adufour/work/proteome/Sus_scrofa.Sscrofa11.1.pep.all.fa

awk '{split($0,a,"pep"); split(a[1],b," ");print b[1]"\t"b[2]"\t"b[3]"\t"b[4]"\t"b[5]"\t"b[6]"\t"b[7]"\t"b[8]"\t"b[9]"\t"b[10]"\t"b[11]"\t"b[12]"\t"b[13]"\t"b[14]"\t"b[15]"\t"b[16]"\t"b[17]"\t"b[18]"\t"a[2]}' /home/adufour/work/cistargetdb/hmmerout.txt > /home/adufour/work/cistargetdb/hmmer_result.txt
rm /home/adufour/work/cistargetdb/hmmerout.txt