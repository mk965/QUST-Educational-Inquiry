# 新正方教务查询

#### 介绍
1. 本系统使用SSM框架进行开发。
2. 目前完成“本学期成绩查询”、“按学期成绩查询”，以及“课表查询”的功能部分，“课表查询”的前端还没有做。
3. 要求教务系统可以公网访问，或者配合学校vpn使用。

#### 软件架构
软件架构说明


#### 安装教程

1. 导入idea
2. 部署tomcat
3. 访问localhost:8080/jiaowu/index

#### 获取信息流程

1. 获取csrftoken和Cookies
2. 请求获取PublicKey
3. 利用PublicKey对登录密码加密并用Base64编码
4. 进行登录
5. 获取所需要的信息

#### 参与贡献

1. Fork 本仓库
2. 新建 Feat_xxx 分支
3. 提交代码
4. 新建 Pull Request


#### 码云特技

1. 使用 Readme\_XXX.md 来支持不同的语言，例如 Readme\_en.md, Readme\_zh.md
2. 码云官方博客 [blog.gitee.com](https://blog.gitee.com)
3. 你可以 [https://gitee.com/explore](https://gitee.com/explore) 这个地址来了解码云上的优秀开源项目
4. [GVP](https://gitee.com/gvp) 全称是码云最有价值开源项目，是码云综合评定出的优秀开源项目
5. 码云官方提供的使用手册 [https://gitee.com/help](https://gitee.com/help)
6. 码云封面人物是一档用来展示码云会员风采的栏目 [https://gitee.com/gitee-stars/](https://gitee.com/gitee-stars/)
