FROM gcr.io/f17w201rdada/portfolio:fa17
MAINTAINER "Brooks Ambrose" brooksambrose@berkeley.edu

COPY . /home/rstudio/

EXPOSE 80 443 2015

USER ${NB_USER}
