#########################################################################
# File Name:    create-table.sh
# Author:       sunxiuyang
# mail:         sunxiuyang04@gmail.com
# Created Time: Fri 28 Sep 2018 04:18:44 PM CST
#########################################################################
#!/bin/bash 

table_num=1

nohup sh PowerSqlgen.sh create 1 25 PowerSqlgen_test meta_tablet_${table_num} 1>>'meta_tablet_'${table_num}'_create'.log 2>>'meta_tablet_'${table_num}'_create'.err & 

nohup sh PowerSqlgen.sh create 26 50 PowerSqlgen_test meta_tablet_${table_num} 1>>'meta_tablet_'${table_num}'_create'.log 2>>'meta_tablet_'${table_num}'_create'.err & 

nohup sh PowerSqlgen.sh create 51 75 PowerSqlgen_test meta_tablet_${table_num} 1>>'meta_tablet_'${table_num}'_create'.log 2>>'meta_tablet_'${table_num}'_create'.err & 

nohup sh PowerSqlgen.sh create 76 100 PowerSqlgen_test meta_tablet_${table_num} 1>>'meta_tablet_'${table_num}'_create'.log 2>>'meta_tablet_'${table_num}'_create'.err & 


