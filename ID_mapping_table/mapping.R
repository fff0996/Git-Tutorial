#If you don't install "biomaRt"
#########################################################
#if (!requireNamespace("BiocManager", quietly = TRUE))
  
  #install.packages("BiocManager")
#BiocManager::install(version = "3.12")
#BiocManager::install("biomaRt")
#########################################################

#Loading biomaRt library
library("biomaRt")


#make database
#use Homosapiens gene
#mapping to gene_ID (Entrez)
ensembl <- useEnsembl(biomart="genes")
datasets <- listDatasets(ensembl)
ensembl <-useDataset(dataset="hsapiens_gene_ensembl",mart=ensembl)
attributes <- listAttributes(ensembl)

#Get targets to map
target <- read.table("target.txt")
uniprot <- target[,1]
#make mapping table
# target -> gene_ID(Entrez)
mapping <- getBM(filters="uniprotswissprot",attributes = c("uniprotswissprot","ensembl_peptide_id"),
                 values=uniprot,mart=ensembl)
#make output file
write.table(mapping,"C:/Users/fff09/Documents/Uniprotswissprot_to_entrezgene_id.txt",row.names=FALSE,sep="\t")
#Get target to map
ENSP <- read.table("ENSP.txt")
ENSP <- ENSP[,1]
#make mapping table
#taget -> gene_ID(Entrez)
ENSP_to_ENTREZ <- getBM(filters="ensembl_peptide_id",attributes = c("ensembl_peptide_id","entrezgene_id"),
                        values=ENSP,mart=ensembl)
#make output file
write.table(ENSP_to_ENTREZ,"C:/Users/fff09/Documents/ENSP_to_ENTREZ.txt",row.names=FALSE,sep="\t")
