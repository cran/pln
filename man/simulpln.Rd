% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/simulpln.R
\name{simulpln}
\alias{simulpln}
\title{Simulate data from polytomous logit-normit (graded logistic) model}
\usage{
simulpln(n, nitem, ncat, alphas, betas)
}
\arguments{
\item{n}{Number of responses to generate.}

\item{nitem}{Number of items.}

\item{ncat}{Number of categories for the items.}

\item{alphas}{A vector of length \code{nitem}\eqn{\times}{ X }(\code{ncat}-1)
corresponding to true values for the (decreasing) cutpoints
for the items.}

\item{betas}{A vector of length \code{nitem} corresponding to values for the
beta vectors of slopes.}
}
\value{
A data matrix in which each row represents a response pattern and the final column represents the frequency of each response pattern.
}
\description{
Simulate data from polytomous logit-normit (graded logistic) model
}
\details{
Data from graded logistic models is generated under the following parameterization:
   \deqn{Pr(y_i = k_i| \eta) = \left\{
     \begin{array}{ll}
     1-\Psi (\alpha_{i,k} + \beta_i \eta) & \mbox{if  } k_i = 0\\
     \Psi (\alpha_{i,k} + \beta_i \eta) - \Psi (\alpha_{i,k+1} + \beta_i \eta) & \mbox{if  } 0 < k_i < m-1\\
     \Psi (\alpha_{i,k+1} + \beta_i \eta) & \mbox{if  } k_i = m-1
     \end{array} \right. }{
       Pr(y_i = k_i| \eta) = {
         1-\Psi (\alpha_i,k + \beta_i*\eta)  if k_i = 0, 
         \Psi (\alpha_i,k + \beta_i*\eta) - \Psi (\alpha_i,k+1 + \beta_i*\eta)  if 0 < k_i < m-1,  
         \Psi (\alpha_i,k+1 + \beta_i*\eta)  if k_i = m-1}.
     }
   Where the items are \eqn{y_i, i = 1, \dots, n}, and response categories are \eqn{k=0, \dots, m-1}. \eqn{\eta} is the latent trait, \eqn{\Psi} is the logistic distribution function, \eqn{\alpha} is an intercept (cutpoint) parameter, and \eqn{\beta} is a slope parameter. When the number of categories for the items is 2, this reduces to the 2PL parameterization:
     \deqn{Pr(y_i = 1| \eta) = \Psi (\alpha_1 + \beta_i \eta)}
}
\examples{
   n<-500;
   ncat<-3;
   nitem<-5
   alphas=c(0,-.5,  .2,-1,  .4,-.6,  .3,-.2,  .5,-.5)
   betas=c(1,1,1,.5,.5)
   
   set.seed(1234567)
   datfr<-simulpln(n,nitem,ncat,alphas,betas)
   nrmleplnout<-nrmlepln(datfr, ncat=ncat, nitem=nitem)
   nrmleplnout
}
\seealso{
\code{\link{nrmlepln}}
   \code{\link{nrmlerasch}}
   \code{\link{nrbcpln}}
}
\author{
Carl F. Falk \email{cffalk@gmail.com}, Harry Joe
}
