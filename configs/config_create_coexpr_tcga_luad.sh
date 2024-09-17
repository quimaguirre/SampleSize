#!/bin/bash

samples_folder="/home/j.aguirreplans/Projects/Scipher/SampleSize/data/sampling/TCGA/2022-11-18-Dataset/sampling_with_repetition/tumor/TCGA-LUAD"
rnaseq_file="/work/ccnr/j.aguirreplans/Databases/TCGA/2022-11-18-Dataset/TCGA/out/reads/tumor/filter_genes_low_counts/rnaseq_filtered_files_by_sample_group/tcga_rnaseq_TCGA-LUAD.csv"
output_folder="/scratch/j.aguirreplans/Scipher/SampleSizeProject/networks_tcga/reads/tumor/TCGA-LUAD"
dataset="tcga_TCGA-LUAD"
metric="aracne"
max_size=1200
