#!/bin/bash

# list all the ports and process that use them
sudo lsof -i
##

# tree usage
# 4 levels of depth
tree -L 4 
# ignore multiple patterns with tree
tree -I '*pycache*|*init*|test'
# only *py files
try -P '*py'
# full
tree -L 4 -P '*py' -I '*pycache*|*init*|test'
##

# DON'T SEARCH IN BINARY FILES
grep -I pattern
##



# CHANGE FONT OF WINDOW BARS
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Ubuntu Bold 9'
##

# SCALE ALL SYSTEM FONTS
gsettings set org.gnome.desktop.interface text-scaling-factor 1.5
##


# CONCATENATE PDF FILES INTO ONE
pdfunite *pdf out.pdf 
##

# CHECK ENDIANNES (SHOULD BE 'LITTLE' ON INTEL-CHIP MACHINES)
lscpu | grep "Byte Order"
##

# FIND COMMAND FILE
whereis command
##

# RESTART X-SERVER WITHOUT A COMPLETE REBOOT 
# (STILL SHUTS ALL X-WINDOW APPS)
sudo systemctl restart display-manager
# OR 
# CHECK WHICH DISPLAY MANAGER YOU USE
cat /etc/X11/default-display-manager
# FOR lightdm TYPE:
sudo service lightdm restart # ETC.
##

# PERMISSION TO MAKE A FILE sACCESSIBLE TO ALL
chmod a+rx
##

# SHOW WHAT PATH BASH ASSOCIATES WITH A SCRIPT script.sh
hash -t script.sh

# TELL BASH TO FORGET ABOUT THE OLD LOCATION OF script.sh 
# AFTER MOVING IT TO A NEW ONE. BASH NEEDS TO SEARCH THE $PATH
# TO FIND AGAIN
hash -d script.sh
##

# tee: OUTPUT BOTH TO SCREEN AND FILE AT THE SAME TIME 
foo | tee foo_output.txt

# OPEN A FILE (e.g a PDF) WITH A DEFAULT APPLICATION
xdg-open <file_name>

# ZOOM IN/OUT THE FONT OF THE TERMINAL/KATE
ctrl + shift + + #(NOT ON THE NUMERIC KEYBOARD BUT THIS WITH =)
ctrl + - #(NOT ON THE NUMERIC KEYBOARD BUT THIS WITH _)

# CHECK WAKE-UP AT KMC
ethtool eno1
# WHERE eno1 IS AN ETHERNET ADAPTOR NAME CHECKED BY ifconfig (1st column)
-_+
# ADDING A REPO
# You should be able to use any of the listed mirrors by adding a line 
# to your

# /etc/apt/sources.list 

# like this:

deb http://cz.archive.ubuntu.com/ubuntu trusty main 

# Replacing cz.archive.ubuntu.com/ubuntu with the mirror in question.
##


# TERMINAL TABS: SHOW ONLY CURRENT DIR, NOT A FULL PATH
# (https://superuser.com/questions/60555/show-only-current-directory-name-not-full-path-on-bash-prompt)
# IN .bashrc (OR .profile OR /etc/bash.bashrc, /etc/profile, ~/.bashrc, ~/.bash_profile, ~/.profile
# IF IT DOESN'T WORK
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \W\a\]$PS1"
    ;;
*)
# INSTEAD OF:
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
##


# ssh WITHOUT PASSWORD (PUBLIC AND PRIVATE KEYS); REDUNDANT WITH imperial_tricks.sh
# 1. Create public and private keys using ssh-key-gen on local-host
ssh-keygen
[enter]
[enter]
[enter]
# 2. Copy the public key to remote-host using ssh-copy-id
ssh-copy-id -i ~/.ssh/id_rsa.pub kmc3817@login.cx1.hpc.ic.ac.uk
##


# Remove the interval between lines 7 and 9:
sed '7,9d' filename.txt 
##

# FIND AND REPLACE PATTERN IN A FILES
sed -i -e 's/old_pattern/new_pattern/g' file*.txt
# zamień (np.) przecinki na kropki w starym pliku i zapisz to jako nowy
sed 's/,/./g'  stary > nowy

# NOTE: USE "" INSTEAD OF '' TO EXPAND VARIABLES, E.G.
sed -i -e "s/$var1/$var2/g" file.txt
##

