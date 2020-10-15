
<!-- README.md is generated from README.Rmd. Please edit that file -->

# pfamscanr

<!-- badges: start -->

[![Travis build
status](https://travis-ci.com/USCbiostats/pfamscanr.svg?branch=master)](https://travis-ci.com/USCbiostats/pfamscanr)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/USCbiostats/pfamscanr?branch=master&svg=true)](https://ci.appveyor.com/project/USCbiostats/pfamscanr)
<!-- badges: end -->

The goal of pfamscanr is to …

## Installation

You can download the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("USCbiostats/pfamscanr")
```

## Example

This is an example extracted directly from the website
<https://www.ebi.ac.uk/Tools/pfa/pfamscan/>

``` r
library(pfamscanr)
ans <- pfamscan(
  fasta_str = ">sp|P35858|ALS_HUMAN OS=Homo sapiens GN=IGFALS PE=1 SV=1
  MALRKGGLALALLLLSWVALGPRSLEGADPGTPGEAEGPACPAACVCSYDDDADEL
  SVFCSSRNLTRLPDGVPGGTQALWLDGNNLSSVPPAAFQNLSSLGFLNLQGGQLGS
  LEPQALLGLENLCHLHLERNQLRSLALGTFAHTPALASLGLSNNRLSRLEDGLFEG
  LGSLWDLNLGWNSLAVLPDAAFRGLGSLRELVLAGNRLAYLQPALFSGLAELRELD
  LSRNALRAIKANVFVQLPRLQKLYLDRNLIAAVAPGAFLGLKALRWLDLSHNRVAG
  LLEDTFPGLLGLRVLRLSHNAIASLRPRTFKDLHFLEELQLGHNRIRQLAERSFEG
  LGQLEVLTLDHNQLQEVKAGAFLGLTNVAVMNLSGNCLRNLPEQVFRGLGKLHSLH
  LEGSCLGRIRPHTFTGLSGLRRLFLKDNGLVGIEEQSLWGLAELLELDLTSNQLTH
  LPHRLFQGLGKLEYLLLSRNRLAELPADALGPLQRAFWLDVSHNRLEALPNSLLAP
  LGRLRYLSLRNNSLRTFTPQPPGLERLWLEGNPWDCGCPLKALRDFALQNPSAVPR
  FVQAICEGDDCQPPAYTYNNITCASPPEVVGLDLRDLSEAHFAPC",
  email = "your@email.com",
  httr::config(connecttimeout=60)
)
```

``` r
ans
#>   model_length
#> 1           28
#> 2           61
#> 3           61
#> 4           61
#> 5           61
#> 6           61
#>                                                                                                                                                                                                                                                                                                    align
#> 1                                                                                                             #HMM       aCPrpChCs......alvVnCsergLtavPrdlP, #MATCH     aCP+ C+Cs      +l+V+Cs+r+Lt++P+++P, #PP        7*******************************99, #SEQ       ACPAACVCSydddadELSVFCSSRNLTRLPDGVP
#> 2                 #HMM       sLdLsnNrltslddeaFkglsnLkvLdLsnNllttlspgafsgLpsLrsLdLsgNrL, #MATCH      L L+ N+l+s+++ aF++ls+L  L+L   +l +l+p+a+ gL++L +L+L++N+L, #PP        6789***************************************************98, #SEQ       ALWLDGNNLSSVPPAAFQNLSSLGFLNLQGGQLGSLEPQALLGLENLCHLHLERNQL
#> 3 #HMM       pnLtsLdLsnNrltslddeaFkglsnLkvLdLsnNllttlspgafsgLpsLrsLdLsgNrL, #MATCH     p L sL LsnNrl+ l+d+ F+gl +L  L+L+ N+l +l   af+gL sLr+L L gNrL, #PP        6799*******************************************************98, #SEQ       PALASLGLSNNRLSRLEDGLFEGLGSLWDLNLGWNSLAVLPDAAFRGLGSLRELVLAGNRL
#> 4         #HMM       nLtsLdLsnNrltslddeaFkglsnLkvLdLsnNllttlspgafsgLpsLrsLdLsgNr, #MATCH     +L++LdLs+N l +++  +F +l++L+ L+L +Nl+  + pgaf gL++Lr+LdLs+Nr, #PP        59********************************************************8, #SEQ       ELRELDLSRNALRAIKANVFVQLPRLQKLYLDRNLIAAVAPGAFLGLKALRWLDLSHNR
#> 5         #HMM       LtsLdLsnNrltslddeaFkglsnLkvLdLsnNllttlspgafsgLpsLrsLdLsgNrL, #MATCH     L++L Ls+N + sl++ +Fk+l+ L++L+L++N+++ l +++f+gL +L+ L+L++N+L, #PP        99*******************************************************98, #SEQ       LRVLRLSHNAIASLRPRTFKDLHFLEELQLGHNRIRQLAERSFEGLGQLEVLTLDHNQL
#> 6     #HMM       nLtsLdLsnNrltslddeaFkglsnLkvLdLsnNllttlspgafsgLpsLrsLdLsgNrL, #MATCH     +L+sL+L  + l  +++++F+gls+L+ L L++N l  +++++++gL+ L +LdL++N+L, #PP        69********************************************************98, #SEQ       KLHSLHLEGSCLGRIRPHTFTGLSGLRRLFLKDNGLVGIEEQSLWGLAELLELDLTSNQL
#>   env.to env.from  name        acc sig  evalue
#> 1     73       40 LRRNT PF01462.18   1 1.5e-09
#> 2    134       74 LRR_8  PF13855.6   1 4.6e-10
#> 3    206      146 LRR_8  PF13855.6   1 5.1e-14
#> 4    278      219 LRR_8  PF13855.6   1 1.5e-16
#> 5    350      290 LRR_8  PF13855.6   1 4.2e-16
#> 6    446      386 LRR_8  PF13855.6   1   5e-13
#>                                    desc hmm.to hmm.from act_site   type bits
#> 1 Leucine rich repeat N-terminal domain     28        1       NA Family 37.3
#> 2                   Leucine rich repeat     61        5       NA Repeat 39.1
#> 3                   Leucine rich repeat     61        1       NA Repeat 51.8
#> 4                   Leucine rich repeat     60        2       NA Repeat 59.9
#> 5                   Leucine rich repeat     61        3       NA Repeat 58.4
#> 6                   Leucine rich repeat     61        2       NA Repeat 48.6
#>      clan seq.to seq.from            seq.name
#> 1 No_clan     73       40 sp|P35858|ALS_HUMAN
#> 2  CL0022    134       78 sp|P35858|ALS_HUMAN
#> 3  CL0022    206      146 sp|P35858|ALS_HUMAN
#> 4  CL0022    277      219 sp|P35858|ALS_HUMAN
#> 5  CL0022    350      292 sp|P35858|ALS_HUMAN
#> 6  CL0022    446      387 sp|P35858|ALS_HUMAN
```
