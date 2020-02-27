---
layout: post-for-project
title:  "VirusBroadcast from KikiLetGo"
date:   2020-02-27 14:43:03 +0800
excerpt: "在B站看到一个视频‘计算机仿真程序告诉你为什么现在还没到出门的时候！！！’，是由大神“Ele实验室”，才发现自己装了这么久的JAVA其实是个神器，原谅我的无知，虽然也找了一些python的脚本，但还是Ele的脚本最为心水"
project: true
---



# VirusBroadcast from KikiLetGo

## 动机

首先我在微博上以及B站上看到了[Ele实验室](https://space.bilibili.com/481434238?spm_id_from=333.788.b_636f6d6d656e74.9)发布的[计算机仿真程序告诉你为什么现在还没到出门的时候！！！](https://www.bilibili.com/video/av86478875?t=83)， 让我这个自以为是会用一点python的人简直看到了自己井底之蛙的形象，想到之前自己虽然装了Java，但是连helloworld都还没开始就积灰了，因此下定决定，从这个脚本满满开始学习。

好在[Ele实验室](https://space.bilibili.com/481434238?spm_id_from=333.788.b_636f6d6d656e74.9)将自己的代码全部放在了[github](https://github.com/KikiLetGo/VirusBroadcast)上，可以自行下载。

OK，那我们开始学习吧：



## 安装Java

```bash
>>> brew cask install java
>>> # and it will install the latest Oracle JDK. You can use
>>> brew cask info java
>>> # to verify which version it will install.
>>> brew tap caskroom/cask
```

## 下载源代码

就像之前说的，大神已经把代码放在了GitHub上：

```bash
>>> git clone https://github.com/KikiLetGo/VirusBroadcast.git
>>> cd VirusBroadcast
>>> tree
.
── README.md
── src
   ├── Bed.java
   ├── City.java
   ├── Constants.java
   ├── Hospital.java
   ├── Main.java
   ├── MathUtil.java
   ├── MoveTarget.java
   ├── MyPanel.java
   ├── Person.java
   ├── PersonPool.java
   ├── Point.java
   └── Virus.java
>>> # 按照习惯我个人我会
>>> cp -rf src test
```

初步采用[understand](https://scitools.com/)查看了小模型的流程图为：

![https://scitools.com/](https://github.com/Clynie/Clynie.github.io/blob/master/_img/VirusBroadcast-Main-main.png?raw=true)














