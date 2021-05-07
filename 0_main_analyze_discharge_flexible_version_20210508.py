#!/usr/bin/env python
# -*- coding: utf-8 -*-

# This is script for evaluating monthly simulated discharge to GRDC discharge data.

import os
import sys
import glob

import dischargeGRDC

import logging
from logger import Logger
# get name for the logger
logger = logging.getLogger("main_script")

# PCR-GLOBWB results: model output directory
pcrglobwb_output = {}
pcrglobwb_output["folder"]               = None                         # "/scratch-shared/edwinhs/runs_2017_finalizing_4LCs/30min/4LCs_accutraveltime_cru-forcing_latest_version/non-natural/begin_from_1958/netcdf/" # 
pcrglobwb_output["netcdf_file_name"]     = "discharge_monthAvg_output.nc" 
pcrglobwb_output["netcdf_variable_name"] = "discharge" 

# output directory storing analysis results (results from this script)
globalAnalysisOutputDir                  = None # "/scratch-shared/edwinhs/05min_runs_analysis_performed_on_june_2016/"
cleanOutputDir                           = True                         # option to clean analysisOutputDir   # FIXME: This must always be True 		

# directory for GRDC files:
# ~ globalDirectoryGRDC = "/projects/0/dfguu/users/edwin/data/observation_data/grdc_monthly_data_splitted/"           # "/scratch/edwin/observation_data/grdc_monthly_data_splitted/"
# ~ # This directory will contain several sub-folders (18 sub-folders per 10 Jun 2014)

globalDirectoryGRDC     = "/scratch-shared/edwinhs/discharge_evaluation_ulysses_2021-01-XX/grdc_observation_niko"

globalDirectoryGRDC     = "//home/edwin/data/grdc_observation_data/requested_on_2018_04_05/monthly_all_files_excluding_ewa/unzip_data_mon_splitted/"

# ~ edwinhs@fcn6.bullx:/home/edwin/data/grdc_observation_data/requested_on_2018_04_05/monthly_all_files_excluding_ewa/unzip_data_mon_splitted$ ls -lah
# ~ total 520K
# ~ drwxr-xr-x 18 edwin edwin 4.0K May  7 21:30 .
# ~ drwxr-xr-x  4 edwin edwin 4.0K May  7 21:28 ..
# ~ drwxr-xr-x  2 edwin edwin  36K May  7 21:29 01
# ~ drwxr-xr-x  2 edwin edwin  32K May  7 21:29 02
# ~ drwxr-xr-x  2 edwin edwin  36K May  7 21:29 03
# ~ drwxr-xr-x  2 edwin edwin  28K May  7 21:29 04
# ~ drwxr-xr-x  2 edwin edwin  32K May  7 21:29 05
# ~ drwxr-xr-x  2 edwin edwin  32K May  7 21:29 06
# ~ drwxr-xr-x  2 edwin edwin  28K May  7 21:30 07
# ~ drwxr-xr-x  2 edwin edwin  28K May  7 21:30 08
# ~ drwxr-xr-x  2 edwin edwin  28K May  7 21:30 09
# ~ drwxr-xr-x  2 edwin edwin  32K May  7 21:30 10
# ~ drwxr-xr-x  2 edwin edwin  28K May  7 21:30 11
# ~ drwxr-xr-x  2 edwin edwin  32K May  7 21:30 12
# ~ drwxr-xr-x  2 edwin edwin  32K May  7 21:30 13
# ~ drwxr-xr-x  2 edwin edwin  36K May  7 21:30 14
# ~ drwxr-xr-x  2 edwin edwin  32K May  7 21:30 15
# ~ drwxr-xr-x  2 edwin edwin  20K May  7 21:30 16
# ~ -rw-r--r--  1 edwin edwin  660 May  7 21:29 split_files.sh

# for 5min results of PCR-GLOBWB 2.0
#~ globalCloneMapFileName = "/projects/0/dfguu/data/hydroworld/PCRGLOBWB20/input5min/routing/lddsound_05min.map"        # "/data/hydroworld/PCRGLOBWB20/input5min/routing/lddsound_05min.map"
#~ lddMapFileName         = "/projects/0/dfguu/data/hydroworld/PCRGLOBWB20/input5min/routing/lddsound_05min.map"        # "/data/hydroworld/PCRGLOBWB20/input5min/routing/lddsound_05min.map"
#~ cellAreaMapFileName    = "/projects/0/dfguu/data/hydroworld/PCRGLOBWB20/input5min/routing/cellsize05min.correct.map" # "/data/hydroworld/PCRGLOBWB20/input5min/routing/cellsize05min.correct.map"

# the following is needed for evaluating model results with 5 arcmin resolution
catchmentClassFileName = None 

def main():

    # get the argument: 
    argument = sys.argv
    print(argument)
    
    # PCR-GLOBWB results: model output directory
    pcrglobwb_output["folder"] = str(argument[1])
    
    # output directory storing analysis results (results from this script)
    globalAnalysisOutputDir    = str(argument[2])
    
    # sub_folder to split/parallelize the analyses
    sub_folder                 = str(argument[3])
    
    # start date and end dates for analyses
    startDate = None # "1901-01-31" # None # "1958-01-31" #YYYY-MM-DD # None 
    endDate   = None # "2010-12-31" # None # "2010-12-31" #YYYY-MM-DD # None 
    try: 
        if argument[5] != "default": endDate   = str(argument[5])
        if argument[4] != "default": startDate = str(argument[4])
    except:
        pass

    # netcdf file name and variable name
    try: 
        pcrglobwb_output["netcdf_file_name"] = str(argument[6])
    except:
        pass

    # netcdf variable name
    try: 
        pcrglobwb_output["netcdf_variable_name"] = str(argument[7])
    except:
        pass
    
    # clone map, ldd and cell area 
    globalCloneMapFileName = str(argument[8])
    lddMapFileName         = str(argument[9])
    cellAreaMapFileName    = str(argument[10])
    
    # sub-folders of the analysis output and GRDC folders 
    analysisOutputDir = globalAnalysisOutputDir + "/" + sub_folder + "/"
    directoryGRDC     = globalDirectoryGRDC + "/" + sub_folder + "/"
    
    # make analysisOutputDir
    try:
        os.makedirs(analysisOutputDir) 
    except:
        if cleanOutputDir == True: os.system('rm -r '+analysisOutputDir+"/*") 
    #
    # temporary directory (note that it is NOT a good idea to store temporary files in the memory (/dev/shm))
    temporary_directory = analysisOutputDir + "/tmp/"
    try:
        os.makedirs(temporary_directory) 
    except:
        os.system('rm -r '+temporary_directory+"/*") # make sure that temporary directory is clean 

    # logger object
    logger = Logger(analysisOutputDir)
    
    # get GRDC attributes of all stations:
    dischargeEvaluation = dischargeGRDC.DischargeEvaluation(pcrglobwb_output["folder"],\
                                                            startDate,endDate,temporary_directory)
    dischargeEvaluation.get_grdc_attributes(directoryGRDC)

    # evaluate model results
    dischargeEvaluation.evaluateAllModelResults(globalCloneMapFileName,\
                                                catchmentClassFileName,\
                                                lddMapFileName,\
                                                cellAreaMapFileName,\
                                                pcrglobwb_output,\
                                                analysisOutputDir)  

if __name__ == '__main__':
    sys.exit(main())
