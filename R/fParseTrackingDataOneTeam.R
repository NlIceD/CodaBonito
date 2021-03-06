#' Pass network ( WIP )
#'
#' Plots a marker for each player at their median passing position, and draws
#' connections between players to represent the number of passes exchanged
#' between them
#'
#' @param cFilePath
#' @param cTag
#' @examples
#' @import data.table
#' @import zoo
#' @export
fParseTrackingDataOneTeam = function (
   cFilePath,
   cTag = '',
   nXLimit = 120,
   nYLimit = 80,
   xMaxBB = 1,
   yMaxBB = 1
) {

   dtRawData = fread(
      cFilePath,
      skip = 3,
      header = F
   )

   dtMetaData = fread(
      cFilePath,
      skip = 2,
      nrows = 1,
      header = F
   )

   vcColnames = na.locf(unlist(dtMetaData))
   rm(dtMetaData)
   vcColnames[vcColnames == 'Time [s]'] = 'Time_s'
   vcColnames[
      grepl(
         vcColnames,
         pattern = 'Player|Ball'
      )
   ] = paste0(
      cTag,
      paste0(
         grep(
            vcColnames[
               grepl(
                  vcColnames,
                  pattern = 'Player|Ball'
               )
            ],
            pattern = 'Player|Ball',
            value = T
         ),
         c('X','Y')
      )
   )

   setnames(
      dtRawData,
      vcColnames
   )


   for ( cColname in colnames(dtRawData) ) {

      if ( grepl(cColname, pattern = 'X$') ) {

         dtRawData[,
            (cColname) := dtRawData[, cColname, with = F] * nXLimit / xMaxBB
         ]

      }

      if ( grepl(cColname, pattern = 'Y$') ) {

         dtRawData[,
            (cColname) := dtRawData[, cColname, with = F] * nYLimit / yMaxBB
         ]

      }

   }

   dtRawData

}
