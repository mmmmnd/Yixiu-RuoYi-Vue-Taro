## 一、这是个什么的项目？

Java 开发一套微信小程序，使用 若依 二次开发一套适合多端的 RESTful API。
前端小程序 Typescript Taro，后台基于 Vue Element 框架。

## 二、项目包含什么功能？

### 2.1.小程序技术栈

* Taro、NutUI、Typescript、Pinia
* 通过原型链封装Http请求
* 封装数据类型

### 2.2.后台技术栈

* 使用 Vue 、element

### 2.3.后端技术栈

* Spring Boot、Spring Security、Redis & Jwt、微信SDK。

### 2.4.优势

* 用户管理：用户是系统操作者，该功能主要完成系统用户配置。
* 部门管理：配置系统组织机构（公司、部门、小组），树结构展现支持数据权限。
* 岗位管理：配置系统用户所属担任职务。
* 菜单管理：配置系统菜单，操作权限，按钮权限标识等。
* 角色管理：角色菜单权限分配、设置角色按机构进行数据范围权限划分。
* 字典管理：对系统中经常使用的一些较为固定的数据进行维护。
* 参数管理：对系统动态配置常用参数。
* 通知公告：系统通知公告信息发布维护。
* 操作日志：系统正常操作日志记录和查询；系统异常信息日志记录和查询。
* 登录日志：系统登录日志记录查询包含登录异常。
* 在线用户：当前系统中活跃用户状态监控。
* 定时任务：在线（添加、修改、删除)任务调度包含执行结果日志。
* 代码生成：前后端代码的生成（java、html、xml、sql）支持CRUD下载 。
* 系统接口：根据业务代码自动生成相关的api接口文档。
* 服务监控：监视当前系统CPU、内存、磁盘、堆栈等相关信息。
* 缓存监控：对系统的缓存信息查询，命令统计等。
* 在线构建器：拖动表单元素生成相应的HTML代码。
* 连接池监视：监视当前系统数据库连接池状态，可进行分析SQL找出系统性能瓶颈。

## 三、如何学习？

### 3.1.克隆项目

首先使克隆项目，然后进入项目根目录使用命令安装包，最后命令启动项目，代码会根据模型自动创建数据库表的。

```
# 克隆项目代码
$ git clone https://github.com/mmmmnd/Yixiu-RuoYi-Vue-Taro.git
```

### 3.2.数据库

启动项目前一定要在创建好 `yixiu-ruoYi-vue-taro` 数据库，以下是执行数据库命令：

```
# 登录数据库
$ mysql -uroot -p密码

# 创建 boblog 数据库
$ CREATE DATABASE IF NOT EXISTS yixiu-ruoYi-vue-taro DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

### 3.3.导入SQL

启动项目前一定要在创建好 `yixiu-ruoYi-vue-taro` 数据库，以下是执行数据库命令：

```
# 打开数据库
$ USE yixiu-ruoYi-vue-taro

# 导入SQL
$ source 根目录SQL文件夹SQL文件
```

### 3.4.Redis

项目使用了Redis，请在你的电脑上面装上Redis：：[「点击：附上Redis安装教程」](https://www.runoob.com/redis/redis-install.html)，安装好 Redis 后，需启动Redis。

### 3.5.修改 Yixiu-RuoYi-Vue-Taro 项目配置

请在根目录下的 [——ruoyi-admin\src\main\resources\*](https://github.com/mmmmnd/Yixiu-RuoYi-Vue-Taro/tree/master/ruoyi-admin/src/main/resources) 文件目录修改配置。

### 3.6.修改 前端后台Api 地址

请在根目录下的 [——ruoyi-ui\.env.*](https://github.com/mmmmnd/Yixiu-RuoYi-Vue-Taro/tree/master/ruoyi-ui) 修改VUE_APP_BASE_API = api地址。

### 3.7.修改 前端小程序Api 地址

请在根目录下的 [——ruoyi-app\src\config\index.ts](https://github.com/mmmmnd/Yixiu-RuoYi-Vue-Taro/tree/master/ruoyi-ui) 修改 BASE_URL = api地址。

### 3.8.启动前端项目

```
# 启动后台管理系统
1. 在根目录下进入ruoyi-ui项目：cd ruoyi-ui，
2. 安装依赖包，执行: npm install 命令，
3. 启动服务: npm run dev; 即可以启动。
```
### 3.9.启动小程序项目
(*为启动某个端的指令)
具体访问[——ruoyi-app\package.json](https://github.com/mmmmnd/Yixiu-RuoYi-Vue-Taro/tree/master/ruoyi-app\package.json) 查阅详情

```
# 启动后台管理系统
1. 在根目录下进入ruoyi-app项目：cd ruoyi-app，
2. 安装包，执行: npm install 命令，
3. 启动服务: npm run dev:*; 即可以访问。
```



### 四、接口说明
### 启动后端端项目后访问 域名地址/doc.html即可

## License

喜欢或对你有帮助的话，请你点一个星星 **star** 鼓励我，或者您有更好的建议和意见，请提出来告知我，可以留言 [Issues](https://github.com/mmmmnd/Yixiu-RuoYi-Vue-Taro/issues/new)。希望能够帮助到你学习！Thanks！共勉！

[MIT](https://github.com/mmmmnd/Yixiu-RuoYi-Vue-Taro/blob/main/LICENSE), by mmmmnd
