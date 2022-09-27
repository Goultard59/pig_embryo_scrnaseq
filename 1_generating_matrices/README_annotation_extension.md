# Issue

The Sus_scrofa.11.1.102.gtf annotation has truncated gene extremities, inappropriate to annotate 3' aligned reads.

# Solution

The annotation was modified to extend 3' exons where reads aligned past annotated genes.

# Steps

1. Reads from /work/project/fragencode/workspace/plus4pigs/data/reads/scRNAseq were aligned to /work/project/fragencode/data/species/sus_scrofa/Sscrofa11.1.102/sus_scrofa.fa with github.com/FAANG/analysis-TAGADA using STAR internally.

```bash
nextflow run FAANG/analysis-TAGADA \
  -revision 1.0.2 \
  -profile slurm singularity \
  --output /work/project/fragencode/workspace/ckurylo/plus4pigs/TAGADA/results \
  --reads /work/project/fragencode/workspace/ckurylo/plus4pigs/TAGADA/inputs/*.fastq.gz \
  --genome /work/project/fragencode/workspace/ckurylo/plus4pigs/TAGADA/inputs/*.fa \
  --annotation /work/project/fragencode/workspace/ckurylo/plus4pigs/TAGADA/inputs/*.gtf
```

2. Annotation was extended with github.com/ctlab/quant3p.

```bash
quant3p \
  --keep-temp \
  --genome 1341049888 \
  -p 5 \
  -n plus4pigs.mapped_to_reference.2021_10_26 \
  -g /work/project/fragencode/data/species/sus_scrofa/Sscrofa11.1.102/sus_scrofa.gtf \
  /work/project/fragencode/workspace/ckurylo/plus4pigs/TAGADA/results/maps/*.bam
```

