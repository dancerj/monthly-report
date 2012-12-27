http://debianmeeting.appspot.com/enquete/showallresults の出力を処理する

$ R

R version 2.15.1 (2012-06-22) -- "Roasted Marshmallows"
Copyright (C) 2012 The R Foundation for Statistical Computing
ISBN 3-900051-07-0
Platform: x86_64-pc-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> enquete <- read.csv('enquete.csv')
> summary(enquete)
 X2eca2010年のDebianを振り返って.2011年を企画する X2ecaCACertの準備に何が必要か
 Min.   :3.00                                     Min.   :4.0                  
 1st Qu.:3.75                                     1st Qu.:4.0                  
 Median :4.00                                     Median :5.0                  
 Mean   :4.00                                     Mean   :4.6                  
 3rd Qu.:4.25                                     3rd Qu.:5.0                  
 Max.   :5.00                                     Max.   :5.0                  
 NA's   :23                                       NA's   :22                   
 X2ecaDebian.Miniconf.企画 X2eca事前課題紹介 X2eca俺のlibsaneが火をふくぜ
 Min.   :1.000             Min.   :3.0       Min.   :4.000               
 1st Qu.:1.250             1st Qu.:3.0       1st Qu.:4.500               
 Median :2.500             Median :3.5       Median :5.000               
 Mean   :2.333             Mean   :3.5       Mean   :4.667               
 3rd Qu.:3.000             3rd Qu.:4.0       3rd Qu.:5.000               
 Max.   :4.000             Max.   :4.0       Max.   :5.000               
 NA's   :21                NA's   :23        NA's   :24                  
 X3f152012年のDebian勉強会をふりかえって X3f15im.config X3f15事前課題紹介
 Min.   :3.00                            Min.   :4.00   Min.   :4.00     
 1st Qu.:3.00                            1st Qu.:4.00   1st Qu.:4.00     
 Median :3.50                            Median :4.00   Median :4.00     
 Mean   :3.75                            Mean   :4.25   Mean   :4.25     
 3rd Qu.:4.25                            3rd Qu.:4.25   3rd Qu.:4.25     
 Max.   :5.00                            Max.   :5.00   Max.   :5.00     
 NA's   :23                              NA's   :23     NA's   :23       
 X3f15著作権法改正 X4d5dMacBookAirにDebianインストール
 Min.   :4.00      Min.   :4                          
 1st Qu.:4.75      1st Qu.:4                          
 Median :5.00      Median :4                          
 Mean   :4.75      Mean   :4                          
 3rd Qu.:5.00      3rd Qu.:4                          
 Max.   :5.00      Max.   :4                          
 NA's   :23        NA's   :25                         
 X4d5d事前課題紹介.Debconfビデオ感想. X5dffDebconf11レポート
 Min.   :3                            Min.   :4             
 1st Qu.:3                            1st Qu.:4             
 Median :3                            Median :4             
 Mean   :3                            Mean   :4             
 3rd Qu.:3                            3rd Qu.:4             
 Max.   :3                            Max.   :4             
 NA's   :25                           NA's   :25            
 X5dffDebianパッケージのビルド方法  X5dffクイズ X5dffスポンサーアップロード入門
 Min.   :5                         Min.   :4    Min.   :4.00                   
 1st Qu.:5                         1st Qu.:4    1st Qu.:4.25                   
 Median :5                         Median :4    Median :4.50                   
 Mean   :5                         Mean   :4    Mean   :4.50                   
 3rd Qu.:5                         3rd Qu.:4    3rd Qu.:4.75                   
 Max.   :5                         Max.   :4    Max.   :5.00                   
 NA's   :25                        NA's   :25   NA's   :25                     
 X5dff事前課題紹介 X7efeDebian.Weekly.news.quiz X7efeDebian.での.node.js.入門
 Min.   :4         Min.   :3.00                 Min.   :4.0                  
 1st Qu.:4         1st Qu.:3.75                 1st Qu.:4.0                  
 Median :4         Median :4.00                 Median :4.0                  
 Mean   :4         Mean   :4.00                 Mean   :4.4                  
 3rd Qu.:4         3rd Qu.:4.25                 3rd Qu.:5.0                  
 Max.   :4         Max.   :5.00                 Max.   :5.0                  
 NA's   :25        NA's   :23                   NA's   :22                   
 X7efeandroidでdebian X7efe月刊Debhelper
 Min.   :4.0          Min.   :3.0       
 1st Qu.:4.0          1st Qu.:3.0       
 Median :4.0          Median :4.0       
 Mean   :4.4          Mean   :3.8       
 3rd Qu.:5.0          3rd Qu.:4.0       
 Max.   :5.0          Max.   :5.0       
 NA's   :22           NA's   :22        
 X8b79Debian.JP.定例会議処理系にXSLTを使ってみた
 Min.   :4                                      
 1st Qu.:4                                      
 Median :4                                      
 Mean   :4                                      
 3rd Qu.:4                                      
 Max.   :4                                      
 NA's   :19                                     
 X8b79Debian.で.sphinx.と.doxygen.を使う  X8b79クイズ    X8b79事前課題紹介
 Min.   :2.000                           Min.   :3.000   Min.   :3.0      
 1st Qu.:4.000                           1st Qu.:3.250   1st Qu.:3.0      
 Median :4.000                           Median :4.000   Median :3.5      
 Mean   :4.111                           Mean   :3.667   Mean   :3.5      
 3rd Qu.:5.000                           3rd Qu.:4.000   3rd Qu.:4.0      
 Max.   :5.000                           Max.   :4.000   Max.   :4.0      
 NA's   :18                              NA's   :21      NA's   :19       
 X8b79最近のイベント紹介 X8ef7Debian.Quiz X8ef7bluetooth.tethering
 Min.   :3.000           Min.   :3.00     Min.   :4.00            
 1st Qu.:3.000           1st Qu.:3.00     1st Qu.:4.00            
 Median :4.000           Median :3.00     Median :4.00            
 Mean   :3.571           Mean   :3.25     Mean   :4.25            
 3rd Qu.:4.000           3rd Qu.:3.25     3rd Qu.:4.25            
 Max.   :4.000           Max.   :4.00     Max.   :5.00            
 NA's   :20              NA's   :23       NA's   :23              
 X8ef7linux.perf  X8ef7systemd
 Min.   :3.00    Min.   :4.0  
 1st Qu.:3.75    1st Qu.:4.0  
 Median :4.50    Median :4.5  
 Mean   :4.25    Mean   :4.5  
 3rd Qu.:5.00    3rd Qu.:5.0  
 Max.   :5.00    Max.   :5.0  
 NA's   :23      NA's   :23   
 X8ef7事前課題紹介..Debian.で今いまいちサポートされていない機能.いけてない実装について語ってください..
 Min.   :3.00                                                                                         
 1st Qu.:3.00                                                                                         
 Median :3.50                                                                                         
 Mean   :3.75                                                                                         
 3rd Qu.:4.25                                                                                         
 Max.   :5.00                                                                                         
 NA's   :23                                                                                           
 X9146Debian.quiz X9146DebianのHaskellパッケージングについて語る
 Min.   :4        Min.   :4.00                                  
 1st Qu.:4        1st Qu.:4.25                                  
 Median :4        Median :4.50                                  
 Mean   :4        Mean   :4.50                                  
 3rd Qu.:4        3rd Qu.:4.75                                  
 Max.   :4        Max.   :5.00                                  
 NA's   :26       NA's   :25                                    
 X9146x86.input.mtrack X9146レゴでなめこ収穫期 X9146事前課題紹介
 Min.   :4.00          Min.   :4.00            Min.   :4        
 1st Qu.:4.25          1st Qu.:4.25            1st Qu.:4        
 Median :4.50          Median :4.50            Median :4        
 Mean   :4.50          Mean   :4.50            Mean   :4        
 3rd Qu.:4.75          3rd Qu.:4.75            3rd Qu.:4        
 Max.   :5.00          Max.   :5.00            Max.   :4        
 NA's   :25            NA's   :25              NA's   :26       
 X9796Debconf2012報告 X9796DebianでC..11を使う
 Min.   :4.000        Min.   :4.000           
 1st Qu.:4.000        1st Qu.:4.500           
 Median :4.000        Median :5.000           
 Mean   :4.333        Mean   :4.667           
 3rd Qu.:4.500        3rd Qu.:5.000           
 Max.   :5.000        Max.   :5.000           
 NA's   :24           NA's   :24              
 X9796Debianで簡単に貢献できそうなもの X9796事前課題紹介.Debian.19周年に思う.
 Min.   :3.0                           Min.   :4.00                          
 1st Qu.:3.5                           1st Qu.:4.25                          
 Median :4.0                           Median :4.50                          
 Mean   :4.0                           Mean   :4.50                          
 3rd Qu.:4.5                           3rd Qu.:4.75                          
 Max.   :5.0                           Max.   :5.00                          
 NA's   :24                            NA's   :25                            
 X9796月刊.Debhelper.共有ライブラリ編
 Min.   :5                           
 1st Qu.:5                           
 Median :5                           
 Mean   :5                           
 3rd Qu.:5                           
 Max.   :5                           
 NA's   :24                          
 aa7fPython初心者が.Pythonプロフェッショナルプログラミング.を読んでみた
 Min.   :2.000                                                         
 1st Qu.:3.000                                                         
 Median :4.000                                                         
 Mean   :3.333                                                         
 3rd Qu.:4.000                                                         
 Max.   :4.000                                                         
 NA's   :24                                                            
 aa7fcoffeescriptを使ってみた
 Min.   :3.000               
 1st Qu.:3.500               
 Median :4.000               
 Mean   :3.667               
 3rd Qu.:4.000               
 Max.   :4.000               
 NA's   :24                  
 aa7f事前課題紹介.書籍紹介とプログラミング言語紹介. b7942011年の振り返り
 Min.   :4                                          Min.   :3.000       
 1st Qu.:4                                          1st Qu.:3.250       
 Median :4                                          Median :4.000       
 Mean   :4                                          Mean   :3.833       
 3rd Qu.:4                                          3rd Qu.:4.000       
 Max.   :4                                          Max.   :5.000       
 NA's   :24                                         NA's   :21          
 b794DWN.trivia.quiz b794quiltでportingしてみた b794事前課題発表
 Min.   :3.0         Min.   :4.000              Min.   :3.000   
 1st Qu.:3.0         1st Qu.:4.000              1st Qu.:3.000   
 Median :3.0         Median :4.000              Median :3.000   
 Mean   :3.4         Mean   :4.333              Mean   :3.333   
 3rd Qu.:4.0         3rd Qu.:4.750              3rd Qu.:3.750   
 Max.   :4.0         Max.   :5.000              Max.   :4.000   
 NA's   :22          NA's   :21                 NA's   :21      
 b794月刊Debhelper第2回 b8afBtrFSを使ってみる b8afCEPHを使ってみる
 Min.   :3.00           Mode:logical          Mode:logical        
 1st Qu.:3.75           NA's:27               NA's:27             
 Median :4.00                                                     
 Mean   :4.00                                                     
 3rd Qu.:4.25                                                     
 Max.   :5.00                                                     
 NA's   :23                                                       
 b8afExt4を使ってみる b8afMiniDebconf計画 b8afNILFSを使ってみる
 Mode:logical         Mode:logical        Mode:logical         
 NA's:27              NA's:27             NA's:27              
                                                               
                                                               
                                                               
                                                               
                                                               
 b8af事前課題紹介 dd42DPN.trivia.quiz dd42Debian.で快適な.LaTeX.作業環境
 Mode:logical     Min.   :3.00        Min.   :3                         
 NA's:27          1st Qu.:3.75        1st Qu.:3                         
                  Median :4.00        Median :4                         
                  Mean   :4.00        Mean   :4                         
                  3rd Qu.:4.25        3rd Qu.:5                         
                  Max.   :5.00        Max.   :5                         
                  NA's   :23          NA's   :22                        
 dd42Debianとは何なのか. dd42HaskellとDebianの辛くて甘い関係
 Min.   :3.0             Min.   :3.0                        
 1st Qu.:4.0             1st Qu.:3.0                        
 Median :4.0             Median :3.0                        
 Mean   :4.2             Mean   :3.4                        
 3rd Qu.:5.0             3rd Qu.:4.0                        
 Max.   :5.0             Max.   :4.0                        
 NA's   :22              NA's   :22                         
 dd42レポートの自動生成 dd42事前課題紹介 dd42月刊.Debhelper
 Min.   :3              Min.   :3.00     Min.   :3.0       
 1st Qu.:3              1st Qu.:3.75     1st Qu.:4.5       
 Median :4              Median :4.00     Median :5.0       
 Mean   :4              Mean   :4.00     Mean   :4.5       
 3rd Qu.:5              3rd Qu.:4.25     3rd Qu.:5.0       
 Max.   :5              Max.   :5.00     Max.   :5.0       
 NA's   :22             NA's   :23       NA's   :23        
 f447Debianでtwitter連携 f447Debianクイズ f447Debian使えるVPSを使ってみた
 Min.   :4.00            Min.   :3.0      Min.   :3.0                    
 1st Qu.:4.00            1st Qu.:3.0      1st Qu.:3.0                    
 Median :4.00            Median :3.0      Median :3.5                    
 Mean   :4.25            Mean   :3.5      Mean   :3.5                    
 3rd Qu.:4.25            3rd Qu.:3.5      3rd Qu.:4.0                    
 Max.   :5.00            Max.   :5.0      Max.   :4.0                    
 NA's   :23              NA's   :23       NA's   :23                     
 f447Debian勉強会予約システムの脆弱性 f447事前課題紹介.2012年企画
 Min.   :3.0                          Min.   :2.0                
 1st Qu.:3.0                          1st Qu.:2.0                
 Median :3.5                          Median :2.5                
 Mean   :3.5                          Mean   :2.5                
 3rd Qu.:4.0                          3rd Qu.:3.0                
 Max.   :4.0                          Max.   :3.0                
 NA's   :23                           NA's   :23                 
 f447第3回月刊Debhelper.dh_auto_..dh_build f456CACert.Assure...GPG.keysigning
 Min.   :1.00                              Min.   :3.00                      
 1st Qu.:1.75                              1st Qu.:3.75                      
 Median :2.50                              Median :4.00                      
 Mean   :2.50                              Mean   :3.75                      
 3rd Qu.:3.25                              3rd Qu.:4.00                      
 Max.   :4.00                              Max.   :4.00                      
 NA's   :23                                NA's   :19                        
 f456Debian勉強会アンケートシステム   f456Kinect    f456事前課題紹介
 Min.   :4                          Min.   :4.000   Min.   :3.000   
 1st Qu.:4                          1st Qu.:5.000   1st Qu.:3.250   
 Median :4                          Median :5.000   Median :4.000   
 Mean   :4                          Mean   :4.875   Mean   :3.667   
 3rd Qu.:4                          3rd Qu.:5.000   3rd Qu.:4.000   
 Max.   :4                          Max.   :5.000   Max.   :4.000   
 NA's   :19                         NA's   :19      NA's   :21      
