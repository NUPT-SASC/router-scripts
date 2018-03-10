#!/bin/sh

### 由于梅林固件不支持网络检测，所以只有利用cru，也就是常用的crond的梅林修改版
### 设定任务计划，每隔一段时间检测是否掉线，掉线则自动重连

account="your dr.com accoutn here"
password="your dr.com password here"

ping -c 3 -w 5 www.baidu.com
if [[ $? != 0 ]];then
logger -t  "NJUPT login" "网络断开，尝试重连"
curl -d "DDDDD=$account&upass=$password&0MKKey=%B5%C7%A1%A1%C2%BC&v6ip=" -o 0.htm http://192.168.168.168/0.htm
if [ `grep -c "http://192.168.168.168:9002" 0.htm` -gt '0' ]; then
logger -t "NJUPT login" "重连成功!"
else
logger -t "NJUPT login" "尝试重连失败，检查是不是密码出错!"
fi