# REPLACE A PATTERN IN A FILE<<NAME>> (I.E. RENAME IT)
rename  's/something/somethingelse/g' files
# OR (BUT IT DOESN'T WORK FOR ME!!!)
#rename something sthelse files
# SPECIAL CHARS MUST BE ESCAPED OR INCLUDED IN ''
# To perform a test before actually changing filenames, use the -n flag
##



https://www.digitalocean.com/community/tutorials/how-to-use-rsync-to-sync-local-and-remote-directories-on-a-vps
# The -a option is a combination flag. It stands for “archive” and syncs 
# recursively and preserves symbolic links, special and device files, modification times, group, owner, and permissions. It is more commonly used than -r and is usually what you want to use.

# An Important Note
# You may have noticed that there is a trailing slash (/) at the end of the first argument in the above commands:

    rsync -a dir1/ dir2

# This is necessary to mean “the contents of dir1”. The alternative, without the trailing slash, would place dir1, including the directory, within dir2. 
# This would create a hierarchy that looks like:

~/dir2/dir1/[files]

# Always double-check your arguments before executing an rsync command. Rsync provides a method for doing this by passing the -n or –dry-run options. The -v flag (for verbose) is also necessary to get the appropriate output:

rsync -anv dir1/ dir2


# COPYING WITH PROGRESS BAR
rsync --info=progress2 
##

# Rsync, which stands for “remote sync”, is a remote and local 
# file synchronization tool. It uses an algorithm that minimizes 
# the amount of data copied by only moving the portions of files 
# that have changed.
rsync -azP local/path user@host:destination/path 

