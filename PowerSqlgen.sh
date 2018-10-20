#########################################################################
# File Name:    PowerSqlgen.sh
# Author:       sunxiuyang
# mail:         sunxiuyang04@gmail.com
# Created Time: Fri 28 Sep 2018 05:45:53 PM CST
#########################################################################
#!/bin/bash


# mysql_host="10.70.8.18"
# mysql_port=3306

# _mysql="mysql -h${mysql_host} -P${mysql_port} -uroot -pbos@META"
_mysql="mysql --defaults-extra-file=config.cnf"

function create_table() {
  echo `date +"%Y-%m-%d %H:%M:%S.%N"`" start"
  start=$1
  step=$2
  db_name=$3
  table_name=$4
  end=$5

echo "start:"${start},step:$step,end:$end,db_name:$db_name,table_name:$table_name

  for i in `seq ${start} ${step} ${end}`; do
      sql='begin; create table '${db_name}'.'$table_name'_'${i}'(k1 BIGINT NOT NULL, k2 VARCHAR(300), v1 BIGINT, v2 DATETIME NOT NULL DEFAULT "2018-08-31 12:00:00")'
    ${_mysql} -e "${sql}"
    echo ${sql}" "done
    if [ $? -ne 0 ]; then
      echo `date +"%Y-%m-%d %H:%M:%S.%N"` ${i}
    fi
  done
  echo `date +"%Y-%m-%d %H:%M:%S.%N"`" end"
}

function create_db() {

    echo `date +"%Y-%m-%d %H:%M:%S.%N"`" start"
    db_name=$1
    end=$2
    sql='begin; create database '${db_name}''
    ${_mysql} -e "${sql}"
    echo ${sql}" "done
    echo `date +"%Y-%m-%d %H:%M:%S.%N"`" end"
}

function insert_t2() {
    echo `date +"%Y-%m-%d %H:%M:%S.%N"`" start"
    start=$1
    step=$2
    db_name=$3
    table_name=$4
    table_id_start=$5
    table_id_end=$6
    end=$7
    echo "start:"${start},step:$step,end:$end,db_name:$db_name,table_name:$table_name,table_id_start:$table_id_start, table_id_end:$table_id_end
    for i in `seq ${start} ${step} ${end}`; do
        rand_str=${RANDOM}${RANDOM}${RANDOM}${RANDOM}${RANDOM}${RANDOM}
        for ((number = ${table_id_start}; number <= ${table_id_end}; number ++)){
            sql='insert into '${db_name}'.'${table_name}'_'${number}' (k1, k2, v1) values('${i}','${rand_str}','${RANDOM}');'
            ${_mysql} -e "${sql}"
            echo ${sql}
        }
        if [ $? -ne 0 ]; then
            echo `date +"%Y-%m-%d %H:%M:%S.%N"` ${i}
        fi
    done
    echo `date +"%Y-%m-%d %H:%M:%S.%N"`" end"
}
function update_t2() {
    echo `date +"%Y-%m-%d %H:%M:%S.%N"`" start"
    start=$1
    step=$2
    db_name=$3
    table_name=$4
    table_id_start=$5
    table_id_end=$6
    end=$7
    for i in `seq ${start} ${step} ${end}`; do
        rand_str='new'${RANDOM}${RANDOM}${RANDOM}${RANDOM}${RANDOM}${RANDOM}
        for ((number = ${table_id_start}; number <= ${table_id_end}; number ++)) {
            table_name_new=''${db_name}'.'${table_name}'_'${number}''
            sql='begin; delete from '${table_name_new}' where k1='${i}'; insert into '${table_name_new}' (k1, k2, v1) values('${i}',"'${rand_str}'",'${RANDOM}'); commit;'
            echo ${sql}
            ${_mysql} -e "${sql}"
        }
        if [ $? -ne 0 ]; then
            echo `date +"%Y-%m-%d %H:%M:%S.%N"` ${i}
        fi
    done
    echo `date +"%Y-%m-%d %H:%M:%S.%N"`" end"
}
function delete_t2() {
    echo `date +"%Y-%m-%d %H:%M:%S.%N"`" start"
    start=$1
    step=$2
    db_name=$3
    table_name=$4
    table_id_start=$5
    table_id_end=$6
    end=$7
    for i in `seq ${start} ${step} ${end}`; do
        rand_str='new'${RANDOM}${RANDOM}${RANDOM}${RANDOM}${RANDOM}${RANDOM}
        for ((number = ${table_id_start}; number <= ${table_id_end}; number ++)) {
            table_name_new=''${db_name}'.'${table_name}'_'${number}''
            sql='begin; delete from '${table_name_new}' where k1='${i}'; commit;'
            echo ${sql}
            ${_mysql} -e "${sql}"
        }
        if [ $? -ne 0 ]; then
            echo `date +"%Y-%m-%d %H:%M:%S.%N"` ${i}
        fi
    done
    echo `date +"%Y-%m-%d %H:%M:%S.%N"`" end"
}