> apply(scaled, 2, mean, na.rm=TRUE)
Error in apply(scaled, 2, mean, na.rm = TRUE) : object 'scaled' not found
> scaled <- t(scale(t(enquete), apply(t(enquete), 2, mean, na.rm=TRUE), apply(t(enquete), 2, sd, na.rm=TRUE)))
> apply(scaled, 2, mean, na.rm=TRUE)
                                                     X2eca2010年のDebianを振り返って.2011年を企画する 
                                                                                           0.28593298 
                                                                        X2ecaCACertの準備に何が必要か 
                                                                                           0.76809271 
                                                                            X2ecaDebian.Miniconf.企画 
                                                                                          -1.63102774 
                                                                                    X2eca事前課題紹介 
                                                                                          -0.32884878 
                                                                         X2eca俺のlibsaneが火をふくぜ 
                                                                                           0.92424879 
                                                              X3f152012年のDebian勉強会をふりかえって 
                                                                                          -0.54927948 
                                                                                       X3f15im.config 
                                                                                           0.28613072 
                                                                                    X3f15事前課題紹介 
                                                                                           0.12873554 
                                                                                    X3f15著作権法改正 
                                                                                           1.41211033 
                                                                  X4d5dMacBookAirにDebianインストール 
                                                                                           0.13869254 
                                                                 X4d5d事前課題紹介.Debconfビデオ感想. 
                                                                                          -1.15231473 
                                                                               X5dffDebconf11レポート 
                                                                                          -0.34710142 
                                                                    X5dffDebianパッケージのビルド方法 
                                                                                           1.27240227 
                                                                                          X5dffクイズ 
                                                                                          -0.34710142 
                                                                      X5dffスポンサーアップロード入門 
                                                                                           0.60158188 
                                                                                    X5dff事前課題紹介 
                                                                                          -0.34710142 
                                                                         X7efeDebian.Weekly.news.quiz 
                                                                                          -0.23970345 
                                                                        X7efeDebian.での.node.js.入門 
                                                                                           0.47807763 
                                                                                 X7efeandroidでdebian 
                                                                                           0.47807763 
                                                                                   X7efe月刊Debhelper 
                                                                                          -0.47211433 
                                                      X8b79Debian.JP.定例会議処理系にXSLTを使ってみた 
                                                                                           0.22575021 
                                                              X8b79Debian.で.sphinx.と.doxygen.を使う 
                                                                                           0.43620695 
                                                                                          X8b79クイズ 
                                                                                          -0.20642131 
                                                                                    X8b79事前課題紹介 
                                                                                          -0.49287486 
                                                                              X8b79最近のイベント紹介 
                                                                                          -0.25033059 
                                                                                     X8ef7Debian.Quiz 
                                                                                          -0.69360978 
                                                                             X8ef7bluetooth.tethering 
                                                                                           0.66086014 
                                                                                      X8ef7linux.perf 
                                                                                           0.60775828 
                                                                                         X8ef7systemd 
                                                                                           1.06419375 
