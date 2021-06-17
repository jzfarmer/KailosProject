import pandas as pd

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

# locus 3
# subset the dataframe by locus 3 and the z string
locus_3 = df.loc[df['locus'] == 'blood-3-cg08535938-chr1_161128968_161129092', ['consensusZstring_0.9']]
# print(locus_3)
# put the z strings for locus 3 in a list to iterate through
z_stringList3 = locus_3.values.tolist()
# print(z_stringList3)

# counting the number of 'Zs' at each position
# total number of Zs in locus 3 is 6
count_locus3_1Z = 0
count_locus3_1z = 0
count_locus3_2Z = 0
count_locus3_2z = 0 
count_locus3_3Z = 0
count_locus3_3z = 0
count_locus3_4Z = 0
count_locus3_4z = 0
count_locus3_5Z = 0
count_locus3_5z = 0
count_locus3_6Z = 0
count_locus3_6z = 0
# print(len(z_stringList3))
for i in range(len(z_stringList3)):
    # print('[{}]{}'.format(i, z_stringList3[i]))
    # print('[{}]{}'.format(i, z_stringList3[i][0]))
    if z_stringList3[i][0][0] == 'Z':
        count_locus3_1Z += 1
    else:
        count_locus3_1z += 1
for i in range(len(z_stringList3)):
    if z_stringList3[i][0][1] == 'Z':
        count_locus3_2Z += 1
    else:
        count_locus3_2z += 1
for i in range(len(z_stringList3)):
    if z_stringList3[i][0][2] == 'Z':
        count_locus3_3Z += 1
    else:
        count_locus3_3z += 1
for i in range(len(z_stringList3)):
    if z_stringList3[i][0][3] == 'Z':
        count_locus3_4Z += 1
    else:
        count_locus3_4z += 1
for i in range(len(z_stringList3)):
    if z_stringList3[i][0][4] == 'Z':
        count_locus3_5Z += 1
    else:
        count_locus3_5z += 1
for i in range(len(z_stringList3)):
    if z_stringList3[i][0][5] == 'Z':
        count_locus3_6Z += 1
    else:
        count_locus3_6z += 1
print('Locus 3 Position 1 Zs:', count_locus3_1Z, 'Locus 3 Position 1 zs:', count_locus3_1z)
print('Locus 3 Position 2 Zs:', count_locus3_2Z, 'Locus 3 Position 2 zs:', count_locus3_2z)
print('Locus 3 Position 3 Zs:', count_locus3_3Z, 'Locus 3 Position 3 zs:', count_locus3_3z)
print('Locus 3 Position 4 Zs:', count_locus3_4Z, 'Locus 3 Position 4 zs:', count_locus3_4z)
print('Locus 3 Position 5 Zs:', count_locus3_5Z, 'Locus 3 Position 5 zs:', count_locus3_5z)
print('Locus 3 Position 6 Zs:', count_locus3_6Z, 'Locus 3 Position 6 zs:', count_locus3_6z)

# blood marker 4
# subset the dataframe by locus 4 and the z string
locus_4 = df.loc[df['locus'] == 'blood-4-cg16817180-chr4_981454_981558', ['consensusZstring_0.9']]
# put the z strings in a list to iterate through
z_stringList4 = locus_4.values.tolist()
# check to make sure every amplicon is present 
# print(len(z_stringList4))

print('')
# counting number of Zs in each position in locus 4
# 8 total Zs in locus 4 z string
count_locus4_1Z = 0
count_locus4_1z = 0
count_locus4_2Z = 0
count_locus4_2z = 0 
count_locus4_3Z = 0
count_locus4_3z = 0
count_locus4_4Z = 0
count_locus4_4z = 0
count_locus4_5Z = 0
count_locus4_5z = 0
count_locus4_6Z = 0
count_locus4_6z = 0
count_locus4_7Z = 0
count_locus4_7z = 0
count_locus4_8Z = 0
count_locus4_8z = 0

for i in range(len(z_stringList4)):
    if z_stringList4[i][0][0] == 'Z':
        count_locus4_1Z += 1
    else:
        count_locus4_1z += 1
for i in range(len(z_stringList4)):
    if z_stringList4[i][0][1] == 'Z':
        count_locus4_2Z += 1
    else:
        count_locus4_2z += 1
for i in range(len(z_stringList4)):
    if z_stringList4[i][0][2] == 'Z':
        count_locus4_3Z += 1
    else:
        count_locus4_3z += 1
for i in range(len(z_stringList4)):
    if z_stringList4[i][0][3] == 'Z':
        count_locus4_4Z += 1
    else:
        count_locus4_4z += 1
for i in range(len(z_stringList4)):
    if z_stringList4[i][0][4] == 'Z':
        count_locus4_5Z += 1
    else:
        count_locus4_5z += 1
for i in range(len(z_stringList4)):
    if z_stringList4[i][0][5] == 'Z':
        count_locus4_6Z += 1
    else:
        count_locus4_6z += 1
for i in range(len(z_stringList4)):
    if z_stringList4[i][0][6] == 'Z':
        count_locus4_7Z += 1
    else:
        count_locus4_7z += 1
