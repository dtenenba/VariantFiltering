.MafDb <-
  setRefClass("MafDb", contains="AnnotationDb",
              fields=list(tag="character"),
              methods=list(
                initialize=function(...) {
                  callSuper(...)
                  .self$tag <- load_taginfo(.self)
                  .self
                }))

## based on the SNPlocs class defined in the BSgenome package
## maybe this class could be generalized to one whose data correspond
## to numerical values associated to nucleotide positions and
## sotored in a RleList object
setClass("PhastConsDb",
         representation=representation(provider="character", ## e.g. UCSC
                                       provider_version="character", ## creation date in compact format
                                       download_url="character", ## download URL of all phastCons data
                                       download_date="character", ## date on which data was downloaded
                                       reference_genome="GenomeDescription", ## extracted from BSgenome.Hsapiens.UCSC.hg19

                                       ## package name and absolute path to local directory where to find
                                       ## the serializd object containing the phastCons scores
                                       data_pkgname="character",
                                       data_dirpath="character",
                                       data_serialized_objnames="character",

                                       .data_cache="environment"))

setClass("GenePhylostrataDb",
         representation=representation(organism="character",
                                       download_url="character",
                                       download_date="character",
                                       source_pub="character",

                                       ## package name and absolute path to local directory where to find
                                       ## the serializd object containing the phastCons scores
                                       data_pkgname="character",
                                       data_dirpath="character",
                                       data_serialized_objnames="character",

                                       ## values defining the strata
                                       strataNames="character",
                                       strataTaxID="character",

                                       .data_cache="environment"))

setClass("VariantFilteringParam",
         representation=representation(callObj="call",
                                       callStr="character",
                                       vcfFiles="TabixFileList",
                                       pedFilename="character",
                                       orgdb="OrgDb",
                                       txdb="TxDb",
                                       snpdb="SNPlocs",
                                       radicalAAchangeFilename="character",
                                       radicalAAchangeMatrix="matrix",
                                       otherAnnotations="list",
                                       allTranscripts="logical",
                                       filterTag="character"))

setClass("VariantFilteringResults",
         representation=representation(callObj="call",
                                       callStr="character",
                                       inputParameters="VariantFilteringParam",
                                       inheritanceModel="character",
                                       variants="GRanges",
                                       dbSNPflag="character",
                                       OMIMflag="character",
                                       variantType="character",
                                       aaChangeType="character",
                                       MAFpopMask="logical",
                                       naMAF="logical",
                                       maxMAF="numeric",
                                       minPhastCons="numeric",
                                       minPhylostratumIndex="integer",
                                       minCRYP5ss="numeric",
                                       minCRYP3ss="numeric"))

setClass("VariantFilteringResultsAIM",
         representation=representation(inheritancepattern="character",
                                       indselected="character",
                                       selectindexcase="character",
                                       selectcarrierrelative1="character",
                                       selectcarrierrelative2="character",
                                       selectaffectedrelative="character",
                                       selectcarrierallele1ch="character",
                                       selectcarrierallele2ch="character",
                                       selectaffrelative1ch="character",
                                       selectunaffectedrelative1ad="character",
                                       selectunaffectedrelative2ad="character",
                                       selectaffectedrelative1ad="character",
                                       selectcarrierrelativefemale1xl="character",
                                       selectaffectedrelativemale1xl="character",
                                       selectunaffectedmale1xl="character",
                                       selectparent1dn="character",
                                       selectparent2dn="character"),
         contains = "VariantFilteringResults")

setClass("VariantFilteringResultsUI",
         representation=representation(indselected="character",
                                       selectgene="character"),
         contains="VariantFilteringResults")

setClass("WeightMatrix",
         representation(wm="externalptr"))
