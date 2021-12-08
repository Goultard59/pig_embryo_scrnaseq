library(dplyr)
library('biomaRt')
library(AnnotationHub)
library(tidyr)

table <- read.table('~/work/proteome/primary_transcripts/OrthoFinder/Results_Mar25/Orthologues/Orthologues_Homo_sapiens.GRCh38.pep.all/Homo_sapiens.GRCh38.pep.all__v__Sus_scrofa.Sscrofa11.1.pep.all.tsv', sep = '\t', header = TRUE)

# Connect to AnnotationHub
ah <- AnnotationHub()

# Access the Ensembl database for organism
ahDb <- query(ah, 
              pattern = c("Sus scrofa", "EnsDb"), 
              ignore.case = TRUE)

id <- ahDb %>%
  mcols() %>%
  rownames() %>%
  tail(n = 1)

edb <- ah[[id]]

# Extract gene-level information from database
annotations <- genes(edb, 
                     return.type = "data.frame")

# Select annotations of interest
sscrofa_list <- annotations %>%
  dplyr::select(gene_id_version, symbol)

# Access the Ensembl database for organism
ahDb <- query(ah, 
              pattern = c("Homo sapiens", "EnsDb"), 
              ignore.case = TRUE)

id <- ahDb %>%
  mcols() %>%
  rownames() %>%
  tail(n = 1)

edb <- ah[[id]]

# Extract gene-level information from database
annotations <- genes(edb, 
                     return.type = "data.frame")

# Select annotations of interest
hsapiens_list <- annotations %>%
  dplyr::select(gene_id_version, symbol)

# Get protein name
genes_hsapiens <- table$Homo_sapiens.GRCh38.pep.all
genes_sscrofa <- table$Sus_scrofa.Sscrofa11.1.pep.all

# Check if symbol gene name if available
hsapiens_list$symbol <- ifelse(hsapiens_list$symbol == '', hsapiens_list$gene_id_version, hsapiens_list$symbol)
sscrofa_list$symbol <- ifelse(sscrofa_list$symbol == '', sscrofa_list$gene_id_version, sscrofa_list$symbol)

#on human gene per row
table = separate_rows(table,"Homo_sapiens.GRCh38.pep.all",sep = ",")

#only best match
table$Sus_scrofa.Sscrofa11.1.pep.all <- gsub("^.*, ", "", table$Sus_scrofa.Sscrofa11.1.pep.all)

#Add symbol name
df <- left_join(table, hsapiens_list, by = c("Homo_sapiens.GRCh38.pep.all" = "gene_id_version"))
df_sub2 <- left_join(df, sscrofa_list, by = c("Sus_scrofa.Sscrofa11.1.pep.all" = "gene_id_version"))
df_final <- df_sub2[ , -which(names(df_sub2) %in% c('Homo_sapiens.GRCh38.pep.all','Sus_scrofa.Sscrofa11.1.pep.all'))]

#rename column
colnames(df_final) <- c("Orthogroup","human_gene","pigs_gene")

#load scenic human motif
motif2tf <- read.delim('/home/adufour/work/cistargetdb/motifs-v9-nr.hgnc-m0.001-o0.0.tbl.3')

#add pig gene name
motiftotf <- inner_join(motif2tf, df_final, by = c('gene_name' = 'human_gene'))

#remove gene version
motiftotf$pigs_gene <- lapply(motiftotf$pigs_gene,  sub, pattern = "\\.\\d+$", replacement = "")

#remove undesired columns
motiftotf_2 <- motiftotf[ , -which(names(motiftotf) %in% c('gene_name','Orthogroup'))]

#rename columns
colnames(motiftotf_2) <- c("motif_id","motif_name","motif_description","source_name","source_version","motif_similarity_qvalue","similar_motif_id","similar_motif_description","orthologous_identity","orthologous_gene_name","orthologous_species","description","gene_name")
motiftotf_2 <- apply(motiftotf_2,2,as.character)
colnames(motiftotf_2)[1] <- "#motif_id"

#write output table
write.table(motiftotf_2, file = "~/work/cistargetdb/motif2tf_orthologuous.tbl", append = FALSE, quote = FALSE, sep = "\t",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,
            col.names = TRUE, qmethod = c("escape", "double"),
            fileEncoding = "")