\name{NB.plot.likelihood}

\alias{NB.plot.likelihood}

\title{Plot profile (log)-likelihood}

\description{This function does not maximise the likelihood function but rather provide a range of log-likelihood values as a function of effective population size. }

\usage{NB.plot.likelihood(infile, alleles, sample.interval, lb, ub, step, plotit = TRUE)}

\arguments{
  \item{infile}{The input data. Please refer to \code{infile} from \code{NB.estimator}. }
  \item{alleles}{Number of alleles at each locus. Please refer to \code{alleles} from \code{NB.estimator}. }
  \item{sample.interval}{Please refer to \code{sample.interval} from \code{NB.estimator}. }
  \item{lb}{The lower bound of N. }
  \item{ub}{The upper bound of N. }
  \item{step}{How many points do you want to evaluate at. }
 \item{plotit}{Do you want to plot the log-likelihood out? }
}

\details{
The input arguments \code{infile}, \code{alleles}, and \code{sample.interval} have the same definitions as those in \code{\link{NB.estimator}}. 
}

\value{
Returns a range of log-likelihood values with the associated effective population size. If \code{plotit==TRUE} then a plot of the log-likelihood will also be produced. 
}

\note{This would be a good way to examine whether the maximization converges to the global maximum. }


\seealso{\code{\link{NB.estimator}. }}

\examples{
## CREATE SAMPLE DATASET
NB.example.dataset()

## PLOT THE LOG-LIKELIHOOD
NB.plot.likelihood(infile='sample_data.txt', alleles=rep(4, 50), 
	sample.interval=c(0, 8), lb=300, ub=2000, step=200)
}
