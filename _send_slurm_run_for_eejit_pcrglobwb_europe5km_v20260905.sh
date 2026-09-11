
SLURM_SCRIPT="_slurm_run_for_eejit_pcrglobwb.sh"

JOB_NAME="europe_5km_1990-2019_watersis_val"
PCRGLOBWB_OUTPUT_FOLDER="/scratch/depfg/sutan101/watersis_runs_202609XX/europe_5km_v20260905_using_pcraster4.4.3_numpy1.26.4/netcdf/discharge_masked_for_validation/reproject_to_0.05arcdeg/"
DISCHARGE_FILENAME="discharge_monthAvg_output_setgrid_masked_remapnn_to_clone_eu_watersis_0p05arcdeg.nc"
ANALYSIS_OUTPUT_FOLDER=${PCRGLOBWB_OUTPUT_FOLDER}/"analysis_1990-2019/"
STR_DATE="1990-01-31"
END_DATE="2019-12-31"
LDD_FILE="None"
GLOBALCLONE="/scratch/depfg/sutan101/watersis_runs_202605XX/europe_5km_v20260528_DONE/netcdf/reproject_to_0.05arcdeg/ldd_catchment_area_KM2_remapnn_to_clone_eu_watersis_0p05arcdeg.map"
CELLAREA_M2="None"
GRDC_MAIN_FOLDER="/scratch/depfg/sutan101/data/grdc_data_monthly_requested_on_2023013/txt_splitted/"
CATCHMENT_AREA_KM2="/scratch/depfg/sutan101/watersis_runs_202605XX/europe_5km_v20260528_DONE/netcdf/reproject_to_0.05arcdeg/ldd_catchment_area_KM2_remapnn_to_clone_eu_watersis_0p05arcdeg.map"
sbatch -J ${JOB_NAME} --export PCRGLOBWB_OUTPUT_FOLDER=${PCRGLOBWB_OUTPUT_FOLDER},DISCHARGE_FILENAME=${DISCHARGE_FILENAME},ANALYSIS_OUTPUT_FOLDER=${ANALYSIS_OUTPUT_FOLDER},STR_DATE=${STR_DATE},END_DATE=${END_DATE},LDD_FILE=${LDD_FILE},GLOBALCLONE=${GLOBALCLONE},CELLAREA_M2=${CELLAREA_M2},GRDC_MAIN_FOLDER=${GRDC_MAIN_FOLDER},CATCHMENT_AREA_KM2=${CATCHMENT_AREA_KM2} ${SLURM_SCRIPT}

#~ sutan101@node044.cluster:/scratch/depfg/sutan101/watersis_runs_202609XX/europe_5km_v20260905_using_pcraster4.4.3_numpy1.26.4/netcdf/discharge_masked_for_validation/reproject_to_0.05arcdeg$ ls -lah
#~ total 721M
#~ drwxr-xr-x 2 sutan101 depfg    5 Sep 11 12:04 .
#~ dr-xr-xr-x 3 sutan101 depfg   10 Sep 11 11:43 ..
#~ -r--r--r-- 1 sutan101 depfg 3.0M Jun 17 15:10 clone_eu_watersis_0p05arcdeg.map
#~ -r--r--r-- 1 sutan101 depfg 6.0M Jun 17 15:18 clone_eu_watersis_0p05arcdeg.nc
#~ -r--r--r-- 1 sutan101 depfg 4.8G Sep 11 11:45 discharge_monthAvg_output_setgrid_masked_remapnn_to_clone_eu_watersis_0p05arcdeg.nc

#~ sutan101@node044.cluster:/scratch/depfg/sutan101/watersis_runs_202605XX/europe_5km_v20260528_DONE/netcdf/reproject_to_0.05arcdeg$ ls -lah
#~ total 941M
#~ drwxr-xr-x  3 sutan101 depfg   15 Jun 18 12:02 .
#~ drwxr-xr-x  4 sutan101 depfg  135 Jun 17 14:58 ..
#~ drwxr-xr-x 32 sutan101 depfg   32 Jun 18 12:02 analysis_1990-2019
#~ -rw-r--r--  1 sutan101 depfg 3.0M Jun 17 15:10 clone_eu_watersis_0p05arcdeg.map
#~ -rw-r--r--  1 sutan101 depfg 6.0M Jun 17 15:18 clone_eu_watersis_0p05arcdeg.nc
#~ -rw-r--r--  1 sutan101 depfg 4.8G Jun 18 09:58 discharge_monthAvg_output_remapnn_to_clone_eu_watersis_0p05arcdeg.nc
#~ -r--r--r--  1 sutan101 depfg 2.0K Feb 27  2026 griddes_europe5km.txt
#~ -rw-r--r--  1 sutan101 depfg 928K Jun  1 11:38 landmask_based_on_upArea.nc.map
#~ -rw-r--r--  1 sutan101 depfg  12M Jun 18 10:59 ldd_catchment_area_KM2_remapnn_to_clone_eu_watersis_0p05arcdeg.map
#~ -rw-r--r--  1 sutan101 depfg 3.7M Jun 18 09:51 ldd_catchment_area_m2.map
#~ -rw-r--r--  1 sutan101 depfg 3.7M Jun 18 09:52 ldd_catchment_area_m2.map.nc
#~ -rw-r--r--  1 sutan101 depfg  12M Jun 18 09:55 ldd_catchment_area_m2_remapnn_to_clone_eu_watersis_0p05arcdeg.map
#~ -rw-r--r--  1 sutan101 depfg  12M Jun 18 09:52 ldd_catchment_area_m2_remapnn_to_clone_eu_watersis_0p05arcdeg.nc
#~ -r-xr-x---  1 sutan101 depfg 928K Jun 17 15:27 ldd.map
#~ -rw-r--r--  1 sutan101 depfg  12M Jun 17 15:24 test.nc