X8ef7事前課題紹介..Debian.で今いまいちサポートされていない機能.いけてない実装について語ってください.. 
                                                                                          -0.11084916 
                                                                                     X9146Debian.quiz 
                                                                                                  NaN 
                                                       X9146DebianのHaskellパッケージングについて語る 
                                                                                           0.31622777 
                                                                                X9146x86.input.mtrack 
                                                                                           0.31622777 
                                                                              X9146レゴでなめこ収穫期 
                                                                                           0.31622777 
                                                                                    X9146事前課題紹介 
                                                                                                  NaN 
                                                                                 X9796Debconf2012報告 
                                                                                           0.42172731 
                                                                             X9796DebianでC..11を使う 
                                                                                           0.86894091 
                                                                X9796Debianで簡単に貢献できそうなもの 
                                                                                           0.09192675 
                                                               X9796事前課題紹介.Debian.19周年に思う. 
                                                                                           0.55805537 
                                                                 X9796月刊.Debhelper.共有ライブラリ編 
                                                                                           1.19874146 
                               aa7fPython初心者が.Pythonプロフェッショナルプログラミング.を読んでみた 
                                                                                          -1.13264949 
                                                                         aa7fcoffeescriptを使ってみた 
                                                                                          -0.68543589 
                                                   aa7f事前課題紹介.書籍紹介とプログラミング言語紹介. 
                                                                                          -0.23822229 
                                                                                 b7942011年の振り返り 
                                                                                          -0.24582328 
                                                                                  b794DWN.trivia.quiz 
                                                                                          -1.00181676 
                                                                           b794quiltでportingしてみた 
                                                                                           0.46776712 
                                                                                     b794事前課題発表 
                                                                                          -0.94900903 
                                                                               b794月刊Debhelper第2回 
                                                                                           0.11201852 
                                                                                b8afBtrFSを使ってみる 
                                                                                                  NaN 
                                                                                 b8afCEPHを使ってみる 
                                                                                                  NaN 
                                                                                 b8afExt4を使ってみる 
                                                                                                  NaN 
                                                                                  b8afMiniDebconf計画 
                                                                                                  NaN 
                                                                                b8afNILFSを使ってみる 
                                                                                                  NaN 
                                                                                     b8af事前課題紹介 
                                                                                                  NaN 
                                                                                  dd42DPN.trivia.quiz 
                                                                                           0.05292561 
                                                                   dd42Debian.で快適な.LaTeX.作業環境 
                                                                                           0.13513800 
                                                                              dd42Debianとは何なのか. 
                                                                                           0.36062713 
                                                                  dd42HaskellとDebianの辛くて甘い関係 
                                                                                          -1.31589102 
                                                                               dd42レポートの自動生成 
                                                                                           0.13513800 
                                                                                     dd42事前課題紹介 
                                                                                           0.05292561 
                                                                                   dd42月刊.Debhelper 
                                                                                           1.02655183 
                                                                              f447Debianでtwitter連携 
                                                                                           0.76223326 
                                                                                     f447Debianクイズ 
                                                                                          -0.30232663 
                                                                      f447Debian使えるVPSを使ってみた 
                                                                                          -0.21426685 
                                                                 f447Debian勉強会予約システムの脆弱性 
                                                                                          -0.06555413 
                                                                          f447事前課題紹介.2012年企画 
                                                                                          -1.28940466 
                                                            f447第3回月刊Debhelper.dh_auto_..dh_build 
                                                                                          -1.19902123 
                                                                   f456CACert.Assure...GPG.keysigning 
                                                                                          -0.28001600 
                                                                   f456Debian勉強会アンケートシステム 
                                                                                           0.04078221 
                                                                                           f456Kinect 
                                                                                           1.35485586 
                                                                                     f456事前課題紹介 
                                                                                          -0.36031990 
