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
print('ZZ locus 4:', count_ZZ, 'Zz locus 4:', count_Zz, 'zZ locus 4:', count_zZ, 'zz locus 4:', count_zz)

# How many of the first Zs are methylated in locus 4?
count_locus4 = 0
for i in range(len(z_stringList4)):
    # print('[{}]{}'.format(i, z_stringList3[i]))
    # print('[{}]{}'.format(i, z_stringList3[i][0]))
    if z_stringList4[i][0][0] == 'Z':
        count_locus4 += 1
    elif z_stringList4[i][0][0] == 'z':
       count_locus4 == 1
print("The number of first Z's for locus 4 that are methylated is:", count_locus4)

# First 6 Zs of locus 4
count_ZZZZZZ = 0
count_zzzzzz = 0
for i in range(len(z_stringList4)):
    if z_stringList4[i][0][:6] == 'ZZZZZZ':
        count_ZZZZZZ += 1
    elif z_stringList4[i][0][:6] == 'zzzzzz':
        count_zzzzzz += 1
print('ZZZZZZ locus 4:', count_ZZZZZZ, 'zzzzzz locus 4:', count_zzzzzz)

# blood marker 7
# there are 9 Zs in the z string
# subset the data by locus 7 and add the z strings to a list
locus_7 = df.loc[df['locus'] == 'blood-7-cg07218880-chr13_115046160_115046282', ['consensusZstring_0.9']]
z_stringList7 = locus_7.values.tolist()

# first 4 zs of marker 7
count_ZZZZ = 0
count_zzzz = 0
count_Zzzz = 0
count_zZzz = 0
count_zzZz = 0
count_zzzZ = 0
count_ZZzz = 0
count_zzZZ = 0
count_ZZZz = 0
count_zzzZ = 0

for i in range(len(z_stringList7)):
    if z_stringList7[i][0][:4] == 'ZZZZ':
        count_ZZZZ += 1
    elif z_stringList7[i][0][:4] == 'zzzz':
        count_zzzz += 1
    elif z_stringList7[i][0][:4] == 'Zzzz':
        count_Zzzz += 1
    elif z_stringList7[i][0][:4] == 'zZzz':
        count_zZzz += 1
    elif z_stringList7[i][0][:4] == 'zzZz':
        count_zzZz += 1
    elif z_stringList7[i][0][:4] == 'zzzZ':
        count_zzzZ += 1
    elif z_stringList7[i][0][:4] == 'ZZzz':
        count_ZZzz += 1
    elif z_stringList7[i][0][:4] == 'zzZZ':
        count_zzZZ += 1
    elif z_stringList7[i][0][:4] == 'ZZZz':
        count_ZZZz += 1
    elif z_stringList7[i][0][:4] == 'zzzZ':
        count_zzzZ += 1
print(count_ZZZZ, count_zzzz, count_Zzzz, count_zZzz, count_zzZz, count_zzzZ, count_ZZzz, count_zzZZ, count_ZZZz, count_zzzZ)












