#########################################################################
# File Name:    insert-table.sh
# Author:       sunxiuyang
# mail:         sunxiuyang04@gmail.com
# Created Time: Fri 28 Sep 2018 05:21:23 PM CST
#########################################################################
#!/bin/bash 

table_num=1

nohup sh PowerSqlgen.sh insert 1 100000 PowerSqlgen_test meta_tablet_${table_num} 1 100 1>>'meta_tablet_'${table_num}'_insert'.log 2>>'meta_tablet_'${table_num}'_insert'.err & 
nohup sh PowerSqlgen.sh insert 100001 200000 PowerSqlgen_test meta_tablet_${table_num} 1 100 1>>'meta_tablet_'${table_num}'_insert'.log 2>>'meta_tablet_'${table_num}'_insert'.err & 
nohup sh PowerSqlgen.sh insert 200001 300000 PowerSqlgen_test meta_tablet_${table_num} 1 100 1>>'meta_tablet_'${table_num}'_insert'.log 2>>'meta_tablet_'${table_num}'_insert'.err & 
nohup sh PowerSqlgen.sh insert 300001 400000 PowerSqlgen_test meta_tablet_${table_num} 1 100 1>>'meta_tablet_'${table_num}'_insert'.log 2>>'meta_tablet_'${table_num}'_insert'.err & 
nohup sh PowerSqlgen.sh insert 400001 500000 PowerSqlgen_test meta_tablet_${table_num} 1 100 1>>'meta_tablet_'${table_num}'_insert'.log 2>>'meta_tablet_'${table_num}'_insert'.err & 
nohup sh PowerSqlgen.sh insert 500001 600000 PowerSqlgen_test meta_tablet_${table_num} 1 100 1>>'meta_tablet_'${table_num}'_insert'.log 2>>'meta_tablet_'${table_num}'_insert'.err & 
nohup sh PowerSqlgen.sh insert 600001 700000 PowerSqlgen_test meta_tablet_${table_num} 1 100 1>>'meta_tablet_'${table_num}'_insert'.log 2>>'meta_tablet_'${table_num}'_insert'.err & 
nohup sh PowerSqlgen.sh insert 700001 800000 PowerSqlgen_test meta_tablet_${table_num} 1 100 1>>'meta_tablet_'${table_num}'_insert'.log 2>>'meta_tablet_'${table_num}'_insert'.err & 
nohup sh PowerSqlgen.sh insert 800001 900000 PowerSqlgen_test meta_tablet_${table_num} 1 100 1>>'meta_tablet_'${table_num}'_insert'.log 2>>'meta_tablet_'${table_num}'_insert'.err & 
nohup sh PowerSqlgen.sh insert 900001 100000 PowerSqlgen_test meta_tablet_${table_num} 1 100 1>>'meta_tablet_'${table_num}'_insert'.log 2>>'meta_tablet_'${table_num}'_insert'.err & 
