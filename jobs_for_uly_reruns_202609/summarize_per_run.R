
get_performance_table <- function (folder_of_analysis_summaries, number_of_sub_folders) {

#~ folder_of_analysis_summaries = "/scratch/depfg/sutan101/benchmark_for_watersis_runs/aqueduct/analysis_1981-2019/"

#~ # number of sub folders where evaluations were splitted
#~ number_of_sub_folders = 30


# read all summary tables:
performance_table = read.table(paste(folder_of_analysis_summaries,"01/summary.txt",sep=""),header=T,sep=";")
for (i in 2:number_of_sub_folders) {
if (i < 10) {table_file_name = paste(folder_of_analysis_summaries,"0",as.character(i),"/summary.txt",sep="")} else {
             table_file_name = paste(folder_of_analysis_summaries,    as.character(i),"/summary.txt",sep="")} 
performance_table = rbind(performance_table,read.table(table_file_name,header=T,sep=";"))
}


# plot cdf 
performance_table_selected = performance_table[which(!is.na(performance_table$kge_2009)),]
kge_2009 = performance_table_selected$kge_2009
kge_2009_cropped = kge_2009
kge_2009_cropped[which(kge_2009_cropped < -1.0)] = -1.0
plot(ecdf(kge_2009_cropped), xlim = c(-1.0,1.0))

# id and kge only
performance_table = data.frame(performance_table$id_from_grdc, performance_table$kge_2009)
names(performance_table)[1] <- "id_from_grdc"
names(performance_table)[2] <- "kge_2009"

return(performance_table)

}
