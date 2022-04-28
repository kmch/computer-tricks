#!/bin/bash
# The shebang (#!) above CAN'T be followed by any other comment!!!!!!
# AIM: If the file is executable, and you want to use it by calling only the script name, 
# the shebang must be included in the file
# to invoke otherwise, e.g.: bash ./file_name
## BASH DRAWBACKS

  # Even the most purist of bash programmers (and there aren't many!) write code that, 
  # when it all adds up, becomes difficult to maintain

  # Bash is slow.

  # Bash's "functions" have several issues

  # Variable typing. Like most scripting languages, Bash does not really support strong variable types.
  # Variables are loosely categorized as scalar or array (plus associative arrays in bash 4), with partial
  # support for an integer type. But really, everything is a string. 

  # Floating point math. Bash has only integer math. Use bc or awk if you need to do floating point math.

###


# You can specify a slash at the end to match only directories:
# (iterate over directories only)
for d in */ ; do
    echo "$d"
done

# FEEDING PROGRAM ARGUMENTS PROGRAMMATICALLY
printf "yes\n$file_name\n$inlines\n\nyes\n" | sgy2vtr $file_name $inlines
##

# READ KEY
read -p "Is the input OK? If so, press enter to continue"
# read -n1 ans 'press'
# echo $ans
##

# SPACES IN ARGUMENT - USE DOUBLE-QUOTES
path='TOSHIBA EXT'
ls -lthr "$path" 
##

# DELETE TRAILING SLASH FROM THE PATH VARIABLE
arg1=${1%/}
##


# REPLACE PATTERN IN A string!!!!!!!!!!!
# ALL OCCURENCES
new_string="${string//${old}/${new}}" 
# ONLY THE FIRST OCCURENCE
new_string="${string/${old}/${new}}" 
##

# FIRST LETTER
firstletter=${word:0:1}
##

# WHEN YOU CAN'T USE && TO EXECUTE ONLY AFTER SUCCESSFUL COMMAND
if [[ $? != 0 ]]; then
  (>&2 echo "ERROR! Last command failed.")
  exit
fi


# READ USER'S INPUT AT RUNTIME 
read var # NO DOLLAR!
echo $var
##


# REDIRECT STDOUT TO VARIABLE
var=$(python test.py)
# REDIRECT STDERR TO VARIABLE
var=$(python test.py 2>&1 > /dev/null) # SPACE BETWEEN > AND & IS A SYNTHAX ERROR
# /dev/null, which is a place you can dump anything you don’t want (often called the bit-bucket), 
# (a special device which discards the information written to it)
# then redirecting standard error into standard output (you have to put an & in front of the destination 
# when you do this).
##


# 1-LINER FOR FS
echo '51 101 1 51' > $file && seq 1 1 101 | awk '{printf "%12i %12.8f  %15.8f  %15.8f\n", NR, 1 + $1/5, "1", $1}' >> $file
##

# CONCATENATE FILES WITH LINE-GAP IN BETWEEN
cat file1 <(echo ) file2 > file3
##

# SHOW 5 LAST LINES
tail -n -5 file.txt
# SHOW LAST LINES OMITTING FIRST 5-1=4 (!) LINES
tail -n +5 file.txt 
# SHOW 5 FIRST LINES
head -n +5 file.txt
# SHOW FIRST LINES OMITTING LAST 5 (!)
head -n -5
# CUT BOTH ENDS 
head -n -1 file.txt | tail -n +2
# COMBINING 2 STREAMS
cat <(tail -n +6 flat_homo-Skeleton.key | head -n -3) <(tail -n +23 flat_homo-Runfile.key)
##

