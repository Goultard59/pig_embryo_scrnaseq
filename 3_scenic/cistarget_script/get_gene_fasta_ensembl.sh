####
# Recuperation de la sequence des genes
####

module load bioinfo/bedtools2-2.29.0

version=Sus_scrofa.Sscrofa11.1.103
fasta=/home/adufour/work/genome_and_annotation/Sus_scrofa.Sscrofa11.1.dna.toplevel.fa
genome=/home/adufour/work/genome_and_annotation/$version.gtf
chrdetails=/home/adufour/work/genome_and_annotation/$version.genome

#recuperation des genes
awk -v var="gene" -F"\t" '($3 == var) {print $0}' $genome > ~/work/cistargetdb/file_feather_generation/gene_$version.gff3

bedtools flank -i ~/work/cistargetdb/file_feather_generation/gene_$version.gff3 -g $chrdetails -l 5000 -r 0 -s > ~/work/cistargetdb/file_feather_generation/gene_upstream_$version.gtf

awk -F'\t' '{if ($5 - $4 >5) print $0 }' ~/work/cistargetdb/file_feather_generation/gene_upstream_$version.gtf > ~/work/cistargetdb/file_feather_generation/gene_upstream_fix_$version.gtf

bedtools getfasta -fi $fasta -bed ~/work/cistargetdb/file_feather_generation/gene_upstream_fix_$version.gtf > ~/work/cistargetdb/file_feather_generation/tmp_seq_by_gene.fasta

while read line; do
  if [ "${line:0:1}" == ">" ]; then
    chr=`echo ${line:1} | cut -d: -f1`;
    secondepart=`echo $line | cut -d: -f2`;
    start=$((`echo $secondepart | cut -d'-' -f1` + 1));
    end=`echo $secondepart | cut -d'-' -f2`;
    gene_name=`awk -v chr="$chr" -v start="$start" -v end="$end" -F"\t" '($1 ~ chr && $4 ~ start && $5 ~ end) {print $9}' ~/work/cistargetdb/file_feather_generation/gene_upstream_fix_$version.gtf`;
    #si doublon
    if [[ `echo "$gene_name" | wc -l` > 1 ]]; then
      #si nouveau doublon
      if [[ "$gene_name" != "$lane" ]]; then
        lane=$gene_name
        count=1
        gene_name=`echo -e "$gene_name" | sed -n "$count p"`
        gene=`echo $gene_name | sed 's/.*gene_id\(.*\);/\1/' | sed 's/;.*//' | sed 's/ //g'  | sed 's/"//g'`;
        echo -e ">$gene" ;
      #sinon
      else
        count=$((count+1))
        gene_name=`echo -e "$gene_name" | sed -n "$count p"`
        gene=`echo $gene_name | sed 's/.*gene_id\(.*\);/\1/' | sed 's/;.*//' | sed 's/ //g'  | sed 's/"//g'`;
        echo -e ">$gene" ;
      fi;
    else
        gene=`echo $gene_name | sed 's/.*gene_id\(.*\);/\1/' | sed 's/;.*//' | sed 's/ //g'  | sed 's/"//g'`;
        echo -e ">$gene";
    fi;
  #affiche la sequence ACGT
  else 
    echo $line ;
    #plop=1;
  fi; 
done < ~/work/cistargetdb/file_feather_generation/tmp_seq_by_gene.fasta | sed '/^--$/d' > ~/work/cistargetdb/file_feather_generation/fasta_gene_ensembl_$version.fasta

rm ~/work/cistargetdb/file_feather_generation/tmp_seq_by_gene.fasta