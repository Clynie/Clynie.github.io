---
layout: post-for-notes
title:  "记录一下我在安装，更新以及使用Python过程中遇到的问题"
date:   2018-08-23
excerpt: "其中目前包括了matplotlib, numpy, jupyter, eofs.iris"
notes: true
---

## Numpy

### Questions:

1. After upgrade numpy:

	```bash
	ValueError: Object arrays cannot be loaded when allow_pickle=False
	```
There are __Two__ solutions:
	1. np.load(file) ` to `np.load(file, allow_pickle=True)`
	2. Downgrade the numpy as `pip install numpy==1.16.2`


## matplotlib
###  Install mkl_toolkits

```bash
# Usually
pip install --upgrade matplotlib
# should be worked, But if doesn't, Please try below:

# For Python2
sudo pip uninstall matplotlib
sudo apt-get install python-matplotlib
# For Python3
sudo pip3 uninstall matplotlib
sudo apt-get install python3-matplotlib

# if anyone has a problem on Mac, can try this
# IT IS ALSO WORKED ON MY LINUX, IT SHOULD QUITE USEFULL
sudo pip install --upgrade matplotlib --ignore-installed six
```

### Basemap

```html
https://matplotlib.org/basemap/users/installing.html
```


#### addcyclic

```python
return list(map(_addcyclic,arr[:-1]) + [_addcyclic_lon(arr[-1])])
TypeError: unsupported operand type(s) for +: 'map' and 'list'
```
一般来说是直接修改源代码，但是新版本和旧版本的写法上有区别：

1. For old basemap version:

```python
def addcyclic(arrin,lonsin):
	"""
	``arrout, lonsout = addcyclic(arrin, lonsin)``
	adds cyclic (wraparound) point in longitude to ``arrin`` and ``lonsin``,
	assumes longitude is the right-most dimension of ``arrin``.
	"""
	nlons = arrin.shape[-1]
	newshape = list(arrin.shape)
	newshape[-1] += 1
	if ma.isMA(arrin):
	    arrout  = ma.zeros(newshape,arrin.dtype)
	else:
	    arrout  = np.zeros(newshape,arrin.dtype)
	arrout[...,0:nlons] = arrin[:]
	arrout[...,nlons] = arrin[...,0]
	if ma.isMA(lonsin):
	    lonsout = ma.zeros(nlons+1,lonsin.dtype)
	else:
	    lonsout = np.zeros((nlons+1,1),lonsin.dtype)
	lonsout[0:nlons] = lonsin[:]
	lonsout[nlons]  = lonsin[-1] + lonsin[1]-lonsin[0]
	return arrout,lonsout
```

2. For New version of Basemap

```python
def addcyclic(*arr,**kwargs):
	"""  
	Adds cyclic (wraparound) points in longitude to one or several arrays,
	the last array being longitudes in degrees. e.g.
	     
	`data1out, data2out, lonsout = addcyclic(data1,data2,lons)``
	     
	==============   ====================================================
	Keywords         Description
	==============   ====================================================
	axis             the dimension representing longitude (default -1,
	                 or right-most)
	cyclic           width of periodic domain (default 360)
	==============   ====================================================
	"""  
	# get (default) keyword arguments
	axis = kwargs.get('axis',-1)
	cyclic = kwargs.get('cyclic',360)
	# define functions
	def _addcyclic(a):
	    """addcyclic function for a single data array"""
	    npsel = np.ma if np.ma.is_masked(a) else np
	    slicer = [slice(None)] * np.ndim(a)
	    try:
	        slicer[axis] = slice(0, 1)
	    except IndexError:
	        raise ValueError('The specified axis does not correspond to an '
	                'array dimension.')
	    return npsel.concatenate((a,a[slicer]),axis=axis)
	def _addcyclic_lon(a):
	    """addcyclic function for a single longitude array"""
	    # select the right numpy functions
	    npsel = np.ma if np.ma.is_masked(a) else np
	    # get cyclic longitudes
	    clon = (np.take(a,[0],axis=axis)
	            + cyclic * np.sign(np.diff(np.take(a,0,-1],axis=axis),axis=axis)))
	    # ensure the values do not exceed cyclic
	    clonmod = npsel.where(clon<=cyclic,clon,np.mod(clon,cyclic))
	    return npsel.concatenate((a,clonmod),axis=axis)
	# process array(s)
	if len(arr) == 1:
	    return _addcyclic_lon(arr[-1])
	else:
	    # return list(map(_addcyclic,arr[:-1]) + [_addcyclic_lon(arr[-1])])
	    return list(map(_addcyclic,arr[:-1])) + [_addcyclic_lon(arr[-1])]

```

## 添加环境变量

```bash
# 添加环境变量：
$ conda create --name Python34 python=3.4
# 打开命令行，进入到要添加的virtual env中，如source activate env01
$ conda activate Python34
# 安装ipykernel，如
$ python -m pip install ipykernel
# 添加当前环境下的python到jupyter notebook中的kernel里，如
$ ipython kernel install --user --name=kernel_env01
# 启动jupyter notebook之后即可在可选kernels中看到kernel_env01
```

## eof.iris

针对气象数据来说，`eofs`提供了针对`cube`数据的`eof`处理

### 安装

```bash
# eofs can be installed for all platforms using conda:
conda install -c conda-forge eofs

# or using pip:
python -m pip install eofs
```


### 使用

```python
import iris
from eofs.iris import Eof

# read a spatial-temporal field, time must be the first dimension
sst = iris.load_cube('sst_monthly.nc')

# create a solver class, taking advantage of built-in weighting
solver = Eof(sst, weights='coslat')

# retrieve the first two EOFs from the solver class
eofs = solver.eofs(neofs=2)
```



### module "importlib._bootstrap" has no attribute "SourceFileLoader"

```bash
python3 -m ensurepip --upgrade
```