> summary(t(enquete))
       V1              V2            V3              V4              V5       
 Min.   :4.000   Min.   :4.0   Min.   :4.000   Min.   :3.000   Min.   :3.000  
 1st Qu.:4.000   1st Qu.:5.0   1st Qu.:4.000   1st Qu.:3.000   1st Qu.:3.000  
 Median :5.000   Median :5.0   Median :4.000   Median :4.000   Median :4.000  
 Mean   :4.588   Mean   :4.9   Mean   :4.333   Mean   :3.917   Mean   :3.857  
 3rd Qu.:5.000   3rd Qu.:5.0   3rd Qu.:4.500   3rd Qu.:4.250   3rd Qu.:4.500  
 Max.   :5.000   Max.   :5.0   Max.   :5.000   Max.   :5.000   Max.   :5.000  
 NA's   :54      NA's   :61    NA's   :68      NA's   :59      NA's   :64     
       V6            V7            V8              V9             V10      
 Min.   :4.0   Min.   :3.0   Min.   :1.000   Min.   :1.000   Min.   :3.00  
 1st Qu.:4.0   1st Qu.:3.0   1st Qu.:3.000   1st Qu.:3.000   1st Qu.:3.75  
 Median :4.0   Median :3.5   Median :4.000   Median :4.000   Median :4.00  
 Mean   :4.1   Mean   :3.5   Mean   :3.679   Mean   :3.692   Mean   :4.00  
 3rd Qu.:4.0   3rd Qu.:4.0   3rd Qu.:4.000   3rd Qu.:4.000   3rd Qu.:4.25  
 Max.   :5.0   Max.   :4.0   Max.   :5.000   Max.   :5.000   Max.   :5.00  
 NA's   :61    NA's   :67    NA's   :43      NA's   :45      NA's   :67    
      V11             V12             V13          V14             V15       
 Min.   :3.000   Min.   :3.000   Min.   :4    Min.   :4.000   Min.   :2.000  
 1st Qu.:3.000   1st Qu.:3.000   1st Qu.:4    1st Qu.:4.000   1st Qu.:3.000  
 Median :4.000   Median :3.000   Median :4    Median :4.000   Median :4.000  
 Mean   :3.667   Mean   :3.333   Mean   :4    Mean   :4.333   Mean   :3.889  
 3rd Qu.:4.000   3rd Qu.:3.750   3rd Qu.:4    3rd Qu.:4.500   3rd Qu.:4.000  
 Max.   :5.000   Max.   :4.000   Max.   :4    Max.   :5.000   Max.   :5.000  
 NA's   :62      NA's   :65      NA's   :70   NA's   :68      NA's   :26     
      V16           V17            V18          V19           V20    
 Min.   :2.0   Min.   :2.00   Min.   :3    Min.   :3.0   Min.   :3   
 1st Qu.:3.0   1st Qu.:3.50   1st Qu.:3    1st Qu.:3.0   1st Qu.:4   
 Median :3.0   Median :4.00   Median :3    Median :3.0   Median :4   
 Mean   :3.6   Mean   :3.87   Mean   :3    Mean   :3.4   Mean   :4   
 3rd Qu.:5.0   3rd Qu.:4.00   3rd Qu.:3    3rd Qu.:4.0   3rd Qu.:4   
 Max.   :5.0   Max.   :5.00   Max.   :3    Max.   :4.0   Max.   :5   
 NA's   :66    NA's   :48     NA's   :64   NA's   :66    NA's   :66  
      V21          V22            V23           V24             V25      
 Min.   :4    Min.   :4.00   Min.   :3.0   Min.   :4.000   Min.   :4.00  
 1st Qu.:4    1st Qu.:4.25   1st Qu.:3.0   1st Qu.:4.000   1st Qu.:4.00  
 Median :4    Median :4.50   Median :4.0   Median :4.000   Median :4.00  
 Mean   :4    Mean   :4.50   Mean   :3.8   Mean   :4.444   Mean   :4.25  
 3rd Qu.:4    3rd Qu.:4.75   3rd Qu.:4.0   3rd Qu.:5.000   3rd Qu.:4.25  
 Max.   :4    Max.   :5.00   Max.   :5.0   Max.   :5.000   Max.   :5.00  
 NA's   :66   NA's   :69     NA's   :56    NA's   :62      NA's   :67    
      V26            V27    
 Min.   :3.00   Min.   :5   
 1st Qu.:3.75   1st Qu.:5   
 Median :4.00   Median :5   
 Mean   :3.75   Mean   :5   
 3rd Qu.:4.00   3rd Qu.:5   
 Max.   :4.00   Max.   :5   
 NA's   :67     NA's   :67  
