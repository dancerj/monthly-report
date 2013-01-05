# graph plotting code.

source('getenquete.R')

# plot a few diagrams.
postscript('scaled_average_score_density.eps')
plot(density(enquete_frame$scaled_average_score, na.rm=TRUE), 
  xlab='scaled average score',
  ylab='density')
dev.off()

postscript('raw_average_score_density.eps')
plot(density(enquete_frame$raw_average_score, na.rm=TRUE), 
  xlab='raw average score',
  ylab='density')
dev.off()

postscript('raw_standard_deviation_density.eps')
plot(density(enquete_frame$raw_standard_deviation, na.rm=TRUE),
  xlab='standard deviation of score per event',
  ylab='density')
dev.off()

postscript('enquete_boxplot.eps')
boxplot(enquete)
dev.off()

postscript('raw_average_score_growth.eps')
plot(enquete_frame$raw_average_score)
dev.off()
 
