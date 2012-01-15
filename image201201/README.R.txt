$ R 

R version 2.11.1 (2010-05-31)
Copyright (C) 2010 The R Foundation for Statistical Computing
ISBN 3-900051-07-0

Rは、自由なソフトウェアであり、「完全に無保証」です。 
一定の条件に従えば、自由にこれを再配布することができます。 
配布条件の詳細に関しては、'license()'あるいは'licence()'と入力してください。 

Rは多くの貢献者による共同プロジェクトです。 
詳しくは'contributors()'と入力してください。 
また、RやRのパッケージを出版物で引用する際の形式については
'citation()'と入力してください。 

'demo()'と入力すればデモをみることができます。 
'help()'とすればオンラインヘルプが出ます。 
'help.start()'でHTMLブラウザによるヘルプがみられます。 
'q()'と入力すればRを終了します。 


> enquete <- read.csv('enquete.csv')
> summary(enquete)
 X2eca2010年のDebianを振り返って.2011年を企画する X2ecaCACertの準備に何が必要か
 Min.   : 3.00                                    Min.   : 4.0                 
 1st Qu.: 3.75                                    1st Qu.: 4.0                 
 Median : 4.00                                    Median : 5.0                 
 Mean   : 4.00                                    Mean   : 4.6                 
 3rd Qu.: 4.25                                    3rd Qu.: 5.0                 
 Max.   : 5.00                                    Max.   : 5.0                 
 NA's   :17.00                                    NA's   :16.0                 
 X2ecaDebian.Miniconf.企画 X2eca事前課題紹介 X2eca俺のlibsaneが火をふくぜ
 Min.   : 1.000            Min.   : 3.0      Min.   : 4.000              
 1st Qu.: 1.250            1st Qu.: 3.0      1st Qu.: 4.500              
 Median : 2.500            Median : 3.5      Median : 5.000              
 Mean   : 2.333            Mean   : 3.5      Mean   : 4.667              
 3rd Qu.: 3.000            3rd Qu.: 4.0      3rd Qu.: 5.000              
 Max.   : 4.000            Max.   : 4.0      Max.   : 5.000              
 NA's   :15.000            NA's   :17.0      NA's   :18.000              
 X5dffDebconf11レポート X5dffDebianパッケージのビルド方法  X5dffクイズ
 Min.   : 4             Min.   : 5                        Min.   : 4  
 1st Qu.: 4             1st Qu.: 5                        1st Qu.: 4  
 Median : 4             Median : 5                        Median : 4  
 Mean   : 4             Mean   : 5                        Mean   : 4  
 3rd Qu.: 4             3rd Qu.: 5                        3rd Qu.: 4  
 Max.   : 4             Max.   : 5                        Max.   : 4  
 NA's   :19             NA's   :19                        NA's   :19  
 X5dffスポンサーアップロード入門 X5dff事前課題紹介
 Min.   : 4.00                   Min.   : 4       
 1st Qu.: 4.25                   1st Qu.: 4       
 Median : 4.50                   Median : 4       
 Mean   : 4.50                   Mean   : 4       
 3rd Qu.: 4.75                   3rd Qu.: 4       
 Max.   : 5.00                   Max.   : 4       
 NA's   :19.00                   NA's   :19       
 X8b79Debian.JP.定例会議処理系にXSLTを使ってみた
 Min.   : 4                                     
 1st Qu.: 4                                     
 Median : 4                                     
 Mean   : 4                                     
 3rd Qu.: 4                                     
 Max.   : 4                                     
 NA's   :13                                     
 X8b79Debian.で.sphinx.と.doxygen.を使う  X8b79クイズ     X8b79事前課題紹介
 Min.   : 2.000                          Min.   : 3.000   Min.   : 3.0     
 1st Qu.: 4.000                          1st Qu.: 3.250   1st Qu.: 3.0     
 Median : 4.000                          Median : 4.000   Median : 3.5     
 Mean   : 4.111                          Mean   : 3.667   Mean   : 3.5     
 3rd Qu.: 5.000                          3rd Qu.: 4.000   3rd Qu.: 4.0     
 Max.   : 5.000                          Max.   : 4.000   Max.   : 4.0     
 NA's   :12.000                          NA's   :15.000   NA's   :13.0     
 X8b79最近のイベント紹介 b7942011年の振り返り b794DWN.trivia.quiz
 Min.   : 3.000          Min.   : 3.000       Min.   : 3.0       
 1st Qu.: 3.000          1st Qu.: 3.250       1st Qu.: 3.0       
 Median : 4.000          Median : 4.000       Median : 3.0       
 Mean   : 3.571          Mean   : 3.833       Mean   : 3.4       
 3rd Qu.: 4.000          3rd Qu.: 4.000       3rd Qu.: 4.0       
 Max.   : 4.000          Max.   : 5.000       Max.   : 4.0       
 NA's   :14.000          NA's   :15.000       NA's   :16.0       
 b794quiltでportingしてみた b794事前課題発表 b794月刊Debhelper第2回
 Min.   : 4.000             Min.   : 3.000   Min.   : 3.00         
 1st Qu.: 4.000             1st Qu.: 3.000   1st Qu.: 3.75         
 Median : 4.000             Median : 3.000   Median : 4.00         
 Mean   : 4.333             Mean   : 3.333   Mean   : 4.00         
 3rd Qu.: 4.750             3rd Qu.: 3.750   3rd Qu.: 4.25         
 Max.   : 5.000             Max.   : 4.000   Max.   : 5.00         
 NA's   :15.000             NA's   :15.000   NA's   :17.00         
 b8afBtrFSを使ってみる b8afCEPHを使ってみる b8afExt4を使ってみる
 Mode:logical          Mode:logical         Mode:logical        
 NA's:21               NA's:21              NA's:21             
                                                                
                                                                
                                                                
                                                                
                                                                
 b8afMiniDebconf計画 b8afNILFSを使ってみる b8af事前課題紹介 dd42DPN.trivia.quiz
 Mode:logical        Mode:logical          Mode:logical     Min.   : 4.000     
 NA's:21             NA's:21               NA's:21          1st Qu.: 4.000     
                                                            Median : 4.000     
                                                            Mean   : 4.333     
                                                            3rd Qu.: 4.500     
                                                            Max.   : 5.000     
                                                            NA's   :18.000     
 dd42Debian.で快適な.LaTeX.作業環境 dd42Debianとは何なのか.
 Min.   : 3.00                      Min.   : 4.0           
 1st Qu.: 3.75                      1st Qu.: 4.0           
 Median : 4.50                      Median : 4.5           
 Mean   : 4.25                      Mean   : 4.5           
 3rd Qu.: 5.00                      3rd Qu.: 5.0           
 Max.   : 5.00                      Max.   : 5.0           
 NA's   :17.00                      NA's   :17.0           
 dd42HaskellとDebianの辛くて甘い関係 dd42レポートの自動生成 dd42事前課題紹介
 Min.   : 3.0                        Min.   : 3.00          Min.   : 4.000  
 1st Qu.: 3.0                        1st Qu.: 3.75          1st Qu.: 4.000  
 Median : 3.5                        Median : 4.50          Median : 4.000  
 Mean   : 3.5                        Mean   : 4.25          Mean   : 4.333  
 3rd Qu.: 4.0                        3rd Qu.: 5.00          3rd Qu.: 4.500  
 Max.   : 4.0                        Max.   : 5.00          Max.   : 5.000  
 NA's   :17.0                        NA's   :17.00          NA's   :18.000  
 dd42月刊.Debhelper f456CACert.Assure...GPG.keysigning
 Min.   : 5         Min.   : 3.00                     
 1st Qu.: 5         1st Qu.: 3.75                     
 Median : 5         Median : 4.00                     
 Mean   : 5         Mean   : 3.75                     
 3rd Qu.: 5         3rd Qu.: 4.00                     
 Max.   : 5         Max.   : 4.00                     
 NA's   :18         NA's   :13.00                     
 f456Debian勉強会アンケートシステム   f456Kinect     f456事前課題紹介
 Min.   : 4                         Min.   : 4.000   Min.   : 3.000  
 1st Qu.: 4                         1st Qu.: 5.000   1st Qu.: 3.250  
 Median : 4                         Median : 5.000   Median : 4.000  
 Mean   : 4                         Mean   : 4.875   Mean   : 3.667  
 3rd Qu.: 4                         3rd Qu.: 5.000   3rd Qu.: 4.000  
 Max.   : 4                         Max.   : 5.000   Max.   : 4.000  
 NA's   :13                         NA's   :13.000   NA's   :15.000  