> summary(scaled)
 X2eca2010年のDebianを振り返って.2011年を企画する X2ecaCACertの準備に何が必要か
 Min.   :-0.4472                                  Min.   :0.0000               
 1st Qu.:-0.1118                                  1st Qu.:0.3150               
 Median : 0.1479                                  Median :0.7071               
 Mean   : 0.2859                                  Mean   :0.7681               
 3rd Qu.: 0.5456                                  3rd Qu.:1.0435               
 Max.   : 1.2951                                  Max.   :1.7748               
 NA's   :23                                       NA's   :22                   
 X2ecaDebian.Miniconf.企画 X2eca事前課題紹介  X2eca俺のlibsaneが火をふくぜ
 Min.   :-2.6638           Min.   :-1.18322   Min.   :0.3150              
 1st Qu.:-2.3225           1st Qu.:-0.63121   1st Qu.:0.6793              
 Median :-1.3034           Median :-0.22361   Median :1.0435              
 Mean   :-1.6310           Mean   :-0.32885   Mean   :0.9242              
 3rd Qu.:-1.1856           3rd Qu.: 0.07876   3rd Qu.:1.2289              
 Max.   :-0.7071           Max.   : 0.31503   Max.   :1.4142              
 NA's   :21                NA's   :23         NA's   :24                  
 X3f152012年のDebian勉強会をふりかえって X3f15im.config     X3f15事前課題紹介 
 Min.   :-1.50000                        Min.   :-0.31623   Min.   :-1.15954  
 1st Qu.:-1.26943                        1st Qu.: 0.03275   1st Qu.:-0.52706  
 Median :-0.75440                        Median : 0.32454   Median : 0.09189  
 Mean   :-0.54928                        Mean   : 0.28613   Mean   : 0.12874  
 3rd Qu.:-0.03425                        3rd Qu.: 0.57792   3rd Qu.: 0.74768  
 Max.   : 0.81168                        Max.   : 0.81168   Max.   : 1.49071  
 NA's   :23                              NA's   :23         NA's   :23        
 X3f15著作権法改正 X4d5dMacBookAirにDebianインストール
 Min.   :0.5000    Min.   :0.1051                     
 1st Qu.:0.7338    1st Qu.:0.1219                     
 Median :1.1512    Median :0.1387                     
 Mean   :1.4121    Mean   :0.1387                     
 3rd Qu.:1.8295    3rd Qu.:0.1555                     
 Max.   :2.8460    Max.   :0.1723                     
 NA's   :23        NA's   :25                         
 X4d5d事前課題紹介.Debconfビデオ感想. X5dffDebconf11レポート
 Min.   :-1.156                       Min.   :-0.84327      
 1st Qu.:-1.154                       1st Qu.:-0.59519      
 Median :-1.152                       Median :-0.34710      
 Mean   :-1.152                       Mean   :-0.34710      
 3rd Qu.:-1.150                       3rd Qu.:-0.09902      
 Max.   :-1.149                       Max.   : 0.14907      
 NA's   :25                           NA's   :25            
 X5dffDebianパッケージのビルド方法  X5dffクイズ      
 Min.   :1.054                     Min.   :-0.84327  
 1st Qu.:1.163                     1st Qu.:-0.59519  
 Median :1.272                     Median :-0.34710  
 Mean   :1.272                     Mean   :-0.34710  
 3rd Qu.:1.382                     3rd Qu.:-0.09902  
 Max.   :1.491                     Max.   : 0.14907  
 NA's   :25                        NA's   :25        
 X5dffスポンサーアップロード入門 X5dff事前課題紹介 
 Min.   :0.1491                  Min.   :-0.84327  
 1st Qu.:0.3753                  1st Qu.:-0.59519  
 Median :0.6016                  Median :-0.34710  
 Mean   :0.6016                  Mean   :-0.34710  
 3rd Qu.:0.8278                  3rd Qu.:-0.09902  
 Max.   :1.0541                  Max.   : 0.14907  
 NA's   :25                      NA's   :25        
 X7efeDebian.Weekly.news.quiz X7efeDebian.での.node.js.入門
 Min.   :-1.1832              Min.   :0.1491               
 1st Qu.:-0.5171              1st Qu.:0.1665               
 Median : 0.1491              Median :0.2340               
 Mean   :-0.2397              Mean   :0.4781               
 3rd Qu.: 0.2321              3rd Qu.:0.5456               
 Max.   : 0.3150              Max.   :1.2951               
 NA's   :24                   NA's   :23                   
 X7efeandroidでdebian X7efe月刊Debhelper
 Min.   :0.1491       Min.   :-1.1926   
 1st Qu.:0.1665       1st Qu.:-1.1856   
 Median :0.2340       Median :-0.5055   
 Mean   :0.4781       Mean   :-0.4721   
 3rd Qu.:0.5456       3rd Qu.: 0.2080   
 Max.   :1.2951       Max.   : 0.3150   
 NA's   :23           NA's   :23        
 X8b79Debian.JP.定例会議処理系にXSLTを使ってみた
 Min.   :-0.5774                                
 1st Qu.: 0.1381                                
 Median : 0.2384                                
 Mean   : 0.2258                                
 3rd Qu.: 0.3541                                
 Max.   : 0.8660                                
 NA's   :19                                     
 X8b79Debian.で.sphinx.と.doxygen.を使う  X8b79クイズ      X8b79事前課題紹介
 Min.   :-2.4695                         Min.   :-1.1926   Min.   :-1.1926  
 1st Qu.: 0.1823                         1st Qu.:-0.6808   1st Qu.:-0.9961  
 Median : 1.0104                         Median : 0.1387   Median :-0.7217  
 Mean   : 0.4362                         Mean   :-0.2064   Mean   :-0.4929  
 3rd Qu.: 1.3129                         3rd Qu.: 0.2714   3rd Qu.: 0.2053  
 Max.   : 1.4907                         Max.   : 0.3150   Max.   : 0.3150  
 NA's   :19                              NA's   :21        NA's   :19       
 X8b79最近のイベント紹介 X8ef7Debian.Quiz  X8ef7bluetooth.tethering
 Min.   :-0.9428         Min.   :-1.1926   Min.   :0.1051          
 1st Qu.:-0.7755         1st Qu.:-1.1651   1st Qu.:0.1381          
 Median : 0.1051         Median :-0.9432   Median :0.6223          
 Mean   :-0.2503         Mean   :-0.6936   Mean   :0.6609          
 3rd Qu.: 0.1607         3rd Qu.:-0.4716   3rd Qu.:1.1450          
 Max.   : 0.3150         Max.   : 0.3044   Max.   :1.2938          
 NA's   :20              NA's   :23        NA's   :23              
 X8ef7linux.perf     X8ef7systemd   
 Min.   :-0.73030   Min.   :0.3044  
 1st Qu.: 0.04575   1st Qu.:0.8977  
 Median : 0.83531   Median :1.2308  
 Mean   : 0.60776   Mean   :1.0642  
 3rd Qu.: 1.39732   3rd Qu.:1.3973  
 Max.   : 1.49071   Max.   :1.4907  
 NA's   :23         NA's   :23      
 X8ef7事前課題紹介..Debian.で今いまいちサポートされていない機能.いけてない実装について語ってください..
 Min.   :-1.1560                                                                                      
 1st Qu.:-0.8367                                                                                      
 Median :-0.2906                                                                                      
 Mean   :-0.1108                                                                                      
 3rd Qu.: 0.4353                                                                                      
 Max.   : 1.2938                                                                                      
 NA's   :23                                                                                           
 X9146Debian.quiz X9146DebianのHaskellパッケージングについて語る
 Min.   : NA      Min.   :0.3162                                
 1st Qu.: NA      1st Qu.:0.3162                                
 Median : NA      Median :0.3162                                
 Mean   :NaN      Mean   :0.3162                                
 3rd Qu.: NA      3rd Qu.:0.3162                                
 Max.   : NA      Max.   :0.3162                                
 NA's   :27       NA's   :26                                    
 X9146x86.input.mtrack X9146レゴでなめこ収穫期 X9146事前課題紹介
 Min.   :0.3162        Min.   :0.3162          Min.   : NA      
 1st Qu.:0.3162        1st Qu.:0.3162          1st Qu.: NA      
 Median :0.3162        Median :0.3162          Median : NA      
 Mean   :0.3162        Mean   :0.3162          Mean   :NaN      
 3rd Qu.:0.3162        3rd Qu.:0.3162          3rd Qu.: NA      
 Max.   :0.3162        Max.   :0.3162          Max.   : NA      
 NA's   :26            NA's   :26              NA's   :27       
 X9796Debconf2012報告 X9796DebianでC..11を使う
 Min.   :0.1491       Min.   :0.3044          
 1st Qu.:0.2268       1st Qu.:0.5581          
 Median :0.3044       Median :0.8117          
 Mean   :0.4217       Mean   :0.8689          
 3rd Qu.:0.5581       3rd Qu.:1.1512          
 Max.   :0.8117       Max.   :1.4907          
 NA's   :24           NA's   :24              
 X9796Debianで簡単に貢献できそうなもの X9796事前課題紹介.Debian.19周年に思う.
 Min.   :-0.68497                      Min.   :0.3044                        
 1st Qu.:-0.26795                      1st Qu.:0.4312                        
 Median : 0.14907                      Median :0.5581                        
 Mean   : 0.09193                      Mean   :0.5581                        
 3rd Qu.: 0.48037                      3rd Qu.:0.6849                        
 Max.   : 0.81168                      Max.   :0.8117                        
 NA's   :24                            NA's   :25                            
 X9796月刊.Debhelper.共有ライブラリ編
 Min.   :0.8117                      
 1st Qu.:1.0528                      
 Median :1.2938                      
 Mean   :1.1987                      
 3rd Qu.:1.3923                      
 Max.   :1.4907                      
 NA's   :24                          
 aa7fPython初心者が.Pythonプロフェッショナルプログラミング.を読んでみた
 Min.   :-2.5342                                                       
 1st Qu.:-1.8469                                                       
 Median :-1.1595                                                       
 Mean   :-1.1326                                                       
 3rd Qu.:-0.4319                                                       
 Max.   : 0.2958                                                       
 NA's   :24                                                            
 aa7fcoffeescriptを使ってみた
 Min.   :-1.1926             
 1st Qu.:-1.1761             
 Median :-1.1595             
 Mean   :-0.6854             
 3rd Qu.:-0.4319             
 Max.   : 0.2958             
 NA's   :24                  
 aa7f事前課題紹介.書籍紹介とプログラミング言語紹介. b7942011年の振り返り
 Min.   :-1.1595                                    Min.   :-1.1595     
 1st Qu.:-0.5052                                    1st Qu.:-1.0327     
 Median : 0.1491                                    Median :-0.2680     
 Mean   :-0.2382                                    Mean   :-0.2458     
 3rd Qu.: 0.2224                                    3rd Qu.: 0.2735     
 Max.   : 0.2958                                    Max.   : 1.0541     
 NA's   :24                                         NA's   :21          
 b794DWN.trivia.quiz b794quiltでportingしてみた b794事前課題発表 
 Min.   :-1.1926     Min.   :0.1491             Min.   :-1.1926  
 1st Qu.:-1.1595     1st Qu.:0.2053             1st Qu.:-1.1568  
 Median :-1.1486     Median :0.3097             Median :-0.9960  
 Mean   :-1.0018     Mean   :0.4678             Mean   :-0.9490  
 3rd Qu.:-0.8433     3rd Qu.:0.6875             3rd Qu.:-0.7245  
 Max.   :-0.6651     Max.   :1.0541             Max.   :-0.6651  
 NA's   :22          NA's   :21                 NA's   :21       
 b794月刊Debhelper第2回 b8afBtrFSを使ってみる b8afCEPHを使ってみる
 Min.   :-0.68497       Min.   : NA           Min.   : NA         
 1st Qu.:-0.05944       1st Qu.: NA           1st Qu.: NA         
 Median : 0.16068       Median : NA           Median : NA         
 Mean   : 0.11202       Mean   :NaN           Mean   :NaN         
 3rd Qu.: 0.33214       3rd Qu.: NA           3rd Qu.: NA         
 Max.   : 0.81168       Max.   : NA           Max.   : NA         
 NA's   :23             NA's   :27            NA's   :27          
 b8afExt4を使ってみる b8afMiniDebconf計画 b8afNILFSを使ってみる
 Min.   : NA          Min.   : NA         Min.   : NA          
 1st Qu.: NA          1st Qu.: NA         1st Qu.: NA          
 Median : NA          Median : NA         Median : NA          
 Mean   :NaN          Mean   :NaN         Mean   :NaN          
 3rd Qu.: NA          3rd Qu.: NA         3rd Qu.: NA          
 Max.   : NA          Max.   : NA         Max.   : NA          
 NA's   :27           NA's   :27          NA's   :27           
 b8af事前課題紹介 dd42DPN.trivia.quiz dd42Debian.で快適な.LaTeX.作業環境
 Min.   : NA      Min.   :-0.31623    Min.   :-0.9527                   
 1st Qu.: NA      1st Qu.:-0.07873    1st Qu.:-0.4753                   
 Median : NA      Median : 0.15878    Median : 0.0000                   
 Mean   :NaN      Mean   : 0.05293    Mean   : 0.1351                   
 3rd Qu.: NA      3rd Qu.: 0.23750    3rd Qu.: 0.6105                   
 Max.   : NA      Max.   : 0.31623    Max.   : 1.4932                   
 NA's   :27       NA's   :24          NA's   :23                        
 dd42Debianとは何なのか. dd42HaskellとDebianの辛くて甘い関係
 Min.   :-0.31623        Min.   :-2.8460                    
 1st Qu.: 0.05016        1st Qu.:-1.5730                    
 Median : 0.24426        Median :-1.0506                    
 Mean   : 0.36063        Mean   :-1.3159                    
 3rd Qu.: 0.55472        3rd Qu.:-0.7936                    
 Max.   : 1.27022        Max.   :-0.3162                    
 NA's   :23              NA's   :23                         
 dd42レポートの自動生成 dd42事前課題紹介   dd42月刊.Debhelper
 Min.   :-0.9527        Min.   :-0.31623   Min.   :0.3162    
 1st Qu.:-0.4753        1st Qu.:-0.07873   1st Qu.:0.7932    
 Median : 0.0000        Median : 0.15878   Median :1.2702    
 Mean   : 0.1351        Mean   : 0.05293   Mean   :1.0266    
 3rd Qu.: 0.6105        3rd Qu.: 0.23750   3rd Qu.:1.3817    
 Max.   : 1.4932        Max.   : 0.31623   Max.   :1.4932    
 NA's   :23             NA's   :24         NA's   :24        
 f447Debianでtwitter連携 f447Debianクイズ  f447Debian使えるVPSを使ってみた
 Min.   :0.1491          Min.   :-1.1926   Min.   :-0.6651                
 1st Qu.:0.2735          1st Qu.:-0.7969   1st Qu.:-0.6504                
 Median :0.8030          Median :-0.6553   Median :-0.2482                
 Mean   :0.7622          Mean   :-0.3023   Mean   :-0.2143                
 3rd Qu.:1.2917          3rd Qu.:-0.1607   3rd Qu.: 0.1879                
 Max.   :1.2938          Max.   : 1.2938   Max.   : 0.3044                
 NA's   :23              NA's   :23        NA's   :23                     
 f447Debian勉強会予約システムの脆弱性 f447事前課題紹介.2012年企画
 Min.   :-1.19257                     Min.   :-1.6744            
 1st Qu.:-0.79695                     1st Qu.:-1.6525            
 Median :-0.18032                     Median :-1.4189            
 Mean   :-0.06555                     Mean   :-1.2894            
 3rd Qu.: 0.55107                     3rd Qu.:-1.0558            
 Max.   : 1.29099                     Max.   :-0.6455            
 NA's   :23                           NA's   :23                 
 f447第3回月刊Debhelper.dh_auto_..dh_build f456CACert.Assure...GPG.keysigning
 Min.   :-2.6253                           Min.   :-1.2247                   
 1st Qu.:-1.9121                           1st Qu.:-0.7312                   
 Median :-1.1599                           Median :-0.1639                   
 Mean   :-1.1990                           Mean   :-0.2800                   
 3rd Qu.:-0.4469                           3rd Qu.: 0.3006                   
 Max.   : 0.1491                           Max.   : 0.4714                   
 NA's   :23                                NA's   :19                        
 f456Debian勉強会アンケートシステム   f456Kinect    f456事前課題紹介 
 Min.   :-0.57735                   Min.   :0.315   Min.   :-1.1832  
 1st Qu.:-0.12500                   1st Qu.:1.207   1st Qu.:-0.8321  
 Median : 0.16068                   Median :1.492   Median :-0.2500  
 Mean   : 0.04078                   Mean   :1.355   Mean   :-0.3603  
 3rd Qu.: 0.30061                   3rd Qu.:1.569   3rd Qu.: 0.1118  
 Max.   : 0.47141                   Max.   :1.886   Max.   : 0.3150  
 NA's   :19                         NA's   :19      NA's   :21       