for i in range(len(z_stringList4)):
    if z_stringList4[i][0][7] == 'Z':
        count_locus4_8Z += 1
    else:
        count_locus4_8z += 1
print('Locus 4 Position 1 Zs:', count_locus4_1Z, 'Locus 4 Position 1 zs:', count_locus4_1z)
print('Locus 4 Position 2 Zs:', count_locus4_2Z, 'Locus 4 Position 2 zs:', count_locus4_2z)
print('Locus 4 Position 3 Zs:', count_locus4_3Z, 'Locus 4 Position 3 zs:', count_locus4_3z)
print('Locus 4 Position 4 Zs:', count_locus4_4Z, 'Locus 4 Position 4 zs:', count_locus4_4z)
print('Locus 4 Position 5 Zs:', count_locus4_5Z, 'Locus 4 Position 5 zs:', count_locus4_5z)
print('Locus 4 Position 6 Zs:', count_locus4_6Z, 'Locus 4 Position 6 zs:', count_locus4_6z)
print('Locus 4 Position 7 Zs:', count_locus4_7Z, 'Locus 4 Position 7 zs:', count_locus4_7z)
print('Locus 4 Position 8 Zs:', count_locus4_8Z, 'Locus 4 Position 8 zs:', count_locus4_8z)

print('')
# blood marker 7
# there are 9 Zs in the z string
# subset the data by locus 7 and add the z strings to a list
locus_7 = df.loc[df['locus'] == 'blood-7-cg07218880-chr13_115046160_115046282', ['consensusZstring_0.9']]
z_stringList7 = locus_7.values.tolist()
# count the Zs and zs at each position 
count_locus7_1Z = 0
count_locus7_1z = 0
count_locus7_2Z = 0
count_locus7_2z = 0 
count_locus7_3Z = 0
count_locus7_3z = 0
count_locus7_4Z = 0
count_locus7_4z = 0
count_locus7_5Z = 0
count_locus7_5z = 0
count_locus7_6Z = 0
count_locus7_6z = 0
count_locus7_7Z = 0
count_locus7_7z = 0
count_locus7_8Z = 0
count_locus7_8z = 0
count_locus7_9Z = 0
count_locus7_9z = 0
for i in range(len(z_stringList7)):
    if z_stringList7[i][0][0] == 'Z':
        count_locus7_1Z += 1
    else:
        count_locus7_1z += 1
for i in range(len(z_stringList7)):
    if z_stringList7[i][0][1] == 'Z':
        count_locus7_2Z += 1
    else:
        count_locus7_2z += 1
for i in range(len(z_stringList7)):
    if z_stringList7[i][0][2] == 'Z':
        count_locus7_3Z += 1
    else:
        count_locus7_3z += 1
for i in range(len(z_stringList7)):
    if z_stringList7[i][0][3] == 'Z':
        count_locus7_4Z += 1
    else:
        count_locus7_4z += 1
for i in range(len(z_stringList7)):
    if z_stringList7[i][0][4] == 'Z':
        count_locus7_5Z += 1
    else:
        count_locus7_5z += 1
for i in range(len(z_stringList7)):
    if z_stringList7[i][0][5] == 'Z':
        count_locus7_6Z += 1
    else:
        count_locus7_6z += 1
for i in range(len(z_stringList7)):
    if z_stringList7[i][0][6] == 'Z':
        count_locus7_7Z += 1
    else:
        count_locus7_7z += 1
for i in range(len(z_stringList7)):
    if z_stringList7[i][0][7] == 'Z':
        count_locus7_8Z += 1
    else:
        count_locus7_8z += 1
for i in range(len(z_stringList7)):
    if z_stringList7[i][0][8] == 'Z':
        count_locus7_9Z += 1
    else:
        count_locus7_9z += 1
print('Locus 7 Position 1 Zs:', count_locus7_1Z, 'Locus 7 Position 1 zs:', count_locus7_1z)
print('Locus 7 Position 2 Zs:', count_locus7_2Z, 'Locus 7 Position 2 zs:', count_locus7_2z)
print('Locus 7 Position 3 Zs:', count_locus7_3Z, 'Locus 7 Position 3 zs:', count_locus7_3z)
print('Locus 7 Position 4 Zs:', count_locus7_4Z, 'Locus 7 Position 4 zs:', count_locus7_4z)
print('Locus 7 Position 5 Zs:', count_locus7_5Z, 'Locus 7 Position 5 zs:', count_locus7_5z)
print('Locus 7 Position 6 Zs:', count_locus7_6Z, 'Locus 7 Position 6 zs:', count_locus7_6z)
print('Locus 7 Position 7 Zs:', count_locus7_7Z, 'Locus 7 Position 7 zs:', count_locus7_7z)
print('Locus 7 Position 8 Zs:', count_locus7_8Z, 'Locus 7 Position 8 zs:', count_locus7_8z)
print('Locus 7 Position 8 Zs:', count_locus7_9Z, 'Locus 7 Position 8 zs:', count_locus7_9z)













