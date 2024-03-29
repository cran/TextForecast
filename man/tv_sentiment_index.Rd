% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tv_sentiment_index.R
\name{tv_sentiment_index}
\alias{tv_sentiment_index}
\title{tv sentiment index function}
\usage{
tv_sentiment_index(x, w, y, alpha, lambda, newx, family, k)
}
\arguments{
\item{x}{A matrix of variables to be selected by shrinkrage methods.}

\item{w}{Optional Argument. A matrix of variables to be selected by shrinkrage methods.}

\item{y}{the response variable.}

\item{alpha}{the alpha required in glmnet.}

\item{lambda}{the lambda required in glmnet.}

\item{newx}{Matrix  that selection will be applied. Useful for time series, when we need the observation at time t.}

\item{family}{the glmnet family.}

\item{k}{the highest positive and negative coefficients to be used.}
}
\value{
The time-varying sentiment index. The index is based on the word/term counting and is computed using: tv_index=(pos-neg)/(pos+neg).
}
\description{
tv sentiment index function
}
\examples{
suppressWarnings(RNGversion("3.5.0"))
set.seed(1)
data("stock_data")
data("news_data")
y=as.matrix(stock_data[,2])
w=as.matrix(stock_data[,3])
data("news_data")
X=news_data[,2:ncol(news_data)]
x=as.matrix(X)
grid_alphas=0.05
cont_folds=TRUE
t=length(y)
optimal_alphas=optimal_alphas(x[1:(t-1),],w[1:(t-1),],
y[2:t],grid_alphas,TRUE,"gaussian")
tv_index <- tv_sentiment_index(x[1:(t-1),],w[1:(t-1),],y[2:t],
optimal_alphas[[1]],optimal_alphas[[2]],x,"gaussian",2)

}
