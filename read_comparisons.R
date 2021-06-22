# X1-X8 moleucle comparisons

X1 <- read.table("Run18387/HD_Samples/18387X1_allMolecules.txt", 
                       header = T, 
                       row.names = NULL, # have to use row names = null because there are duplicate row names
                       sep = '\t')
X2 <-  read.table("Run18387/HD_Samples/18387X2_allMolecules.txt", 
                  header = T, 
                  row.names = NULL, # have to use row names = null because there are duplicate row names
                  sep = '\t')
X3 <-  read.table("Run18387/HD_Samples/18387X3_allMolecules.txt", 
                  header = T, 
                  row.names = NULL, # have to use row names = null because there are duplicate row names
                  sep = '\t')
X4 <-  read.table("Run18387/HD_Samples/18387X4_allMolecules.txt", 
                  header = T, 
                  row.names = NULL, # have to use row names = null because there are duplicate row names
                  sep = '\t')
X5 <- read.table("Run18387/HD_Samples/18387X5_allMolecules.txt", 
                 header = T, 
                 row.names = NULL, # have to use row names = null because there are duplicate row names
                 sep = '\t')
X6 <-  read.table("Run18387/HD_Samples/18387X6_allMolecules.txt", 
                  header = T, 
                  row.names = NULL, # have to use row names = null because there are duplicate row names
                  sep = '\t')
X7 <-  read.table("Run18387/HD_Samples/18387X7_allMolecules.txt", 
                  header = T, 
                  row.names = NULL, # have to use row names = null because there are duplicate row names
                  sep = '\t')
X8 <-  read.table("Run18387/HD_Samples/18387X8_allMolecules.txt", 
                  header = T, 
                  row.names = NULL, # have to use row names = null because there are duplicate row names
                  sep = '\t')
Blood_X1 <- X1[c(73497:117864), c(2,8)]
Blood_X1 <- Blood_X1[!(Blood_X1$numReads < 5),] # to filter out those amplicons with <5 reads
Blood_X1$locus = as.numeric(as.factor(Blood_X1$locus))
# Blood_X1$numReads <- log(Blood_X1$numReads)
Blood_X5 <- X5[c(128721:205761), c(2,8)]
Blood_X5 <- Blood_X5[!(Blood_X5$numReads < 5),] # to filter out those amplicons with <5 reads
Blood_X5$locus = as.numeric(as.factor(Blood_X5$locus))
# Blood_X5$numReads <- log(Blood_X5$numReads)

# Blood_X1Graph <- ggplot(data = Blood_X1, aes(locus, numReads), fill = locus) + 
 # geom_bar(stat = "identity") +
 # ggtitle(paste("Number of Molecules Blood
# 18387X1")) 


# Blood_X5Graph <- ggplot(data = Blood_X5, aes(locus, numReads), fill = locus) + 
 # geom_bar(stat = "identity") +
 # ggtitle(paste("Number of Molecules Blood
# 18387X5")) 

Blood_X1Graph <- ggplot(data = Blood_X1) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Blood
18387X1")) +
  ylab("Amplicon count") +
  ylim(0,7.5)


Blood_X5Graph <- ggplot(data = Blood_X5) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Blood
18387X5")) +
  ylab("Amplicon count")

ggarrange(Blood_X1Graph, Blood_X5Graph, ncol = 1, nrow = 2)  


# pancancer markers
Pancancer_X1 <- X1[,c(2,8)]
Pancancer_X1 <-Pancancer_X1 %>% filter(
  locus %in% c("pancan-8-cg04739647-chr2_176987433_176987545-8", "pancan-10-cg20072171-chr3_62356850_62357007-10","pancan-18-cg14428146-chr8_23563822_23563978-18","pancan-19-cg13324546-chr8_23563978_23564101-19", "pancan-20-cg22747746-chr8_23564185_23564337-20","pancan-21-cg14038391-chr10_102900030_102900174-21","pancan-25-cg00986824-chr12_75601394_75601509-25","pancan-26-cg07614018-chr19_18811452_18811616-26")
) # grabs just the pancancer markers

