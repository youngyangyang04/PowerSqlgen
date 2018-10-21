# PowerSqlgen
Generate sqls to test mysql database

# Usage

```
./PowerSqlgen.sh 
 _____                       _____       _
|  __ \                     / ____|     | |
| |__) |____      _____ _ _| (___   __ _| | __ _  ___ _ __
|  ___/ _ \ \ /\ / / _ \ '__\___ \ / _  | |/ _  |/ _ \ '_ \
| |  | (_) \ V  V /  __/ |  ____) | (_| | | (_| |  __/ | | |
|_|   \___/ \_/\_/ \___|_| |_____/ \__, |_|\__, |\___|_| |_|
                                      | |   __/ |
                                      |_|  |___/
------------------------------------------------------------
usage:
sh PowerSqlgen.sh create_db ${db_name}
sh PowerSqlgen.sh create_table ${table_id_start} ${table_id_end} ${db_name} ${table_name}
sh PowerSqlgen.sh insert ${key_id_start} ${key_id_end} ${db_name} ${table_name} ${table_id_start} ${table_id_end}
sh PowerSqlgen.sh get_table_count ${db_name} ${table_name} ${table_id_start} ${table_id_end}
sh PowerSqlgen.sh update ${key_id_start} ${key_id_end} ${db_name} ${table_name} ${table_id_start} ${table_id_end}
sh PowerSqlgen.sh delete_table ${table_id_start} ${table_id_end} ${db_name} ${table_name}
------------------------------------------------------------
example:
sh PowerSqlgen.sh create_db PowerSqlgen_test
sh PowerSqlgen.sh create_table 1 300 PowerSqlgen_test meta_tablet_1
sh PowerSqlgen.sh insert 1 10000 PowerSqlgen_test meta_tablet_1 1 10
sh PowerSqlgen.sh get_table_count PowerSqlgen_test meta_tablet_1 60 70
sh PowerSqlgen.sh update 60 70 PowerSqlgen_test meta_tablet_1 1 10
sh PowerSqlgen.sh delete_table 1 100 PowerSqlgen_test meta_tablet_1

```

# Demo video
<a href="https://www.youtube.com/watch?v=U5ShNmZpl98&feature=youtu.be" target="_blank"><img src="https://github.com/youngyangyang04/PowerSqlgen/blob/master/images/MacHi%202018-10-21%2010-46-37.png" alt="PowerSqlgen demo" width="300" height="280" border="50" /></a> 
