##############################################################################################
#' @title  Load pre-defined site specific information into the global environment

#' @author Stefan Metzger \email{eddy4R.info@gmail.com}\n
#' Dave Durden

#' @description Load pre-defined site specific information into the global environment.

#' @param \code{loc} Parameter of class character. A parameter to choose the site for which site specific information is pulled.

#' @return Site specific information provided as a list \code{SiteInfo}

#' @references 
#' License: Terms of use of the NEON FIU algorithm repository dated 2015-01-16. 

#' @keywords site, metadata, preprocessing

#' @examples 
#' def.get.site.info("SERC")

#' @seealso Currently none

#' @export

# changelog and author contributions / copyrights
#   Stefan Metzger (2014-10-02)
#     original creation
#   Stefan Metzger (2015-11-28)
#     re-formualtion as function() to allow packaging
#   Dave Durden (2016-02-11)
#     Applying standard style following Wiki
#   Dave Durden (2016-05-04)
#     Adding site information for SERC
##############################################################################################


def.get.site.info <- function(
  #location
  loc=c("IM", "LOS", "NR", "NS", "PF" , "SERC")[6]
) {
  
  #allocate empty list for site information
  SiteInfo <- list()
  
  #get site info
  #Xilingol, Inner Mongolia, China
  if(loc == "IM") {
    #UTC to local time difference (China standard time, CST)
    SiteInfo$TimeDiffUtcLt <- +8	
    SiteInfo$ZoneTime <- "CST"
    #UTM zone for conversion lat / lon to UTM
    SiteInfo$ZoneUtm <- data.frame(zone=50)
  }
  
  #Lindenberg, Brandenburg, Germany
  if(loc == "LOS") {
    #UTC to local time difference (Central European summer time, CEST -> 26.10)
    SiteInfo$TimeDiffUtcLt <- +2
    SiteInfo$ZoneTime <- "CEST"
    #UTM zone for conversion lat / lon to UTM
    SiteInfo$ZoneUtm <- data.frame(zone=33)	
  }
  
  #Niwot Ridge, CO, U.S.A.
  if(loc == "NR") {
    #UTC to local time difference (Mountain standard time, MST)
    SiteInfo$TimeDiffUtcLt <- -7
    SiteInfo$ZoneTime <- "MST"
    #UTC to local time difference (Mountain daylight saving time, MDT)
    #      UTC2LT <- -6  
    #coordinates in UTM [m]
    SiteInfo$ZoneUtm <- data.frame(zone=13, estg=453382, nthg=4431552)
    #height of tower base above sea level [m]
    SiteInfo$ElevAslTow <- 3023
    #measurement height [m]
    SiteInfo$DistZaxsMeas <- 21.5
    #displacement height 7.8+/-1.1[m]
    site_info$DistZaxsDisp <- 7.8
    #canopy height 11 - 13[m]
    SiteInfo$DistZaxsCnpy <- 12 
    #CSAT3 boom angle [degrees from true North]
    SiteInfo$AzSoni <- 204
    #planar fit coefficients (CoefPf [degree] [degree] [m s-1] alpha (CoefAngPtch), beta (CoefAngRoll),
    #and the regression offset (CoefOfstReg)       
    SiteInfo$CoefPf <- data.frame(CoefAngPtch = 2.29, CoefAngRoll = 5.62, CoefOfstReg = -0.0185)
  }
  
  #Northslope, AK, U.S.A.
  if(loc == "NS") {  
    #UTC to local time difference (Alaska standard time)
    SiteInfo$TimeDiffUtcLt <- -9
    SiteInfo$ZoneTime <- "AKST"
    #UTC to local time difference (Alaska daylight time)
    #       site_info$UTC2LT <- -8  
    #		site_info$tz <- "AKDT"
    #UTM zone for conversion lat / lon to UTM
    SiteInfo$ZoneUtm<- data.frame(zone=4)
  }
  
  #Park Falls, Wi, U.S.A.
  if(loc == "PF"){
    #UTC to local time difference (Central standard time)
    SiteInfo$TimeDiffUtcLt <- -6
    SiteInfo$ZoneTime <- "CST"
    #coordinates in UTM zone [m]
    SiteInfo$ZoneUtm <- data.frame(zone=15, estg=711415, nthg=5091655) 
    #height of tower base above sea level [m]
    SiteInfo$ElevAslTow <- 470 
  }
  
  #Smithsonian Environmental Research Center, MD, U.S.A.
  if(location == "SERC") {
    #UTC to local time difference (Eastern standard time, EST)
    SiteInfo$TimeDiffUtcLt <- -5
    SiteInfo$ZoneTime <- "EST"
    #UTC to local time difference (Eastern daylight saving time, EDT)
    #      UTC2LT <- -4  
    #coordinates in UTM [m]
    SiteInfo$ZoneUtm <- data.frame(zone = 18, estg = 364703.4, nthg = 4305740.9)
    #height of tower base above sea level [m]
    SiteInfo$ElevAslTow  <- 33.23
    #measurement height [m]
    SiteInfo$DistZaxsMeas <- 61.94
    #displacement height 7.8+/-1.1[m]
    SiteInfo$DistZaxsDisp <- 32
    #canopy height 11 - 13[m]
    SiteInfo$DistZaxsCnpy <- 38
    #CSAT3 boom angle [degrees from true North]
    SiteInfo$AzSoni <- 230
    #planar fit coefficients (April 22 to May 3, 2016) [degree] [degree] [m s-1]
    SiteInfo$CoefPf <- data.frame(CoefAngPtch = -0.7056, CoefAngRoll = -1.8718, CoefOfstReg = 0.0549)
  }
  #return site info
  return(SiteInfo)
  
}
