\name{NB.likelihood}

\alias{NB.likelihood}
\title{Log-likelihood values for the NB estimator
}
\description{This will return return the log-likelihood value given a value of N. }

\usage{NB.likelihood(N, infile, alleles, sample.interval)}

\arguments{
  \item{N}{The effective population size dor diploid individuals. }
  \item{infile}{Your input data file in a plain text format. This data contains the allele counts at each locus and from each sampling time point. }
  \item{alleles}{a vector containing the number of alleles at each locus. For example, c(4, 4, 4) would mean that 3 loci are sampled, with 4 alleles each. }
  \item{sample.interval}{a vector stating at which generations the samples were taken. For example, c(0, 8) would indicate that two samples were collected from the 0th and 8th generation. }
}

\details{More details please see \code{\link{NB.estimator}}. }

\value{This function returns one single element, the log-likelihood of the model given the effective population size N and your inputs. }

\note{This function allows you to use your own optimisation algorithms or customise the parameters using \code{optim} or \code{nlm}. Otherwise please use \code{\link{NB.estimator}} which has the internal \code{optim} wrapped inside. }

\seealso{\code{\link{NB.estimator}}. }

\examples{
## CREATE SAMPLE DATASET
NB.example.dataset()

##SEE WHAT'S THE LOG-LIKELIHOOD VALUE IS WHEN N=1000
NB.likelihood(N=1000, infile='sample_data.txt', 
	alleles=rep(4, 50), sample.interval=c(0, 8))

	#####
	# NUMERICAL RESULT
	#[1] -544.0405
	#####

}