function delete_table() {
    echo `date +"%Y-%m-%d %H:%M:%S.%N"`" start"
    table_id_start=$1
    table_id_end=$2
    db_name=$3
    table_name=$4
    end=$5
    for ((number = ${table_id_start}; number <= ${table_id_end}; number ++)) {
        table_name_new=''${db_name}'.'${table_name}'_'${number}''
        sql='begin; DROP TABLE '${table_name_new}'; commit;'
        echo ${sql}
        ${_mysql} -e "${sql}"
    }
    echo `date +"%Y-%m-%d %H:%M:%S.%N"`" end"
}
function select_count() {
    echo `date +"%Y-%m-%d %H:%M:%S.%N"`" start"
    db_name=$1
    table_name=$2
    table_id_start=$3
    table_id_end=$4

    for ((number = ${3}; number <= ${4}; number ++)) {
        table_name=''${1}'.'${2}'_'${number}''
        sql='begin; select count(*) from '${table_name}'; commit;'
        echo ${sql}
        ${_mysql} -e "${sql}"
    }
}

function usage() {
    echo " _____                       _____       _                  "
    echo "|  __ \                     / ____|     | |                 "
    echo "| |__) |____      _____ _ _| (___   __ _| | __ _  ___ _ __  "
    echo "|  ___/ _ \ \ /\ / / _ \ '__\___ \ / _  | |/ _  |/ _ \ '_ \ "
    echo "| |  | (_) \ V  V /  __/ |  ____) | (_| | | (_| |  __/ | | |"
    echo "|_|   \___/ \_/\_/ \___|_| |_____/ \__, |_|\__, |\___|_| |_|"
    echo "                                      | |   __/ |           "
    echo "                                      |_|  |___/            "
    echo "------------------------------------------------------------"
    echo "usage:" 
    echo "sh  PowerSqlgen.sh create_db "'${db_name}'
    echo "sh PowerSqlgen.sh create_table "'${table_id_start}' '${table_id_end}' '${db_name}' '${table_name}' 
    echo "sh PowerSqlgen.sh insert "'${key_id_start}' '${key_id_end}' '${db_name}' '${table_name}' '${table_id_start}' '${table_id_end}' 
    echo "sh PowerSqlgen.sh get_table_count "'${db_name}' '${table_name}' '${table_id_start}' '${table_id_end}'
    echo "sh PowerSqlgen.sh update "'${key_id_start}' '${key_id_end}' '${db_name}' '${table_name}' '${table_id_start}' '${table_id_end}'
    echo "sh PowerSqlgen.sh delete_table "'${table_id_start}' '${table_id_end}' '${db_name}' '${table_name}'
    echo "------------------------------------------------------------"
    echo "example: "
    echo "sh PowerSqlgen.sh create_db PowerSqlgen_test"
    echo "sh PowerSqlgen.sh create_table 1 300 PowerSqlgen_test meta_tablet_1"
    echo "sh PowerSqlgen.sh insert 1 10000 PowerSqlgen_test meta_tablet_1 1 10" 
    echo "sh PowerSqlgen.sh get_table_count PowerSqlgen_test meta_tablet_1 60 70"
    echo "sh PowerSqlgen.sh update 60 70 PowerSqlgen_test meta_tablet_1 1 10"
    echo "sh PowerSqlgen.sh delete_table 1 100 PowerSqlgen_test meta_tablet_1 "
    exit -1;
}
while :
do
  case $1 in
    create_table)
        create_table $2 $3 $4 $5 $6
        break
        ;;
    insert)
        insert_t2 $2 $3 $4 $5 $6 $7
        break
        ;;
    get_table_count)
        select_count $2 $3 $4 $5
        break
        ;;
    update)
        update_t2 $2 $3 $4 $5 $6 $7
        break
        ;;
    delete)
        delete_t2 $2 $3 $4 $5 $6 $7
        break
        ;;
    delete_table)
        delete_table $2 $3 $4 $5 $6
        break
        ;;
    create_db)
        create_db $2
        break
        ;;
    *)
        usage 
        ;;
  esac
done

echo "That's all folks!"

