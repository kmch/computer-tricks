##### RECENT, UNCATEGORIZED #####################################################################################

# Confusion with emails linked to a github account
# ------------------------------------------------
# * you can't link more than account to a given email
# * but a given account can have multiple emails linked (primare and extras)
# * e.g. as `kmch` my primary email is kajetan_ch@o2.pl and secondary is kmch.scholar@gmail.com
# In the terminal you set the user (globally) by:
# $ git config --global user.name "kmch"
# $ git config --global user.email "kajetan_ch@o2.pl"
# I found out that it is the email that matters because if I provide wrong email for kmch,
# e.g. kajetan.chrapkiewicz@gmail.com, than it sets the user to kajetan-web which has this
# email linked to it (I created this user only to test hugo-academic website)



# If you can't change branches due to:
 # "The following untracked working tree files would be overwritten by checkout (...)
 # Please move or remove them before you can switch branches"
# use -f flag:
git checkout -f branch-name 
##


# repo graph etc. on Github
# -> go to Insights tab
##

# discard local changes
git checkout path/to/files
# in particular  
git checkout .
# discards all local changes when run in repo's root dir
##

# merge specific files!
git checkout branch_to_merge file1 file2...
# note branch from which we're merging files (branch_to_merge)
# can be a remote one, in that case you need to express it 
# remotes/origin/branch_name
##

# Reduce the size of .git
git gc --aggressive --prune
# more: https://stackoverflow.com/questions/5613345/how-to-shrink-the-git-folder
##

# update info about remote branches (removes info about branches that no longer exist)
 git remote prune origin
##


# avoid typing in credentials every time

# change from url to ssh to url
 git remote set-url origin git@github.com:my-user-name/my-repo-name.git
# add new ssh key in github account's settings / ssh and gpg keys
# by copying the conntent of 
~/.ssh/id_rsa.pub # without network-user-name at the end

# that's it!
##


# cloning all the branches
# actually it is done every time but 
# by default only master will be VISIBLE at first
# show all branches of cloned repo
git branch -a 
# connect other remote branch with local
git checkout name-of-branch # without remotes/origin!
# https://stackoverflow.com/questions/67699/how-to-clone-all-remote-branches-in-git


# don't show untracked files in the status
git status -uno
# which is equivalent to:
git status --untracked-files=no
# I also created an alias
git stn 


# to update your local repository to the newest commit, execute

git pull # = fetch + merge

## in your working directory to fetch and merge remote changes
# If you can't understand why you can't pull from remote, wait a few moments and try later! 
# Maybe the server takes its time!
##

# Remove untracked files from the working tree
# Step 1 is to show what will be deleted by using the -n option:
git clean -n
# Clean Step - beware: this will delete files:
git clean -f
##

# rename a branch while pointed to any branch
git branch -m <oldname> <newname>
# if you want to rename the current branch
git branch -m <newname>
## 

# CHANGE DESCRIPTION OF THE LAST COMMIT
git commit --amend -m 'NEW DESCR'
# (IN FACT WHAT WE'RE REALLY DOING HERE IS:
# 1. Amend (= cancel in git)
# 2. Commit again )
##

# ADD ALL FILES FROM PREVIOUS COMMIT (-a) AND COMMIT IN 1 STEP (SO IT WILL ADD ONLY MODIFIED FILES!!!)
git commit -am 'Description'
##

# TWO-PART COMMIT INFO
git commit -m "Title" -m "Description ..........";
##

# DELETE BRANCH
git branch -d feature_x
##

# VARIABLE MUST BE IN "". Otherwise words other than 1st will be treated as next arguments of git commit (=> ERROR)
git commit -m "$variable"
##

# when 'Your local changes to the following files would be overwritten by checkout'
git checkout HEAD^ path/to/these/files
##

#################################################################################################################



###### SYNC-ING WITH REMOTE REPOSITORY (DON'T NEED WHEN USING DROPBOX) ##########################################

# clone existing directory
git clone https://github.com/kmch/hello-world.git path/to/repo  - copy repo to path/to/repo 
#  you needn't do a git init
#  * files are tracked and unmodified
# it need'nt to be remote repo, you can type local path:
git clone /path/to/repository
##

# push the branch to your remote repository
git push origin <branch>
##

# If you aint cloned an existing repo and want to connect your repository to a remote server, you need to add it:
git remote add origin <server>
# Now you are able to push your changes to the selected remote server
#
#Step 1: Switch to your repository's directory
cd /path/to/your/repo

#Step 2: Connect your existing repository to Bitbucket
git remote add origin https://StanUlam@bitbucket.org/StanUlam/real.git 
git remote add origin https://StanUlam@bitbucket.org/StanUlam/synth.git 

# if we added wrong host (e.g. bitbucket SSH instead of https):
git remote set-url origin good_host

#
git push -u origin master
##

# show remotes for push/pull
git remote -v 



# USEFUL INFO ABOUT THE REPO
git remote show origin 
##

# To prevent error fatal: The remote end hung up unexpectedly
git config --global https.postBuffer 524288000
## it increases the buffer size of a single file to pull/push to maximum (500 MB)

