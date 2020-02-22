---
layout: post-for-project
title:  "First to Crawl Funds Data"
date:   2020-02-22 19:15:03 +0800
excerpt: "简单的采用python爬取简单的基金数据"
project: true
---



## 借鉴

根据[河里的肥鱼](https://www.jianshu.com/p/1d67cfbfd9bb)的文章进行学习
首先送[天天基金](http://fund.eastmoney.com)开始出发，作者选取这个网站的原因是由于这个网站的基金比较全。
**随意**选取[银河创新成长混合(519674)](http://fund.eastmoney.com/519674.html)

## 需要的python包：

```python
import requests
import time
import execjs
import matplotlib.pyplot as plt # 用于画图
import numpy as np
```

## 接口构造

```python
def getUrl(fscode):
    head = 'http://fund.eastmoney.com/pingzhongdata/'
    tail = '.js?v='+ time.strftime("%Y%m%d%H%M%S",time.localtime())
    return head+fscode+tail
```

## 获取数据

```python
def getWorth(fscode):
    #用requests获取到对应的文件
    content = requests.get(getUrl(fscode))
    
   #使用execjs获取到相应的数据
    jsContent = execjs.compile(content.text)
    name = jsContent.eval('fS_name')
    code = jsContent.eval('fS_code')
    #单位净值走势
    netWorthTrend = jsContent.eval('Data_netWorthTrend')
    #累计净值走势
    ACWorthTrend = jsContent.eval('Data_ACWorthTrend')

    netWorth = []
    ACWorth = []

    #提取出里面的净值
    for dayWorth in netWorthTrend[::-1]:
        netWorth.append(dayWorth['y'])

    for dayACWorth in ACWorthTrend[::-1]:
        ACWorth.append(dayACWorth[1])
    print(name,code)
    return netWorth, ACWorth
```


## 查看数据

```python
netWorth, ACWorth = getWorth('519674')
print(netWorth)
len(netWorth)

>>> 银河创新成长混合 519674
[6.1423, 5.9585, 5.747, 5.8071, 5.6002, 5.4243, 5.3753, 5.3354, 5.2235, 5.1426, 5.2218, 5.0837, 4.9414, 4.8895,
...
 0.9993, 1, 1]
2206
```

## 问题：

* 我们如果分析最近几个周、几个月的数据，其实也可以不需要了解具体某一天的数据，取最近20天、40天等方式即可。当然，也可以**从当天开始逆推回去**，给每个净值标上日期，不过这个**需要忽略节假日**，处理起来比较麻烦且必要性不大，我就没有做这个处理。
* 目前想到的解决办法是采用`pip install chinesecalendar`

```python
>>> import datetime
>>> from chinese_calendar import is_workday
>>> da  =  datetime.date(2019,1,2)
>>> boll = is_workday(da)
>>> print(boll)
True
```

* 然后对每天进行判断然后blahblah
	* 随便你是不全原来的数据
	* 还是剔除掉日期。

具体实现就看各位自己的喜好了。这里仅仅给出最简单对折线图：

```python
import matplotlib.pyplot as plt
import numpy as np
plt.style.use('ggplot')

%matplotlib inline
fig, ax1 = plt.subplots()

x_ = 60
x = np.arange(1,x_ + 1,1)

V1 = netWorth[:x_][::-1]
ax1.plot(x, V1, linewidth=2, color='#986DB2', label='Net Worth Trend')
# ax1.fill_between(x, V1, min(V1), alpha=0.3)
ax1.set_xlim(x[0], x[-1])
ax1.set_ylim(np.min(V1), np.max(V1))
ax1.tick_params(axis='y', labelcolor='#986DB2')
ax2.grid(True)
leg = plt.legend(loc='upper left')

ax2 = ax1.twinx() 
V2 = (np.array(netWorth[:-1]) - np.array(netWorth[1:]))[:x_][::-1]
ax2.plot(x, V2, linewidth=1, color='#7DB9DE', label='incremental')
ax2.fill_between(x=x, y1=0, y2=V2, color='#7DB9DE', alpha=0.5)
# ax1.xlim(x[0], x[-1])
ax2.set_ylim(np.min(V2), np.max(V2))
ax2.tick_params(axis='y', labelcolor='#7DB9DE')

leg = plt.legend(loc='upper right')
ax2.grid(False)
plt.tight_layout()


plt.show()
```

![](https://github.com/Clynie/Clynie.github.io/blob/master/_img/fund_test_1.0.png?raw=true)


## 获取所有数据并保存

```python
import requests
import time
import execjs

def getUrl(fscode):
    head = 'http://fund.eastmoney.com/pingzhongdata/'
    tail = '.js?v='+ time.strftime("%Y%m%d%H%M%S",time.localtime())
  
    return head+fscode+tail

# 根据基金代码获取净值
def getWorth(fscode):
    content = requests.get(getUrl(fscode))
    jsContent = execjs.compile(content.text)
    
    name = jsContent.eval('fS_name')
    code = jsContent.eval('fS_code')
    #单位净值走势
    netWorthTrend = jsContent.eval('Data_netWorthTrend')
    #累计净值走势
    ACWorthTrend = jsContent.eval('Data_ACWorthTrend')

    netWorth = []
    ACWorth = []

    for dayWorth in netWorthTrend[::-1]:
        netWorth.append(dayWorth['y'])

    for dayACWorth in ACWorthTrend[::-1]:
        ACWorth.append(dayACWorth[1])
    print(name,code)
    return netWorth, ACWorth
  
def getAllCode():
    url = 'http://fund.eastmoney.com/js/fundcode_search.js'
    content = requests.get(url)
    jsContent = execjs.compile(content.text)
    rawData = jsContent.eval('r')
    allCode = []
    for code in rawData:
        allCode.append(code[0])
    return allCode

allCode = getAllCode()



netWorthFile = open('./netWorth.csv','w')
ACWorthFile = open('./ACWorth.csv','w')

for code in allCode:
    try:
        netWorth, ACWorth = getWorth(code)
    except:
        continue
    if len(netWorth)<=0 or len(ACWorth)<0:
        print(code+"'s' data is empty.")
        continue
    netWorthFile.write("\'"+code+"\',")  
    netWorthFile.write(",".join(list(map(str, netWorth))))
    netWorthFile.write("\n")
  
    ACWorthFile.write("\'"+code+"\',")  
    ACWorthFile.write(",".join(list(map(str, ACWorth))))
    ACWorthFile.write("\n")
    print("write "+code+"'s data success.")
  

netWorthFile.close()
ACWorthFile.close()

```





