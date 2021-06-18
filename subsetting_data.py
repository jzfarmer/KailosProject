
# script to subset each blood loci and retrieve the methratio for each file

import pandas as pd
import numpy as np

# read in the sample
# get rid of \t and \n separators
filename = '18387X8_allMolecules.txt'
df = pd.read_csv(filename, sep='\t', usecols=['locus', 'methRatio']) 
print(f"{filename} : file read!")
df = df.replace('\t',' ', regex=True)
df = df.replace('\n',' ', regex=True)
# print(df)

# for (columnName, columnData) in df.iteritems():
   #print('Colunm Name : ', columnName)
   # print('Column Contents : ', columnData.values)

locus_1 = df.loc[df['locus'] == 'blood-1-cg07865091-chr1_43814286_43814441', ['methRatio']]
locus_2 = df.loc[df['locus'] == 'blood-2-cg08706567_cg13393721-chr1_43815020_43815167', ['methRatio']]
locus_3 = df.loc[df['locus'] == 'blood-3-cg08535938-chr1_161128968_161129092', ['methRatio']]
locus_4 = df.loc[df['locus'] == 'blood-4-cg16817180-chr4_981454_981558', ['methRatio']]
locus_5 = df.loc[df['locus'] == 'blood-5-cg21448513-chr8_57103511_57103669', ['methRatio']]
locus_6 = df.loc[df['locus'] == 'blood-6-cg09148852-chr12_122235067_122235172', ['methRatio']]
locus_7 = df.loc[df['locus'] == 'blood-7-cg07218880-chr13_115046160_115046282', ['methRatio']]
locus_8 = df.loc[df['locus'] == 'blood-8-cg12952132-chr19_55417539_55417665', ['methRatio']]

# print(type(locus_1))

locus_1.to_csv('locus1.txt', sep = '\t')
locus_2.to_csv('locus2.txt', sep = '\t')
locus_3.to_csv('locus3.txt', sep = '\t')
locus_4.to_csv('locus4.txt', sep = '\t')
locus_5.to_csv('locus5.txt', sep = '\t')
locus_6.to_csv('locus6.txt', sep = '\t')
locus_7.to_csv('locus7.txt', sep = '\t')
locus_8.to_csv('locus8.txt', sep = '\t')

print("Files split!")