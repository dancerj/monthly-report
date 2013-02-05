#!/usr/bin/Rscript
# source('commitstat.R')
timestamp <-
  strtoi(system2(
           'git',
           args = c('log', "--pretty='%ct'", '../utils/gae'),
           stdout = TRUE))
readabletime <-
  as.POSIXct(strtoi(timestamp), 'GMT', origin='1970-1-1')
# plot each quarter's commit logs.
postscript('util-gae-commits.eps', horizontal = FALSE)
hist(readabletime,
     breaks = 'quarter',
     sub = 'histogram of git commits on util/gae',
     xlab = 'year-month',
     format = '%Y-%m',
     freq = TRUE)
dev.off()