# WHEN ONE OF DIRS IN PATH DOESNT WORK, PUT SYMBOLIC LINS IN ANOTHER
cd ~/bin
ln -s ../meme/bin/* .
##

# SEARCH IN PDFS
pdfgrep pattern file
##


# PERMISSIONS
# It is easy to think of the permission settings as a series of bits 
# (which is how the computer thinks about them). Here's how it works:
rwx rwx rwx = 111 111 111
rw- rw- rw- = 110 110 110
rwx --- --- = 111 000 000
# and so on...
rwx = 111 in binary = 7
rw- = 110 in binary = 6
r-x = 101 in binary = 5
r-- = 100 in binary = 4
# COMMANDS:
chmod 777 some_file
# 777
# (rwxrwxrwx) No restrictions on permissions. Anybody may do anything. Generally not a desirable setting.
# 
# 755
# (rwxr-xr-x) The file is owner may read, write, and execute the file. All others may read and execute the
# file. This setting is common for programs that are used by all users.
# 
# 700
# (rwx------) The file is owner may read, write, and execute the file. Nobody else has any rights. 
# This setting is useful for programs that only the owner may use and must be kept private from others.
# 
# 666
# (rw-rw-rw-) All users may read and write the file.
# 
# 644
# (rw-r--r--) The owner may read and write a file, while all others may only read the file. 
# A common setting for data files that everybody may read, but only the owner may change.
# 
# 600	
# (rw-------) The owner may read and write a file. All others have no rights. A common setting for 
# data files that the owner wants to keep private.
chmod -R 777 some_dir # AND ALL ITS SUBDIRS 
# In most ways, the permissions scheme for directories works the same way as they do with files. 
# However, the execution permission is used in a different way. It provides control for access to file 
# listing and other things.
# 777
# (rwxrwxrwx) No restrictions on permissions. Anybody may list files, create new files in the directory and 
# delete files in the directory. Generally not a good setting.
# 
# 755
# (rwxr-xr-x) The directory owner has full access. All others may list the directory, but cannot create files 
# nor delete them. This setting is common for directories that you wish to share with other users.
# 
# 700
# (rwx------) The directory owner has full access. Nobody else has any rights. This setting is useful for 
# directories that only the owner may use and must be kept private from others.

# DIFFERENT APPROACH
chmod u=rx file        # (Give the owner rx permissions, not w)
chmod go-rwx file      # (Deny rwx permission for group, others)
chmod g+w file         # (Give write permission to the group)
chmod a+x file1 file2  # (Give execute permission to everybody)
chmod g+rx,o+x file    # (OK to combine like this with a comma)
##


# EXECUTE(?) THE CONTENT OF file IN CURRENT SHELL (!)
source file 
# ANOTHER WAY TO DO IT
. file
##

# INSTALLING KDE APPS ON GNOME (AVOIDING PULLING TOO MUCH)
sudo apt-get install kate --no-install-recommends
##


# GETTING OUT OF STUCK ssh SESSION
Normal keys are forwarded over the ssh session, so none of those will work. Instead, use the escape sequences. 
To kill the current session hit subsequently Enter ↵, ~, . # '~' IS PRESSED WITH SHIFT, OFC.
##

# INFO ABOUT CPU (E.G. 32/64 BIT)
lscpu
##


# VIEW IMAGE IN GNOME
eog file.png # eog = eye of gnome
##

# CREATE HIDDEN FILE NOT TO MESS UP THE DIR (NOR CREATE SUBDIR)
touch .my_hidden_file
##

# READ (OR RATHER PREVIEW) BINARY FILE
xxd -b file
##

# shutdown in 60 minutes
sudo shutdown -P +60
##

#
ffmpeg -r 20 -i %03d.png -y -an film.mp4 konwersja animacja-film
# OR 
convert -delay 20 -loop 0 *.png animation.gif
##

# CONVERT gif INTO mp4 (FORMAT RECOMMENDED BY YT)
ffmpeg -i animated.gif -movflags faststart -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" video.mp4
## (ALL FLAGS ETC. ARE NEEDED FOR BEST QUALITY)


#
#Adding a path to own commands so that they can be run in any location 
#	Edit .bashrc in your home directory and add the following line:
export PATH="/path/to/dir:$PATH"
#	You will need to source your .bashrc or logout/login (or restart the terminal) for the changes to take effect.
#	To source your .bashrc, simply type
source .bashrc
#	when in the home directory.
# source is a bash built-in command that executes the content of the argument-file in the CURRENT shell
##

# E.g.:
export PATH="/home/chkajetan/Pulpit/mgr/PROGRAMS.330/bin:$PATH"

~/.bashrc to w ogóle ważny plik!
	można definiować w nim aliasy poleceń. Np. żeby wpisując 'mc', tak naprawdę uruchamiać skrypt mc-wrapper.sh, dzięki któremu po wyłączeniu midnight commandera jesteśmy w katalogu, który w nim przeglądaliśmy 
##

#
chmod +x file_name.sh   -  czyni plik wykonywalnym (uprawnienia)  
##

#
convert - narzedzie pakietu ImageMagic 
convert animacja.gif %03d.png  - rozbij gifa na klatki .png: 001.png, 002.png, ... 
##

# trim borders of the identical color as the corners of an image
convert input.png -trim output.png
# or:
ext='.png'
for file in *png
do
	core=${file%$ext}
	convert $file -trim $file #$core'_cut.png'
done
##

#
montage -mode concatenate -tile 1x *.jpg out.jpg  # -  sklej obrazki *.jpg pionowo (1x - 1 kolumna, ileś wierszy). Poziomo byłoby x1
#Sklei obrazki w takiej kolejnosci, jak zostana podane w poleceniu:
in1 in2 out - in1 po lewej, in2 po prawej
##

#
shit+left/right arrow   # -  przechodzenie miedzy kartami basha
##

#
ls -lh  plik/folder  # -  pokazuje zajmowane miejsce w Mb
##

#
ls -lt  -  pokazuje posortowane wg modyfikacji (opcja -t)  w formacie 'long listing' (opcja -l)
##

#
ls | grep out    -   pokazuje pliki zawierajace 'out' w nazwie
##

## CASE SOLUTIONS

# bash: …: No such file or directory” even though the executable is there
# You probably need the 32-bit libraries.
# To install these on a Debian-based distribution (e.g. Ubuntu) run the following command:
sudo apt-get install ia32-libs
##


# adobe flash player doen't support (i.e. updates can't be automatic) browsers other than Chrome/Chromium any more!! You c
sudo apt-get install pepperflashplugin-nonfree # and use chrome
##


###


##
# list only subdirectories in the current one
ls -d */
##


#
$ ls
  this_has_text_to_find_1.txt
  this_has_text_to_find_2.txt
$ rename 's/text_to_find/been_renamed/' *.txt
$ ls
  this_has_been_renamed_1.txt
  this_has_been_renamed_2.txt
##

# Renaming/moving files with suffixes quickly
cp /home/foo/realllylongname.cpp{,-old}
# This expands to:
cp /home/foo/realllylongname.cpp /home/foo/realllylongname.cpp-old
##



# scroll
shift+up/down
##

# If you are halfway through typing a command but change your mind, hit Alt-# to add a # at the 
# beginning and enter it as a comment (or use Ctrl-A, #, enter). You can then return to it later via command history

