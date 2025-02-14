
workdir="/rds/general/user/${System.getenv('USER')}/ephemeral/"
nextflow run main.nf \
-c conf/test_single_vcf.config \
-profile imperial,singularity \
-w ${workdir}

#docker command not found. need to change config to run singularity.

#testing with some samples
inputdir=/rds/general/user/ah3918/ephemeral/PROJECTS/EPILEPSY_EQTLS/OUTPUTS/BULK/genotype_outs/by_chromosome/
outdir=/rds/general/user/ah3918/ephemeral/PROJECTS/EPILEPSY_EQTLS/OUTPUTS/BULK/genotype_outs/by_chromosome/IMPUTATION_OUTS/


cd $home
cd TOOLS/
mkdir REF_DATA
cd REF_DATA
wget https://imputationserver.sph.umich.edu/resources/ref-panels/imputationserver2-hapmap2.zip

#now, update hamap2.yaml with the correct path to the reference data

nextflow run main.nf -c ./IMPERIAL_SETUP/job.config \
-profile imperial \
--files ${inputdir}/chr* \
--output ${outdir}