> summary(t(enquete))
       V1             V2               V3               V4               V5    
 Min.   : 4.0   Min.   : 3.000   Min.   : 4.000   Min.   : 4.000   Min.   : 3  
 1st Qu.: 4.0   1st Qu.: 3.000   1st Qu.: 5.000   1st Qu.: 4.000   1st Qu.: 4  
 Median : 4.0   Median : 4.000   Median : 5.000   Median : 4.000   Median : 4  
 Mean   : 4.4   Mean   : 3.667   Mean   : 4.857   Mean   : 4.333   Mean   : 4  
 3rd Qu.: 5.0   3rd Qu.: 4.000   3rd Qu.: 5.000   3rd Qu.: 4.500   3rd Qu.: 4  
 Max.   : 5.0   Max.   : 5.000   Max.   : 5.000   Max.   : 5.000   Max.   : 5  
 NA's   :32.0   NA's   :28.000   NA's   :30.000   NA's   :34.000   NA's   :32  
       V6               V7               V8               V9        
 Min.   : 3.000   Min.   : 4.000   Min.   : 3.000   Min.   : 4.000  
 1st Qu.: 3.000   1st Qu.: 4.000   1st Qu.: 3.500   1st Qu.: 4.000  
 Median : 4.000   Median : 4.000   Median : 4.000   Median : 4.000  
 Mean   : 3.857   Mean   : 4.333   Mean   : 3.895   Mean   : 4.444  
 3rd Qu.: 4.500   3rd Qu.: 4.500   3rd Qu.: 4.000   3rd Qu.: 5.000  
 Max.   : 5.000   Max.   : 5.000   Max.   : 5.000   Max.   : 5.000  
 NA's   :30.000   NA's   :34.000   NA's   :18.000   NA's   :28.000  
      V10            V11          V12             V13          V14       
 Min.   : 3.0   Min.   : 3   Min.   : 4.00   Min.   : 4   Min.   : 4.00  
 1st Qu.: 3.0   1st Qu.: 4   1st Qu.: 4.00   1st Qu.: 4   1st Qu.: 4.25  
 Median : 3.5   Median : 4   Median : 4.00   Median : 4   Median : 4.50  
 Mean   : 3.5   Mean   : 4   Mean   : 4.25   Mean   : 4   Mean   : 4.50  
 3rd Qu.: 4.0   3rd Qu.: 4   3rd Qu.: 4.25   3rd Qu.: 4   3rd Qu.: 4.75  
 Max.   : 4.0   Max.   : 5   Max.   : 5.00   Max.   : 4   Max.   : 5.00  
 NA's   :33.0   NA's   :32   NA's   :33.00   NA's   :31   NA's   :35.00  
      V15              V16          V17              V18            V19       
 Min.   : 3.000   Min.   : 4   Min.   : 2.000   Min.   : 2.0   Min.   : 3.00  
 1st Qu.: 3.000   1st Qu.: 4   1st Qu.: 3.250   1st Qu.: 3.0   1st Qu.: 3.75  
 Median : 4.000   Median : 4   Median : 4.000   Median : 3.0   Median : 4.00  
 Mean   : 3.875   Mean   : 4   Mean   : 3.889   Mean   : 3.6   Mean   : 4.00  
 3rd Qu.: 4.250   3rd Qu.: 4   3rd Qu.: 4.000   3rd Qu.: 5.0   3rd Qu.: 4.25  
 Max.   : 5.000   Max.   : 4   Max.   : 5.000   Max.   : 5.0   Max.   : 5.00  
 NA's   :29.000   NA's   :36   NA's   :19.000   NA's   :32.0   NA's   :33.00  
      V20              V21      
 Min.   : 1.000   Min.   : 1.0  
 1st Qu.: 4.000   1st Qu.: 3.0  
 Median : 4.000   Median : 3.0  
 Mean   : 3.833   Mean   : 3.2  
 3rd Qu.: 4.000   3rd Qu.: 4.0  
 Max.   : 5.000   Max.   : 4.0  
 NA's   :19.000   NA's   :27.0  
