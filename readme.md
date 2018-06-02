package.json             -->    脚本运行文件
webpack.config.js        -->    编译配置文件
production-dir           -->    内部包含生产环境软件同级目录扩展
script-src               -->    扩展文件源码

app                      -->    运行目录
app/package.json         -->    系统配置文件
app/login.html           -->    登录界面
app/main.html            -->    系统主界面
app/font                 -->    字体文件夹
app/img                  -->    图片文件夹
app/media                -->    媒体文件夹
app/vendor               -->    外部引入插件或工具包文件夹
app/vendor/include.js    -->    全局引用无需babel编译使用的node库
app/vendor/Tool.js       -->    工具封装库
app/vendor/Prototype.js  -->    原型函数库
app/vendor/KeyCode.js    -->    输入法强制转换为英文函数库
app/node_modules         -->    node模块文件夹

src                      -->    开发目录
src/Api.js               -->    api请求封装框架
src/Router.js            -->    路由配置
src/Menu.js              -->    菜单配置
src/Event.js             -->    事件注册配置
src/login.js             -->    登录界面开发文件
src/login.css            -->    登录界面样式文件
src/main.js              -->    主界面开发文件
src/main.css             -->    主界面样式文件
src/UI                   -->    界面开发UI组件文件夹
src/Module               -->    界面开发界面模块文件夹




src/Module下界面组件的继承方法
changeView(obj);    
    切换界面方法：
        参数方式1
            obj = {view:'界面路由名称', param:'界面携带参数'}
        参数方式2
            支持dataset
            data-view='界面路由名称' data-param='界面携带参数'

closeView();    
    关闭界面方法：


src/Module下界面组件的继承属性
param:携带参数

####
生产环境软件同级目录须安装的node扩展:node-adodb, request, request-progress
####

AddGroup   新增组 ->会员管理
BalanceStatistics   余额统计
MemberConsumptionStatistics  会员消费统计
MemberInfoUpdate    会员信息修改
OperatingDetails  营业明细
RechargeUp    充值统计
RevokeData   撤单统计
StaffManagement 会员管理
Addstaff  新增员工 -> 会员管理
StaffManagement 员工权限 ->会员管理
ForegroundStatistics   前台统计
OperateIncome   营业日报
UnpaidStatistics  未付款统计
SaleCard   售卡
ReportLoss  挂失
MemberCardConsume 会员卡消费
Recharge   充值页面

Payandrecharge 支付充值
Solutiontohang 解除挂失
Editshopprices 编辑商品价格



