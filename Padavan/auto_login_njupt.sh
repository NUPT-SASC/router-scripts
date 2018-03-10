#!/bin/sh

### 这是一个让路由器能够保证二十四小时njupt网络在线的脚本
### 请将脚本放置在padavan路由器的如下位置:
### 自定义设置 > 网络检测 > 在网络访问状态改变时运行脚本:
### 路由器使用http 80端口的可达性测试网络是否断开，断开则执行此脚本
### 由于学校网络在没有登录时对80端口网站重定向到登录页面，会导致检测失败
### 所以用于 TCP 连接检测的主机请填写非80端口的外网主机 
### 目前我们使用的是58.218.215.155:443 
### Custom user script
### Called on Internet status changed
### $1 - Internet status (0/1) 0表示网络断开，1表示网络正常
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