3. Annotation was updated by Adrien Dufour.

    Les correction sont les suivantes :

    Suppressions de CDC20B, ENSSSCG00000047132, ENSSSCT000000701642


    Ajout des gènes à partir de la précédente annotations du génome porcins :

    13 ensembl gene 119663183 119669539 . + . gene_id "ENSSSCG00000037485"; gene_version "1"; gene_name "SOX2"; gene_source "ensembl"; gene_biotype "protein_coding";

    13 ensembl transcript 119663183 119669539 . + . gene_id "ENSSSCG00000037485"; gene_version "1"; transcript_id "ENSSSCT00000046496"; transcript_version "1"; gene_name "SOX2"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name "SOX2-201";
    transcript_source "ensembl"; transcript_biotype "protein_coding";

    13 ensembl exon 119663183 119669539 . + . gene_id "ENSSSCG00000037485"; gene_version "1"; transcript_id "ENSSSCT00000046496"; transcript_version "1"; exon_number "1"; gene_name "SOX2"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name
    "SOX2-201"; transcript_source "ensembl"; transcript_biotype "protein_coding"; exon_id "ENSSSCE00000299098"; exon_version "1";

    13 ensembl CDS 119668476 119669432 . + 0 gene_id "ENSSSCG00000037485"; gene_version "1"; transcript_id "ENSSSCT00000046496"; transcript_version "1"; exon_number "1"; gene_name "SOX2"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name
    "SOX2-201"; transcript_source "ensembl"; transcript_biotype "protein_coding"; protein_id "ENSSSCP00000046427"; protein_version "1";

    13 ensembl start_codon 119668476 119668478 . + 0 gene_id "ENSSSCG00000037485"; gene_version "1"; transcript_id "ENSSSCT00000046496"; transcript_version "1"; exon_number "1"; gene_name "SOX2"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name
    "SOX2-201"; transcript_source "ensembl"; transcript_biotype "protein_coding";

    13 ensembl stop_codon 119669433 119669435 . + 0 gene_id "ENSSSCG00000037485"; gene_version "1"; transcript_id "ENSSSCT00000046496"; transcript_version "1"; exon_number "1"; gene_name "SOX2"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name
    "SOX2-201"; transcript_source "ensembl"; transcript_biotype "protein_coding";

    13 ensembl five_prime_utr 119663183 119668475 . + . gene_id "ENSSSCG00000037485"; gene_version "1"; transcript_id "ENSSSCT00000046496"; transcript_version "1"; gene_name "SOX2"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name "SOX2-201";
    transcript_source "ensembl"; transcript_biotype "protein_coding";

    13 ensembl three_prime_utr 119669436 119669539 . + . gene_id "ENSSSCG00000037485"; gene_version "1"; transcript_id "ENSSSCT00000046496"; transcript_version "1"; gene_name "SOX2"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name "SOX2-201";
    transcript_source "ensembl"; transcript_biotype "protein_coding";


    12 ensembl gene 52882840 52884859 . - . gene_id "ENSSSCG00000017954"; gene_version "3"; gene_name "SOX15"; gene_source "ensembl"; gene_biotype "protein_coding";

    12 ensembl transcript 52882840 52884859 . - . gene_id "ENSSSCG00000017954"; gene_version "3"; transcript_id "ENSSSCT00000019538"; transcript_version "3"; gene_name "SOX15"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name "SOX15-201";
    transcript_source "ensembl"; transcript_biotype "protein_coding";

    12 ensembl exon 52883867 52884859 . - . gene_id "ENSSSCG00000017954"; gene_version "3"; transcript_id "ENSSSCT00000019538"; transcript_version "3"; exon_number "1"; gene_name "SOX15"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name
    "SOX15-201"; transcript_source "ensembl"; transcript_biotype "protein_coding"; exon_id "ENSSSCE00000156399"; exon_version "3";

    12 ensembl CDS 52883867 52884399 . - 0 gene_id "ENSSSCG00000017954"; gene_version "3"; transcript_id "ENSSSCT00000019538"; transcript_version "3"; exon_number "1"; gene_name "SOX15"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name
    "SOX15-201"; transcript_source "ensembl"; transcript_biotype "protein_coding"; protein_id "ENSSSCP00000019020"; protein_version "2";

    12 ensembl start_codon 52884397 52884399 . - 0 gene_id "ENSSSCG00000017954"; gene_version "3"; transcript_id "ENSSSCT00000019538"; transcript_version "3"; exon_number "1"; gene_name "SOX15"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name
    "SOX15-201"; transcript_source "ensembl"; transcript_biotype "protein_coding";

    12 ensembl exon 52882840 52883227 . - . gene_id "ENSSSCG00000017954"; gene_version "3"; transcript_id "ENSSSCT00000019538"; transcript_version "3"; exon_number "2"; gene_name "SOX15"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name
    "SOX15-201"; transcript_source "ensembl"; transcript_biotype "protein_coding"; exon_id "ENSSSCE00000156400"; exon_version "2";

    12 ensembl CDS 52883062 52883227 . - 1 gene_id "ENSSSCG00000017954"; gene_version "3"; transcript_id "ENSSSCT00000019538"; transcript_version "3"; exon_number "2"; gene_name "SOX15"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name
    "SOX15-201"; transcript_source "ensembl"; transcript_biotype "protein_coding"; protein_id "ENSSSCP00000019020"; protein_version "2";

    12 ensembl stop_codon 52883059 52883061 . - 0 gene_id "ENSSSCG00000017954"; gene_version "3"; transcript_id "ENSSSCT00000019538"; transcript_version "3"; exon_number "2"; gene_name "SOX15"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name
    "SOX15-201"; transcript_source "ensembl"; transcript_biotype "protein_coding";

    12 ensembl five_prime_utr 52884400 52884859 . - . gene_id "ENSSSCG00000017954"; gene_version "3"; transcript_id "ENSSSCT00000019538"; transcript_version "3"; gene_name "SOX15"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name "SOX15-201";
    transcript_source "ensembl"; transcript_biotype "protein_coding";

    12 ensembl three_prime_utr 52882840 52883058 . - . gene_id "ENSSSCG00000017954"; gene_version "3"; transcript_id "ENSSSCT00000019538"; transcript_version "3"; gene_name "SOX15"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name "SOX15-201";
    transcript_source "ensembl"; transcript_biotype "protein_coding";


    Modification :

    5 ensembl gene 62932382 62943088 . + . gene_id "ENSSSCG00000040403"; gene_version "2"; gene_name "NANOG"; gene_source "ensembl"; gene_biotype "protein_coding";

    5 ensembl transcript 62932382 62943088 . + . gene_id "ENSSSCG00000040403"; gene_version "2"; transcript_id "ENSSSCT00000062427"; transcript_version "2"; gene_name "NANOG"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name "NANOG-201";
    transcript_source "ensembl"; transcript_biotype "protein_coding";

    5 ensembl exon 62932382 62932725 . + . gene_id "ENSSSCG00000040403"; gene_version "2"; transcript_id "ENSSSCT00000062427"; transcript_version "2"; exon_number "1"; gene_name "NANOG"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name
    "NANOG-201"; transcript_source "ensembl"; transcript_biotype "protein_coding"; exon_id "ENSSSCE00000323605"; exon_version "2";

    5 ensembl CDS 62932575 62932725 . + 0 gene_id "ENSSSCG00000040403"; gene_version "2"; transcript_id "ENSSSCT00000062427"; transcript_version "2"; exon_number "1"; gene_name "NANOG"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name
    "NANOG-201"; transcript_source "ensembl"; transcript_biotype "protein_coding"; protein_id "ENSSSCP00000056364"; protein_version "1";

    5 ensembl start_codon 62932575 62932577 . + 0 gene_id "ENSSSCG00000040403"; gene_version "2"; transcript_id "ENSSSCT00000062427"; transcript_version "2"; exon_number "1"; gene_name "NANOG"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name
    "NANOG-201"; transcript_source "ensembl"; transcript_biotype "protein_coding";

    5 ensembl exon 62935870 62936132 . + . gene_id "ENSSSCG00000040403"; gene_version "2"; transcript_id "ENSSSCT00000062427"; transcript_version "2"; exon_number "2"; gene_name "NANOG"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name
    "NANOG-201"; transcript_source "ensembl"; transcript_biotype "protein_coding"; exon_id "ENSSSCE00000370749"; exon_version "1";

    5 ensembl CDS 62935870 62936132 . + 2 gene_id "ENSSSCG00000040403"; gene_version "2"; transcript_id "ENSSSCT00000062427"; transcript_version "2"; exon_number "2"; gene_name "NANOG"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name
    "NANOG-201"; transcript_source "ensembl"; transcript_biotype "protein_coding"; protein_id "ENSSSCP00000056364"; protein_version "1";

    5 ensembl exon 62938396 62938482 . + . gene_id "ENSSSCG00000040403"; gene_version "2"; transcript_id "ENSSSCT00000062427"; transcript_version "2"; exon_number "3"; gene_name "NANOG"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name
    "NANOG-201"; transcript_source "ensembl"; transcript_biotype "protein_coding"; exon_id "ENSSSCE00000317041"; exon_version "1";

    5 ensembl CDS 62938396 62938482 . + 0 gene_id "ENSSSCG00000040403"; gene_version "2"; transcript_id "ENSSSCT00000062427"; transcript_version "2"; exon_number "3"; gene_name "NANOG"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name
    "NANOG-201"; transcript_source "ensembl"; transcript_biotype "protein_coding"; protein_id "ENSSSCP00000056364"; protein_version "1";

    5 ensembl exon 62938622 62943088 . + . gene_id "ENSSSCG00000040403"; gene_version "2"; transcript_id "ENSSSCT00000062427"; transcript_version "2"; exon_number "4"; gene_name "NANOG"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name
    "NANOG-201"; transcript_source "ensembl"; transcript_biotype "protein_coding"; exon_id "ENSSSCE00000302762"; exon_version "2";

    5 ensembl CDS 62938622 62939032 . + 0 gene_id "ENSSSCG00000040403"; gene_version "2"; transcript_id "ENSSSCT00000062427"; transcript_version "2"; exon_number "4"; gene_name "NANOG"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name
    "NANOG-201"; transcript_source "ensembl"; transcript_biotype "protein_coding"; protein_id "ENSSSCP00000056364"; protein_version "1";

    5 ensembl stop_codon 62939033 62939035 . + 0 gene_id "ENSSSCG00000040403"; gene_version "2"; transcript_id "ENSSSCT00000062427"; transcript_version "2"; exon_number "4"; gene_name "NANOG"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name
    "NANOG-201"; transcript_source "ensembl"; transcript_biotype "protein_coding";

    5 ensembl five_prime_utr 62932382 62932574 . + . gene_id "ENSSSCG00000040403"; gene_version "2"; transcript_id "ENSSSCT00000062427"; transcript_version "2"; gene_name "NANOG"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name "NANOG-201";
    transcript_source "ensembl"; transcript_biotype "protein_coding";

    5 ensembl three_prime_utr 62939036 62943088 . + . gene_id "ENSSSCG00000040403"; gene_version "2"; transcript_id "ENSSSCT00000062427"; transcript_version "2"; gene_name "NANOG"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name "NANOG-201";
    transcript_source "ensembl"; transcript_biotype "protein_coding";


    6 ensembl gene 94026675 94028030 . - . gene_id "ENSSSCG00000003646"; gene_version "3"; gene_name "POU3F1"; gene_source "ensembl"; gene_biotype "protein_coding";

    6 ensembl transcript 94026675 94028030 . - . gene_id "ENSSSCG00000003646"; gene_version "3"; transcript_id "ENSSSCT00000004042"; transcript_version "3"; gene_name "POU3F1"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name "POU3F1-201";
    transcript_source "ensembl"; transcript_biotype "protein_coding"; projection_parent_transcript "ENST00000373012.4";

    6 ensembl exon 94026675 94028030 . - . gene_id "ENSSSCG00000003646"; gene_version "3"; transcript_id "ENSSSCT00000004042"; transcript_version "3"; exon_number "1"; gene_name "POU3F1"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name
    "POU3F1-201"; transcript_source "ensembl"; transcript_biotype "protein_coding"; exon_id "ENSSSCE00000029598"; exon_version "3"; projection_parent_transcript "ENST00000373012.4";

    6 ensembl CDS 94026678 94028030 . - 0 gene_id "ENSSSCG00000003646"; gene_version "3"; transcript_id "ENSSSCT00000004042"; transcript_version "3"; exon_number "1"; gene_name "POU3F1"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name
    "POU3F1-201"; transcript_source "ensembl"; transcript_biotype "protein_coding"; protein_id "ENSSSCP00000003951"; protein_version "3"; projection_parent_transcript "ENST00000373012.4";

    6 ensembl start_codon 94028028 94028030 . - 0 gene_id "ENSSSCG00000003646"; gene_version "3"; transcript_id "ENSSSCT00000004042"; transcript_version "3"; exon_number "1"; gene_name "POU3F1"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name
    "POU3F1-201"; transcript_source "ensembl"; transcript_biotype "protein_coding"; projection_parent_transcript "ENST00000373012.4";

    6 ensembl stop_codon 94026675 94026677 . - 0 gene_id "ENSSSCG00000003646"; gene_version "3"; transcript_id "ENSSSCT00000004042"; transcript_version "3"; exon_number "1"; gene_name "POU3F1"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name
    "POU3F1-201"; transcript_source "ensembl"; transcript_biotype "protein_coding"; projection_parent_transcript "ENST00000373012.4";

4. Annotation was sorted for CellRanger ARC:

```bash
./sort_gtf.py \
  -i Sus_scrofa.11.1.102.quant3p_extended.updated.gtf \
  -o Sus_scrofa.11.1.102.quant3p_extended.updated.sorted.gtf
```
