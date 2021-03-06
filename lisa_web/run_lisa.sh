#!/bin/bash -ex

source /project/dev/qqin/miniconda3/bin/activate base

outdir=$3
mkdir -p /project/Cistrome/LISA/lisa_web/upload/${outdir}
cd /project/Cistrome/LISA/lisa_web/upload/${outdir}

###nice -n 15 lisa model --web=True --new_rp_h5=None --new_count_h5=None --species hg38 --epigenome '['H3K27ac']' --cluster=False --covariates=False --random=True --prefix test --threads 3 AR.symbol

nice -n 15 lisa model --method="$5" --web=True --new_rp_h5=None --new_count_h5=None --species $1 --epigenome "$2" --cluster=False --covariates=False --random=True --stat_background_number=300 --background=$6 --prefix ${outdir} --threads 4 $4

echo "accomplished!!.."  >> /project/Cistrome/LISA/lisa_web/upload/${outdir}_snakemake_output.txt
sleep 1

