#!/bin/bash
folder="GSE193677-Rectum_CD_inflamed___GSE193677-Rectum_Control_noninflamed" #"TCGA-BRCA_female___TCGA-Breast_female"
types=("all")
sizes=(20 40 60 80 100) # GSE193677-Rectum_CD_inflamed___GSE193677-Rectum_Control_noninflamed
#sizes=(20 60 100 140 180 220) # GSE193677-Rectum_inflamed___GSE193677-Rectum_control
cats=("common" "disease-gene" "disease-specific" "normal-specific" "undefined")
for size in ${sizes[@]};
do
for type in ${types[@]};
do
sbatch --export=size=$size,type=$type,folder=$folder /home/j.aguirreplans/Projects/Scipher/SampleSize/scripts/calculate_separation.sh
for cat in ${cats[@]};
do
sbatch --export=size=$size,type=$type,cat=$cat,folder=$folder /home/j.aguirreplans/Projects/Scipher/SampleSize/scripts/calculate_go_enrichment.sh
sbatch --export=size=$size,type=$type,cat=$cat,folder=$folder /home/j.aguirreplans/Projects/Scipher/SampleSize/scripts/calculate_go_enrichment_coexpr.sh
sbatch --export=size=$size,type=$type,cat=$cat,folder=$folder /home/j.aguirreplans/Projects/Scipher/SampleSize/scripts/calculate_proximity_multiple_drugs.sh
done
done
done
