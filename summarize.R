
# number of sub folders where evaluations were splitted
number_of_sub_folders = 30

#~ edwin@tcn1174.local.snellius.surf.nl:/scratch-shared/edwin/pcrglobwb_ulysses_2023-12-XX_validation$ ls -lah
#~ total 3.0K
#~ drwxr-x---  6 edwin edwin 4.0K Dec 20 09:45 .
#~ drwxr-xr-x 11 edwin edwin 4.0K Dec 20 09:00 ..
#~ drwxr-x---  3 edwin edwin 4.0K Dec 20 09:46 check_orig_2lcs
#~ drwxr-x---  3 edwin edwin 4.0K Dec 20 10:01 check_sqrt_2lcs
#~ drwxr-x---  3 edwin edwin 4.0K Dec 20 09:45 check_sqrt_4lcs_old
#~ drwxr-x---  3 edwin edwin 4.0K Dec 20 09:53 mhm

folder_of_analysis_summaries = ""
folder_of_analysis_summaries = "check_sqrt_4lcs_old/validation_1981-1995/"



# read all summary tables:
performance_table = read.table(paste(folder_of_analysis_summaries,"01/summary.txt",sep=""),header=T,sep=";")
#~ for (i in 2:18) {
for (i in 2:number_of_sub_folders) {
if (i < 10) {table_file_name = paste(folder_of_analysis_summaries,"0",as.character(i),"/summary.txt",sep="")} else {
             table_file_name = paste(folder_of_analysis_summaries,    as.character(i),"/summary.txt",sep="")} 
performance_table = rbind(performance_table,read.table(table_file_name,header=T,sep=";"))
}

# selecting performance 
performance_table_selected = performance_table[which(!is.na(performance_table$kge_2009)),]

# plot cdf
kge_2009 = performance_table_selected$kge_2009
kge_2009_cropped = kge_2009
kge_2009_cropped[which(kge_2009_cropped < -1.0)] = -1.0
plot(ecdf(kge_2009_cropped), xlim = c(-0.4,1.0))
  
median(performance_table_selected$kge_2009)



performance_table_complete = performance_table
performance_table = performance_table_seleted

# - only the data with reasonable number of pairs 
performance_table = performance_table[which(performance_table$num_of_month_pairs >= 60), ]
# - only grdc catchment area > 10 km2
performance_table = performance_table[which(performance_table$grdc_catchment_area_in_km2  >= 10),]
#~ # - only model catchment area > 10 km2
#~ performance_table = performance_table[which(performance_table$model_catchment_area_in_km2 >= 10),]
# - only if ratio between the model and grdc catchment areas < 1.25
ratio                          =  performance_table$model_catchment_area_in_km2/performance_table$grdc_catchment_area_in_km2
ratio[which(ratio < ratio^-1)] = (ratio[which(ratio < ratio^-1)])^-1
performance_table = performance_table[which(ratio < 1.25), ]
length(performance_table$kge_2009)

# - only if average discharge > 0.0
performance_table = performance_table[which(performance_table$average_observation > 0.0), ]
#~ performance_table = performance_table[which(performance_table$average_model > 0.0), ]
#~ # - only if ratio discharge is reasonable
#~ ratio                          =  performance_table$average_model/performance_table$average_observation
#~ ratio[which(ratio < ratio^-1)] = (ratio[which(ratio < ratio^-1)])^-1
#~ length(performance_table$kge_2009)
#~ performance_table = performance_table[which(ratio < 10.0), ]
#~ length(performance_table$kge_2009)

# - calculate runoff
grdc_runoff_in_mm_per_year = performance_table$average_observation * 10^3 * 365.25 / (performance_table$model_catchment_area_in_km2 * 10^6 * (1/(24.*3600.)))

# 
performance_table  = cbind(performance_table, grdc_runoff_in_mm_per_year) 