#
# In bash, use Ctrl-W to kill the last word, and Ctrl-U to kill the line. See man readline for default 
# keybindings in bash. There are a lot. For example Alt-. cycles through prevous arguments, and Alt-* expands a glob.
##
# Basic network management: ip or ifconfig, dig.
#
for i in $(cat ./list_of_ip_addresses.txt); do dig $i; done
#
for file in *.wav; do lame "$file" "$(basename "$file" .wav).mp3" ; done;
##

# list of files and folders, sorted in descending order by size
du | sort -nr | less
##

# files from oldest to newest (modification dates) 
ls -lthr
## r for recent, h for human format of file space

# currently mounted filesystems in nice layout
mount | column -t
##

# Place the argument of the most recent command on the shell
'ALT+.' or '<ESC> .'
##

# stopwatch
time read
## ctrl+d to stop

# clear (shorter)
ctrl+l
##

# disable/enable desctop effects (e.g. in order to exit zoom-around-pointer mode for a while caused by ctrl++ 
# which has no zoom-out shorcut for Polish keyboard)
shift+alt+f12 
##

# reset zoom-around-pointer mode by editing
~/.kde/share/config/kwinrc
## and changing initial zoom back to 1


# run previous command replacing bad pattern (e.g with a typo) with corrected one
^bad^corrected
##

# run last command
!!
##

# external command in a script forks off a subprocess, whereas a Bash builtin does not. For this reason, builtins execute 
# more quickly than their external command equivalents.
##

# Be familiar with bash job management: &, Ctrl-Z, Ctrl-C, jobs, fg, bg, kill, etc

# A job in foreground will be showing currently in the shell and you cannot communicate with the shell until either 
# the job is finished or you interrupt it. A job running in background starts and returns you to the prompt where you 
# can enter further commands while the background process continues. A background job can write to the current terminal 
# window. Jobs start by default in the foreground.
# To start a job (e.g. kate) in background:
kate &
##

# If you start a job in the foreground, you can move it to background. First, you stop the job with control-z, then use 
# the command bg to send the stopped job to background
ctrl-z
bg
##

#
# Now that you can identify a job's number using jobs or ps, you can use them to control jobs. If you have several 
# jobs running in background, you can select one to bring to foreground by using its job number. 
# Instead of using bare fg you add the job number like this:
fg 2
##

# when command 'make' cannot be found
sudo apt-get install --reinstall build-essential
##

# SZUKANIE
locate file # good!!!!!!!!!

find / -type d -name 'name_of_directory' # szukanie folderu w folderze /
find / -name "*szukana*"  # szuka w calym drzewie pliku o nazwie zawierajacej slowo szukana


# DELETE ALL SYMBOLIC LINKS (ONLY) IN A CURRENT DIRECTORY
find -type l -delete
##

# znajdz pliki utworzone 19 maja o 23:18 lub młodsze i skasuj je
find . -newermt "September 30 20:40" -delete
## uwaga! bez godziny "May 19 2016" pokaże również te utworzone przed 23:18

find . -ctime 15 -exec cp {} ../otherfolder \; # see man find (look for -exec)
# better is:
find . -ctime 15 -print0 | xargs -0 cp -t path/to/destination
# open with gwenview FILES (-type f to avoid opening also current dir as a whole) modified not earlier than 10 minutes ago
gwenview $(find . -type f -mmin -10)
find . -type f -mmin -25 -print0 | xargs -0 gwenview
# The find command prints results to standard output by default, so the -print option is normally not needed, but 
# print0 separates the filenames with a 0 (NULL) byte so that names containing spaces or newlines can be interpreted correctly.
# The xargs command reads space- or newline-separated strings (typically from the find command, but they could come from anywhere) and executes some command for each string.
# If xargs is run with a -0 option, it'll expect NULL-separated strings as output by find ... -print0


which polecenie    -   lokalizuje plik POLECENIA

aptitude search 'nazwa pakietu' # szukanie pakietu (wyniki: p - nie ma śladu, i - zainstalowany itp.)
# #p stands for "purged": the package and all its configuration files were removed, #or the package was never installed
apt-cache search keyword
where the search keyword can be all or part of a package name or any words used in its description.

##

# measure time between sending ICMP Echo Request and receiving ICMP Echo Reply from wikipedia server. 
# do it 5 times (without -c (count) option it would last unlimitedly)
ping -c 5 pl.wikipedia.org
##


# for upgrading just a single package, use install:
sudo apt-get install <package_name>
##

# SHOW GROUPS A USER BELONGS TO
groups kmc3817
##

