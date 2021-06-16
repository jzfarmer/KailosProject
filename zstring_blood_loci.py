import pandas as pd
import numpy as np

# read in the sample with the just the blood loci
# get rid of \t and \n separators
filename = 'AN_sample1.txt'
df = pd.read_csv(filename, sep='\t', lineterminator='\r') 
print(f"{filename} : file read!")
df = df.replace('\t',' ', regex=True)
df = df.replace('\n',' ', regex=True)
print(df)

# check the data frame to make sure everything read in correctly
for (columnName, columnData) in df.iteritems():
    print('Colunm Name : ', columnName)
    print('Column Contents : ', columnData.values)

# subset the dataframe by locus 3 and the z string
locus_3 = df.loc[df['locus'] == 'blood-3-cg08535938-chr1_161128968_161129092', ['consensusZstring_0.9']]
# print(locus_3)
# put the z strings for locus 3 in a list to iterate through
z_stringList3 = locus_3.values.tolist()
# print(z_stringList3)

# is the first z methylated in locus 3? 









