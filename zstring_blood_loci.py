import pandas as pd
import os
from dataclasses import dataclass
import logging
import time
# read in the sample with the just the blood loci
# get rid of \t and \n separators

# sets the number of z positions for each locus, ie there's 6 Zs in the z string for locus 3
# creates empty lists for each position for each Z
@dataclass
class locus_counts:
    locus_3: [6]
    locus_4: [8]
    locus_7: [9]
    locus_2: [11]
    def __init__(self):
        self.locus_3 = [[0,0] for i in range(6)]
        self.locus_4 = [[0,0] for i in range(8)]
        self.locus_7 = [[0,0] for i in range(9)]
        self.locus_2 = [[0,0] for i in range(11)]
    
    def __add__(self, other):
        new_count = locus_counts()
        for (self3, other3, i) in zip(self.locus_3, other.locus_3, range(len(other.locus_3))): 
            other3_Z, other3_z = other3
            self3_Z, self3_z = self3
            new_count.locus_3[i] = [self3_Z + other3_Z, self3_z + other3_z]
        for (self4, other4, i) in zip(self.locus_4, other.locus_4, range(len(other.locus_4))): 
            other4_Z, other4_z = other4
            self4_Z, self4_z = self4
            new_count.locus_4[i] = [self4_Z + other4_Z, self4_z + other4_z]
        for (self7, other7, i) in zip(self.locus_7, other.locus_7, range(len(other.locus_7))): 
            other7_Z, other7_z = other7
            self7_Z, self7_z = self7
            new_count.locus_7[i] = [self7_Z + other7_Z, self7_z + other7_z]
        for (self2, other2, i) in zip(self.locus_2, other.locus_2, range(len(other.locus_2))): 
            other2_Z, other2_z = other2
            self2_Z, self2_z = self2
            new_count.locus_2[i] = [self2_Z + other2_Z, self2_z + other2_z]
        return new_count
    def addZ(self, locus, position):
        if locus == 3:
            self.locus_3[position][0] += 1
        elif locus == 4:
            self.locus_4[position][0] += 1
        elif locus == 7:
            self.locus_7[position][0] += 1
        elif locus == 2:
            self.locus_2[position][0] += 1
        else:
            logging.warning('invalid locus')
    def addz(self, locus, position):
        if locus == 3:
            self.locus_3[position][1] += 1
        elif locus == 4:
            self.locus_4[position][1] += 1
        elif locus == 7:
            self.locus_7[position][1] += 1
        elif locus == 2:
            self.locus_2[position][1] += 1
        else:
            logging.warning('invalid locus')
    # returns the count of Zs and zs at a specified locus and position
    def atPosition(self, locus, position):
        if locus == 3:
            self.locus_3[position]
        elif locus == 4:
            self.locus_4[position]
        elif locus == 7:
            self.locus_7[position]
        elif locus == 2:
            self.locus_2[position]
        else:
            logging.warning('invalid locus')
        

