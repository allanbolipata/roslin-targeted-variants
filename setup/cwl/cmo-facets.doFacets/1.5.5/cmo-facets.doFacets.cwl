#!/usr/bin/env cwl-runner

$namespaces:
  dct: http://purl.org/dc/terms/
  foaf: http://xmlns.com/foaf/0.1/
  doap: http://usefulinc.com/ns/doap#

$schemas:
- http://dublincore.org/2012/06/14/dcterms.rdf
- http://xmlns.com/foaf/spec/20140114.rdf
- http://usefulinc.com/ns/doap#

doap:release:
- class: doap:Version
  doap:name: cmo-facets.doFacets
  doap:revision: 1.5.5
- class: doap:Version
  doap:name: cwl-wrapper
  doap:revision: 1.0.0

dct:creator:
- class: foaf:Organization
  foaf:name: Memorial Sloan Kettering Cancer Center
  foaf:member:
  - class: foaf:Person
    foaf:name: Jaeyoung Chun
    foaf:mbox: mailto:chunj@mskcc.org

dct:contributor:
- class: foaf:Organization
  foaf:name: Memorial Sloan Kettering Cancer Center
  foaf:member:
  - class: foaf:Person
    foaf:name: Jaeyoung Chun
    foaf:mbox: mailto:chunj@mskcc.org

cwlVersion: cwl:v1.0

class: CommandLineTool
baseCommand:
- non-cmo.sh
- --tool
- "facets"
- --version
- "1.5.5"
- --language_version
- "default"
- --language
- "python"
- doFacets

requirements:
  InlineJavascriptRequirement: {}
  ResourceRequirement:
    ramMin: 8
    coresMin: 1

doc: |
  Run FACETS on tumor-normal SNP read counts generated using cmo_snp-pileup

inputs:
  cval:
    type:
    - 'null'
    - int
    default: 100
    doc: critical value for segmentation
    inputBinding:
      prefix: --cval

  snp_nbhd:
    type:
    - 'null'
    - int
    default: 250
    doc: window size
    inputBinding:
      prefix: --snp_nbhd

  ndepth:
    type:
    - 'null'
    - int
    default: 35
    doc: threshold for depth in the normal sample
    inputBinding:
      prefix: --ndepth

  min_nhet:
    type:
    - 'null'
    - int
    default: 25
    doc: minimum number of heterozygote snps in a segment used for bivariate t-statistic
      during clustering of segments
    inputBinding:
      prefix: --min_nhet

  purity_cval:
    type:
    - 'null'
    - int
    default: 500
    doc: critical value for segmentation
    inputBinding:
      prefix: --purity_cval

  purity_snp_nbhd:
    type:
    - 'null'
    - int
    default: 250
    doc: window size
    inputBinding:
      prefix: --purity_snp_nbhd

  purity_ndepth:
    type:
    - 'null'
    - int
    default: 35
    doc: threshold for depth in the normal sample
    inputBinding:
      prefix: --purity_ndepth

  purity_min_nhet:
    type:
    - 'null'
    - int
    default: 25
    doc: minimum number of heterozygote snps in a segment used for bivariate t-statistic
      during clustering of segments
    inputBinding:
      prefix: --purity_min_nhet

  dipLogR:
    type: ['null', string]
    doc: diploid log ratio
    inputBinding:
      prefix: --dipLogR

  genome:
    type: ['null', string]
    doc: Genome of counts file
    inputBinding:
      prefix: --genome

  counts_file:
    type: File

    doc: paired Counts File
    inputBinding:
      prefix: --counts_file

  TAG:
    type: string

    doc: output prefix
    inputBinding:
      prefix: --TAG

  directory:
    type: string

    doc: output prefix
    inputBinding:
      prefix: --directory

  R_lib:
    type: ['null', string]
    default: /opt/common/CentOS_6-dev/facets_lib/0.5.6/
    doc: Which version of FACETs to load into R
    inputBinding:
      prefix: --R_lib

  single_chrom:
    type: ['null', string]
    default: F
    doc: Perform analysis on single chromosome
    inputBinding:
      prefix: --single_chrom

  ggplot2:
    type: ['null', string]
    default: T
    doc: Plots using ggplot2
    inputBinding:
      prefix: --ggplot2

  seed:
    type: ['null', string]
    doc: Set the seed for reproducibility
    inputBinding:
      prefix: --seed


outputs:
  png_files:
    type: File[]
    outputBinding:
      glob: '*.png'
  txt_files:
    type: File[]
    outputBinding:
      glob: '*.txt'
  out_files:
    type: File[]
    outputBinding:
      glob: '*.out'
  rdata_files:
    type: File[]
    outputBinding:
      glob: '*.Rdata'
  seg_files:
    type: File[]
    outputBinding:
      glob: '*.seg'
