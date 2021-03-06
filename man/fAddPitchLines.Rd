% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fAddPitchLines.R
\name{fAddPitchLines}
\alias{fAddPitchLines}
\title{Pitch background}
\usage{
fAddPitchLines(
  plotObject,
  nXLimit = 120,
  nYLimit = 80,
  cLineColour = "white",
  cPitchColour = "#038253"
)
}
\arguments{
\item{plotObject}{a ggplot object. Can just be a blank ggplot object too}

\item{nXLimit}{Length of the pitch}

\item{nYLimit}{Breadth of the pitch}

\item{cLineColour}{the colour of the line markings on the pitch}

\item{cPitchColour}{the colour of the grass on the pitch}
}
\description{
Adds pitch markings, green background, etc. for plot background to look like
a football pitch. ggplot adds things in order so initiate a ggplot object, 
add the pitch marking with this function, and then add the data you want to 
add
}
\examples{
p1 = ggplot()
p1 = fAddPitchLines(p1)
p1
p1 = p1 + theme_pitch()
p1
# adding passing data on top now
p1 + 
   geom_point(
      data = dtPasses,
      aes(x = x , y = y)
   )
)
}