# set read/write permission to file
chmod 666 file_name
#So, in laymen terms, if you wanted a file to be readable by everyone, and writable by only you, you would write the chmod command with the following structure.
#COMMAND : OWNER : GROUP : WORLD : PATH
#chmod read & write read read FileName
#Code:
#chmod 644 myDoc.txt
#Wait! What are those numbers?!?
#Computers like numbers, not words. Sorry. You will have to deal with it. Take a look at the following output of `ls -l`
#Code:
#-rw-r--r-- 1 gcawood iqnection 382 Dec 19 6:49 myDoc.txt
#You will need to convert the word read or write or execute into the numeric equivalent (octal) based on the table below.
#4 read (r)
#2 write (w)
#1 execute (x)
#
##

# Clearing the content of file ("echo > file" would leave empty line!)
> file 
##

# change starting directory of bash
settings->general->initial directory
## it's better than cd ~/Pulpit in .bashrc because new tab mimic current tab (not moves to Pulpit like with .bashrc option)


# change default directory of bash. Edit ~/.bashrc adding a line:
cd ~/Pulpit
## CAUTION it will appear also in a new tab!!!!!!!!!! (drawback)


# CPU architecture information form /proc/cpuinfon in human-read-able format:
  lscpu
##

# removing anaconda
#The anaconda installer adds a line in your ~/.bash_profile script that prepends the anaconda bin directory to your $PATH environment variable. Deleting the anaconda directory #should be all you need to do, but it's good housekeeping to remove this line from your setup script too.
##




## GREP (Globally search REgular expression & Print)
# created by Ken Thompson
# search plain-text data for lines matching a regex pattern 

grep "apple" fruitlist.txt
# search files in dir for pattern occurence inside them
grep -rnw 'path/dir' -e "pattern"
#-r or -R is recursive,
#-n is line number, and
#-w stands match the whole word. 
grep --include=\*.{c,h} -rnw '/path/to/somewhere/' -e "pattern"
#This will only search through the files which have .c or .h extensions. Similarly a sample use of --exclude:
grep --exclude=*.o -rnw '/path/to/somewhere/' -e "pattern"
#Above will exclude searching all the files ending with .o extension. Just like exclude file it's possible to exclude/include directories through --exclude-dir and --include-dir parameter; for example, the following shows how to integrate --exclude-dir:
grep --exclude-dir={dir1,dir2,*.dst} -rnw '/path/to/somewhere/' -e "pattern"
##







# get network name of the computer
hostname
# ping it:
ping host_name
##

# removing anaconda
#The anaconda installer adds a line in your ~/.bash_profile script that prepends the anaconda bin directory to your $PATH environment variable. Deleting the anaconda directory #should be all you need to do, but it's good housekeeping to remove this line from your setup script too.
##

#
uname –m # if the response is i686, you have a 32-bit version of Linux, if  x86_64 - 64-bit version.
##

# check if package is install by dpkg (in particular by apt-get)
dpkg --get-selections | grep package_name
##

#
acroread # adobe reader from terminal
##



# directory containing gcc libraries
/usr/lib/gcc
##



# automatic partition mounting
# type:
sudo blkid #to check UUID 
# edit fstab file:
sudo kate /etc/fstab 
# add relevant entry, e.g.:
UUID=A49C8B359C8B00D2 /media/Data ntfs  users,defaults,exec 0 0 # in theory defaults should contain exec option (ability to execute e.g. bash scripts on this partition), but it didn't work and I had to add explicit 'exec' option
##

# show all mounted partition with mounting options (e.g. exec/noexec)  
mount
##



# otwórz (np.) pliki .doc w writerze
libreoffice --writer *.doc
##


# eksportuj pliki open office'a calc do plików tekstowych csv (przecinki oddzielają w nich kolumny)
unoconv -f csv *.xlsx
##

# jesli folder1 i folder2 istnieja i maja jakas wspolna czesc
cp -r folder1 folder2
## to ta wspolna czesc zostanie nadpisana w foldrze 2, ale dodatkowe pliki folderu 2 nie zostana usuniete!! (to kopiuje plik po pliku, a nie 'obraz' calego folderu1 zastepuje 'obraz' folderu2 )


# USTAWIANIE DOMYŚLNEGO KONSOLOWEGO EDYTORA TEKSTU (chyba tylko dla bieżącej sesji
If you want to set the editor for Git and also other programs, set the standardized VISUAL and EDITOR environment variables*:
	export VISUAL=vim
	export EDITOR="$VISUAL"
