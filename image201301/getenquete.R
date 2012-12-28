#!/usr/bin/Rscript
#
# Script to process the enquete csv file.
#
# use "source('getenquete.R')" to use this script interactively.
enquete <- read.csv('enquete.csv')
# scale scores to normal distribution for each user.
scaled <- t(scale(t(enquete), apply(t(enquete), 2, mean, na.rm=TRUE), apply(t(enquete), 2, sd, na.rm=TRUE)))
# summary(scaled)
average_score <- apply(scaled, 2, mean, na.rm=TRUE)
# summary(average_score)
# get number of non-na reponse
enquete_response <- colSums(!is.na(enquete))
# create a dataframe to join them.
enquete_frame <- data.frame(average_score = average_score, enquete_response = enquete_response)
write.csv(enquete_frame)