> 
> scaled <- t(scale(t(enquete), apply(t(enquete), 2, mean, na.rm=TRUE), apply(t(enquete), 2, sd, na.rm=TRUE)))
> summary(scaled)
 X2eca2010年のDebianを振り返って.2011年を企画する X2ecaCACertの準備に何が必要か
 Min.   :-0.4472                                  Min.   : 0.0000              
 1st Qu.:-0.1118                                  1st Qu.: 0.1944              
 Median : 0.0749                                  Median : 0.7071              
 Mean   : 0.2658                                  Mean   : 0.6586              
 3rd Qu.: 0.4525                                  3rd Qu.: 1.0435              
 Max.   : 1.3606                                  Max.   : 1.3481              
 NA's   :17.0000                                  NA's   :16.0000              
 X2ecaDebian.Miniconf.企画 X2eca事前課題紹介  X2eca俺のlibsaneが火をふくぜ
 Min.   :-3.3042           Min.   :-1.04850   Min.   : 0.1944             
 1st Qu.:-2.1491           1st Qu.:-0.59754   1st Qu.: 0.6189             
 Median :-1.3034           Median :-0.22361   Median : 1.0435             
 Mean   :-1.6768           Mean   :-0.32534   Mean   : 0.8840             
 3rd Qu.:-1.0845           3rd Qu.: 0.04859   3rd Qu.: 1.2289             
 Max.   :-0.7071           Max.   : 0.19437   Max.   : 1.4142             
 NA's   :15.0000           NA's   :17.00000   NA's   :18.0000             
 X5dffDebconf11レポート X5dffDebianパッケージのビルド方法  X5dffクイズ     
 Min.   :-0.8433        Min.   : 1.054                    Min.   :-0.8433  
 1st Qu.:-0.5925        1st Qu.: 1.211                    1st Qu.:-0.5925  
 Median :-0.3416        Median : 1.367                    Median :-0.3416  
 Mean   :-0.3416        Mean   : 1.367                    Mean   :-0.3416  
 3rd Qu.:-0.0908        3rd Qu.: 1.524                    3rd Qu.:-0.0908  
 Max.   : 0.1600        Max.   : 1.680                    Max.   : 0.1600  
 NA's   :19.0000        NA's   :19.000                    NA's   :19.0000  
 X5dffスポンサーアップロード入門 X5dff事前課題紹介
 Min.   : 0.1600                 Min.   :-0.8433  
 1st Qu.: 0.3835                 1st Qu.:-0.5925  
 Median : 0.6071                 Median :-0.3416  
 Mean   : 0.6071                 Mean   :-0.3416  
 3rd Qu.: 0.8306                 3rd Qu.:-0.0908  
 Max.   : 1.0541                 Max.   : 0.1600  
 NA's   :19.0000                 NA's   :19.0000  
 X8b79Debian.JP.定例会議処理系にXSLTを使ってみた
 Min.   :-0.5774                                
 1st Qu.: 0.1001                                
 Median : 0.1772                                
 Mean   : 0.2648                                
 3rd Qu.: 0.5701                                
 Max.   : 0.8706                                
 NA's   :13.0000                                
 X8b79Debian.で.sphinx.と.doxygen.を使う  X8b79クイズ       X8b79事前課題紹介
 Min.   :-2.2693                         Min.   :-1.36012   Min.   :-1.4142  
 1st Qu.: 0.2991                         1st Qu.:-0.70711   1st Qu.:-1.0471  
 Median : 1.0104                         Median : 0.06675   Median :-0.7217  
 Mean   : 0.5575                         Mean   :-0.18408   Mean   :-0.4953  
 3rd Qu.: 1.3740                         3rd Qu.: 0.17915   3rd Qu.: 0.1487  
 Max.   : 1.6801                         Max.   : 0.87057   Max.   : 0.8706  
 NA's   :13.0000                         NA's   :15.00000   NA's   :13.0000  
 X8b79最近のイベント紹介 b7942011年の振り返り b794DWN.trivia.quiz
 Min.   :-0.9428         Min.   :-1.06792     Min.   :-1.3601    
 1st Qu.:-0.5418         1st Qu.:-0.60213     1st Qu.:-1.0679    
 Median : 0.0000         Median :-0.02881     Median :-0.9718    
 Mean   :-0.2198         Mean   :-0.10123     Mean   :-0.9947    
 3rd Qu.: 0.1468         3rd Qu.: 0.18578     3rd Qu.:-0.8433    
 Max.   : 0.1944         Max.   : 1.05409     Max.   :-0.7303    
 NA's   :14.0000         NA's   :15.00000     NA's   :16.0000    
 b794quiltでportingしてみた b794事前課題発表  b794月刊Debhelper第2回
 Min.   : 0.1335            Min.   :-1.3601   Min.   :-0.21764      
 1st Qu.: 0.1686            1st Qu.:-1.0439   1st Qu.: 0.04571      
 Median : 0.5325            Median :-0.9075   Median : 0.14675      
 Mean   : 0.5847            Mean   :-0.8652   Mean   : 0.29283      
 3rd Qu.: 1.0082            3rd Qu.:-0.7585   3rd Qu.: 0.39387      
 Max.   : 1.0954            Max.   :-0.2176   Max.   : 1.09545      
 NA's   :15.0000            NA's   :15.0000   NA's   :17.00000      
 b8afBtrFSを使ってみる b8afCEPHを使ってみる b8afExt4を使ってみる
 Min.   : NA           Min.   : NA          Min.   : NA         
 1st Qu.: NA           1st Qu.: NA          1st Qu.: NA         
 Median : NA           Median : NA          Median : NA         
 Mean   :NaN           Mean   :NaN          Mean   :NaN         
 3rd Qu.: NA           3rd Qu.: NA          3rd Qu.: NA         
 Max.   : NA           Max.   : NA          Max.   : NA         
 NA's   : 21           NA's   : 21          NA's   : 21         
 b8afMiniDebconf計画 b8afNILFSを使ってみる b8af事前課題紹介 dd42DPN.trivia.quiz
 Min.   : NA         Min.   : NA           Min.   : NA      Min.   : 0.1588    
 1st Qu.: NA         1st Qu.: NA           1st Qu.: NA      1st Qu.: 0.2136    
 Median : NA         Median : NA           Median : NA      Median : 0.2684    
 Mean   :NaN         Mean   :NaN           Mean   :NaN      Mean   : 0.2684    
 3rd Qu.: NA         3rd Qu.: NA           3rd Qu.: NA      3rd Qu.: 0.3232    
 Max.   : NA         Max.   : NA           Max.   : NA      Max.   : 0.3780    
 NA's   : 21         NA's   : 21           NA's   : 21      NA's   :19.0000    
 dd42Debian.で快適な.LaTeX.作業環境 dd42Debianとは何なのか.
 Min.   :-0.9527                    Min.   : 0.1335        
 1st Qu.:-0.2873                    1st Qu.: 0.2557        
 Median : 0.3780                    Median : 0.3780        
 Mean   : 0.2534                    Mean   : 0.5939        
 3rd Qu.: 0.8564                    3rd Qu.: 0.8241        
 Max.   : 1.3349                    Max.   : 1.2702        
 NA's   :18.0000                    NA's   :18.0000        
 dd42HaskellとDebianの辛くて甘い関係 dd42レポートの自動生成 dd42事前課題紹介 
 Min.   :-2.2678                     Min.   :-0.9527        Min.   : 0.1588  
 1st Qu.:-1.6679                     1st Qu.:-0.2873        1st Qu.: 0.2136  
 Median :-1.0679                     Median : 0.3780        Median : 0.2684  
 Mean   :-1.4295                     Mean   : 0.2534        Mean   : 0.2684  
 3rd Qu.:-1.0103                     3rd Qu.: 0.8564        3rd Qu.: 0.3232  
 Max.   :-0.9527                     Max.   : 1.3349        Max.   : 0.3780  
 NA's   :18.0000                     NA's   :18.0000        NA's   :19.0000  
 dd42月刊.Debhelper f456CACert.Assure...GPG.keysigning
 Min.   : 0.3780    Min.   :-1.3601                   
 1st Qu.: 0.8241    1st Qu.:-0.7392                   
 Median : 1.2702    Median :-0.1833                   
 Mean   : 0.9944    Mean   :-0.3391                   
 3rd Qu.: 1.3026    3rd Qu.: 0.1609                   
 Max.   : 1.3349    Max.   : 0.4714                   
 NA's   :18.0000    NA's   :13.0000                   
 f456Debian勉強会アンケートシステム   f456Kinect      f456事前課題紹介 
 Min.   :-0.577350                  Min.   : 0.1944   Min.   :-1.0485  
 1st Qu.:-0.125000                  1st Qu.: 1.2072   1st Qu.:-0.8321  
 Median : 0.141638                  Median : 1.3415   Median :-0.2500  
 Mean   : 0.003964                  Mean   : 1.2903   Mean   :-0.3562  
 3rd Qu.: 0.168602                  3rd Qu.: 1.5450   3rd Qu.: 0.1200  
 Max.   : 0.471405                  Max.   : 1.8856   Max.   : 0.1944  
 NA's   :13.000000                  NA's   :13.0000   NA's   :15.0000  