* Setting both is not necessarily needed, but some programs may not use the more-correct VISUAL. See VISUAL vs. EDITOR.
# Jw. tylko, że na stałe:
sudo update-alternatives --config editor
##

#
/usr/lib/mozilla/plugins #folder z wtyczkami mozilli (można go wytropić wpisując w przeglądarce (about:plugins)
#
# ręczna aktualizacja flasha: rozpakować paczkę tar.gz i dalej wg 'readme'
##

#
# autouzupelnianie dla nazw ze spacjami: trzeba ominąć pierwszą spację (\ ) wpisać następną literę i tab. Np. dla nazwy 'a b c':
	a\ b<tab>
# da:
	a\ b\ c/
# czyli to, co chcieliśmy
##

# if command cmd1 succeeds, run command cmd2
cmd1 && cmd2 
##

## KIEROWANIE STRUMIENI DANYCH
# rurka | przekazuje strumień do innych POLECEŃ
# e.g. use the OUTPUT of command (NOT FILE) cmd1  as the INPUT of cmd2 
cmd1 | cmd2 
# Lejki 
<, > 
# i służą do „przelewania” strumieni z PLIKU (<) lub do PLIKU (>).

# przesłanie całego pliku DO STRUMIENIA !!!!!!!!!!!!!!!!!!!!!! 
cat
# połącz kilka plików tekstowych w jedną całość:
cat prolog.txt rozdz01.txt rozdz02.txt epilog.txt > opowiadanie.txt
     
# przesłanie NAPISU do strumienia
echo
Polecenie może służyć do komunikacji z użytkownikiem (w skryptach, o których innym razem) lub do wpisywania napisów do pliku, np.:
echo ”Moje ciekawostki:” > ciekawostki.txt
        
# Za pomocą operatorów przypisania
>, >> 
# można manipulować STRUMIENIAMI, poprzez przypisanie deskryptorów: 0, 1, 2 
# innym PLIKOM (ALE NIE POLECENIOM), niż tym reprezentującym klawiaturę i ekran.
0 - strumień wejścia
1 - strumień wyjścia
2 - strumień błędów

polecenie 2> errors.txt   -  zapisze strumień błędów polecenia do errors.txt

# REDIRECT BOTH OUTPUT AND ERROR TO ONE FILE
run.sh &> both.log
##

	Zgodnie z POSIX deskryptor pliku to liczba całkowita, czyli wartość typu int z języka C. Domyślnie każdy proces po uruchomieniu ma otwarte 3 standardowe deskryptory plików:
	Wartość deskryptora 	Nazwa 	Nazwa uchwytu
	0 	Standardowe wejście (stdin) 	STDIN
	1 	Standardowe wyjście (stdout) 	STDOUT
	2 	Standardowe wyjście diagnostyczne (stderr) 	STDERR
	
	Deskryptor pliku – identyfikator pliku wykorzystywany przez system operacyjny. Po wykonaniu operacji otwarcia pliku, deskryptor pliku może być wykorzystywany wielokrotnie przez wywołanie systemowe w operacjach wejścia/wyjścia. 
	
	deskryptor vs uchwyt
	Deskryptor pliku jest zwracany przez funkcje systemowe z rodziny open, w odróżnieniu od funkcji fopen, które zwracają uchwyt pliku. Uchwyt pliku jest strukturą danych zawierającą dodatkowe informacje na temat otwartego pliku. 
	Określenie deskryptor pliku jest używane głównie w systemach operacyjnych zgodnych z normą POSIX. W terminologii Microsoft Windows używane jest określenie "uchwyt pliku" (ang. file handle).
	
	Standardowy strumień wejścia to dane (zwykle tekst) przekazywane do programu. Pobiera on dane poprzez użycie funkcji read. Nie wszystkie programy wymagają danych wejściowych. Przykładowo, dir albo ls wykonują swoją funkcję nie pobierając żadnych danych z stdin. O ile strumień nie jest przekierowany, dane są pobierane z terminala, z którego został uruchomiony program.

	Standardowy strumień wyjścia to strumień, do którego program zapisuje dane wynikowe. Robi to za pomocą funkcji write. Niektóre programy nie zwracają danych wynikowych – na przykład mv nic nie wypisuje jeżeli przeniesienie się powiodło. Jeżeli strumień nie jest przekierowany dane są wysyłane do terminala z którego uruchomiono program.

##

ctrl+r nazwa ctrl+r ctrl+r...  -   szukanie w historii poleceń zawierających nazwę
polecenie #useful           #  -   komentarz useful do polecenia
	To można wykorzystać z ctrl+r
