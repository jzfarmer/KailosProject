import pandas as pd
import numpy as np

# read in the sample with the just the blood loci
# get rid of \t and \n separators
filename = 'AN_sample1.txt'
df = pd.read_csv(filename, sep='\t', lineterminator='\r') 
# print(f"{filename} : file read!")
df = df.replace('\t',' ', regex=True)
df = df.replace('\n',' ', regex=True)
# print(df)

# check the data frame to make sure everything read in correctly
#for (columnName, columnData) in df.iteritems():
   # print('Colunm Name : ', columnName)
   # print('Column Contents : ', columnData.values)

# subset the dataframe by locus 3 and the z string
locus_3 = df.loc[df['locus'] == 'blood-3-cg08535938-chr1_161128968_161129092', ['consensusZstring_0.9']]
# print(locus_3)
# put the z strings for locus 3 in a list to iterate through
z_stringList3 = locus_3.values.tolist()
# print(z_stringList3)

# how many of the first zs are methylated in locus 3? 
count_locus3 = 0
# print(len(z_stringList3))
for i in range(len(z_stringList3)):
    # print('[{}]{}'.format(i, z_stringList3[i]))
    # print('[{}]{}'.format(i, z_stringList3[i][0]))
    if z_stringList3[i][0][0] == 'Z':
        count_locus3 += 1
    elif z_stringList3[i][0][0] == 'z':
       count_locus3 == 1
print("The number of first Z's for locus 3 that are methylated is:", count_locus3)

# blood marker 4
# subset the dataframe by locus 4 and the z string
locus_4 = df.loc[df['locus'] == 'blood-4-cg16817180-chr4_981454_981558', ['consensusZstring_0.9']]
# put the z strings in a list to iterate through
z_stringList4 = locus_4.values.tolist()
# check to make sure every amplicon is present 
# print(len(z_stringList4))

# How many of the last 2 Z's are methylated in locus 4? 
# 8 total Zs in locus 4 z string
count_ZZ = 0
count_Zz = 0
count_zZ = 0
count_zz = 0

for i in range(len(z_stringList4)):
    if z_stringList4[i][0][6:] == 'ZZ':
        count_ZZ += 1
    elif z_stringList4[i][0][6:] == 'Zz':
        count_Zz += 1
    elif z_stringList4[i][0][6:] == 'zZ':
        count_zZ += 1
    else:
        count_zz += 1
print('ZZ locus 4:', count_ZZ, 'Zz locus 4:', count_Zz, 'zZ locus 4:', count_zZ, 'zz loucs 4', count_zz)









