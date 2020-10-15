## code to prepare `P35858` dataset goes here

# Actual code to get the data
if (FALSE) {
P35858 <- pfamscan(
    fasta_str = ">sp|P35858|ALS_HUMAN Insulin-like growth factor-binding protein complex acid labile subunit OS=Homo sapiens GN=IGFALS PE=1 SV=1
  MALRKGGLALALLLLSWVALGPRSLEGADPGTPGEAEGPACPAACVCSYDD
  DADELSVFCSSRNLTRLPDGVPGGTQALWLDGNNLSSVPPAAFQNLSSLGF
  LNLQGGQLGSLEPQALLGLENLCHLHLERNQLRSLALGTFAHTPALASLGL
  SNNRLSRLEDGLFEGLGSLWDLNLGWNSLAVLPDAAFRGLGSLRELVLAGN
  RLAYLQPALFSGLAELRELDLSRNALRAIKANVFVQLPRLQKLYLDRNLIA
  AVAPGAFLGLKALRWLDLSHNRVAGLLEDTFPGLLGLRVLRLSHNAIASLR
  PRTFKDLHFLEELQLGHNRIRQLAERSFEGLGQLEVLTLDHNQLQEVKAGA
  FLGLTNVAVMNLSGNCLRNLPEQVFRGLGKLHSLHLEGSCLGRIRPHTFTG
  LSGLRRLFLKDNGLVGIEEQSLWGLAELLELDLTSNQLTHLPHRLFQGLGK
  LEYLLLSRNRLAELPADALGPLQRAFWLDVSHNRLEALPNSLLAPLGRLRY
  LSLRNNSLRTFTPQPPGLERLWLEGNPWDCGCPLKALRDFALQNPSAVPRF
  VQAICEGDDCQPPAYTYNNITCASPPEVVGLDLRDLSEAHFAPC",
    email     = "your@email.com",
    httr::config(connecttimeout=60)
  )
}

P35858 <-
  structure(
    list(
      model_length = c("28", "61", "61", "61", "61",
                       "61"),
      align = list(
        c(
          "#HMM       aCPrpChCs......alvVnCsergLtavPrdlP",
          "#MATCH     aCP+ C+Cs      +l+V+Cs+r+Lt++P+++P",
          "#PP        7*******************************99",
          "#SEQ       ACPAACVCSydddadELSVFCSSRNLTRLPDGVP"
        ),
        c(
          "#HMM       sLdLsnNrltslddeaFkglsnLkvLdLsnNllttlspgafsgLpsLrsLdLsgNrL",
          "#MATCH      L L+ N+l+s+++ aF++ls+L  L+L   +l +l+p+a+ gL++L +L+L++N+L",
          "#PP        6789***************************************************98",
          "#SEQ       ALWLDGNNLSSVPPAAFQNLSSLGFLNLQGGQLGSLEPQALLGLENLCHLHLERNQL"
        ),
        c(
          "#HMM       pnLtsLdLsnNrltslddeaFkglsnLkvLdLsnNllttlspgafsgLpsLrsLdLsgNrL",
          "#MATCH     p L sL LsnNrl+ l+d+ F+gl +L  L+L+ N+l +l   af+gL sLr+L L gNrL",
          "#PP        6799*******************************************************98",
          "#SEQ       PALASLGLSNNRLSRLEDGLFEGLGSLWDLNLGWNSLAVLPDAAFRGLGSLRELVLAGNRL"
        ),
        c(
          "#HMM       nLtsLdLsnNrltslddeaFkglsnLkvLdLsnNllttlspgafsgLpsLrsLdLsgNr",
          "#MATCH     +L++LdLs+N l +++  +F +l++L+ L+L +Nl+  + pgaf gL++Lr+LdLs+Nr",
          "#PP        59********************************************************8",
          "#SEQ       ELRELDLSRNALRAIKANVFVQLPRLQKLYLDRNLIAAVAPGAFLGLKALRWLDLSHNR"
        ),
        c(
          "#HMM       LtsLdLsnNrltslddeaFkglsnLkvLdLsnNllttlspgafsgLpsLrsLdLsgNrL",
          "#MATCH     L++L Ls+N + sl++ +Fk+l+ L++L+L++N+++ l +++f+gL +L+ L+L++N+L",
          "#PP        99*******************************************************98",
          "#SEQ       LRVLRLSHNAIASLRPRTFKDLHFLEELQLGHNRIRQLAERSFEGLGQLEVLTLDHNQL"
        ),
        c(
          "#HMM       nLtsLdLsnNrltslddeaFkglsnLkvLdLsnNllttlspgafsgLpsLrsLdLsgNrL",
          "#MATCH     +L+sL+L  + l  +++++F+gls+L+ L L++N l  +++++++gL+ L +LdL++N+L",
          "#PP        69********************************************************98",
          "#SEQ       KLHSLHLEGSCLGRIRPHTFTGLSGLRRLFLKDNGLVGIEEQSLWGLAELLELDLTSNQL"
        )
      ),
      env = structure(
        list(
          to = c("73", "134", "206", "278", "350",
                 "446"),
          from = c("40", "74", "146", "219", "290", "386")
        ),
        class = "data.frame",
        row.names = c(NA,
                      6L)
      ),
      name = c("LRRNT", "LRR_8", "LRR_8", "LRR_8", "LRR_8", "LRR_8"),
      acc = c(
        "PF01462.18",
        "PF13855.6",
        "PF13855.6",
        "PF13855.6",
        "PF13855.6",
        "PF13855.6"
      ),
      sig = c(1L, 1L, 1L, 1L, 1L, 1L),
      evalue = c("1.5e-09",
                 "4.6e-10", "5.1e-14", "1.5e-16", "4.2e-16", "5e-13"),
      desc = c(
        "Leucine rich repeat N-terminal domain",
        "Leucine rich repeat",
        "Leucine rich repeat",
        "Leucine rich repeat",
        "Leucine rich repeat",
        "Leucine rich repeat"
      ),
      hmm = structure(
        list(
          to = c("28", "61", "61", "60", "61", "61"),
          from = c("1",
                   "5", "1", "2", "3", "2")
        ),
        class = "data.frame",
        row.names = c(NA,
                      6L)
      ),
      act_site = c(NA, NA, NA, NA, NA, NA),
      type = c("Family",
               "Repeat", "Repeat", "Repeat", "Repeat", "Repeat"),
      bits = c("37.3",
               "39.1", "51.8", "59.9", "58.4", "48.6"),
      clan = c("No_clan",
               "CL0022", "CL0022", "CL0022", "CL0022", "CL0022"),
      seq = structure(
        list(
          to = c("73", "134", "206", "277", "350", "446"),
          from = c("40",
                   "78", "146", "219", "292", "387"),
          name = c(
            "sp|P35858|ALS_HUMAN",
            "sp|P35858|ALS_HUMAN",
            "sp|P35858|ALS_HUMAN",
            "sp|P35858|ALS_HUMAN",
            "sp|P35858|ALS_HUMAN",
            "sp|P35858|ALS_HUMAN"
          )
        ),
        class = "data.frame",
        row.names = c(NA,
                      6L)
      )
    ),
    class = "data.frame",
    row.names = c(NA, 6L)
  )

usethis::use_data(P35858, overwrite = TRUE)