> average_score <- apply(scaled, 2, mean, na.rm=TRUE)
> summary(average_score)
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max.     NA's 
-1.63100 -0.34710  0.09193  0.03031  0.47290  1.41200        8 
> average_score
                                                     X2eca2010年のDebianを振り返って.2011年を企画する 
                                                                                           0.28593298 
                                                                        X2ecaCACertの準備に何が必要か 
                                                                                           0.76809271 
                                                                            X2ecaDebian.Miniconf.企画 
                                                                                          -1.63102774 
                                                                                    X2eca事前課題紹介 
                                                                                          -0.32884878 
                                                                         X2eca俺のlibsaneが火をふくぜ 
                                                                                           0.92424879 
                                                              X3f152012年のDebian勉強会をふりかえって 
                                                                                          -0.54927948 
                                                                                       X3f15im.config 
                                                                                           0.28613072 
                                                                                    X3f15事前課題紹介 
                                                                                           0.12873554 
                                                                                    X3f15著作権法改正 
                                                                                           1.41211033 
                                                                  X4d5dMacBookAirにDebianインストール 
                                                                                           0.13869254 
                                                                 X4d5d事前課題紹介.Debconfビデオ感想. 
                                                                                          -1.15231473 
                                                                               X5dffDebconf11レポート 
                                                                                          -0.34710142 
                                                                    X5dffDebianパッケージのビルド方法 
                                                                                           1.27240227 
                                                                                          X5dffクイズ 
                                                                                          -0.34710142 
                                                                      X5dffスポンサーアップロード入門 
                                                                                           0.60158188 
                                                                                    X5dff事前課題紹介 
                                                                                          -0.34710142 
                                                                         X7efeDebian.Weekly.news.quiz 
                                                                                          -0.23970345 
                                                                        X7efeDebian.での.node.js.入門 
                                                                                           0.47807763 
                                                                                 X7efeandroidでdebian 
                                                                                           0.47807763 
                                                                                   X7efe月刊Debhelper 
                                                                                          -0.47211433 
                                                      X8b79Debian.JP.定例会議処理系にXSLTを使ってみた 
                                                                                           0.22575021 
                                                              X8b79Debian.で.sphinx.と.doxygen.を使う 
                                                                                           0.43620695 
                                                                                          X8b79クイズ 
                                                                                          -0.20642131 
                                                                                    X8b79事前課題紹介 
                                                                                          -0.49287486 
                                                                              X8b79最近のイベント紹介 
                                                                                          -0.25033059 
                                                                                     X8ef7Debian.Quiz 
                                                                                          -0.69360978 
                                                                             X8ef7bluetooth.tethering 
                                                                                           0.66086014 
                                                                                      X8ef7linux.perf 
                                                                                           0.60775828 
                                                                                         X8ef7systemd 
                                                                                           1.06419375 