Pancancer_X5 <- X5[,c(2,8)]
Pancancer_X5 <-Pancancer_X5 %>% filter(
  locus %in% c("pancan-8-cg04739647-chr2_176987433_176987545-8", "pancan-10-cg20072171-chr3_62356850_62357007-10","pancan-18-cg14428146-chr8_23563822_23563978-18","pancan-19-cg13324546-chr8_23563978_23564101-19", "pancan-20-cg22747746-chr8_23564185_23564337-20","pancan-21-cg14038391-chr10_102900030_102900174-21","pancan-25-cg00986824-chr12_75601394_75601509-25","pancan-26-cg07614018-chr19_18811452_18811616-26")
) # grabs just the pancancer markers

# filter out amplicons with reads <5
Pancancer_X1 <- Pancancer_X1[!(Pancancer_X1$numReads < 5),]
Pancancer_X5 <- Pancancer_X5[!(Pancancer_X5$numReads < 5),]

Pancancer_X1Graph <- ggplot(data = Pancancer_X1) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Pancancer 
18387X1")) +
  ylab("Amplicon count") +
  ylim(0,7.5)


Pancancer_X5Graph <- ggplot(data = Pancancer_X5) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Pancancer
18387X5")) +
  ylab("Amplicon count")
ggarrange(Pancancer_X1Graph, Pancancer_X5Graph, ncol = 1, nrow = 2)  


# X2 Blood
Blood_X2 <- X2[,c(2,8)]
Blood_X2 <-Blood_X2 %>% filter(
  locus %in% c("blood-1-cg07865091-chr1_43814286_43814441", "blood-2-cg08706567_cg13393721-chr1_43815020_43815167","blood-3-cg08535938-chr1_161128968_161129092","blood-4-cg16817180-chr4_981454_981558","blood-5-cg21448513-chr8_57103511_57103669","blood-6-cg09148852-chr12_122235067_122235172","blood-7-cg07218880-chr13_115046160_115046282","blood-8-cg12952132-chr19_55417539_55417665")
)
Blood_X2 <- Blood_X2[!(Blood_X2$numReads < 5),] # filter out reads <5
Blood_X2Graph <- ggplot(data = Blood_X2) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Blood
18387X2")) +
  ylab("Amplicon count") +
  ylim(0,20)


#X3 Blood
Blood_X3 <- X3[,c(2,8)]
Blood_X3 <-Blood_X3 %>% filter(
  locus %in% c("blood-1-cg07865091-chr1_43814286_43814441", "blood-2-cg08706567_cg13393721-chr1_43815020_43815167","blood-3-cg08535938-chr1_161128968_161129092","blood-4-cg16817180-chr4_981454_981558","blood-5-cg21448513-chr8_57103511_57103669","blood-6-cg09148852-chr12_122235067_122235172","blood-7-cg07218880-chr13_115046160_115046282","blood-8-cg12952132-chr19_55417539_55417665")
)
Blood_X3 <- Blood_X3[!(Blood_X3$numReads < 5),] # filter out reads <5
Blood_X3Graph <- ggplot(data = Blood_X3) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Blood
18387X3")) +
  ylab("Amplicon count") +
  ylim(0,40)

#X4 Blood

Blood_X4 <- X4[,c(2,8)]
Blood_X4 <-Blood_X4 %>% filter(
  locus %in% c("blood-1-cg07865091-chr1_43814286_43814441", "blood-2-cg08706567_cg13393721-chr1_43815020_43815167","blood-3-cg08535938-chr1_161128968_161129092","blood-4-cg16817180-chr4_981454_981558","blood-5-cg21448513-chr8_57103511_57103669","blood-6-cg09148852-chr12_122235067_122235172","blood-7-cg07218880-chr13_115046160_115046282","blood-8-cg12952132-chr19_55417539_55417665")
)
Blood_X4 <- Blood_X4[!(Blood_X4$numReads < 5),] # filter out reads <5
Blood_X4Graph <- ggplot(data = Blood_X4) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Blood
18387X4")) +
  ylab("Amplicon count")
  #ylim(0,40)

#X6 Blood

Blood_X6 <- X6[,c(2,8)]
Blood_X6 <-Blood_X6 %>% filter(
  locus %in% c("blood-1-cg07865091-chr1_43814286_43814441", "blood-2-cg08706567_cg13393721-chr1_43815020_43815167","blood-3-cg08535938-chr1_161128968_161129092","blood-4-cg16817180-chr4_981454_981558","blood-5-cg21448513-chr8_57103511_57103669","blood-6-cg09148852-chr12_122235067_122235172","blood-7-cg07218880-chr13_115046160_115046282","blood-8-cg12952132-chr19_55417539_55417665")
)
Blood_X6 <- Blood_X6[!(Blood_X6$numReads < 5),] # filter out reads <5
Blood_X6Graph <- ggplot(data = Blood_X6) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Blood
18387X6")) +
  ylab("Amplicon count") +
  xlim(0,400)