# EXCLUDE PATH FROM FULL PATH STRING
file_name=${full_path##*/}
##

# STRING SPLITTING WITH 1-CHAR DELIMITER (HERE: _)
# data_dir=${option}_${anom_size}_${anom_ampl}
option=$(echo $data_dir | cut -f1 -d_)
anom_size=$(echo $data_dir | cut -f2 -d_)
anom_ampl=$(echo $data_dir | cut -f3 -d_)
##

# LOGICAL 'OR' ||
if [[ ${option} == '2' || ${option} == '3' || ${option} == '4' ]]; then
# space after [[ is ESSENTIAL !!!!!! or there will be an error!
##

# Echo that outputs to stderr
# To avoid interaction with other redirections use subshell
(>&2 echo "Crust error!")
##

# ~NP.ARANGE (SEQUENCE OF NUMBERS: START INTERVAL STOP)
for i in `seq 10 20 120`
  do echo $i
done
  
##

# REGEX
chó[dw] # means "chód" and "chów"
##

# extract first 4 columns from .mod file (omit header, i.e. the lines < 13)
for i in *mod; do tail -n +13 $i | awk '{ print $1" "$2" "$3" "$4}' > ${i%.mod}.txt; done
##


# Why does a unquoted wildcard work remotely with scp?
If there is no matching filename, then a wildcard expression in bash expands to itself. 
# So, as long as you don't create any file locally whose name matches user@remote:~/dir/*.xml, 
# your command works without quoting.
##

 

# A command list embedded between parentheses runs as a SUBSHELL:
( command1; command2; command3; ... )
# Variables in a subshell are not visible outside the block of code in the subshell. They are not accessible to 
# the parent process, to the shell that launched the subshell. These are, in effect, LOCAL VARIABLES.

# E.g. do something in current dir:
(cd /some/other/dir; other-command)
# continue in original dir
##


# directory containing the bash script
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#This will work as long as the last component of the path used to 
#find the script is not a symlink (directory links are OK). 
#If you want to also resolve any links to the script itself, 
#you need a multi-line solution

# time of code execution
start=`date +%s`
#...
end=`date +%s`
runtime=$((end-start)) # in sec
echo 'RUNTIME OF THE NITER.SH: '$runtime' s'
##

#
parent_dir=$(pwd)
##

# check if string contains pattern
  if [[ ${startmods} == *"fine"* ]]; then
    echo 'jupi'
  else 
    echo 'lupi'
  fi
##

# end of for loop as a variable
TOP=5
for ((i=1; i<=$TOP; i++))
do
   echo $i
   # rest of your code
done
##

# concatenate strings
a='foo'
b='bar'
c=$a$b
# or with space:
c=>$a' '$b # OR RATHER =
##

#
#!/bin/bash
while IFS='' read -r line || [[ -n "$line" ]]; do
    echo "Text read from file: $line"
done < "$1"
# 
# Explanation:
# 
#     IFS='' (or IFS=) prevents leading/trailing whitespace from being trimmed.
#     -r prevents backslash escapes from being interpreted.
#     || [[ -n $line ]] prevents the last line from being ignored if it doesn't end with a \n (since read returns a non-zero exit code when it encounters EOF).
# 
##

#
l_files=( $(ls | grep KRL | grep 0.08) )
q_files=( $(ls | grep KRQ | grep 0.08) )
t_files=( $(ls | grep KRT | grep 0.08) )

for i in ${!l_files[@]} #1..${#l_files[@]}
do
  lqt2bodin.sh 0.08 ${l_files[i]} ${q_files[i]} ${t_files[i]}
done
##

# length of array
echo ${#array[@]}
##
# increment in loop
i=$[$i +1]
##

#
l_files=( $(ls | grep KRL | grep 0.08) )
q_files=( $(ls | grep KRQ | grep 0.08) )
t_files=( $(ls | grep KRT | grep 0.08) )

echo ${l_files[2]}
# for l in ${l_files[@]}
# do
#   echo $l
# done

##

# tricky argument handling
  #!/bin/bash
  kind=$1 # kind of interpolation, eg. 'linear, 'quadratic', 'cubic'
  npoints=$2 # number of interpolation  points (kinda resampling) 
  files=( "${@:3}" ) # make an array from 1 string of arguments
  echo "${files[@]}"
  /media/Data/DO_BACKUPU/GEOFIZYKA/mgr/prog/to_mod.sh "${files[@]}" # all array elements
##

#
time=$1
files="${@:2}"

echo $time
for file in $files
do
	echo $file
done
##

#
a=1

if [[ $a -eq 2 ]]
then
	echo $a
elif [[ $a -eq 1 ]]
then
	echo 'jupi'
else
	echo 'wow'
fi
##

# iterate over the range 1 2 3 4 5
for i in {1..5}


# Put this line in ~/.bashrc file
shopt -s extglob
# It extends regexes. You can then move all files except one by:
mv !(fileOne) ~/path/newFolder
##


# The while loop remains the most appropriate and easiest way to read a file line by line.
while read line           
do           
    command           
done < file 
##


#
echo -e 'acroread \n' > tricks.txt # Passing the -e argument to echo enables interpretation of escape sequences.
##


#
If you run in folder1 a script that resides in folder2 and that uses another script from folder2 (relative path), you will get the error  


##


# wszystkie argumenty skryptu jako jeden string
# cat script.sh
#!/bin/sh
str="$*" # $* produces all the scripts arguments separated by the first character of $IFS which, by default, is a space.
echo "$str"
# przykład działania
	>./script.sh a ab cde
	a ab cde
##

# so that "$*" is an array not one string of words:
ARGS="$*"
python /media/Data/DO_BACKUPU/GEOFIZYKA/mgr/prog/average.py $ARGS
##

#Grep regex NOT containing string 
#szukanie stringa zawierającego PATT ale niezawierającego NOTPATT
#grep matches, grep -v does the inverse. If you need to "match A but not B" you usually use pipes:
	grep "${PATT}" file | grep -v "${NOTPATT}"
##
# core
# subtracting strings
	string="hello-world"
	prefix="hell"
	suffix="ld"
How do I get to the following result?
	result="o-wor"
# ANSWER
	$ foo=${string#$prefix}
	$ foo=${foo%$suffix}
	$ echo "${foo}"
	o-wor
#
${MYVAR#pattern}       # delete shortest match of pattern from the beginning
${MYVAR##pattern}      # delete longest match of pattern from the beginning
${MYVAR%pattern}       # delete shortest match of pattern from the end
${MYVAR%%pattern}      # delete longest match of pattern from the end
##	

#
B=`basename $i .PLT` # basename is withoutc path and extension
##

#
cały skrypt może się dziwnie wysypywać przez przypadkowo wpisany znak " ' " (przypadkowo wpisany) - trudne do wykrycia.
##

# sprawdzanie czy wyraz nie zawiera danego ciągu znaków (np. 'c0')
if [[ ${testmystring} != *"c0"* ]];then
    # testmystring does not contain c0
fi
##

# How do I get the path of the directory in which a Bash script is located FROM that Bash script?
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

is a useful one-liner which will give you the full directory name of the script no matter where it is being called from.

This will work as long as the last component of the path used to find the script is not a symlink (directory links are OK).
## (http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in?rq=1)

# posortuj
sort < lista
##

# posortuj wg liczb (20, 40, ..., 100, ... , 200, ...)
ls *twolayers_alpha2.0_2048_a.sac | sort -n
##

#
options=( "-l" "-t" ) # to jest bashowa tablica
command=( "$ls" "${options[@]}" ) # @ jest wskaźnikiem (np. @1, @2 itd.) 
# samo @ oznacza tu wszystkie wskaźniki, a użycie wewnątrz "" sprawia, że odpowiadające
# im elementy tablicy są zapisane jako osobne słowa
# przekierowanie czegoś takiego do pythona daje JEDEN string

# wykonaj
"${command[@]}"
##

#
You need to escape the . as "0\.49".
A . is a regex meta-character to match any character(except newline). To match a literal period, you need to escape it.
or 
grep -F -r '0.49' * treats 0.49 as a "fixed" string instead of a regular expression. This makes . lose its special meaning.
##

#
a="5" # here it can't more than one space!!!!!!!!!!!
if (( a != 5 )) # comparing arithmetics within double parenthesis. Notice lack of $ and possibility to use space on both sides!
##


#
printf '%s\n' 'first line' 'second line' 'third line' > file_name
##


#
/"szukana_fraza" <enter>  - takie ctrl+f w konsoli (gdy przeglądamy stronę 'man' albo 'less' itp.)
n  - znajdź następny
shift+n - znajdź poprzedni
##

#
FILES="$(ls | grep .mod)" # array of all model files' names in current directory # using " is allegedly safer in special cases
n=$(ls | grep .mod | wc -l) # number of .mod files in current directory
##

#
We use a subshell () to avoid overwriting the value of IFS in the current environment. In that subshell, we then modify the value of IFS so that the first character is a newline (using $'...' quoting). Finally, we use parameter expansion to print the contents of the array as a single word; each element is separated by the first charater of IFS.
To capture to a variable:
	$ var=$( IFS=$'\n'; echo "${System[*]}" )
##

#
PRZYKŁAD PĘTLI
for i in *.tar.gz; do  gunzip -c $i | tar xf -; done
##

#
printf "\n"   -  wyswietl pusta linie
	printf has more consistent behavior than echo. The behavior of echo varies greatly between different versions.
echo -e "linia nr 1 \nlinia nr 2"

echo
echo ""
echo ''
echo ``
##

#
Cudzysłowy "" zachowują znaczenie specjalne trzech znaków:
    $ wskazuje na nazwę zmiennej, umożliwiając podstawienie jej wartości
    \ znak maskujący
		` ` odwrotny apostrof, umozliwia zacytowanie polecenia 
##		

#
ctrl+d   -  znak END OF FILE, np. wychodzi z interaktywnego Pythona
##
