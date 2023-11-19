
# number of sub folders where evaluations were splitted
number_of_sub_folders = 30

folder_of_analysis_summaries = ""

# read all summary tables:
performance_table = read.table(paste(folder_of_analysis_summaries,"01/summary.txt",sep=""),header=T,sep=";")
#~ for (i in 2:18) {
for (i in 2:number_of_sub_folders) {
if (i < 10) {table_file_name = paste(folder_of_analysis_summaries,"0",as.character(i),"/summary.txt",sep="")} else {
             table_file_name = paste(folder_of_analysis_summaries,    as.character(i),"/summary.txt",sep="")} 
performance_table = rbind(performance_table,read.table(table_file_name,header=T,sep=";"))
}
