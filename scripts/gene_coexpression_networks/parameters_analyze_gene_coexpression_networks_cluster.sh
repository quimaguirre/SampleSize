#!/bin/bash

input_folder="$1"
output_results_dir="$2"
output_subgraphs_dir="$3"
genes_dataset_file="$4"
ppi_file="$5"
disease_genes_file="$6"
essential_genes_file="$7"
threshold="$8"

# Loop through each file in the directory
for coexpression_network_file in "$input_folder"/*; do
    # Check if the file is a regular file (not a directory)
    if [[ -f "$coexpression_network_file" ]]; then

        # Extract the filename from the dataset path
        filename=$(basename "$coexpression_network_file")

        # Remove '.net' extension from the filename
        dataset_short="${filename%.net}"

        # Create dataset_name using dataset_short and threshold
        dataset_name="${dataset_short}_threshold_${threshold}"

        echo "Input file exists: $coexpression_network_file"

        output_topology_file="${output_results_dir}/${dataset_name}_analysis_topology.txt"
        if [ -f "$output_topology_file" ]; then
            echo "Output topology file exists: $output_topology_file"
        else
            sbatch --export=coexpression_network_file=$coexpression_network_file,output_results_dir=$output_results_dir,output_subgraphs_dir=$output_subgraphs_dir,dataset_name=$dataset_name,threshold=$threshold,ppi_file=$ppi_file,disease_genes_file=$disease_genes_file,essential_genes_file=$essential_genes_file,genes_dataset_file=$genes_dataset_file /home/j.aguirreplans/Projects/Scipher/SampleSize/scripts/gene_coexpression_networks/job_array_analyze_gene_coexpression_networks_cluster.sh
            #echo "Output file does not exist: $output_topology_file"
        fi
    fi
done