> apply(scaled, 2, mean, na.rm=TRUE)
x2eca2010年のdebianを振り返って.2011年を企画する 
                                     0.265782005 
                   x2ecacacertの準備に何が必要か 
                                     0.658609157 
                       x2ecadebian.miniconf.企画 
                                    -1.676778473 
                               x2eca事前課題紹介 
                                    -0.325337935 
                    x2eca俺のlibsaneが火をふくぜ 
                                     0.884025672 
                          x5dffdebconf11レポート 
                                    -0.341629909 
               x5dffdebianパッケージのビルド方法 
                                     1.367120953 
                                     x5dffクイズ 
                                    -0.341629909 
                 x5dffスポンサーアップロード入門 
                                     0.607053389 
                               x5dff事前課題紹介 
                                    -0.341629909 
 x8b79debian.jp.定例会議処理系にxsltを使ってみた 
                                     0.264815115 
         x8b79debian.で.sphinx.と.doxygen.を使う 
                                     0.557508487 
                                     x8b79クイズ 
                                    -0.184083818 
                               x8b79事前課題紹介 
                                    -0.495261518 
                         x8b79最近のイベント紹介 
                                    -0.219801080 
                            b7942011年の振り返り 
                                    -0.101231928 
                             b794dwn.trivia.quiz 
                                    -0.994688159 
                      b794quiltでportingしてみた 
                                     0.584663155 
                                b794事前課題発表 
                                    -0.865180612 
                          b794月刊debhelper第2回 
                                     0.292826734 
                           b8afbtrfsを使ってみる 
                                             nan 
                            b8afcephを使ってみる 
                                             nan 
                            b8afext4を使ってみる 
                                             nan 
                             b8afminidebconf計画 
                                             nan 
                           b8afnilfsを使ってみる 
                                             nan 
                                b8af事前課題紹介 
                                             nan 
                             dd42dpn.trivia.quiz 
                                     0.268370655 
              dd42debian.で快適な.latex.作業環境 
                                     0.253402728 
                         dd42debianとは何なのか. 
                                     0.593889881 
             dd42haskellとdebianの辛くて甘い関係 
                                    -1.429457216 
                          dd42レポートの自動生成 
                                     0.253402728 
                                dd42事前課題紹介 
                                     0.268370655 
                              dd42月刊.debhelper 
                                     0.994361302 
              f456cacert.assure...gpg.keysigning 
                                    -0.339146227 
              f456debian勉強会アンケートシステム 
                                     0.003963773 
                                      f456kinect 
                                     1.290319774 
                                f456事前課題紹介 
                                    -0.356155493 
