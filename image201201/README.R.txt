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
