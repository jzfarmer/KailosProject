[![Anaconda-Server Badge](https://anaconda.org/bioconda/ctseq/badges/installer/conda.svg)](https://anaconda.org/bioconda/ctseq)

# ctseq
ctseq is a pipeline to analyze methylation patch PCR data.

### Current version:
 - v0.0.3.1

### Requirements

 - Python >= 3.7

### Fastq file info


 - ctseq assumes:
	 - Each sample will have
		 - one fastq file containing your forward reads
		 - one fastq file containing your reverse reads
		 - one fastq file containing your unique molecular identifiers (UMIs)
		 >If you have multiple forward read files, etc for a single sample, please concatenate them to follow the format above and please make sure the read names are in the same order for both the forward and reverse fastq files

		 > if you don't have a separate fastq file containing your UMIs, that's okay as long as your UMI's are included in the read names as follows:
	 ```@M01806:488:000000000-J36GT:1:1101:15963:1363:GTAGGTAAAGTG1:N:0:CGAGTAAT``` where 'GTAGGTAAAGTG' is the UMI

	 - Your fastq files are named with your sample name first followed by "_"
		 >e.g. 17675X9_200103_A00421_0144_BHJLTTDRXX_S35_L001_R1_001.fastq.gz
'	 17675X9' is the sample name
-	ctseq will analyze all fastq files in the designated directory. If you want samples from different sequencing runs analyzed together, please include them all in the same directory.



## Installation

### Docker

#### Option 1: Download already-built container from DockerHub
Replace 'v0.0.1' with the version of ctseq you want to clone and build. The latest version number is found at the top of this README (a list of all the versions you can download are listed [here](https://hub.docker.com/r/ryanhmiller/ctseq/tags)).
```
# download docker file
docker pull ryanhmiller/ctseq:v0.0.1
```
or...

#### Option 2: Build container yourself locally
Get Dockerfile
```
git clone https://github.com/ryanhmiller/ctseq
```

Move into ```ctseq``` directory
```
cd ctseq
```

Build Docker container (substitute ```ctseqdocker``` out for your desired Docker container name)
```
docker build -t ctseqdocker .
```

#### Run Docker container
Run container
```
# Command to run container if you built the docker container yourself. Use the container name you specified in place of 'ctseqdocker'
docker run -it ctseqdocker

# Command to run if you pulled the Docker container from DockerHub, using the correct version number in place of 'v0.0.1'
docker run -it -v /users/ryan/data/methylationData/17879R/:/myOutputDir ryanhmiller/ctseq:v0.0.1
```


Run Docker container interactively with access to an outside directory.
```
# Command if you built the container yourself. Substitute correct container name in place of 'ctseqdocker'
docker run -it -v /users/ryan/data/methylationData/17879R/:/myOutputDir ctseqdocker

# Command if you pulled container from DockerHub. Substitute correct version number in place of 'v0.0.1'
docker run -it -v /users/ryan/data/methylationData/17879R/:/myOutputDir ryanhmiller/ctseq:v0.0.1
```
'/users/ryan/data/methylationData/17879R/' represents the directory you want visible to your Docker container and it will be visible as '/myOutputDir' when you are in the container. You are more than welcome to put your fastq and reference (.fa) files in the same directory so you only have to mount one directory to your Docker container


More [info](https://docs.docker.com/storage/volumes/) from Docker about volumes and mounting directories


Exit Docker container
```
exit
```

### Singularity
If you want to use a Docker container of ctseq but you do not have privileges to run Docker on your system (e.g. a high performance compute environments at a university, etc) you can run the Docker container of ctseq in Singularity


Download Docker image from cloud and make Singularity container for it ('.sif' file). Replace 'ctseqsingularity.sif' with whatever you want your Singularity container file to be called (with extension '.sif') and replace 'v0.0.1' with the version of ctseq you want to clone and build. The latest version number is found at the top of this README (a list of all the versions you can download are listed [here](https://hub.docker.com/r/ryanhmiller/ctseq/tags)).
```
singularity build ctseqsingularity.sif docker://ryanhmiller/ctseq:v0.0.1
```

Run ctseq in Singularity. Your whole file system will be visible to Singularity so you won't need to mount any directories, etc.
```
singularity exec ctseqtest.sif ctseq analyze \
	--refDir /users/ryan/data/ref/breastCancerPanel \
	--dir /users/ryan/data/methylationData/17879R \
	--umiType separate \
	--umiLength 12 \
	--forwardExt R1_001.fastq.gz \
	--reverseExt R3_001.fastq.gz \
	--umiExt R2_001.fastq.gz \
	--cutadaptCores 18 \
	--bismarkCores 6 \
	--processes 10 \
	--nameRun 17879R
```

### Conda (not up to date)
Install Conda if you do not have it already
>Conda installation [instructions](https://docs.conda.io/projects/conda/en/latest/user-guide/install/linux.html#install-linux-silent) (Linux). Follow instructions to install 'Miniconda'

Create new environment in which to run ctseq (recommended)
```
conda create --name myEnvName python=3.7
```

Activate Conda environment
```
conda activate myEnvName
```

Install ctseq (from ```bioconda``` channel) in newly created environment
```
conda install -c bioconda ctseq
```

Step out of Conda environment
```
conda deactivate
```

Now whenever you want to run ctseq you will just want to activate this Conda environment you just created and run your ctseq commands.


## Files needed to run pipeline
### 1) Fragment reference file (required)
Fasta file (with extension '.fa') containing the reference sequences of your desired patch PCR fragments. Please add 'AGAGAATGAGGAAGGTGGGGAGT' to the beginning of each reference sequence and 'AGTGTGGGAGGGTAGTTGGTGTT' to the end of each reference sequences. These are the adapter sequences attached to your fragments and including them in your reference sequences aids in cutting adapter and aligning your reads to the reference sequences.

Example contents of reference file (```breastCancerPanelReference.fa```)
```
>chr1_714463_714572-cg04496485
AGAGAATGAGGAAGGTGGGGAGTTGAGCCTGGGTACGTGCGCTCCACAACGCCTCCCCCAGCCAGGGCCCGGGGATCCCCGGGAGCGTCCCCGGCTACCTGGCGCCGCTCATCCTGGGTAGGGTCGGCCCCCAGTGTGGGAGGGTAGTTGGTGTT
>chr1_8014372_8014524-cg02737782
AGAGAATGAGGAAGGTGGGGAGTCAGGTCAGTCGGTAGGTTTCCGGCGCCCAGCGCCCCGTGGGAGTTGTGTCTGGTGGCCCACGCTGGGGGGGGGCTCTTCACACTGGTGGGCGCAGAGGCGAAGCCGTTCCCAGGGCCCCTCACAGAACTCGGTGTCAGAATTTCCCCCCTTGAGTGTGGGAGGGTAGTTGGTGTT
>chr1_26662532_26662609-cg23053573
AGAGAATGAGGAAGGTGGGGAGTCAGCCCCGCCTCTGCCCCAGCGCCCCCAGCCCTCCGCCCCTCCACGTTCTCACCTGCCGCCGTGGACCCGGCAGGACAGTGTGGGAGGGTAGTTGGTGTT
>chr1_33938185_33938321-cg18139020_cg13303553
AGAGAATGAGGAAGGTGGGGAGTTCAGACGTTCCATTCCCAGGGTGGCGCCGCTCGGACTCCGCGTCCCAGCATTCCCCGCACGAGCCCGGGAGCACTTCCGCCCTGTTGTGAAGTGGGTGTCTCGGTGGGTGAGTCCGGGTGGCGGGGCGGGGGCAGCAGTGTGGGAGGGTAGTTGGTGTT
```

### 2) Fastq files (required)
Files containing your methylation patch PCR sequencing data. Uncompressed (.fastq) or compressed (.fastq.gz) data files are acceptable

### 3) Fragment info file (required if plotting results)
This file will contain the row annotation information for your fragments when making heatmaps. The two necessary columns are the first column which should be the name of the fragments and another column called fragOrder showing the order you wish the fragments to be in when you make the molecule depth plot.


testFragInfo.txt
```
Fragment	length	totalCGs	GCcontent	freeEnergy	fragOrder
chr19_15342654_15342820-cg03562044	166	15	0.686746987951807	-63.5	39
chr6_26044142_26044281-cg15387132_cg07701237_cg26426142	139	8	0.460431654676259	-30.5	166
chr6_26044281_26044387-cg02221866	106	8	0.537735849056604	-31.5	136
```


## Pipeline
### Note about paths
When designating paths to directories with ctseq, please use the full path ```/the/full/path/to/my/directory``` or the path relative to your home directory ```~/path/to/my/directory```
If you do not use one of the directory flags (e.g. ```--refDir``` or ```--dir```), ctseq will just look in your current directory for the necessary files
### Step 1: Make methylation reference files
This is necessary so we can take the fastq files from the chemically (bisulfite) or enzymatically (EM-seq) converted DNA and determine the methylation state of each CpG site.

Command: ```make_methyl_ref```
Options:
```
-h, --help		command help
--refDir 		(optional) Path to directory where you want to build 		
			your methylation reference files. Directory must contain
			a reference '.fa' file containing the reference 		
			sequences of your fragments.
```
Example usage:
```
ctseq make_methyl_ref \
	--refDir /users/ryan/ref/breastCancerPanel
```

### Step 2: Analyze your data
Now we want to call and count the number of methylated/unmethylated molecules in your data

Command: ```analyze```
Options:
```
-h, --help  		command help
---------------------------------
--umiType {separate,inline}		(required) Choose 'separate' if the UMIs for the reads are contained in a separate fastq file where the line after the read name is the UMI. Choose 'inline' if the UMIs are already included in the forward/reverse read fastq files in the following format:
'@M01806:488:000000000-J36GT:1:1101:15963:1363:GTAGGTAAAGTG1:N:0:CGAGTAAT' where 'GTAGGTAAAGTG' is the UMI

--umiLength			(required) length of your UMIs

--forwardExt		(required) Unique extension of fastq files containing your FORWARD reads. Make sure to include '.gz' if your files are compressed

--reverseExt		(required) Unique extension of fastq files containing your REVERSE reads. Make sure to include '.gz' if your files are compressed

--umiExt	 		Unique extension of fastq files containing the UMIs (This flag is REQUIRED if UMIs are contained in separate fastq file. Flag is not applicable if your UMIs are inline). Make sure to include '.gz' if your files are compressed.

--nameRun 			(required) Desired prefix for final output files
---------------------------------
--dir 				(optional) Path to directory where you have your fastq files.

--refDir			(optional) Path to directoyr with your reference '.fa' file as well as the methylation reference files that you built in Step 1.

--forwardAdapter	(optional) adapter sequence to remove from FORWARD reads (default=AGTGTGGGAGGGTAGTTGGTGTT)

--reverseAdapter 	(optional) adapter sequence to remove from REVERSE reads (default=ACTCCCCACCTTCCTCATTCTCTAAGACGGTGT)

--cutadaptCores 	(optional) number of cores to use when cutting the adapters from your reads with Cutadapt (default=1). Highly recommended to run with more than 1 core.

--bismarkCores		(optional) number of cores to use when aligning your reads with Bismark (default=1). Highly recommended to run with more than 1 core, try starting with 6 cores if running on a machine with at least 128 GB of available RAM

--consensus			(optional) when looking at all the reads with the same UMI, what ratio of the reads need to be methylated at a particular locus to believe that methylation call is real? (default=0.9)

--processes 		(optional) number of processes used to call unique molecules as well as methylated molecules from all the read data (default=1). Try running with more than 1 if resources allow

--umiThreshold 		(optional) UMIs with this edit distance will be collapsed together (default=0, i.e. don't collapse)

--umiCollapseAlg 	(optional) algorithm used to collapse UMIs
(default=directional)

--cisCG 			(optional) cis-CG threshold to determine if a molecule is methylated (default=0.75)

--moleculeThreshold (optional)	number of reads needed to be counted as a unique molecule (default=5)
```
Example usage:
```
ctseq analyze \
	--refDir /users/ryan/data/ref/breastCancerPanel \
	--dir  /users/ryan/data/methylationData/17879R \
	--umiType separate \
	--umiLength 12 \
	--forwardExt R1_001.fastq.gz \
	--reverseExt R3_001.fastq.gz \
	--umiExt R2_001.fastq.gz \
	--cutadaptCores 18 \
	--bismarkCores 6 \
	--processes 10 \
	--nameRun 17879R
```

### Step 3: Plot results
This command will generate several graphs to summarize the methylation of data analyzed

Command:
```
ctseq plot
```

Usage:
```
--dir		(optional) Path to directory where you have your plot input files. If no '--dir' is specified, ctseq will look in your current directory
--fragInfo	(required) Name of file containing your fragment info for this sequencing run. If not in same directory as your plot input files, please designate full path to the 'fragInfo' file.
```

Example usage:
```
ctseq plot \
	--dir /users/ryan/data/methylationData/17879R \
	--fragInfo testFragInfo.txt
```

#### Fragment info file
This tab-delimited file will contain the row annotation information for your fragments when making heatmaps. The two necessary columns are the first column with the fragment names and another column called ```fragOrder``` showing the order you wish the fragments to be in when you make the molecule depth plot.

testFragInfo.txt
```
Fragment	length	totalCGs	GCcontent	freeEnergy	fragOrder
chr19_15342654_15342820-cg03562044	166	15	0.686746987951807	-63.5	39
chr6_26044142_26044281-cg15387132_cg07701237_cg26426142	139	8	0.460431654676259	-30.5	166
chr6_26044281_26044387-cg02221866	106	8	0.537735849056604	-31.5	136
```

#### Sample info file (optional)
When plotting, you can also make use of the sample info file. This is a tab-delimited file containing any extra information about each sample you want to be shown on your plots. Make sure your sample info file name ends in ```_sampleInfo.txt``` and is located in the same directory as your output files from ctseq.

test_sampleInfo.txt
```
sample	info
17879X1	1%_titration
17879X2	0.75%_titration
17879X3	0.50%_titration
17879X4	0.25%_titration
17879X5	0.01%_titration
17879X6	0.00%_titration
```


### plot_multiple: Plot data together from more than one sequencing run
This command combines the data from multiple sequencing runs (located in separate directories) and plots the data together.

Command:
```
ctseq plot_multiple
```

Usage:
```
--dir		(optional) Path to directory where you want your plots to be created. If no '--dir' is given, ctseq will create the plots in your current working directory. Remember to include a file ending in '_directories.txt\ containing the paths of the directories containing the data you want to plot'
--fragInfo	(required) Name of file containing your fragment info for this sequencing run. If not in same directory as '--dir', please designate full path to the 'fragInfo' file.
--name		(required) Desired name to be used as the prefix for the file names of these plots
```

#### Directories file:
To plot data from multiple sequencing runs, you will need a file containing the paths of each directory containing data you want to plot. Each path must be on a separate line and the file name must end in ```_directories.txt```. This file must be located at the directory indicated by ```--dir``` (or the current working directory if no ```--dir``` is specified)

example_directories.txt
```
/users/ryan/data/methylationData/17879R
/users/ryan/data/methylationData/17880R
/users/ryan/data/methylationData/17883R
/users/ryan/data/methylationData/17885R
```
Example usage:
```
ctseq plot_multiple \
	--dir /users/ryan/data/methylationData/17879R \
	--fragInfo testFragInfo.txt \
	--name TitrationReplicates
```


### *Advanced usage for ```analyze``` (under construction...)

```ctseq analyze``` performs many different actions which can actually be run individually if wanted...

Under construction...