> average_score <- apply(scaled, 2, mean, na.rm=TRUE)
> write.csv(average_score)
"","x"
"X2eca2010年のDebianを振り返って.2011年を企画する",0.265782004752358
"X2ecaCACertの準備に何が必要か",0.658609157051467
"X2ecaDebian.Miniconf.企画",-1.67677847288666
"X2eca事前課題紹介",-0.325337934747546
"X2eca俺のlibsaneが火をふくぜ",0.884025671678169
"X5dffDebconf11レポート",-0.341629909296384
"X5dffDebianパッケージのビルド方法",1.36712095331843
"X5dffクイズ",-0.341629909296384
"X5dffスポンサーアップロード入門",0.607053388754129
"X5dff事前課題紹介",-0.341629909296384
"X8b79Debian.JP.定例会議処理系にXSLTを使ってみた",0.264815114529638
"X8b79Debian.で.sphinx.と.doxygen.を使う",0.557508487151354
"X8b79クイズ",-0.184083818309900
"X8b79事前課題紹介",-0.495261518150820
"X8b79最近のイベント紹介",-0.219801079954323
"b7942011年の振り返り",-0.101231927535827
"b794DWN.trivia.quiz",-0.994688158876128
"b794quiltでportingしてみた",0.584663154875175
"b794事前課題発表",-0.86518061156894
"b794月刊Debhelper第2回",0.292826734383766
"b8afBtrFSを使ってみる",NA
"b8afCEPHを使ってみる",NA
"b8afExt4を使ってみる",NA
"b8afMiniDebconf計画",NA
"b8afNILFSを使ってみる",NA
"b8af事前課題紹介",NA
"dd42DPN.trivia.quiz",0.268370655108359
"dd42Debian.で快適な.LaTeX.作業環境",0.253402728051224
"dd42Debianとは何なのか.",0.593889881369359
"dd42HaskellとDebianの辛くて甘い関係",-1.4294572162706
"dd42レポートの自動生成",0.253402728051224
"dd42事前課題紹介",0.268370655108359
"dd42月刊.Debhelper",0.994361301686173
"f456CACert.Assure...GPG.keysigning",-0.339146226977589
"f456Debian勉強会アンケートシステム",0.00396377308743415
"f456Kinect",1.29031977439283
"f456事前課題紹介",-0.356155493492248
