
# Create a text file named txtFile.txt and add the text
$ vim txtFile.txt

# Create a CSV file named csvFile.csv and add the data
$ vim csvFile.csv

# Make a textData folder on the HDFS
$ hdfs dfs -mkdir /user/sameer/textData

# Copy the TXT file, txtFile.txt, into the textData folder in the HDFS
$ hdfs dfs -put ./txtFile.txt /user/sameer/textData

# Copy the CSV file, csvFile.csv, into the textData folder in the HDFS
$ hdfs dfs -put ./csvFile.csv /user/sameer/textData

# Use the stat command to get the file statistics
$ hdfs dfs -stat "type:%F permissions:%a %u:%g size:%b name:%n" /user/sameer/textData/txtFile.txt
$ hdfs dfs -stat "type:%F permissions:%a %u:%g size:%b name:%n" /user/sameer/textData/csvFile.csv
