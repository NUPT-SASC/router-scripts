#!/bin/sh

### 这是一个让路由器能够保证二十四小时njupt网络在线的脚本
### 请将脚本放置在padavan路由器的如下位置:
### 自定义设置 > 网络检测 > 在网络访问状态改变时运行脚本:
### Custom user script
### Called on Internet status changed
### $1 - Internet status (0/1)
### $2 - elapsed time (s) from previous state

logger -t "di" "Internet state: $1, elapsed time: $2s."
account="your dr.com accoutn here"
password="your dr.com password here"

if [[ $1 == 0 ]];then
  logger -t  "NJUPT login" "网络断开，尝试重连"
  curl -d "DDDDD=$account&upass=$password&0MKKey=%B5%C7%A1%A1%C2%BC&v6ip=" -o 0.htm http://192.168.168.168/0.htm
  if [ `grep -c "http://192.168.168.168:9002" 0.htm` -gt '0' ]; then
    logger -t "NJUPT login" "重连成功!"
  else
    logger -t "NJUPT login" "尝试重连失败，检查是不是密码出错!"
  fi
else
  logger -t "NJUPT login" "重连成功以经过验证"
fi

