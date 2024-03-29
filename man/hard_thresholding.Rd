% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hard_thresholding.R
\name{hard_thresholding}
\alias{hard_thresholding}
\title{hard thresholding}
\usage{
hard_thresholding(x, w, y, p_value, newx)
}
\arguments{
\item{x}{the input matrix x.}

\item{w}{the optional input matrix w, that cannot be selected.}

\item{y}{the response variable.}

\item{p_value}{the threshold p-value.}

\item{newx}{matrix  that selection will applied. Useful for time series, when we need the observation at time t.}
}
\value{
the variables less than p-value.
}
\description{
hard thresholding
}
\examples{
data("stock_data")
data("optimal_factors")
y=as.matrix(stock_data[,2])
y=as.vector(y)
w=as.matrix(stock_data[,3])
pc=as.matrix(optimal_factors)
t=length(y)
news_factor <- hard_thresholding(w=w[1:(t-1),],x=pc[1:(t-1),],y=y[2:t],p_value = 0.01,newx = pc)

}
