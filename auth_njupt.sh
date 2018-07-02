#!/bin/sh

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
    logger -t "网络断开，尝试认证..."
    wget -O ${TEMP_FILE_PATH} -q --post-data=${POST_DATA} $AUTH_URL
    if grep -Fq "UID" ${TEMP_FILE_PATH};
    then
        echo "认证成功!"
    else
        echo "认证失败"
    fi
else
    # 已经登录了
    echo "网络连接正常"
fi

rm ${TEMP_FILE_PATH}