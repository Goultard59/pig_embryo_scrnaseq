#Initialize variable and modules
module load bioinfo/bedtools2-2.29.0
version=Sus_scrofa.Sscrofa11.1.103
fasta=/home/adufour/work/genome_and_annotation/Sus_scrofa.Sscrofa11.1.dna.toplevel.fa
genome=/home/adufour/work/genome_and_annotation/$version.gtf
chrdetails=/home/adufour/work/genome_and_annotation/$version.genome

#Filter annotation file on transcript level
awk -v var="transcript" -F"\t" '($3 == var) {print $0}' $genome > ~/work/cistargetdb/file_feather_generation/gene_$version.gff3

#Get 5kb upstream transcript annotation
bedtools flank -i ~/work/cistargetdb/file_feather_generation/gene_$version.gff3 -g $chrdetails -l 5000 -r 0 -s > ~/work/cistargetdb/file_feather_generation/gene_upstream_$version.gtf

#Sort and filter annotation file
bedtools sort -i ~/work/cistargetdb/file_feather_generation/gene_upstream_$version.gtf > ~/work/cistargetdb/file_feather_generation/gene_upstream_sorted_$version.gtf
sort -k1,1 -k4,4n -k5,5n -k7,7 -u ~/work/cistargetdb/file_feather_generation/gene_upstream_sorted_$version.gtf > ~/work/cistargetdb/file_feather_generation/gene_upstream_uniq_$version.gtf
awk -F'\t' '{if ($5 - $4 > 5) print $0 }' ~/work/cistargetdb/file_feather_generation/gene_upstream_uniq_$version.gtf > ~/work/cistargetdb/file_feather_generation/gene_upstream_fix_$version.gtf

#Get 5kb upstream transcript sequence
bedtools getfasta -s -fi $fasta -bed ~/work/cistargetdb/file_feather_generation/gene_upstream_fix_$version.gtf > ~/work/cistargetdb/file_feather_generation/tmp_seq_by_gene.fasta

###
#Recover the gene names
###

#Read the upstream transcript FASTA
while read line; do
  #if identifier
  if [ "${line:0:1}" == ">" ]; then
    chr=`echo ${line:1} | cut -d: -f1`;
    opart=`echo $line | cut -d'(' -f1`;
    tpart=`echo $line | cut -d'(' -f2`;
    ipart=`echo $opart | cut -d: -f2`;
    start=$((`echo $ipart | cut -d'-' -f1` + 1));
    end=`echo $ipart | cut -d'-' -f2`;
    strand=`echo $tpart | sed 's/)//'`;
    gene_name=`awk -v chr="$chr" -v start="$start" -v end="$end" -v strand="$strand" -F"\t" '($1 == chr && $4 == start && $5 == end && $7 == strand) {print $9}' ~/work/cistargetdb/file_feather_generation/gene_upstream_fix_$version.gtf`;
    #If duplicate
    gene=`echo $gene_name | sed 's/.*gene_id\(.*\);/\1/' | sed 's/;.*//' | sed 's/ //g'  | sed 's/"//g'`;
    list_transcript=`grep $gene ~/work/cistargetdb/file_feather_generation/gene_upstream_fix_$version.gtf`
    if [[ `echo -e "$list_transcript" | wc -l` > 1 ]]; then
      count=`echo -e "$list_transcript" | awk -v chr="$chr" -v start="$start" -v end="$end" -v strand="$strand" -F"\t" '($1 == chr && $4 == start && $5 == end && $7 == strand) {print NR}'`
      #If duplicate
      echo -e ">$gene#$count" ;
    else
      echo -e ">$gene";
    fi;
  #print ACGT sequence
  else 
    echo $line ;
    plop=1;
  fi; 
done < ~/work/cistargetdb/file_feather_generation/tmp_seq_by_gene.fasta | sed '/^--$/d' > ~/work/cistargetdb/file_feather_generation/fasta_gene_ensembl_$version.fasta

rm ~/work/cistargetdb/file_feather_generation/tmp_seq_by_gene.fasta