#X7 Blood

Blood_X7 <- X7[,c(2,8)]
Blood_X7 <-Blood_X7 %>% filter(
  locus %in% c("blood-1-cg07865091-chr1_43814286_43814441", "blood-2-cg08706567_cg13393721-chr1_43815020_43815167","blood-3-cg08535938-chr1_161128968_161129092","blood-4-cg16817180-chr4_981454_981558","blood-5-cg21448513-chr8_57103511_57103669","blood-6-cg09148852-chr12_122235067_122235172","blood-7-cg07218880-chr13_115046160_115046282","blood-8-cg12952132-chr19_55417539_55417665")
)
Blood_X7 <- Blood_X7[!(Blood_X7$numReads < 5),] # filter out reads <5
Blood_X7Graph <- ggplot(data = Blood_X7) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Blood
18387X7")) +
  ylab("Amplicon count")


#X8 Blood

Blood_X8 <- X8[,c(2,8)]
Blood_X8 <-Blood_X8 %>% filter(
  locus %in% c("blood-1-cg07865091-chr1_43814286_43814441", "blood-2-cg08706567_cg13393721-chr1_43815020_43815167","blood-3-cg08535938-chr1_161128968_161129092","blood-4-cg16817180-chr4_981454_981558","blood-5-cg21448513-chr8_57103511_57103669","blood-6-cg09148852-chr12_122235067_122235172","blood-7-cg07218880-chr13_115046160_115046282","blood-8-cg12952132-chr19_55417539_55417665")
)
Blood_X8 <- Blood_X8[!(Blood_X8$numReads < 5),] # filter out reads <5
Blood_X8Graph <- ggplot(data = Blood_X8) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Blood
18387X8")) +
  ylab("Amplicon count")


ggarrange(Blood_X1Graph, Blood_X2Graph,Blood_X3Graph, 
          Blood_X4Graph, Blood_X5Graph, Blood_X6Graph,
          Blood_X7Graph,Blood_X8Graph,
          ncol = 2, nrow = 4) 


# Pancancer X2
Pancancer_X2 <- X2[,c(2,8)]
Pancancer_X2 <-Pancancer_X2 %>% filter(
  locus %in% c("pancan-8-cg04739647-chr2_176987433_176987545-8", "pancan-10-cg20072171-chr3_62356850_62357007-10","pancan-18-cg14428146-chr8_23563822_23563978-18","pancan-19-cg13324546-chr8_23563978_23564101-19", "pancan-20-cg22747746-chr8_23564185_23564337-20","pancan-21-cg14038391-chr10_102900030_102900174-21","pancan-25-cg00986824-chr12_75601394_75601509-25","pancan-26-cg07614018-chr19_18811452_18811616-26")
) # grabs just the pancancer markers

Pancancer_X2 <- Pancancer_X2[!(Pancancer_X2$numReads < 5),]

Pancancer_X2Graph <- ggplot(data = Pancancer_X2) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Pancancer 
18387X2")) +
  ylab("Amplicon count") +
  ylim(0,20)

# Pancancer X3
Pancancer_X3 <- X3[,c(2,8)]
Pancancer_X3 <-Pancancer_X3 %>% filter(
  locus %in% c("pancan-8-cg04739647-chr2_176987433_176987545-8", "pancan-10-cg20072171-chr3_62356850_62357007-10","pancan-18-cg14428146-chr8_23563822_23563978-18","pancan-19-cg13324546-chr8_23563978_23564101-19", "pancan-20-cg22747746-chr8_23564185_23564337-20","pancan-21-cg14038391-chr10_102900030_102900174-21","pancan-25-cg00986824-chr12_75601394_75601509-25","pancan-26-cg07614018-chr19_18811452_18811616-26")
) # grabs just the pancancer markers

Pancancer_X3 <- Pancancer_X3[!(Pancancer_X3$numReads < 5),]

Pancancer_X3Graph <- ggplot(data = Pancancer_X3) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Pancancer 
18387X3")) +
  ylab("Amplicon count") +
  ylim(0,50)

