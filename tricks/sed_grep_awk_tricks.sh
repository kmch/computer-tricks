#
# awk
# 
awk options program file



# REMOVE A LINE CONTAINING A PATTERN
sed -i "/pattern to match/d" files

# REPLACE A WHOLE (!) LINE CONTAINING A PATTERN
sed -i "/pattern to match/c\replacing_text" files

sed -E "/FREFS/r ../lines2add.mod" *test.mod > output.mod