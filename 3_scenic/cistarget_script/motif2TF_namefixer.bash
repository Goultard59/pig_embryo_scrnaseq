sed -i 's/c2h2_zfs/c2h2zf/g' /home/adufour/work/cistargetdb/motifs-v9-nr.hgnc-m0.001-o0.0.tbl.1
sed -i 's/\b\(taipale__\)\([^_]\+_[^_]\+\)_\?\(\w*\)\b/\1\3_\2/g' /home/adufour/work/cistargetdb/motifs-v9-nr.hgnc-m0.001-o0.0.tbl.1
sed -i 's/\b\(dbcorrdb__\)\([^_]\+\)__\(\w*\)\b/\1\2/' /home/adufour/work/cistargetdb/motifs-v9-nr.hgnc-m0.001-o0.0.tbl.1
sed -i 's/neph/encode/' /home/adufour/work/cistargetdb/motifs-v9-nr.hgnc-m0.001-o0.0.tbl.1
sed -i 's/__hs__/__/' /home/adufour/work/cistargetdb/motifs-v9-nr.hgnc-m0.001-o0.0.tbl.1
sed -i 's/\b\(yetfasco__\)\([^_]\+\)_\(\w*\)\b/\1\3/' /home/adufour/work/cistargetdb/motifs-v9-nr.hgnc-m0.001-o0.0.tbl.1

(predrem__)(\w+)\t(\w+)\t(\S+)

awk -F'\t' 'NR>1 {print $1}' /home/adufour/work/cistargetdb/motifs-v9-nr.hgnc-m0.001-o0.0.tbl.1 | uniq | sed 's/__/-/' | sed 's/$/.cb/' > list_first_column.txt

echo "taipale__NCTAATTANN_LHX2_DBD" | sed -e 's/\b\(taipale__\)\([^_]\+_[^_]\+\)_\?\(\w*\)\b/\1\2-\3/g'
taipale__ATGASTCAT_JDP2_DBD

sed -i 's/\b\(taipale__\)\([^_]\+_[^_]\+\)_\?\(\w*\)\b/\1\3_\2/g'

ls | sed 's/.cb//g' | sed 's/^-/__/'

for f in *.cb ; do mv "$f" "$(echo "$f" | sed 's/-\+/__/')" ; done

#motif_id	motif_name	motif_description	source_name	source_version	gene_name	motif_similarity_qvalue	similar_motif_id	similar_motif_description	orthologous_identity	orthologous_gene_name	orthologous_species	description
bergman__Abd-B	Abd-B	Abd-B	bergman	1.1	HOXA9	0.000600	cisbp__M1008	HOXA6[gene ID: "ENSG00000106006" species: "Homo sapiens" TF status: "inferred" TF family: "Homeodomain" DBDs: "Homeobox"]; HOXB9[gene ID: "ENSG00000170689" species: "Homo sapiens" TF status: "inferred" TF family: "Homeodomain" DBDs: "Homeobox"]; HOXC9[gene ID: "ENSG00000180806" species: "Homo sapiens" TF status: "inferred" TF family: "Homeodomain" DBDs: "Homeobox"]; Hoxa9[gene ID: "ENSMUSG00000038227" species: "Mus musculus" TF status: "direct" TF family: "Homeodomain" DBDs: "Homeobox"]; Hoxb9[gene ID: "ENSMUSG00000020875" species: "Mus musculus" TF status: "inferred" TF family: "Homeodomain" DBDs: "Homeobox"]; NP_032296.2[gene ID: "NP_032296.2" species: "Mus musculus" TF status: "inferred" TF family: "Homeodomain" DBDs: "Homeobox"]	0.981618	ENSMUSG00000038227	M. musculus	gene is orthologous to ENSMUSG00000038227 in M. musculus (identity = 98%) which is annotated for similar motif cisbp__M1008 ('HOXA6[gene ID: "ENSG00000106006" species: "Homo sapiens" TF status: "inferred" TF family: "Homeodomain" DBDs: "Homeobox"]; HOXB9[gene ID: "ENSG00000170689" species: "Homo sapiens" TF status: "inferred" TF family: "Homeodomain" DBDs: "Homeobox"]; HOXC9[gene ID: "ENSG00000180806" species: "Homo sapiens" TF status: "inferred" TF family: "Homeodomain" DBDs: "Homeobox"]; Hoxa9[gene ID: "ENSMUSG00000038227" species: "Mus musculus" TF status: "direct" TF family: "Homeodomain" DBDs: "Homeobox"]; Hoxb9[gene ID: "ENSMUSG00000020875" species: "Mus musculus" TF status: "inferred" TF family: "Homeodomain" DBDs: "Homeobox"]; NP_032296.2[gene ID: "NP_032296.2" species: "Mus musculus" TF status: "inferred" TF family: "Homeodomain" DBDs: "Homeobox"]'; q-value = 0.0006)
bergman__Aef1	Aef1	Aef1	bergman	1.1	ZNF8	0.000000	None	None	0.213656	FBgn0005694	D. melanogaster	motif is annotated for orthologous gene FBgn0005694 in D. melanogaster (identity = 21%)



awk -F'\t' '
BEGIN { print "#motif_id\tmotif_name\tmotif_description\tsource_name\tsource_version\tgene_name\tmotif_similarity_qvalue\tsimilar_motif_id\tsimilar_motif_description\torthologous_identity\torthologous_gene_name\torthologous_species\tdescription"}
NR>1 {print $1"\t"$2"\t"3"\t"$4"\t"$5"\t"$6"\t"0.000000"\t"None"\t"None"\t"$10"\t"$11"\t"$12"\t"$13}' /home/adufour/work/cistargetdb/motifs-v9-nr.hgnc-m0.001-o0.0.tbl.1