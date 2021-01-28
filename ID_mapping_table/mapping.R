if (!requireNamespace("BiocManager", quietly = TRUE))
  
  install.packages("BiocManager")
BiocManager::install(version = "3.12")
BiocManager::install("biomaRt")

library("biomaRt")


listEnsembl()
ensembl <- useEnsembl(biomart="genes")
datasets <- listDatasets(ensembl)
ensembl <-useDataset(dataset="hsapiens_gene_ensembl",mart=ensembl)
attributes <- listAttributes(ensembl)

target <- read.table("target.txt")
uniprot <- target[,1]

mapping <- getBM(filters="uniprotswissprot",attributes = c("uniprotswissprot","ensembl_peptide_id"),
                 values=uniprot,mart=ensembl)
write.table(mapping,"C:/Users/fff09/Documents/Uniprotswissprot_to_entrezgene_id.txt",row.names=FALSE,sep="\t")

ENSP <- read.table("ENSP.txt")
ENSP <- ENSP[,1]
head(ENSP)
ENSP_to_ENTREZ <- getBM(filters="ensembl_peptide_id",attributes = c("ensembl_peptide_id","entrezgene_id"),
                        values=ENSP,mart=ensembl)
write.table(ENSP_to_ENTREZ,"C:/Users/fff09/Documents/ENSP_to_ENTREZ.txt",row.names=FALSE,sep="\t")
