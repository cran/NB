\name{NB.estimator}

\alias{NB.estimator}

\title{Maximum likelihood estimation of effective population size from temporally-spaced genetic data}

\description{
The concept of effective population size is imporatnt in population genetics. 
This function estimates the effective population size \eqn{N_e} from temporally-sapced genetic data using maximum likelihood method with continuous approximation. 
}

\usage{
NB.estimator(infile, alleles, sample.interval, bound = c(50, 1e+07), 
	profile.likelihood=FALSE)
}

\arguments{
  \item{infile}{The input dataset. It should be a plain text file (*.txt) containing the number of alleles of each allele, at each locus, from each temporal sample. For example, Suppose we have \eqn{i} temporal samples from the focal population, \eqn{j} loci, and \eqn{K_j} alleles at locus \eqn{j}. 
	Denoting the number of copies of allele \eqn{k} at locus \eqn{j} from sample \eqn{i} as \eqn{n_{k,j,i}}, then the input format of data is as follows: 
	\cr \eqn{n_{1,1,1}~n_{2,1,1}~...~n_{K_1,1,1}}
	\cr \eqn{n_{1,2,1}~n_{2,2,1}~...~n_{K_2,2,1}}
	\cr ...
	\cr \eqn{n_{1,j,1}~n_{2,j,1}~...~n_{K_j, j,1}}
	\cr
	\cr \eqn{n_{1,1,2}~n_{2,1,2}~...~n_{K_1,1,2}}
	\cr \eqn{n_{1,2,2}~n_{2,2,2}~...~n_{K_2,2,2}}
	\cr ...
	\cr \eqn{n_{1,j,2}~n_{2,j,2}~...~n_{K_j, j,2}}
	\cr
	\cr ...
	\cr
	\cr Note: A space is required to separate the allele counts. 
	}
  \item{alleles}{A vector containing the number of alleles at each locus. For example, \code{c(4, 4, 4)} would mean that 3 loci are sampled, with 4 alleles each.}
  \item{sample.interval}{A vector stating at which generations the samples were taken. For example, \code{c(0, 8)} would indicate that two samples were collected from the 0th and 8th generation. }
  \item{bound}{Lower and upper bound for searching for the effective population size. Default values are \code{c(50, 1e7)}. }
  \item{profile.likelihood}{\code{TRUE} if you would like to \code{plot} the log-likelihood function, or to look at the details of the log-likelihood values between your confidence interval. \code{FALSE} will return you the lower and upper 95\% confidence interval only. }
}

\details{The input arguments above largely follow the input format of MLNE (Wang, 2001; Wang and Whitlock, 2003) to allow users to switch between platforms with the minimal effort. 
	The infile should be in a plain text (*.txt) file format. It contains the same information as the input data as MLNE does. The built-in \code{optim} optimiser is wrapped within this function. }

\value{
 \item{N}{The point estimate of the effective population size \eqn{N_e}. }
 \item{CI}{The approximate 95\% confidence interval calculated from the log-likelihood. They are the region where the log-likelihood is 2 units below the maxima. }
 \item{log.like}{The value of the maximised log-likelihood. }
 \item{profile.CI}{A list of log-likelihood values as a function of \eqn{N_e} within the 95\% confidence interval. }
}

\note{
If you would like to use your own optimisation algorithm or customerise the parameters within the \code{optim} function, please consider using \code{\link{NB.likelihood}} from this package. 
}


\seealso{
 \code{\link{NB.likelihood}}. \code{\link{NB.example.dataset}. }
}

\examples{
## CREATE SAMPLE DATASET
NB.example.dataset()

## RUN THE FUNCTION
NB.estimator(infile='sample_data.txt', alleles=rep(4, 50), 
	sample.interval=c(0, 8), profile.likelihood=FALSE)

	#####
	## NUMERICAL RESULTS
	#$N
	# [1] 1241.079
	#
	#$CI
	#[1]  594.195 6375.933
	#
	#$log.like
	#[1] -543.9159
	#####
}
