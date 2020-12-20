これだと、0を0点として評価してしまうな。

> enquete <- read.csv('201012enquete.csv')

> summary(enquete)
  事前課題紹介  X2010年のDebianを振り返って.2011年を企画する
 Min.   :3.00   Min.   :3                                   
 1st Qu.:3.75   1st Qu.:3                                   
 Median :4.00   Median :4                                   
 Mean   :3.75   Mean   :4                                   
 3rd Qu.:4.00   3rd Qu.:5                                   
 Max.   :4.00   Max.   :5                                   
 NA's   :1.00   NA's   :1                                   
 CACertの準備に何が必要か 俺のlibsaneが火をふくぜ Debian.Miniconf.企画
 Min.   :4.000            Min.   :4.000           Min.   :1.000       
 1st Qu.:4.000            1st Qu.:4.500           1st Qu.:2.000       
 Median :5.000            Median :5.000           Median :3.000       
 Mean   :4.556            Mean   :4.714           Mean   :2.778       
 3rd Qu.:5.000            3rd Qu.:5.000           3rd Qu.:4.000       
 Max.   :5.000            Max.   :5.000           Max.   :4.000       
                          NA's   :2.000                               

> quantile(enquete$俺の)
  0%  25%  50%  75% 100% 
  0    4    5    5    5 
> quantile(enquete$Debian)
  0%  25%  50%  75% 100% 
   1    2    3    4    4 

> cor(enquete)
                                             事前課題紹介
事前課題紹介                                    1.0000000
X2010年のDebianを振り返って.2011年を企画する    0.9112932
CACertの準備に何が必要か                       -0.2988072
俺のlibsaneが火をふくぜ                         0.7572402
Debian.Miniconf.企画                           -0.3406926
                                             X2010年のDebianを振り返って.2011年を企画する
事前課題紹介                                                                    0.9112932
X2010年のDebianを振り返って.2011年を企画する                                    1.0000000
CACertの準備に何が必要か                                                       -0.4143710
俺のlibsaneが火をふくぜ                                                         0.6547702
Debian.Miniconf.企画                                                           -0.4506499
                                             CACertの準備に何が必要か
事前課題紹介                                               -0.2988072
X2010年のDebianを振り返って.2011年を企画する               -0.4143710
CACertの準備に何が必要か                                    1.0000000
俺のlibsaneが火をふくぜ                                     0.1863390
Debian.Miniconf.企画                                        0.6139406
                                             俺のlibsaneが火をふくぜ
事前課題紹介                                               0.7572402
X2010年のDebianを振り返って.2011年を企画する               0.6547702
CACertの準備に何が必要か                                   0.1863390
俺のlibsaneが火をふくぜ                                    1.0000000
Debian.Miniconf.企画                                      -0.1797731
                                             Debian.Miniconf.企画
事前課題紹介                                           -0.3406926
X2010年のDebianを振り返って.2011年を企画する           -0.4506499
CACertの準備に何が必要か                                0.6139406
俺のlibsaneが火をふくぜ                                -0.1797731
Debian.Miniconf.企画                                    1.0000000


> cor(enquete$俺の, enquete$X)
[1] 0.6547702
> cor(enquete$俺の, enquete$事前)
[1] 0.7572402
> cor(enquete$CAC, enquete$事前)
[1] -0.2988072
> 


> fivenum(enquete)
[1] 0 3 4 5 5
> fivenum(enquete$事前)
[1] 0 3 4 4 4
> fivenum(enquete$X)
[1] 0 3 4 5 5
> fivenum(enquete$CACert)
[1] 4 4 5 5 5
> fivenum(enquete$俺の)
[1] 0 4 5 5 5
> fivenum(enquete$Debian)
[1] 1 2 3 4 4


> plot(enquete$CACert, enquete$俺の, xlim=c(1,5), ylim=c(1,5))
> png('oreno-cacert.png')
> plot(enquete$CACert, enquete$俺の, xlim=c(1,5), ylim=c(1,5))
> dev.off()
X11cairo 
       2 


> cor(enquete$CAC, enquete$俺の, use="pairwise.complete.obs")
[1] 0.7302967
> cor(enquete$CAC, enquete$俺の, use="complete.obs")
[1] 0.7302967
> cor(enquete$俺の, enquete$事前, use="complete.obs")
[1] -0.2581989
> cor(enquete$CAC, enquete$事前, use="complete.obs")
[1] 0
> cor(enquete$CAC, enquete$事前, use="pairwise.complete.obs")
[1] 0
> cor(enquete$俺の, enquete$事前, use="pairwise.complete.obs")
[1] -0.2581989
> 
