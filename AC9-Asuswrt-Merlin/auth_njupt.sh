#!/bin/sh

### 由于梅林固件不支持网络检测，所以只有利用cru，也就是常用的crond的梅林修改版
### 设定任务计划，每隔一段时间检测是否掉线，掉线则自动重连

ACCOUNT=""
PASSWORD=""

CHEKC_URL="http://192.168.168.168"
AUTH_URL="http://192.168.168.168/0.htm"

TEMP_FILE_PATH='result.html'
POST_DATA="DDDDD=${ACCOUNT}&upass=${PASSWORD}&0MKKey=%B5%C7%A1%A1%C2%BC&v6ip="

wget -O ${TEMP_FILE_PATH} -q $CHEKC_URL
if grep -Fq "0.htm" ${TEMP_FILE_PATH};
then
    # 尚未登录
    logger -t  "NJUPT auth" "网络断开，尝试认证..."
    wget -O ${TEMP_FILE_PATH} -q --post-data=${POST_DATA} $AUTH_URL
    if grep -Fq "UID" ${TEMP_FILE_PATH};
    then
        logger -t "NJUPT auth" "认证成功!"
    else
        logger -t "NJUPT auth" "认证失败"
    fi
else
    # 已经登录了
    logger -t "NJUPT auth" "网络连接正常"
fi

rm ${TEMP_FILE_PATH}