# Pancancer X4
Pancancer_X4 <- X4[,c(2,8)] 
Pancancer_X4 <-Pancancer_X4 %>% filter(
  locus %in% c("pancan-8-cg04739647-chr2_176987433_176987545-8", "pancan-10-cg20072171-chr3_62356850_62357007-10","pancan-18-cg14428146-chr8_23563822_23563978-18","pancan-19-cg13324546-chr8_23563978_23564101-19", "pancan-20-cg22747746-chr8_23564185_23564337-20","pancan-21-cg14038391-chr10_102900030_102900174-21","pancan-25-cg00986824-chr12_75601394_75601509-25","pancan-26-cg07614018-chr19_18811452_18811616-26")
) # grabs just the pancancer markers

Pancancer_X4 <- Pancancer_X4[!(Pancancer_X4$numReads < 5),]

Pancancer_X4Graph <- ggplot(data = Pancancer_X4) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Pancancer 
18387X4")) +
  ylab("Amplicon count") +
  ylim(0,100)

# Pancancer X6
Pancancer_X6 <- X6[,c(2,8)]
Pancancer_X6 <-Pancancer_X6 %>% filter(
  locus %in% c("pancan-8-cg04739647-chr2_176987433_176987545-8", "pancan-10-cg20072171-chr3_62356850_62357007-10","pancan-18-cg14428146-chr8_23563822_23563978-18","pancan-19-cg13324546-chr8_23563978_23564101-19", "pancan-20-cg22747746-chr8_23564185_23564337-20","pancan-21-cg14038391-chr10_102900030_102900174-21","pancan-25-cg00986824-chr12_75601394_75601509-25","pancan-26-cg07614018-chr19_18811452_18811616-26")
) # grabs just the pancancer markers

Pancancer_X6 <- Pancancer_X6[!(Pancancer_X6$numReads < 5),]

Pancancer_X6Graph <- ggplot(data = Pancancer_X6) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Pancancer 
18387X6")) +
  ylab("Amplicon count")

# Pancancer X7
Pancancer_X7 <- X7[,c(2,8)]
Pancancer_X7 <-Pancancer_X7 %>% filter(
  locus %in% c("pancan-8-cg04739647-chr2_176987433_176987545-8", "pancan-10-cg20072171-chr3_62356850_62357007-10","pancan-18-cg14428146-chr8_23563822_23563978-18","pancan-19-cg13324546-chr8_23563978_23564101-19", "pancan-20-cg22747746-chr8_23564185_23564337-20","pancan-21-cg14038391-chr10_102900030_102900174-21","pancan-25-cg00986824-chr12_75601394_75601509-25","pancan-26-cg07614018-chr19_18811452_18811616-26")
) # grabs just the pancancer markers

Pancancer_X7 <- Pancancer_X7[!(Pancancer_X7$numReads < 5),]

Pancancer_X7Graph <- ggplot(data = Pancancer_X7) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Pancancer 
18387X7")) +
  ylab("Amplicon count")

# Pancancer X8
Pancancer_X8 <- X8[,c(2,8)]
Pancancer_X8 <-Pancancer_X8 %>% filter(
  locus %in% c("pancan-8-cg04739647-chr2_176987433_176987545-8", "pancan-10-cg20072171-chr3_62356850_62357007-10","pancan-18-cg14428146-chr8_23563822_23563978-18","pancan-19-cg13324546-chr8_23563978_23564101-19", "pancan-20-cg22747746-chr8_23564185_23564337-20","pancan-21-cg14038391-chr10_102900030_102900174-21","pancan-25-cg00986824-chr12_75601394_75601509-25","pancan-26-cg07614018-chr19_18811452_18811616-26")
) # grabs just the pancancer markers

Pancancer_X8 <- Pancancer_X8[!(Pancancer_X8$numReads < 5),]

Pancancer_X8Graph <- ggplot(data = Pancancer_X8) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Pancancer 
18387X8")) +
  ylab("Amplicon count")

ggarrange(Pancancer_X1Graph, Pancancer_X2Graph, 
          Pancancer_X3Graph, Pancancer_X4Graph,
          Pancancer_X5Graph, Pancancer_X6Graph,
          Pancancer_X7Graph,Pancancer_X8Graph,
          ncol = 2, nrow = 4)  