# If you can't understand why you can't pull from remote, wait a few moments and try later! 
# Maybe the server takes its time!
##




#################################################################################################################



##### MERGE #####################################################################################################
# to merge another branch into your active branch (e.g. master), use
git merge <branch>
# in both cases git tries to auto-merge changes. Unfortunately, this is not always possible and results in conflicts. You are responsible to merge those conflicts manually by editing the files shown by git. After changing, you need to mark them as merged with
git add <filename>
# before merging changes, you can also preview them by using
git diff <source_branch> <target_branch>
##

# Occasionally, this process doesn’t go smoothly. If you changed the same part of the same 
# file differently in the two branches you’re merging together, Git won’t be able to merge 
# them cleanly.

#################################################################################################################



##### UNDO ######################################################################################################
git reset --hard (commit_id)
# ROLL BACK THE REPO TO A PARTICULAR COMMIT (FORSAKE SOME FAILED MODIFICATIONS)
# 1) MAKE A COPY OF THE BRANCH IN ITS CURRENT STATE:
git branch failed_feature 
# 2) RESET YOUR CURRENT BRANCH TO YOUR DESIRED COMMIT 
git reset --hard c2e7af2b51 # REPLACE c2e7af2b51 WITH ID OF THE COMMIT YOU WANT TO ROLL BACK TO
# 3) DELETE FAILED BRANCH TO SAVE SPACE
git branch -d failed_feature
##

# UNSTAGE (UN-ADD) FILE(S)
git reset HEAD <file>... #DEPRECATED. BETTER NOT TO USE 'HEAD'
# or when HEAD is undefined (because you haven't yet made any commits in your repo)
git reset <file>...
##



# Remove untracked files from the working tree

# Step 1 is to show what will be deleted by using the -n option:
git clean -n
# Clean Step - beware: this will delete files:
git clean -f

##

#################################################################################################################



##### SHOWING DIFFERENCES #######################################################################################
# show differences between current commit and working tree
git diff HEAD [filename]
# show differences between index and working tree
# that is, changes you haven't staged to commit
git diff [filename]
# show differences between current commit and index
# that is, what you're about to commit
git diff --cached [filename]
#################################################################################################################


##### CHECK LOGS ################################################################################################

# SEE WHOLE HISTORY OF THE REPO, NOT ONLY COMMITS
git reflog
##

# SEE COMPRESSED LOG (ONE LINE PER COMMIT)
git log --pretty=oneline
##

# SHOW ALL BRANCHES IN gitk (VERY LIGHT git CLIENT)
gitk --all
##

# SEE ONLY WHICH FILES HAVE CHANGED
git log --name-status
##

# SEE AN ASCII-ART OF ALL THE BRANCHES
git log --graph --oneline --decorate --all
##

#################################################################################################################



##### GENERAL IDEA ##############################################################################################

# UNLIKE OTHER VCSs (VERSION CONTROL SYSTEMS), GIT STORES WHOLE FILES, NOT DIFFs!!!

# GIT LOGICALLY STORES EACH FILE UNDER ITS SHA-1 (Secure Hash Algorithm 1), SO IF YOU HAVE 
## TWO FILES WITH EXACTLY THE SAME CONTENT (OR IF YOU RENAME THE FILE), ONLY ONE COPY IS STORED 

# GIT REPO IS A BIG GRAPH, WITH COMMITS BEING ITS NODES

# HEAD: THE CURRENT commit YOUR REPO IS IN

# YOU CAN THING OF A DETACHED HEAD AS BEING ON AN UNNAMED BRANCH

#################################################################################################################



##### CONFIGURATION #############################################################################################

# Avoid providing github credential at every push:
# https://stackoverflow.com/questions/6565357/git-push-requires-username-and-password
# A common cause is cloning using the default (HTTPS) instead of SSH. 
# You can correct this by going to your repository, clicking "Clone or download", 
# then clicking the "Use SSH" button above the URL field and updating the URL 
# of your origin remote like this:
git remote set-url origin git@github.com:username/repo.git
##

# INITIAL CONFIGURATION ('CONFIGURE WITH GLOBAL RESULT')
git config --global user.name 'user_name' 
git config --global user.email user_email 
# CHECK IT
git config --list
##

# GLOBAL .gitignore
touch /path/.gitignore # E.G. ~/.gitignore
git config --global core.excludesfile '/path/.gitignore' #!!!!!!!!!!!
##

# GLOBAL CONFIGURATION OF GIT (E.G. ALIASES OF GIT COMMANDS) - EDIT:
~/.gitconfig
##

# LOCAL CONFIGURATION OF GIT - EDIT:
./.git/config
##

# LOCALLY (FOR GIVEN REPO) MAKE COMMITS INFO IN GIT LOG ONE-LINERS
git config format.pretty oneline
##

# EDIT .git/config (LOCALLY) OR ~/.gitconfig (GLOBALLY) TO DEFINE SHORTENED ALIASES OF POPULAR COMMANDS:
[alias]
        co = commit
        st = status
        ch = checkout
        br = branch
##

#################################################################################################################
