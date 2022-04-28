#
cd Inversion
screen
[enter]
rj-mcmc.sh
[ctrl+a+d]
exit
# 
ssh ...
screen -r
##

# Create VM (virtual machine) instance via you google cloud dashboard. It's got internal and external IP assigned
# Before you can access your instances using SSH or SCP, you must generate a new SSH key-pair:
#     1. on my local machine type:
      ssh-keygen -t rsa -f ~/.ssh/my-ssh-key -C [USERNAME]
      #where:
      # my-ssh-key is any name appealing to you 
      # [USERNAME] (user account on this machine, maybe guest) is for example? your google account name, in my case kajetan.chrapkiewicz
#     2. Restrict access to your my-ssh-key private key so that only you can read it and nobody can write to it.
      chmod 400 ~/.ssh/my-ssh-key 
#     3. Save PUBLIC key on your VM instance as per https://cloud.google.com/compute/docs/instances/connecting-to-instance#standardssh
	# paste content of ~/.ssh/my-ssh-key.pub (!!!!) into web: metadane/klucze ssh/edycja/utworz nowy

# Connect to your VM instance via ssh
ssh -i ~/.ssh/my-ssh-key [USERNAME]@[EXTERNAL_IP_ADDRESS] # PRIVATE KEY!
# -i option:
# Selects a file from which the identity (private key)
# for public key authentication is read.

# Copy files VM->local machine (being on your local machine)
scp -i ~/.ssh/my-ssh-key [USERNAME]@[IP_ADDRESS]:[REMOTE_FILE_PATH] [LOCAL_FILE_PATH] # PRIVATE KEY!
# use -r to copy folders

# Copy files the other way round (local->VM), still being on your local machine). Might the dir after colon, needn't to be home
scp -i ~/.ssh/moj-kluczyk local-path kajetan.chrapkiewicz@104.196.51.27:~  # PRIVATE KEY!
# use -r to copy folders

# When you are done, use the exit command to disconnect from the instance.
exit

# to disable VM not to incur any (except for storage fee) charge, stop you VM via web dashboard!!!!
## AFTER THAT IP OF VM CHANGES

# to install make command properly
sudo apt-get install --reinstall build-essential
##

# to settle down mpi on the VM
sudo apt-get install gfortran libopenmpi-dev libopenmpi1.6 openmpi-bin openmpi-common
##

# varia
instance-1.c.majestic-lead-153318.internal # hostname?

sudo dpkg-reconfigure gridengine-master

sudo service hostname restart
##