X8ef7事前課題紹介..Debian.で今いまいちサポートされていない機能.いけてない実装について語ってください.. 
                                                                                          -0.11084916 
                                                                                     X9146Debian.quiz 
                                                                                                  NaN 
                                                       X9146DebianのHaskellパッケージングについて語る 
                                                                                           0.31622777 
                                                                                X9146x86.input.mtrack 
                                                                                           0.31622777 
                                                                              X9146レゴでなめこ収穫期 
                                                                                           0.31622777 
                                                                                    X9146事前課題紹介 
                                                                                                  NaN 
                                                                                 X9796Debconf2012報告 
                                                                                           0.42172731 
                                                                             X9796DebianでC..11を使う 
                                                                                           0.86894091 
                                                                X9796Debianで簡単に貢献できそうなもの 
                                                                                           0.09192675 
                                                               X9796事前課題紹介.Debian.19周年に思う. 
                                                                                           0.55805537 
                                                                 X9796月刊.Debhelper.共有ライブラリ編 
                                                                                           1.19874146 
                               aa7fPython初心者が.Pythonプロフェッショナルプログラミング.を読んでみた 
                                                                                          -1.13264949 
                                                                         aa7fcoffeescriptを使ってみた 
                                                                                          -0.68543589 
                                                   aa7f事前課題紹介.書籍紹介とプログラミング言語紹介. 
                                                                                          -0.23822229 
                                                                                 b7942011年の振り返り 
                                                                                          -0.24582328 
                                                                                  b794DWN.trivia.quiz 
                                                                                          -1.00181676 
                                                                           b794quiltでportingしてみた 
                                                                                           0.46776712 
                                                                                     b794事前課題発表 
                                                                                          -0.94900903 
                                                                               b794月刊Debhelper第2回 
                                                                                           0.11201852 
                                                                                b8afBtrFSを使ってみる 
                                                                                                  NaN 
                                                                                 b8afCEPHを使ってみる 
                                                                                                  NaN 
                                                                                 b8afExt4を使ってみる 
                                                                                                  NaN 
                                                                                  b8afMiniDebconf計画 
                                                                                                  NaN 
                                                                                b8afNILFSを使ってみる 
                                                                                                  NaN 
                                                                                     b8af事前課題紹介 
                                                                                                  NaN 
                                                                                  dd42DPN.trivia.quiz 
                                                                                           0.05292561 
                                                                   dd42Debian.で快適な.LaTeX.作業環境 
                                                                                           0.13513800 
                                                                              dd42Debianとは何なのか. 
                                                                                           0.36062713 
                                                                  dd42HaskellとDebianの辛くて甘い関係 
                                                                                          -1.31589102 
                                                                               dd42レポートの自動生成 
                                                                                           0.13513800 
                                                                                     dd42事前課題紹介 
                                                                                           0.05292561 
                                                                                   dd42月刊.Debhelper 
                                                                                           1.02655183 
                                                                              f447Debianでtwitter連携 
                                                                                           0.76223326 
                                                                                     f447Debianクイズ 
                                                                                          -0.30232663 
                                                                      f447Debian使えるVPSを使ってみた 
                                                                                          -0.21426685 
                                                                 f447Debian勉強会予約システムの脆弱性 
                                                                                          -0.06555413 
                                                                          f447事前課題紹介.2012年企画 
                                                                                          -1.28940466 
                                                            f447第3回月刊Debhelper.dh_auto_..dh_build 
                                                                                          -1.19902123 
                                                                   f456CACert.Assure...GPG.keysigning 
                                                                                          -0.28001600 
                                                                   f456Debian勉強会アンケートシステム 
                                                                                           0.04078221 
                                                                                           f456Kinect 
                                                                                           1.35485586 
                                                                                     f456事前課題紹介 
                                                                                          -0.36031990 
