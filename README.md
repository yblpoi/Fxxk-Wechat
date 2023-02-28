# Fxxk-Wechat

![GitHub repo file count](https://img.shields.io/github/directory-file-count/yblpoi/Fxxk-Wechat)![GitHub release (latest by date)](https://img.shields.io/github/v/release/yblpoi/Fxxk-Wechat)![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/yblpoi/Fxxk-Wechat/bulid.yml)![GitHub last commit](https://img.shields.io/github/last-commit/yblpoi/Fxxk-Wechat)![GitHub all releases](https://img.shields.io/github/downloads/yblpoi/Fxxk-Wechat/total)

一个简单粗暴的安卓[**Magisk**](https://github.com/topjohnwu/Magisk)模块。用于清理某个特别好用的国民级聊天软件。

一个功能单一的聊天软件，应用大小有**665MB**。在我登录两天左右，用户数据达到了惊人的**2.3GB**。

因此用魔法对付魔法，用流氓对付流氓。

**它不体面，我就帮他体面。**

## 前排提醒

如果您使用的是尊贵的苹果，抑或是某些不主张用户刷机的品牌的手机。建议您停止阅读，因为这个模块和您没有任何的关系。也请您不要询问怎么给您的手机使用此模块。

如果您了解安卓刷机，或者已经享受刷机带来的乐趣，那么欢迎您使用我的模块。也欢迎您[**创建议题**](https://github.com/yblpoi/Fxxk-Wechat/issues)，一起完善这个项目。

由于咱并非计算机专业，如果在代码方面有任何优化的建议，也欢迎提交PR。

应酷友要求，建立了聊天QQ群，群号：684657469，也可点击链接跳转加入：[![](https://pub.idqqimg.com/wpa/images/group.png)](https://qm.qq.com/cgi-bin/qm/qr?k=MRuXRY_eUr8W4EEpcjk23APBOLJNu-El&jump_from=webapi&authKey=6yWsmS5Ko4XlJ0q/E3YpaGdmFSI2JGv5qnnfAAazUtDd5hoW8bOAUdi8swg7KLET)

## 实现功能

目前实现了以下功能：

- 通过**Magisk**控制模块的开关。除了刷入以及版本更新，无需重启即可实现功能的调整。
- 清理内容如下：
  - 微信反复制造的缓存文件
  - 小程序缓存
  - 毫无卯月的直播数据
  - 微信获取的手机数据（包括且不限于电池、网络等等）
- 同时尽量避开了聊天数据。在本人手机上测试时，并没有误杀。
- 安装过程添加了后悔药。如果您在安装时决定放弃，可以按下**音量-**，取消安装。
- 在自动打包时形成更新内容介绍。

## 使用方法

具体使用方法如下：

- 备份必要的数据，数据无价。
- 安装 [**Magisk**](https://github.com/topjohnwu/Magisk)
- 在 [**Release**](https://github.com/yblpoi/Fxxk-Wechat/releases) 界面下载最新版本模块
- 打开面具刷入模块。请仔细阅读刷入前的提示。如果您决定刷入，轻轻按一下**音量+**就可以完成刷入了。
- 重启手机。
- [!] 如果您需要配置删除的目录，配置文件位于 `/模块目录/files/FUCK-WERCHAT.conf`
- 处于安全考虑，模块配置文件不再处于 `/sdcard/Android/ `

## 模块文件说明

整个模块的文件结构如下

```
.
├── customize.sh 					#安装脚本
├── files						#配置文件存放目录
│   └── FUCK-WECHAT.conf
├── Fxxk-wechat.sh					#主要功能脚本
├── META-INF						#面具模块必需文件
│   └── com
│       └── google
│           └── android
│               ├── update-binary
│               └── updater-script
├── module.prop						#模块信息
├── Run_FUCK_WECHAT.sh					#控制脚本
└── service.sh						#服务进程脚本
```

### 对于配置文件目录的补充说明

在配置文件中，主要出现了以下两种目录：

- /data/media/0/
- /data/data/

其中 `/data/media/0/`等同于 `/sdcard`，也就是手机中常见的 `/storage/emulated/0/`

`/data/data/`目录则是真正藏污纳垢的地方，因为普通权限下无法访问。

## TO-DO · 下步打算

### 清理计划

体积巨大且常用的软件我都会考虑加入清理列表。

包括且不限于：

- 手机QQ
- TIM（QQ商业版）
- 企业微信

### 代码优化

包括且不限于：

- 安装过程
- 安全性
- 代码可读性

### 项目WIKI

- 国内访问：个人博客（建设中）
- 全局访问：Github（新建文件夹）

## 更新内容

- Beta版请看[更新文档](https://github.com/yblpoi/Fxxk-Wechat/blob/main/UPDATE.md)
- Stable版请看[更新文档](https://github.com/yblpoi/Fxxk-Wechat/blob/stable/UPDATE.md)

## 分支说明

本模块由2023年2月14日结束Alpha测试阶段，为了方便控制版本，接下来的更新将会分为两个分支。

位于本仓库[Main](https://github.com/yblpoi/Fxxk-Wechat/tree/main)分支的，是所谓Beta版本。用于最新功能的测试和开发。比如对于软件的支持。

位于本仓库[Stable](https://github.com/yblpoi/Fxxk-Wechat/tree/stable)分支的，是模块的稳定版本。策略不像Beta版那么激进，是为了确保安全稳定而开发的版本。通常来讲，会滞后于Beta版本的发布与更新。

## 特别鸣谢

已经退出酷安的阿巴酱。本模块很大程度上源于对他模块的定制。是他的模块为我打开了开发的思路，解决了很多棘手的难题。本模块许多关键的部分使用的是他的源码。可惜的是我并没有找到他的项目，因此目前没法贴上链接。

## LICENSE

本模块遵守GNU General Public License v3.0协议。

应该没有人闲着没事干倒卖面具模块的吧？
