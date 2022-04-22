#! /usr/bin/env r
args = commandArgs(trailingOnly=TRUE)

#Loading package
library(ggplot2)
library(dplyr)
library(limma)
library(BiocParallel)
library(readr)
library(S4Vectors)

#Setting colours
custom_colors <- list()

colors_dutch <- c(
  '#FFC312','#C4E538','#12CBC4','#FDA7DF','#ED4C67',
  '#F79F1F','#A3CB38','#1289A7','#D980FA','#B53471',
  '#EE5A24','#009432','#0652DD','#9980FA','#833471',
  '#EA2027','#006266','#1B1464','#5758BB','#6F1E51'
)

colors_spanish <- c(
  '#40407a','#706fd3','#f7f1e3','#34ace0','#33d9b2',
  '#2c2c54','#474787','#aaa69d','#227093','#218c74',
  '#ff5252','#ff793f','#d1ccc0','#ffb142','#ffda79',
  '#b33939','#cd6133','#84817a','#cc8e35','#ccae62'
)

custom_colors$discrete <- c(colors_dutch, colors_spanish)

custom_colors$cell_cycle <- setNames(
  c('#45aaf2', '#f1c40f', '#e74c3c', '#7f8c8d'),
  c('G1',      'S',       'G2M',     '-')
)

#Function to read GMT files
read_GMT_file <- function(file) {
  gmt <- readr::read_delim(
    file,
    delim = ';',
    col_names = c('X1'),
    col_types = readr::cols()
  )

  gene_set_genes <- list()
  for ( i in seq_len(nrow(gmt)) )
  {
    temp_genes <- strsplit(gmt$X1[i], split = '\t')[[1]] %>% unlist()
    temp_genes <- temp_genes[3:length(temp_genes)]
    gene_set_genes[[i]] <- temp_genes
  }
  gene_set_loaded <- list(
    genesets = gene_set_genes,
    geneset.names = lapply(strsplit(gmt$X1, split = '\t'), '[', 1) %>% unlist(),
    geneset.description = lapply(
        strsplit(gmt$X1, split = '\t'), '[', 2
      ) %>% unlist()
  )

  return(gene_set_loaded)
}

# load gene sets from GMT file
gene_sets <- read_GMT_file('/home/adufour/save/gmt_files/go_sscrofa.name.gmt')

# set gene set names
names(gene_sets$genesets) <- gene_sets$geneset.description

#load embryo files
embryo <- readRDS(args[2])

#specify tissue
cluster <- args[1]

# get list of genes unique genes across all gene sets
genes_to_analyze <- gene_sets$genesets %>% unlist() %>% unique()
# filter gene list for those which are present in the data set
genes_to_analyze <- genes_to_analyze[which(genes_to_analyze %in% rownames(embryo@assays$RNA@counts))]

# get expression matrix and reduce it to cells and genes of interest
expression_matrix <- embryo@assays$RNA@counts[ genes_to_analyze , ] %>% as.matrix()

# perform GSVA
gsva <- GSVA::gsva(
  expression_matrix,
  gset.idx.list = gene_sets$genesets,
  min.sz > 1,
  parallel.sz = 5
)

# generate design matrix
design_matrix <- tibble(
  control = 1,
  test = c(
    rep(0, embryo@meta.data %>% dplyr::filter(cell_type == cluster) %>% nrow()),
    rep(1, embryo@meta.data %>% dplyr::filter(cell_type != cluster) %>% nrow())
  )
)

# fit linear model, followed by empirical Bayes statistics for differential
# enrichment analysis
fit <- lmFit(gsva, design_matrix)
fit <- eBayes(fit)

# prepare data for plotting
data <- topTable(fit, coef = 'test', number = 50) %>%
  mutate(gene_set = topTable(fit, coef = 'test', number = 50)$ID) %>%
  arrange(t) %>%
  mutate(
    gene_set = factor(gene_set, levels = gene_set),
    just = ifelse(t < 0, 0, 1),
    nudge_y = ifelse(t < 0, 1, -1),
    color = ifelse(t < -5 | t > 5, 'black', 'grey')
  )

DataFrame(data)

# plot t-value
p <- ggplot(data = data, aes(x = gene_set, y = t, fill = t)) +
  geom_col() +
  geom_hline(yintercept = c(-5,5), linetype = 'dashed', color = 'grey80') +
  geom_text(
    aes(
      x = gene_set,
      y = 0,
      label = gene_set,
      hjust = just,
      color = color
    ),
    nudge_y = data$nudge_y, size = 3
  ) +
  scale_x_discrete(name = '', labels = NULL) +
  scale_y_continuous(name = 't-value', limits = c(-55,55)) +
  scale_fill_distiller(palette = 'Spectral', limits = c(-max(data$t), max(data$t))) +
  scale_color_manual(values = c('black' = 'black', 'grey' = 'grey')) +
  coord_flip() +
  theme_bw() +
  theme(
    panel.grid = element_blank(),
    axis.ticks.y =  element_blank(),
    legend.position = 'none'
  )

#Saving plot and results
saveRDS(fit, file = paste0('/home/adufour/work/rds_storage/go_analysis/fit_', cluster, '.rds'))
ggsave(paste0('/home/adufour/work/notebook/plots/GSVA_GO_', cluster, '.png'), height = 7.5, width = 7.5)