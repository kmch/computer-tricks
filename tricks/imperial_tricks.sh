# I'VE COPIED OPENDECT EXEC TO /usr/local/bin/dtect
# WHOLE PACKAGE, HOWEVER, RESIDES IN ~/OpendTect
# AND DATA DIR IS ~/opendtect
##

# PASSING ARGUMENTS INTO pbs SCRIPT
qsub -v arg_name=arg_value sricpt.pbs
##

# UNFREEZE SESSION
enter  ~  .
##

# ssh WITHOUT PASSWORD (PUBLIC AND PRIVATE KEYS)
# 1. Create public and private keys using ssh-key-gen on local-host
ssh-keygen
[enter]
[enter]
[enter]
# 2. Copy the public key to remote-host using ssh-copy-id
ssh-copy-id -i ~/.ssh/id_rsa.pub kmc3817@login.cx1.hpc.ic.ac.uk
##


# FIRST I HAVE TO CONNECT TO VPN!!!
/media/mpaulatt/data2/paulatto/Work/P17/Profile17_DATA/SEGY_FILT
ssh -Y kmc3817@ese-kmc3817.ese.ic.ac.uk # MY OWN COMPUTER (I ONLY NEEDED TO TYPE hostname TO GET ese-kmc3817
ssh -Y kmc3817@ese-mpaulatt.ese.ic.ac.uk
ssh -Y kmc3817@auk-8.ese.ic.ac.uk # OR OTHER NO. INSTEAD OF 8
ssh -Y kmc3817@login.cx1.hpc.ic.ac.uk
# OPTIONS
-X     # Enables X11 forwarding
-Y     # Enables trusted X11 forwarding
##

# CX1
# PRIVATE QUEUE (CAN BE SUBMITTED FROM ANYWHERE ON CX1 NOT NECESSARILY /project)
qsub -q pqmrwarn -v project_name=caldera2d ../../../prog/run_both.pbs
##
/home/kmc3817 # != SAME PATH ON AUK!
/project/mrwarn/kmc3817 # MP REQUEST
/project/mrwarn_b/kmc3817 # JM REQUEST
/project/mrwarn_b/mpaulatt/2DTestInvert # NO ACCESS (ALLEGEDLY WELL-WORKING 2D FWI OF MARMOUSI)
##

# AUK
/home/kmc3817 # 16GB 
/data/kmc3817 # 200 GB QUOTA LIMIT TO SHARE WITH:
/data/ProMAX/data/kmc3817 ##
SSclient # ProMAX TYPE ANYWHERE, CHANGE TO COARSER GRAPHICS TO PREVENT FREEZING

/data4/bheath/DATA/IMPERIAL_RAW_SEGY # MESSY DATA
/data4/mpaulatt/DATA_PROTEUS/Archive/SEGY # STATE-OF-THE-ART DATA (HYDROPHONE)
/data4/mpaulatt/DATA_PROTEUS/Archive/SEGY_UTM ## 
# UTM coordinates in the normal header locations and local coordinates where
# the cdp (byte 21-24) and cdpt (byte 25-28) normally are. 
# The profile number is under header word ep (byte 17-20)
/data4/mpaulatt/DATA_PROTEUS/Archive/Gathers ## GATHERS CLOSEST TO EACH STATION
/data4/mpaulatt/DATA_PROTEUS/Profi

/data4/mpaulatt/2DTest # SYNTHETIC GENERATION FOR MARMOUSI
/home/mpaulatt/Code/cwp/4/44R5 # NO ACCESS - SU ON AUK

##

# MICHELE'S MACHINE (ssh -Y kmc3817@ese-mpaulatt.ese.ic.ac.uk)
# WHETHER data? IS VISIBLE OR NOT DEPENDS ON WHETHER OR NOT THIS DISK IS MOUNTED BY MP 
/media/mpaulatt/data1/paulatto/DATA/SantoriniTomo/IMPERIAL_RAW_SEGY 
/media/mpaulatt/data2/paulatto/Work/IBFD
/media/mpaulatt/data2/paulatto/Work/IBFD/wavefor2dfs
/media/mpaulatt/data2/paulatto/Work/BenTomo
/media/mpaulatt/data2/paulatto/Work/BenTomo/Profile17

/media/mpaulatt/data2/paulatto/Work/P17/Profile17_DATA/SEGY # PERMISSION DENIED
##


# scp
scp hello.sh kmc3817@login.cx1.hpc.ic.ac.uk:~
##



# Beginner's Guide to HPC at Imperial (24 May 2017)
hpc-support@imperial.ac.uk
# talk to ax4 the same as to cx[1,2]

# cx1 25k cores
# each node has its own small part of memory. only ax4 has shared mem

perms
1st_char-you-group-everybodyelse
1-3-3-3

# there is only login-[2,3] nodes visible to outside
# rest only by queue (PBS)

job=program
#
top
u kmc3817 # SHOW ONLY MY PROCESSES
# OBSERVE PARALLEL PROCESS
top
H
##
# the job requiring more memory than N GB / per core it starts to steal from other codes, which is harder to queue

qstat -q 
# legend
pq* - private queues

#queue you are in depends on what your job is
qstat
# if it returns nothing - the job is finished

touch . # TO UPDATE TO SEE OUTPUT!!!!!!!!!
# touch OPENS/CREATES A FILE/DIR (DIR IS ALSO A FILE) AND SAVES IT WITHOUT MODIFICATION UPDATING THE DATES ASSOCIATED WITH THE FILE 

submit.pbs.e4455447 # error output
##

# the more processors the better? no - programs have plateous for certain no. of cpus

qstat -rt 4455603[] # seperate jobs

#go to the node
ssh cx1-49-4-2
rack-quad-core
cd /tmp/pbs.4553334352.cx1b/
