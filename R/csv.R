#' CSV Import
#' 
#' @description This function imports all CSV within the working directory as either a list object or individual objects. 
#' 
#' @param df returns individual data frames from all available '.csv' files within the working directory. 
#' 
#' @return Either individual data frames or a list object containing all csv files.
#' 
#' @examples
#' csv_only()
#' 
#' @export csv_only
#'



csv_only <- function(df = FALSE) {
  tempcsv = dir(pattern=".csv", all.files = T)
  csv = map(set_names(tempcsv, tempcsv), read_csv)
  if (df) {
    list2env(csv, .GlobalEnv)
    message("All csv files are now objects")
  } 
  else {
    csv <<- csv
    message("All csv files are located in the 'csv' list object.")
  }
}