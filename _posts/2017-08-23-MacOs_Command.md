---
layout: post-for-notes
title:  "The Command in MacOs"
date:   2018-08-23
excerpt: "Command Finding Log"
notes: true
---


## Macos自带了一个命令可以用来转换图片格式

这个命令的使用主要参考了这个[网址](https://www.jibing57.com/2018/04/25/command-line-tools-to-check-images-on-macos/)  
其中的例子，以及使用方法也是复制以上[网址](https://www.jibing57.com/2018/04/25/command-line-tools-to-check-images-on-macos/)。


系统自带的sips命令

Macos自带了一个命令可以用来转换图片格式，名字叫做[sips](https://www.birme.net/blog/bulk-resize-images-with-sips-on-mac/)

转换格式的用法如下:

```bash
sips -s format [转换的目标格式] --out [目标文件名字] [输入文件]
```

如下是一个将jpg图片转换为png图片的例子:

```bash
$ ls
kulipa.jpg
# 将kulipa.jpg转换为png格式，输出名字叫kulipa.png
$ sips -s format png --out kulipa.png kulipa.jpg
/Users/carlshen/tmp/command_line_image_check/kulipa.jpg
  /Users/carlshen/tmp/command_line_image_check/kulipa.png
$ 
$ ls
kulipa.jpg kulipa.png
$ 
$ file kulipa.jpg kulipa.png
kulipa.jpg: JPEG image data, JFIF standard 1.01, resolution (DPI), density 1x1, segment length 16, baseline, precision 8, 220x220, frames 3
kulipa.png: PNG image data, 220 x 220, 8-bit/color RGB, non-interlaced
$ 
```

支持的格式有jpeg | tiff | png | gif | jp2 | pict | bmp | qtif | psd | sgi | tga
不同系统的sips支持的格式可能不同，可以使用man sips来查看sips支持的转换格式

sips除了能转换图片格式以外，还可以对图片进行调整大小(resize)，旋转(rotate)和翻转(flip)等。

拿一个原size是1200x896的house.jpg为例:
* 限定范围缩放命令: `sips -Z pixelsWH [file]`
	* 例子: `sips -Z 300 house.jpg`
	* 将原图缩放到300x300像素的方框内，保持图片的长宽比不变
* 调整大小命令: `sips -z height width [file]`
	* 例子: `sips -z 400 400 house.jpg`
	* 图片会被缩小拉伸到400x400，原图片的长宽比会改变
* 旋转图片命令: `sips -r degreesCW [file]`
	* 例子: `sips -r 90 house.jpg`
	* 图片会顺时针旋转90度
* 翻转图片命令: `sips -f horizontal|vertical [file]`
	* 例子: `sips -f horizontal house.jpg`
	* 图片会水平翻转。如果使用vertical, 则会垂直翻转
* **注意**，上述命令会**直接修改原图片**，如果要保留原图片，则可以加上__–out__ 参数指定输出的文件名。比如`sips -f horizontal house.jpg --out house_horizontal.jpg`
