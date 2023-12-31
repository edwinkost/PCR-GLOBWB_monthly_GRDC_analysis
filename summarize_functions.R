

cdf_kge <- function (folder_of_analysis_summaries, number_of_sub_folders) {

#~ # number of sub folders where evaluations were splitted
#~ number_of_sub_folders = 30

#~ edwin@tcn1174.local.snellius.surf.nl:/scratch-shared/edwin/pcrglobwb_ulysses_2023-12-XX_validation$ ls -lah
#~ total 3.0K
#~ drwxr-x---  6 edwin edwin 4.0K Dec 20 09:45 .
#~ drwxr-xr-x 11 edwin edwin 4.0K Dec 20 09:00 ..
#~ drwxr-x---  3 edwin edwin 4.0K Dec 20 09:46 check_orig_2lcs
#~ drwxr-x---  3 edwin edwin 4.0K Dec 20 10:01 check_sqrt_2lcs
#~ drwxr-x---  3 edwin edwin 4.0K Dec 20 09:45 check_sqrt_4lcs_old
#~ drwxr-x---  3 edwin edwin 4.0K Dec 20 09:53 mhm

#~ folder_of_analysis_summaries = "/scratch-shared/edwin/pcrglobwb_ulysses_2023-12-XX_validation_final/2lcs_orig/validation_1981-2019/"




# read all summary tables:
performance_table = read.table(paste(folder_of_analysis_summaries,"01/summary.txt",sep=""),header=T,sep=";")
for (i in 2:number_of_sub_folders) {
if (i < 10) {table_file_name = paste(folder_of_analysis_summaries,"0",as.character(i),"/summary.txt",sep="")} else {
             table_file_name = paste(folder_of_analysis_summaries,    as.character(i),"/summary.txt",sep="")} 
performance_table = rbind(performance_table,read.table(table_file_name,header=T,sep=";"))
}


performance_table_all = performance_table

# selecting performance 
performance_table_selected = performance_table[which(!is.na(performance_table$kge_2009)),]

# - only if average observation discharge > 0.0
performance_table_selected = performance_table_selected[which(performance_table_selected$average_observation > 0.0), ]

# - only the data with reasonable number of pairs 
performance_table_selected = performance_table_selected[which(performance_table_selected$num_of_month_pairs >= 100), ]
# - only grdc catchment area > 100 km2
performance_table_selected = performance_table_selected[which(performance_table_selected$grdc_catchment_area_in_km2  >= 100.),]

# - only if ratio between the model and grdc catchment areas < 1.25
ratio                          =  performance_table_selected$model_catchment_area_in_km2/performance_table_selected$grdc_catchment_area_in_km2
ratio[which(ratio < ratio^-1)] = (ratio[which(ratio < ratio^-1)])^-1
performance_table_selected = performance_table_selected[which(ratio < 1.25), ]

# print number of stations used
print(length(performance_table_selected$kge_2009))

# get cdf
kge_2009 = performance_table_selected$kge_2009
kge_2009_cropped = kge_2009
#~ kge_minimum = -1.0
#~ kge_2009_cropped[which(kge_2009_cropped < kge_minimum)] = kge_minimum
plot(ecdf(kge_2009_cropped), xlim = c(-0.4,1.0))

# print median  
print(median(kge_2009_cropped))

#~ # - calculate runoff (based on observed discharge)
#~ grdc_runoff_in_mm_per_year = performance_table_selected$average_observation * 10^3 * 365.25 / (performance_table_selected$model_catchment_area_in_km2 * 10^6 * (1/(24.*3600.)))
#~ performance_table_selected = cbind(performance_table_selected, grdc_runoff_in_mm_per_year) 

return(ecdf(kge_2009_cropped))

}
