##############################################################################################
#' @title Definition function: Calculation of average signal strength for LI-7200 IRGA

#' @author
#' Stefan Metzger \email{eddy4R.info@gmail.com} \cr
#' Hongyan Luo \email{hluo@battelleecology.org}

#' @description Function definition. Calculation of average signal strength for LI-7200 IRGA.

#' @param ssiCo2 A vector containing the CO2 signal strength, of class "numeric". [percent]
#' @param ssiH2o A vector containing the H2O signal strength, of class "numeric". [percent]

#' @return 
#' The returned object is the average signal strength calculated from the CO2 signal strength and the H2O signal strength.  

#' @references
#' License: GNU AFFERO GENERAL PUBLIC LICENSE Version 3, 19 November 2007.

#' @keywords signal strength, irga

#' @examples
#' Currently none.

#' @seealso Currently none.

#' @export

# changelog and author contributions / copyrights
#   Stefan Metzger (2016-09-06)
#     original creation
#   Hongyan Luo (2016-09-07)
#     adjust to eddy4R coding style
#   Stefan Metzger (2016-09-13)
#     complete example call to def.ssi.mean()
#   Natchaya P-Durden (2018-04-03)
#     update @param format
##############################################################################################
def.ssi.mean <- function(
  # CO2 signal strength 
  ssiCo2,
  # H2O signal strength
  ssiH2o
) {
  
  # test for correct units of input variables
  
  if(attributes(ssiCo2)$unit != "-" || attributes(ssiH2o)$unit != "-") {
    
    stop("def.ssi.mean(): input units are not matching internal units, please check.")
    
  } else {
    
    # calculate mean signal strength
    ssiMean <- (ssiCo2 + ssiH2o) / 2
    
    # assign output unit
    attributes(ssiMean)$unit <- "-"
    
    # return results
    return(ssiMean) 
    
  }
}


# example call
# tst <- def.ssi.mean(ssiCo2 = def.unit.extr(data =  data$irga, nameVar = "ssiCo2"),
#                     ssiH2o = def.unit.extr(data =  data$irga, nameVar = "ssiH2o")
#                     )