def countZstring(filename):

    df = pd.read_csv(filename, sep='\t', lineterminator='\r') 
    # logging.debug(f"{filename} : file read!")
    df = df.replace('\t',' ', regex=True)
    df = df.replace('\n',' ', regex=True)
    # logging.debug(df)

    # check the data frame to make sure everything read in correctly
    #for (columnName, columnData) in df.iteritems():
    # logging.debug('Colunm Name : ', columnName)
    # logging.debug('Column Contents : ', columnData.values)

    # locus 3
    # subset the dataframe by locus 3 and the z string
    locus_3 = df.loc[df['locus'] == 'blood-3-cg08535938-chr1_161128968_161129092', ['consensusZstring_0.9']]
    # logging.debug(locus_3)
    # put the z strings for locus 3 in a list to iterate through
    z_stringList3 = locus_3.values.tolist()
    # logging.debug(z_stringList3)

    # counting the number of 'Zs' at each position
    # total number of Zs in locus 3 is 6
    counts = locus_counts()
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
    # logging.debug(len(z_stringList3))
    for i in range(len(z_stringList3)):
        # logging.debug('[{}]{}'.format(i, z_stringList3[i]))
        # logging.debug('[{}]{}'.format(i, z_stringList3[i][0]))
        if z_stringList3[i][0][0] == 'Z':
            count_locus3_1Z += 1
            counts.addZ(3,0)
        else:
            count_locus3_1z += 1
            counts.addz(3,0)
    for i in range(len(z_stringList3)):
        if z_stringList3[i][0][1] == 'Z':
            count_locus3_2Z += 1
            counts.addZ(3,1)
        else:
            count_locus3_2z += 1
            counts.addz(3,1)
    for i in range(len(z_stringList3)):
        if z_stringList3[i][0][2] == 'Z':
            count_locus3_3Z += 1
            counts.addZ(3,2)
        else:
            count_locus3_3z += 1
            counts.addz(3,2)
    for i in range(len(z_stringList3)):
        if z_stringList3[i][0][3] == 'Z':
            count_locus3_4Z += 1
            counts.addZ(3,3)
        else:
            count_locus3_4z += 1
            counts.addz(3,3)
    for i in range(len(z_stringList3)):
        if z_stringList3[i][0][4] == 'Z':
            count_locus3_5Z += 1
            counts.addZ(3,4)
        else:
            count_locus3_5z += 1
            counts.addz(3,4)
    for i in range(len(z_stringList3)):
        if z_stringList3[i][0][5] == 'Z':
            count_locus3_6Z += 1
            counts.addZ(3,5)
        else:
            count_locus3_6z += 1
            counts.addz(3,5)
    logging.debug('Locus 3 Position 1 Zs:', count_locus3_1Z, 'Locus 3 Position 1 zs:', count_locus3_1z)
    logging.debug('Locus 3 Position 2 Zs:', count_locus3_2Z, 'Locus 3 Position 2 zs:', count_locus3_2z)
    logging.debug('Locus 3 Position 3 Zs:', count_locus3_3Z, 'Locus 3 Position 3 zs:', count_locus3_3z)
    logging.debug('Locus 3 Position 4 Zs:', count_locus3_4Z, 'Locus 3 Position 4 zs:', count_locus3_4z)
    logging.debug('Locus 3 Position 5 Zs:', count_locus3_5Z, 'Locus 3 Position 5 zs:', count_locus3_5z)
    logging.debug('Locus 3 Position 6 Zs:', count_locus3_6Z, 'Locus 3 Position 6 zs:', count_locus3_6z)

    # blood marker 4
    # subset the dataframe by locus 4 and the z string
    locus_4 = df.loc[df['locus'] == 'blood-4-cg16817180-chr4_981454_981558', ['consensusZstring_0.9']]
    # put the z strings in a list to iterate through
    z_stringList4 = locus_4.values.tolist()
    # check to make sure every amplicon is present 
    # logging.debug(len(z_stringList4))

    logging.debug('')
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
            counts.addZ(4,0)
        else:
            count_locus4_1z += 1
            counts.addz(4,0)
    for i in range(len(z_stringList4)):
        if z_stringList4[i][0][1] == 'Z':
            count_locus4_2Z += 1
            counts.addZ(4,1)
        else:
            count_locus4_2z += 1
            counts.addz(4,1)
    for i in range(len(z_stringList4)):
        if z_stringList4[i][0][2] == 'Z':
            count_locus4_3Z += 1
            counts.addZ(4,2)
        else:
            count_locus4_3z += 1
            counts.addz(4,2)
    for i in range(len(z_stringList4)):
        if z_stringList4[i][0][3] == 'Z':
            count_locus4_4Z += 1
            counts.addZ(4,3)
        else:
            count_locus4_4z += 1
            counts.addz(4,3)
    for i in range(len(z_stringList4)):
        if z_stringList4[i][0][4] == 'Z':
            count_locus4_5Z += 1
            counts.addZ(4,4)
        else:
            count_locus4_5z += 1
            counts.addz(4,4)
    for i in range(len(z_stringList4)):
        if z_stringList4[i][0][5] == 'Z':
            count_locus4_6Z += 1
            counts.addZ(4,5)
        else:
            count_locus4_6z += 1
            counts.addz(4,5)
    for i in range(len(z_stringList4)):
        if z_stringList4[i][0][6] == 'Z':
            count_locus4_7Z += 1
            counts.addZ(4,6)
        else:
            count_locus4_7z += 1
            counts.addz(4,6)
    for i in range(len(z_stringList4)):
        if z_stringList4[i][0][7] == 'Z':
            count_locus4_8Z += 1
            counts.addZ(4,7)
        else:
            count_locus4_8z += 1
            counts.addz(4,7)
    logging.debug('Locus 4 Position 1 Zs:', count_locus4_1Z, 'Locus 4 Position 1 zs:', count_locus4_1z)
    logging.debug('Locus 4 Position 2 Zs:', count_locus4_2Z, 'Locus 4 Position 2 zs:', count_locus4_2z)
    logging.debug('Locus 4 Position 3 Zs:', count_locus4_3Z, 'Locus 4 Position 3 zs:', count_locus4_3z)
    logging.debug('Locus 4 Position 4 Zs:', count_locus4_4Z, 'Locus 4 Position 4 zs:', count_locus4_4z)
    logging.debug('Locus 4 Position 5 Zs:', count_locus4_5Z, 'Locus 4 Position 5 zs:', count_locus4_5z)
    logging.debug('Locus 4 Position 6 Zs:', count_locus4_6Z, 'Locus 4 Position 6 zs:', count_locus4_6z)
    logging.debug('Locus 4 Position 7 Zs:', count_locus4_7Z, 'Locus 4 Position 7 zs:', count_locus4_7z)
    logging.debug('Locus 4 Position 8 Zs:', count_locus4_8Z, 'Locus 4 Position 8 zs:', count_locus4_8z)

    logging.debug('')
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
            counts.addZ(7,0)
        else:
            count_locus7_1z += 1
            counts.addz(7,0)
    for i in range(len(z_stringList7)):
        if z_stringList7[i][0][1] == 'Z':
            count_locus7_2Z += 1
            counts.addZ(7,1)
        else:
            count_locus7_2z += 1
            counts.addz(7,1)
    for i in range(len(z_stringList7)):
        if z_stringList7[i][0][2] == 'Z':
            count_locus7_3Z += 1
            counts.addZ(7,2)
        else:
            count_locus7_3z += 1
            counts.addz(7,2)
    for i in range(len(z_stringList7)):
        if z_stringList7[i][0][3] == 'Z':
            count_locus7_4Z += 1
            counts.addZ(7,3)
        else:
            count_locus7_4z += 1
            counts.addz(7,3)
    for i in range(len(z_stringList7)):
        if z_stringList7[i][0][4] == 'Z':
            count_locus7_5Z += 1
            counts.addZ(7,4)
        else:
            count_locus7_5z += 1
            counts.addz(7,4)
    for i in range(len(z_stringList7)):
        if z_stringList7[i][0][5] == 'Z':
            count_locus7_6Z += 1
            counts.addZ(7,5)
        else:
            count_locus7_6z += 1
            counts.addz(7,5)
    for i in range(len(z_stringList7)):
        if z_stringList7[i][0][6] == 'Z':
            count_locus7_7Z += 1
            counts.addZ(7,6)
        else:
            count_locus7_7z += 1
            counts.addz(7,6)
    for i in range(len(z_stringList7)):
        if z_stringList7[i][0][7] == 'Z':
            count_locus7_8Z += 1
            counts.addZ(7,7)
        else:
            count_locus7_8z += 1
            counts.addz(7,7)
    for i in range(len(z_stringList7)):
        if z_stringList7[i][0][8] == 'Z':
            count_locus7_9Z += 1
            counts.addZ(7,8)
        else:
            count_locus7_9z += 1
            counts.addz(7,8)
    logging.debug('Locus 7 Position 1 Zs:', count_locus7_1Z, 'Locus 7 Position 1 zs:', count_locus7_1z)
    logging.debug('Locus 7 Position 2 Zs:', count_locus7_2Z, 'Locus 7 Position 2 zs:', count_locus7_2z)
    logging.debug('Locus 7 Position 3 Zs:', count_locus7_3Z, 'Locus 7 Position 3 zs:', count_locus7_3z)
    logging.debug('Locus 7 Position 4 Zs:', count_locus7_4Z, 'Locus 7 Position 4 zs:', count_locus7_4z)
    logging.debug('Locus 7 Position 5 Zs:', count_locus7_5Z, 'Locus 7 Position 5 zs:', count_locus7_5z)
    logging.debug('Locus 7 Position 6 Zs:', count_locus7_6Z, 'Locus 7 Position 6 zs:', count_locus7_6z)
    logging.debug('Locus 7 Position 7 Zs:', count_locus7_7Z, 'Locus 7 Position 7 zs:', count_locus7_7z)
    logging.debug('Locus 7 Position 8 Zs:', count_locus7_8Z, 'Locus 7 Position 8 zs:', count_locus7_8z)
    logging.debug('Locus 7 Position 9 Zs:', count_locus7_9Z, 'Locus 7 Position 9 zs:', count_locus7_9z)

    logging.debug('')

    # blood 2
    # total zs is 11
    locus_2 = df.loc[df['locus'] == 'blood-2-cg08706567_cg13393721-chr1_43815020_43815167', ['consensusZstring_0.9']]
    z_stringList2 = locus_2.values.tolist()

    count_locus2_1Z = 0
    count_locus2_1z = 0
    count_locus2_2Z = 0
    count_locus2_2z = 0 
    count_locus2_3Z = 0
    count_locus2_3z = 0
    count_locus2_4Z = 0
    count_locus2_4z = 0
    count_locus2_5Z = 0
    count_locus2_5z = 0
    count_locus2_6Z = 0
    count_locus2_6z = 0
    count_locus2_7Z = 0
    count_locus2_7z = 0
    count_locus2_8Z = 0
    count_locus2_8z = 0
    count_locus2_9Z = 0
    count_locus2_9z = 0
    count_locus2_10Z = 0
    count_locus2_10z = 0
    count_locus2_11Z = 0
    count_locus2_11z = 0

    for i in range(len(z_stringList2)):
        if z_stringList2[i][0][0] == 'Z':
            count_locus2_1Z += 1
            counts.addZ(2,0)
        else:
            count_locus2_1z += 1
            counts.addz(2,0)
    for i in range(len(z_stringList2)):
        if z_stringList2[i][0][1] == 'Z':
            count_locus2_2Z += 1
            counts.addZ(2,1)
        else:
            count_locus2_2z += 1
            counts.addz(2,1)
    for i in range(len(z_stringList2)):
        if z_stringList2[i][0][2] == 'Z':
            count_locus2_3Z += 1
            counts.addZ(2,2)
        else:
            count_locus2_3z += 1
            counts.addz(2,2)
    for i in range(len(z_stringList2)):
        if z_stringList2[i][0][3] == 'Z':
            count_locus2_4Z += 1
            counts.addZ(2,3)
        else:
            count_locus2_4z += 1
            counts.addz(2,3)
    for i in range(len(z_stringList2)):
        if z_stringList2[i][0][4] == 'Z':
            count_locus2_5Z += 1
            counts.addZ(2,4)
        else:
            count_locus2_5z += 1
            counts.addz(2,4)
    for i in range(len(z_stringList2)):
        if z_stringList2[i][0][5] == 'Z':
            count_locus2_6Z += 1
            counts.addZ(2,5)
        else:
            count_locus2_6z += 1
            counts.addz(2,5)
    for i in range(len(z_stringList2)):
        if z_stringList2[i][0][6] == 'Z':
            count_locus2_7Z += 1
            counts.addZ(2,6)
        else:
            count_locus2_7z += 1
            counts.addz(2,6)
    for i in range(len(z_stringList2)):
        if z_stringList2[i][0][7] == 'Z':
            count_locus2_8Z += 1
            counts.addZ(2,7)
        else:
            count_locus2_8z += 1
            counts.addz(2,7)
    for i in range(len(z_stringList2)):
        if z_stringList2[i][0][8] == 'Z':
            count_locus2_9Z += 1
            counts.addZ(2,8)
        else:
            count_locus2_9z += 1
            counts.addz(2,8)
    for i in range(len(z_stringList2)):
        if z_stringList2[i][0][9] == 'Z':
            count_locus2_10Z += 1
            counts.addZ(2,9)
        else:
            count_locus2_10z += 1
            counts.addz(2,9)
    for i in range(len(z_stringList2)):
        if z_stringList2[i][0][10] == 'Z':
            count_locus2_11Z += 1
            counts.addZ(2,10)
        else:
            count_locus2_11z += 1
            counts.addz(2,10)

    logging.debug('Locus 2 Position 1 Zs:', count_locus2_1Z, 'Locus 2 Position 1 zs:', count_locus2_1z)
    logging.debug('Locus 2 Position 2 Zs:', count_locus2_2Z, 'Locus 2 Position 2 zs:', count_locus2_2z)
    logging.debug('Locus 2 Position 3 Zs:', count_locus2_3Z, 'Locus 2 Position 3 zs:', count_locus2_3z)
    logging.debug('Locus 2 Position 4 Zs:', count_locus2_4Z, 'Locus 2 Position 4 zs:', count_locus2_4z)
    logging.debug('Locus 2 Position 5 Zs:', count_locus2_5Z, 'Locus 2 Position 5 zs:', count_locus2_5z)
    logging.debug('Locus 2 Position 6 Zs:', count_locus2_6Z, 'Locus 2 Position 6 zs:', count_locus2_6z)
    logging.debug('Locus 2 Position 7 Zs:', count_locus2_7Z, 'Locus 2 Position 7 zs:', count_locus2_7z)
    logging.debug('Locus 2 Position 8 Zs:', count_locus2_8Z, 'Locus 2 Position 8 zs:', count_locus2_8z)
    logging.debug('Locus 2 Position 9 Zs:', count_locus2_9Z, 'Locus 2 Position 9 zs:', count_locus2_9z)
    logging.debug('Locus 2 Position 10 Zs:', count_locus2_10Z, 'Locus 2 Position 10 zs:', count_locus2_10z)
    logging.debug('Locus 2 Position 11 Zs:', count_locus2_11Z, 'Locus 2 Position 11 zs:', count_locus2_11z)

    logging.debug('')

    logging.debug('Total Zs for locus 2', len(z_stringList2))
    logging.debug('Total Zs for locus 3', len(z_stringList3))
    logging.debug('Total Zs for locus 4', len(z_stringList4))
    logging.debug('Total Zs for locus 7', len(z_stringList7))
    return counts

# looks in the current directory for .txt files (allmolecules files)
# appends the all molecules files to a list
logging.basicConfig(level=logging.INFO)
ext = []
for file in os.listdir(os.getcwd()):
    filesplit = os.path.splitext(file)
    if filesplit[1] == '.txt':
        ext.append(file)
logging.info(f"found {len(ext)} files")
# counts all the Zs and zs at each position for each locus, added together for each file. 
total_counts = locus_counts()
for e in ext:
    logging.info(f"trying to process file: {e}")
    start = time.time()
    total_counts = total_counts+countZstring(e)
    processing_time = time.time() - start
    logging.info(f"took {processing_time} seconds to process file {e}")

print(f"{total_counts.locus_2}\t{total_counts.locus_3}\t{total_counts.locus_4}\t{total_counts.locus_7}\t")
