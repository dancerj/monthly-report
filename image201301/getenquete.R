#!/usr/bin/Rscript
#
# Script to process the enquete csv file.
#
# use "source('getenquete.R')" to use this script interactively.
enquete <- read.csv('enquete.csv')

compute_enquete_stats <- function(enquete) {
  # get number of non-na reponse from enquete. Useful for understanding the statistical significance along with SD.
  enquete_response <- colSums(!is.na(enquete))

  # get average numbers for event.
  raw_average_score <- apply(enquete, 2, mean, na.rm=TRUE)

  # get standard deviation for event score.
  raw_standard_deviation <- apply(enquete, 2, sd, na.rm=TRUE)

  # scale scores to normal distribution for each user, so that each user's pattern only contributes as much.
  scaled <- t(scale(t(enquete), apply(t(enquete), 2, mean, na.rm=TRUE), apply(t(enquete), 2, sd, na.rm=TRUE)))
  scaled_average_score <- apply(scaled, 2, mean, na.rm=TRUE)

  # create a dataframe to join them for easy consumption.

  enquete_frame <- data.frame(
	      raw_average_score = raw_average_score, 
	      raw_standard_deviation = raw_standard_deviation, 
	      scaled_average_score = scaled_average_score, 
	      enquete_response = enquete_response)

  enquete_frame
}


dump_for_session <- function(name) {
  # Dump information for a session.
  # 'name' should be the session key.
  write.csv(array(c(
    "raw average score", 
    "raw standard deviation",
    "enquete response",
    raw_average_score[name],
    raw_standard_deviation[name],
    enquete_response[name]), c(3,2)))
}

enquete_frame <- compute_enquete_stats(enquete)
write.csv(enquete_frame)

high_confidence_enquete <- subset(enquete, rowSums(!is.na(enquete)) > 5)
high_confidence_enquete_frame <- compute_enquete_stats(high_confidence_enquete)
write.csv(high_confidence_enquete_frame)
