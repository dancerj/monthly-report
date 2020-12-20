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

dump_for_session <- function(df, name) {
  # Dump information for a session.
  # 'name' should be the session key.
  # 
  # e.g. dump_for_session(enquete_frame, "第95回東京エリアDebian勉強会.2012年12月勉強会.著作権法改正.3f15")
  write.csv(array(c("raw average score", 
                    "raw standard deviation",
                    "enquete response",
                    df$raw_average_score[name],
                    df$raw_standard_deviation[name],
                    df$enquete_response[name]), c(3,2)))
}

enquete_frame <- compute_enquete_stats(enquete)
write.csv(enquete_frame)

high_confidence_enquete <- subset(enquete, rowSums(!is.na(enquete)) > 5)
high_confidence_enquete_frame <- compute_enquete_stats(high_confidence_enquete)
write.csv(high_confidence_enquete_frame)

# limit to those with enquete results that are answered by experienced enquete answers more than 3 times.
high_confidence_enquete_remove_na <- t(subset(t(high_confidence_enquete), colSums(!is.na(high_confidence_enquete)) > 3))

vector_affinity <- function (a, b) {
  # compute the affinity of two vectors. If they contain NA's, they are ignored.
  # affinity is as in 'cos t'.
  stopifnot(is.vector(a), 
            is.vector(b), 
            length(a) == length(b))

  sum((a * b), na.rm=TRUE) / (
                 sqrt(sum(a * a, na.rm=TRUE)) *
                 sqrt(sum(b * b, na.rm=TRUE)))
}


# Obtain the correlation between different sessions.
write.csv(cor(enquete, use="pairwise"))
# Obtain the correlation between different users.
write.csv(cor(t(enquete), use="pairwise"))
