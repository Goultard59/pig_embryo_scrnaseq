library(plyr)
library(stringr)
hmmerpath <- "/home/adufour/work/cistargetdb/hmmerout.txt"
tflist_output="/home/adufour/work/cistargetdb/tf_list.txt"

#read hmmer result table
table <- read.delim(hmmerpath, header=FALSE, comment.char="#")

#create the different filter levels
filter_04 <- c('AF-4', 'AF-4_C', 'AF4_int', 'TF_AP-2', 'ARID', 'CBFB_NFYA', 'CBF_beta', 'CBF', 'BTD', 'NFYB', 'NFYC', 'CG-1', 'CP2',
 'CSD', 'CSRNP_N', 'DASH', 'E2F_TDP', 'ETS_PEA3_N', 'Forkhead', 'Forkhead_N', 'GCM', 'GTF2I', 'HMGA', 'HSF_DNA-bind', 'HTH_psq', 
 'IRF', 'Myb_DNA-binding', 'Myb_DNA-bind_2', 'Myb_DNA-bind_3', 'Myb_DNA-bind_4', 'Myb_DNA-bind_5', 'Myb_DNA-bind_6', 
 'Myb_DNA-bind_7', 'MBD', 'NCU-G1', 'NDT80_PhoG', 'Nrf1_activ_bdg', 'Nrf1_DNA-bind', 'PC4', 'P53', 'PAX', 'HPD', 'LRRFIP', 
 'RFX_DNA_binding', 'RHD_dimer', 'RHD_DNA_bind', 'Runt', 'SAND', 'SRF-TF', 'STAT_bind', 'T-box', 'T-box_assoc', 'TEA', 
 'Transcription_factor_COE', 'GCFC', 'TSC22', 'Tub', 'TF_bZIP', 'MH1', 'CTF_NFI', 'Pou', 'CUT', 'TF_Otx', 'zf-C4', 'DM', 'GATA', 
 'zf-LITAF-like', 'zf-MIZ', 'zf-NF-X1', 'THAP')
filter_02 <- c('bHLH-MYC_N', 'COE1_HLH', 'HLH', 'Neuro_bHLH')
filter_03 <- c('HMG_box', 'HMG_box_2', 'HMG_box_5', 'Homeobox_KN', 'Homeodomain', 'zf-C2HC', 'zf-C2HC_2', 'zf-BED', 'zf-C2H2')
filter_20 <- c('zf-CCCH')

#filtering the result table according to the different threshold
table_filtered_04 <- subset(table, V3 %in% filter_04 & V5 < 1e-04)
table_filtered_02 <- subset(table, V3 %in% filter_02 & V5 < 1e-02)
table_filtered_03 <- subset(table, V3 %in% filter_03 & V5 < 1e-03)
table_filtered_20 <- subset(table, V3 %in% filter_20 & V5 < 1e-20)

filtered_table <- rbind(table_filtered_04, table_filtered_02, table_filtered_03, table_filtered_20)

#Extract gene name
gene_name <- str_match(filtered_table$V19, "gene:\\s*(.*?)\\s*\\.")

#write TF list out
#Other genes which are categorized at "Others" in AnimalTFdb have been manually added to this list
write.table(unique(sort(gene_name[,2])), tflist_output, append = FALSE, quote = FALSE, row.names = FALSE, col.names = FALSE)
