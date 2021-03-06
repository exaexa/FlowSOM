% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/3_buildMST.R
\name{PlotOverview2D}
\alias{PlotOverview2D}
\title{Plot metaclusters on scatter plots}
\usage{
PlotOverview2D(fsom, markerlist, metaclusters, colors = NULL, ff, ...)
}
\arguments{
\item{fsom}{FlowSOM object, as generated by \code{\link{FlowSOM}}.
If using a FlowSOM object as generated by 
\code{\link{BuildMST}}, it needs to be wrapped in a list,
list(FlowSOM = fsom, metaclustering = metaclustering).}

\item{markerlist}{List in which each element is a pair of marker names}

\item{metaclusters}{Metaclusters of interest}

\item{colors}{Named vector with color value for each metacluster. 
If NULL (default) colorbrewer "paired" is interpolated}

\item{ff}{flowFrame to use as reference for the marker names}

\item{...}{Other parameters to pass on to PlotClusters2D}
}
\value{
Nothing is returned, but a plot is drawn for every markerpair and
        every metacluster. The individual cells are colored, and the 
        center of each FlowSOM cluster is indicated with a blue cross.
}
\description{
Write multiple 2D scatter plots to a png file. 
All cells of fsom$data are plotted in black, and those of the selected 
metaclusters are plotted in color.
}
\examples{
   # Read from file, build self-organizing map and minimal spanning tree
   fileName <- system.file("extdata", "68983.fcs", package="FlowSOM")
   flowSOM.res <- FlowSOM(fileName, 
                          compensate=TRUE, transform=TRUE, scale=TRUE,
                          colsToUse=c(9,12,14:18),
                          nClus = 10,
                          seed = 1)
                          
   # Plot cells
   markers_of_interest = list(c("FSC-A", "SSC-A"),
                              c("CD3", "CD19"),
                              c("TCRb", "TCRyd"),
                              c("CD4", "CD8"))
   metaclusters_of_interest = 1:10
   
   # Recommended to write to png
   
   png("Markeroverview.png",
       width = 500 * length(markers_of_interest),
       height = 500 * length(metaclusters_of_interest))
   PlotOverview2D(flowSOM.res,
                  markerlist = markers_of_interest,
                  metaclusters = metaclusters_of_interest,
                  pchCluster = 19,
                  ff = flowCore::read.FCS(fileName))
   dev.off()

}
\seealso{
\code{\link{PlotClusters2D}}
}