ctrl+r #useful              #  -   wyszuka polecenie otagowane tym komentarzem!



history   -   wyświetl historię komend

history -d command_id # DELETE COMMAND FROM HISTORY

ls -lt */  - pokaz zawartosc wszystkich katalogow w tym katalogu
ls -d */   -  pokaz tylko wszystkie katalogi w biezacym katalogu
cd -      - return to the previous directory!!!!!
ls -t    -   wg daty modyfikacji
ls -a  - pokazuje ukryte pliki i foldery
echo $?  - wartosc zwracana przez ostatnio uruchomiony program
file - wyswietla jakiego typu jest plik (albo czy jest to folder)
nazwa_aplikacji &  - uruchomienie aplikacji i mozliwosc dalszego pisania w terminalu
nano - edytor tekstu konsolowy
	shift + insert - wklejanie zewn. tekstu w nano


ctrl + F10     -  widok wszystkich okien przyciemniony
(ctrl + ) F5   -  odswiez
ctrl+alt+l     - wyloguj

free -m    -  pokazuje wykorzystanie pamięci RAM i swap

top - menedżer zadań w czasie rzeczywistym
kill -SIGKILL nr_procesu(PID) - natychmiastowe zamknięcie procesu (mocne) - działa!
ps -auxww  - wyswietla WSZYSTKIE procesy
ctrl + c  -  zabicie pracującej komendy (procesu) w terminalu
ctrl + \  -  jw. tylko, że mocniejsze
ctrl + z  -  zawieś proces (można go zabić poprzez id)
fg        -  odwieś proces
ctrl+ esc - odpowiednik ctrl-alt-del

