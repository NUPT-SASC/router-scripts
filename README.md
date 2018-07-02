# 理学院科协科协路由器里跑的小脚本

### 设备信息
1. `AC9-Asuswrt-Merlin`: 薅羊毛0元购搞到的腾达AC9，刷了梅林固件
2. `K2P-Padavan`: 薅羊毛0元购搞到的斐讯K2P，刷了潘多拉固件（ 听说现在斐讯跑路了。。还好下车早

### 脚本信息

就一个，自动登录南邮校园网并断网重连，保证有电就有网。

### htmls中的四个html

- `not_auth.html`: **尚未认证**时 GET http://192.168.168.168 得到的html
- `has_auth.html`: **已经认证**时 GET http://192.168.168.168 得到的html
- `auth_faild.html`: POST http://192.168.168.168/0.htm 认证**失败**返回的html
- `auth_success.html`: POST http://192.168.168.168/0.htm 认证**成功**返回的html