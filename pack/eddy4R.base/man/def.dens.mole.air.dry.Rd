% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/def.dens.mole.air.dry.R
\name{def.dens.mole.air.dry}
\alias{def.dens.mole.air.dry}
\title{Definition function: Calculation of the molar density of the dry air alone}
\usage{
def.dens.mole.air.dry(densMoleAir, densMoleH2o)
}
\arguments{
\item{densMoleAir}{A vector containing the mole density of the air mixture (includes dry air and water vapor), of class "numeric". [mol m-3]}

\item{densMoleH2o}{A vector containing the water vapor mole density of the air mixture, of class "numeric". [molH2o m-3]}
}
\value{
The returned object is the the molar density of the dry air alone
}
\description{
Function definition. Calculation of the molar density of the mdry air alone
}
\examples{
Example 1, this will cause an error message due to densMoleAir and densMoleH2o have no units: 
def.dens.mole.air.dry(densMoleAir = 37.9, densMoleH2o = 0.3)
Example 2, assign values and units to variables first, the function should run ok.
densMoleAir = 37.9
densMoleH2o = 0.3
attributes(densMoleAir)$unit = "mol m-3"
attributes(densMoleH2o)$unit = "molH2o m-3"
def.dens.mole.air.dry(densMoleAir, densMoleH2o)
}
\references{
License: GNU AFFERO GENERAL PUBLIC LICENSE Version 3, 19 November 2007
}
\seealso{
Currently none.
}
\author{
Stefan Metzger \email{eddy4R.info@gmail.com} \cr
Hongyan Luo \email{hluo@battelleecology.org}
}
\keyword{density}
\keyword{mole}
