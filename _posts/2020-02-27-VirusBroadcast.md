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

## 分析


首先了解Java基本的原理是(举例)：

```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello World");
    }
}
```

也就是说基本上Java，类似于python的定义，

1. 首先import *
2. 然后定义class，`public class HelloWorld {}`
3. 在class中定义function,`public static void main(String[] args) {}`

在主程序中是这样的：

```java
public class Main {

    public static void main(String[] args) {
        initHospital();
        initPanel();
        initInfected();
    }

    /**
     * 初始化画布
     */
    private static void initPanel() {
    }

    private static int hospitalWidth;

    /**
     * 初始化医院参数
     */
    private static void initHospital() {
    }

    /**
     * 初始化初始感染者
     */
    private static void initInfected() {
        }
    }
}
```

这里另外加个小知识，因为本人从头开始学习`Java`所以很多东西是边看边编边学，所以首先说明一下`static`,`public`和`private`的区别：

* `static`：静态修饰符，被static修饰的变量和方法类似于全局变量和全局方法，可以在不创建对象时调用，当然也可以在创建对象之后调用。
* `public`：声明当前被修饰的对象、方法、变量为公有的。
* `private`: ：声明当前被修饰的变量、方法为私有的。
* `private static`: 修饰的属性仅仅可以被静态方法调用，但是只能被本类中的方法（可以是非静态的）调用，在外部创建这个类的对象或者直接使用这个类访问都是非法的。




### 初始化画布

1. 这里采用的是`paint(Graphics g)`
一般来说: java绘图时，最常使用到的就是`paint(Graphics g){...内容...}`方法获取画笔，然后利用`JPanel`等容器作为画布,在`JFrame`内呈现出内容，很多情况下这种方式都还是很实用，下附实例：


```java
import java.applet.Applet;
import java.awt.Color;
import java.awt.Graphics;
import javax.swing.JFrame;
import javax.swing.JPanel;
 
//以下为一个框体小程序
public class _001{// _001为自定义的主类名
	public static void main(String[] args) {
	JFrame newFrame=new JFrame("funBox");
	newFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);          //定义JFrame关闭时的操作（必需），有效避免不能关闭后台当前框体进程的问题   
	newFrame.setSize(400, 400);         //定义JFrame的相关属性
	newFrame.setLocation(200, 200);
	newFrame.setVisible(true); 
	newThread n1= new newThread();           //线程的运行，将需要呈现的图像添加进JFrame中
	newFrame.add(n1);
	Thread t1 = new Thread(n1);
	t1.start();
	 
	}
}
 
class newThread extends JPanel implements Runnable //Java类中只能继承一个类，但是可以实现多个接口，此处newThread 为自定义新建类名
{
	Graphics g;    //此处定义Graphics对象 g;
	private static final long serialVersionUID = 1L;   
	public void run()   //进程run()方法重写
	{  
		g=getGraphics();   //Graphics对象 g的获取
		for(int i=0;i<100;)
		{
			try {
				Thread.sleep(2000);
			} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}  
			this.update(g) ;       //update()方法的调用，刷新图像，使得图像不会重叠显现   
			g.setColor(Color.green);   //绘制（0，0）开始移动的20*20绿色小块
			g.fillRect(i, i, 20, 20);
			i+=20;
		} 
	}
}
```

2. 有的时候，需要`Graphics`对象进行更多的操作（例如下面需要在`run()`中调用`Graphics`对象）而不能使用`paint(Graphics g)`方法，这个时候，就得获取自己定义的`Graphics`对象来完成需求，下附实例：


```java
package ?; //?为自定义建包名
import java.applet.Applet;
import java.awt.Color;
import java.awt.Graphics;
import javax.swing.JFrame;
import javax.swing.JPanel;
 
//以下为一个框体小程序
public class _001// _001为自定义的主类名
{
	public static void main(String[] args) {
		JFrame newFrame=new JFrame("funBox");
		newFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);          //定义JFrame关闭时的操作（必需），有效避免不能关闭后台当前框体进程的问题   
		newFrame.setSize(400, 400);         //定义JFrame的相关属性
		newFrame.setLocation(200, 200);
		newFrame.setVisible(true); 
		newThread n1= new newThread();           //线程的运行，将需要呈现的图像添加进JFrame中
		newFrame.add(n1);
		Thread t1 = new Thread(n1);
		t1.start();
	}
}
 
class newThread extends JPanel implements Runnable //Java类中只能继承一个类，但是可以实现多个接口，此处newThread 为自定义新建类名
{
	Graphics g;    //此处定义Graphics对象 g;
	private static final long serialVersionUID = 1L;   
	public void run()   //进程run()方法重写
	{  
		g=getGraphics();   //Graphics对象 g的获取
		for(int i=0;i<100;)
		{
			try {
				Thread.sleep(2000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  
			this.update(g) ;       //update()方法的调用，刷新图像，使得图像不会重叠显现   
			g.setColor(Color.green);   //绘制（0，0）开始移动的20*20绿色小块
			g.fillRect(i, i, 20, 20);
			i+=20;
		} 
	}
}
```


### 初始化医院参数

### 初始化初始感染者








