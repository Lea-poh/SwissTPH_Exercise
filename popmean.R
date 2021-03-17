popmean <- function(data, intervention = "all", years){
  if(intervention == "all") intervention <- c("none", "IRS", "ITN", "IRS.ITN")
  get_interventions <-  function(year) {
    current_year <- dat[dat[,"year"] == year,]
    population <- sum(current_year$population)
    current_year_interv <- (current_year[1,intervention]* current_year$population[1] + current_year[2,intervention]* current_year$population[2]) / population
    return(current_year_interv)
  }
  out_list <- lapply(years, get_interventions)
  names(out_list) <- years
  return(out_list)
}