ln -s ścieżka_pliku_do_którego_tworzymy_dowiązanie ścieżka_dowiązania - dowiązanie symboliczne (odwołuje się do nazwy pliku, a nie do samego pliku, jak dowiązanie twarde (ln) - dowiązanie twarde polega na utworzeniu kolejnej nazwy tego samego pliku, czyli usuwając "pierwotny" plik usuwamy tylko jego jedną z nazw. W systemie plików zostaje jeszcze ta druga - czyli żeby usunąć ten plik musimy usunąć i pierwotny i dowiązanie twarde. A w symb. usunięcie pierwotnego pliku powoduje tzw. broken link. Dowiązanie twarde można ponadto utworzyć tylko w obrębie jednego systemu plików.
Trzeba pamiętać, że 'rozszerzenie' w nazwie pliku (np. 'plik.txt') to tak naprawdę tylko element nazwy i tworząc dowiązanie pliku tekstowego 'plik' poprzez ln -s ./plik.txt folder/nowa_nazwa stworzymy nie działający link (bo nie ma takiego pliku jak 'plik.txt'!). Oczywiście przenosząc pierwotny plik w innej miejsce zepsujemy link (dowiązanie cały czas myśli, że właściwa jest poprzednia lokalizacja). 

ln -s -d  - dowiązanie symbol. do folderu; musi być podana pełna ścieżka (bezwględna) folderu, którego dowiązanie tworzymy (nie trzeba do do lokalizacji, gdzie ten dowiązany folder chcemy, żeby powstał). Więc ta docelowa lokalizacja to może być np. '.', ale już '../' chyba nie działa! 

sound - manage notification - multimedia system (pop upy - switching to...)
sudo update-alternatives --config default.plymouth - edycja ekranu splash

unrar x 'nazwa pliku' - rozpakowuje pliki rar tworzac katalog o takiej samej nazwie
unzip 'nazwa pliku' - rozpakowuje pliki zip
unzip 'nazwa pliku' -d sciezka_do_folderu - rozpakowuje pliki do folderu
zip -r nazwa_archiwum.zip nazwa_folderu - kompresja zip katalogu
tar -xvjf plik.tar.bz2
tar -xvzf plik.tar.gz (.tgz)

# COMPRESS WHOLE DIRECTORY 
tar -zcvf archive.tar.gz directory/ 
##

# ROZPAKUJ DO FOLDERU O TEJ SAMEJ NAZWIE CO PACZKA!
gunzip -c plik.tar.gz | tar xvf - 
##

env - pokazuje zmienne środowiskowe
env | less
env | grep PATH - wyświetla linie dotyczące PATH spośród wszystkich zmiennych środowiskowych 

/home/kajtek/.mozilla/firefox/mwad0hks.default/bookmarkbackups - pliki zakładek
/etc/hostname i /etc/hosts - edycja tych plików pozwala na zmianę nazwy sieciowej komputera

# RAM w KB
awk '/MemTotal/ {print $2}' /proc/meminfo
##

df -h   - lista partycji dysku wraz z wypelnieniem
du -hs /var/cache/apt/archives  # - pokazuje miejsce zajmowane przez archiwa apt
#
du -hs # miejsce zajmowane na dysku
##

lsb_release -a - wyswietla info o wersji Linuxa (system version, distribution version)
uname -a   -  sprawdź architekturę systemu
cat /etc/linuxmint/info - wyswietla info o dystrbycji



inxi -r - Show distro repository data. Currently supported repo types: APT; PACMAN; PISI; YUM.
(w ogóle poczytać inxi --help)

program --version  -  sprawdz wersje programu, np.:
	python --version
	gcc --version

## REPOZYTORIA
/etc/apt/sources.list - lista repozytoriów
# adding new (illustrated by repo containing vlc plugin):
sudo apt-add-repository ppa:strukturag/libde265
sudo apt-get update # UPDATE REPOSITORIES
sudo apt install vlc-plugin-libde265 # 
# No suitable decoder module: VLC does not support the audio or video format "hev1". Unfortunately there is no way for youf to fix this.
# That surprisingly pessimistic error message is wrong. hev1 is the HEVC/H.265 standard, which is a new video 
# compression standard that is getting popular for high DPI content. All VLC needs is a decoder plugin for it.

sudo apt-get update # downloads the package lists from the repositories and "updates" them to get information on
# the newest versions of packages and their dependencies. Used to re-synchronize the package index files from 
# their sources. The indexes of available packages are fetched from the location(s) specified in 
# /etc/apt/sources.list. An update should always be performed before an upgrade or dist-upgrade.

# adding old repositories on example of libg2c fortran library needed in CPS programs
wget http://old-releases.ubuntu.com/ubuntu/pool/universe/g/gcc-3.4/libg2c0_3.4.6-6ubuntu5_i386.deb
sudo dpkg -i --force-all libg2c0_3.4.6-6ubuntu5_i386.deb # dpkg is used to install, remove, and provide information about .deb packages.
## CAUTION wget saves files to the current directory!! unless other is specified

# System upgrade:
# A) clean upgrade - from bootable drive (pendrive can be made bootable as well!). Replacing old partition by new. No problems with partition table neither with Grub.
# B) updating packages (what about kernel?)
##

###



## INSTALACJA PAKIETÓW


# COMPARE SHA256 AND/OR MD5 SUMS
# (SHA256 is a much more secure check than an MD5 check)

# 1) GENERATE ONE FROM THE DOWNLOADED FILE
md5sum linuxmint-18.3-kde-64bit.iso # IT TAKES LONG TIME, BE PATIENT!
# OR
sha256sum linuxmint-18.3-kde-64bit.iso

# 2) COPY THE CORRECT ONE FROM THE WEB:
https://ftp.heanet.ie/pub/linuxmint.com/stable/18.3/

# 3) COMPARE E.G. IN KATE EDITOR (FIND ...)
##


#
sudo pip install numpy
##


###

## SPRZĄTANIE
sudo apt-from serial import Serialget remove package_name  # usuwa pakiet
sudo apt-get autoclean # częściowe pakiety
sudo apt-get clean # cache apt
sudo apt-get autoremove # nieużywane zależności

# fix broken dependencies (see man apt-get)
sudo apt-get install -f 
##

# trash-cli
trash-put           trash files and directories.
trash-empty         empty the trashcan(s).
trash-list          list trashed files.
# CAUTION: SOMETIMES NOT ALL ARE VISIBLE. THEN THE LAST LINE SHOULD SAY
#ABOUT THE OTHER LOCATION, E.G.
"TrashDir skipped because parent not sticky: /media/kajetan/TOSHIBA EXT/.Trash/1000"
# IN THIS CASE JUST:
cd /media/kajetan/TOSHIBA EXT/.Trash/1000/files
# AND DO WHATEVER YOU WANT WITH THESE FILES (COPY ETC.)
# NOTE THAT THEY ARE NOT OVERWRITTEN BUT SUBSEQUENT NUMBERS _1, _2, ...
# ARE APPENDED TO THE FILENAMES. THE NEWEST <-> THE LARGEST NUMBER
##

restore-trash       restore a trashed file.
trash-rm            remove individual files from the trashcan.
##


###