> write.csv(average_score)
"","x"
"X2eca2010年のDebianを振り返って.2011年を企画する",0.285932976897187
"X2ecaCACertの準備に何が必要か",0.768092705584907
"X2ecaDebian.Miniconf.企画",-1.63102774417004
"X2eca事前課題紹介",-0.328848782452919
"X2eca俺のlibsaneが火をふくぜ",0.924248791393733
"X3f152012年のDebian勉強会をふりかえって",-0.549279476025824
"X3f15im.config",0.286130720599144
"X3f15事前課題紹介",0.128735536919532
"X3f15著作権法改正",1.41211033226621
"X4d5dMacBookAirにDebianインストール",0.138692544651545
"X4d5d事前課題紹介.Debconfビデオ感想.",-1.15231473329368
"X5dffDebconf11レポート",-0.347101422105791
"X5dffDebianパッケージのビルド方法",1.27240226919466
"X5dffクイズ",-0.347101422105791
"X5dffスポンサーアップロード入門",0.601581875944723
"X5dff事前課題紹介",-0.347101422105791
"X7efeDebian.Weekly.news.quiz",-0.239703445270578
"X7efeDebian.での.node.js.入門",0.478077628228709
"X7efeandroidでdebian",0.478077628228709
"X7efe月刊Debhelper",-0.472114327746365
"X8b79Debian.JP.定例会議処理系にXSLTを使ってみた",0.225750206033889
"X8b79Debian.で.sphinx.と.doxygen.を使う",0.436206945042377
"X8b79クイズ",-0.206421305866111
"X8b79事前課題紹介",-0.492874855486757
"X8b79最近のイベント紹介",-0.250330588785243
"X8ef7Debian.Quiz",-0.693609776578125
"X8ef7bluetooth.tethering",0.660860135819182
"X8ef7linux.perf",0.607758284533475
"X8ef7systemd",1.06419374912111
"X8ef7事前課題紹介..Debian.で今いまいちサポートされていない機能.いけてない実装について語ってください..",-0.110849162699289
"X9146Debian.quiz",NA
"X9146DebianのHaskellパッケージングについて語る",0.316227766016837
"X9146x86.input.mtrack",0.316227766016837
"X9146レゴでなめこ収穫期",0.316227766016837
"X9146事前課題紹介",NA
"X9796Debconf2012報告",0.421727310395802
"X9796DebianでC..11を使う",0.86894090589576
"X9796Debianで簡単に貢献できそうなもの",0.0919267540573111
"X9796事前課題紹介.Debian.19周年に思う.",0.55805536634371
"X9796月刊.Debhelper.共有ライブラリ編",1.19874146223425
"aa7fPython初心者が.Pythonプロフェッショナルプログラミング.を読んでみた",-1.13264948554989
"aa7fcoffeescriptを使ってみた",-0.685435890049934
"aa7f事前課題紹介.書籍紹介とプログラミング言語紹介.",-0.238222294549976
"b7942011年の振り返り",-0.245823282031616
"b794DWN.trivia.quiz",-1.00181675603493
"b794quiltでportingしてみた",0.467767119701869
"b794事前課題発表",-0.94900902773602
"b794月刊Debhelper第2回",0.11201851837452
"b8afBtrFSを使ってみる",NA
"b8afCEPHを使ってみる",NA
"b8afExt4を使ってみる",NA
"b8afMiniDebconf計画",NA
"b8afNILFSを使ってみる",NA
"b8af事前課題紹介",NA
"dd42DPN.trivia.quiz",0.0529256124024963
"dd42Debian.で快適な.LaTeX.作業環境",0.135138002062081
"dd42Debianとは何なのか.",0.360627127246514
"dd42HaskellとDebianの辛くて甘い関係",-1.31589102306357
"dd42レポートの自動生成",0.135138002062081
"dd42事前課題紹介",0.0529256124024963
"dd42月刊.Debhelper",1.02655183172334
"f447Debianでtwitter連携",0.762233255333365
"f447Debianクイズ",-0.302326632473911
"f447Debian使えるVPSを使ってみた",-0.214266853102811
"f447Debian勉強会予約システムの脆弱性",-0.0655541314518522
"f447事前課題紹介.2012年企画",-1.2894046571419
"f447第3回月刊Debhelper.dh_auto_..dh_build",-1.19902123342331
"f456CACert.Assure...GPG.keysigning",-0.280015998125093
"f456Debian勉強会アンケートシステム",0.0407822091113403
"f456Kinect",1.35485585833327
"f456事前課題紹介",-0.360319896232299
