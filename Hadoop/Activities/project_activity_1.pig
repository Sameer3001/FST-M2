1 --Load data from HDFS 
2 inputDialogues4 LOAD 'hdfs:///user/sameer/inputs/episodeIV_dialogues.txt USING PigStorage('\t')           	AS (name:chararray, line:chararray);
3 inputDialogues5 LOAD 'hdfs 'hdfs:///user/sameer/inputs/episodev_dialogues.txt USING 	PigStorage('\t') AS (name:chararray, line:chararray);
4 inputDialogues6 LOAD 'hdfs:///user/sameer/inputs/episodevI_dialogues line:chararray); USING 	PigStorage('\t') AS (name:chararray, line:chararray);
5
6 --Filter out first 2 lines from each file 
7 ranked4 RANK inputDialogues4;
8 OnlyDialogues4 = FILTER ranked4 BY (rank_inputDialogues4 > 2);
9 ranked5 RANK inputDialogues5; 
10 OnlyDialogues5 = FILTER ranked5 BY (rank_inputDialogues5 > 2);
11 ranked6 RANK inputDialogues6; 
12 OnlyDialogues5 = FILTER ranked6 BY (rank_inputDialogues6 > 2);
13 
14 --Merge the 3 inputs
15 InputData = UNION Only Dialogues4, OnlyDialogues5, OnlyDialogues6;
16 
17 --Group by name
18 groupByName = GROUP inputData by name;
19 
20 --Count the number of lines by each character
21 names = FOREACH groupByName GENERATE $0 as name, COUNT($1) as no_of_lines; 
22 namesOrdered = ORDER names BY no_of_lines DESC;
23 
24 Remove the output folder
25 rmf hdfs:///user/sameer/outputs;
26 
27 --Store result in HDFS
28 STORE namesOrdered INTO "hdfs:///user/sameer/outputs' USING PigStorage('\t');