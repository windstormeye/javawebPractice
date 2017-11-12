<%@ page session="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">

body{
	margin:0px;
	padding:0px;
	text-align:center;

	background-color: rgb(205, 236, 252);

	z-index: 0;

}
 #container { 
        width:980px; 
        height: 1000px;
        background-color: #99bbbb;

        margin: 0 auto;/*让页面居中*/
       position: relative;

       z-index: 1;
    }

#header
{
	margin: -20px auto;
	background-color:#99bbbb;

	z-index: 2;
}
	/*div#container{width:100%;height: 100%; background-color: #99bbbb;}*/

#banner
{

}

#Person {
	
		/*margin: 5px;/*设置两个div之间的距离*/
		height:300px; 
		width:210px; 
		/*不能让div浮动，否则就不会按照顺序结构来了*/

		border-style: solid;
		border-width: 1px;
		border-color: black;

		background-color:rgb(238, 238, 238);

		z-index: 2;
	}

#footer {

		width: 980px;
		top: 1200px;

		background-color:rgb(205, 236, 252); 
		
		text-align:center;

		position: fixed;
		bottom: 0px;

		z-index: 2;
		
	}

#firstTopZone
{
	top: 100px;
	width: 210px;
	margin-top: 5px;

	height: auto;
	border-style: solid;
	border-width: 1px;
	border-color: black;

	background-color: rgb(238, 238, 238);

	z-index: 2;
}

#secondTopZone
{
	height: auto;

	top: 150px;
	margin-top: 5px;
	width: 210px;

	border-style: solid;
	border-width: 1px;
	border-color: black;

	background-color: rgb(238, 238, 238);

	z-index: 2;
}

#thirdTopZone
{
	height: auto;

	top: 150px;
	margin-top: 5px;
	width: 210px;

	border-style: solid;
	border-width: 1px;
	border-color: black;

	background-color: rgb(238, 238, 238);

	z-index: 2;
}

#superLink
{
	height: auto;

	top: -20px;
	margin-top: 5px;
	width: 210px;

	border-style: solid;
	border-width: 1px;
	border-color: black;

	background-color: rgb(238, 238, 238);

	position: relative;

	z-index: 2;

}

#temp
{
	width: 980px;
	height: 30px;
}

#xuandongtiandi
{
	
	margin: 5px;
	width: 199px;
	border-style: solid;
	border-width: 1px;
	border-color: black;
}

#wenzhanfenlei
{
	
	margin: 5px;
	width: 199px;
	border-style: solid;
	border-width: 1px;
	border-color: black;
}

#zuixinwenzhang
{
	
	margin: 5px;
	width: 199px;
	border-style: solid;
	border-width: 1px;
	border-color: black;
}

#youqinglianjie
{
	
	margin: 5px;
	width: 199px;
	border-style: solid;
	border-width: 1px;
	border-color: black;
}

#content1
{
	left: 220px;
	top: -865px;

	position: relative;

	height: auto;
	
	width: 750px;

	margin-top: 5px;
	
	border-style: solid;
	border-width: 1px;
	border-color: black;

	background-color: rgb(238, 238, 238);

	z-index: 2;
}

#content2
{
	left: 220px;
	top: -860px;

	position: relative;

	height: auto;
	
	width: 750px;

	margin-top: 5px;
	
	border-style: solid;
	border-width: 1px;
	border-color: black;

	background-color: rgb(238, 238, 238);

	z-index: 2;
}

#content3
{
	left: 220px;
	top: -855px;

	position: relative;

	height: auto;
	
	width: 750px;

	margin-top: 5px;
	
	border-style: solid;
	border-width: 1px;
	border-color: black;

	background-color: rgb(238, 238, 238);

	z-index: 2;
}





h1 {
		margin-bottom:0;
	}
h2 {
		margin-bottom:0; 
		font-size:14px;
	}
ul {
		margin:0;
	}
li {
		list-style:none;
	}
</style>
</head>

<body>

<div id="container">
	
	<div id="header">
		<h1>Json's Blog ( beta version )</h1>
		<h2>This is a iOS & Andriod Developer community</h2>
	</div>
	<div id="temp"></div>

	<div id = "banner">
		<a href="" style="text-decoration: none; font-size: 12px;">个人首页</a>   
		<a href="" style="text-decoration: none; font-size: 12px;">我的相册</a>
		<a href="" style="text-decoration: none; font-size: 12px;">给我留言</a>   
		<a href="" style="text-decoration: none; font-size: 12px;" >收藏本站</a>
		<a href="" style="text-decoration: none; font-size: 12px;">更多信息</a>
		<a href="" style="text-decoration: none; font-size: 12px;">加入我们</a>
	</div>
	<div id="Person">
		<img src="EOS.jpg" style="width: 100px; height: 100px; margin-top:80px;/*margin-top设置距离上边框的距离*/">
		<p>Welcome to my blog</p>
		
	</div>

		<div id="firstTopZone">
		<div id="xuandongtiandi">****** 炫动天地 ******</div>
			<a href="" style="text-decoration: none; ">个人首页</a>   
			<a href="" style="text-decoration: none;">我的相册</a><br />
			<a href="" style="text-decoration: none;">给我留言</a>   
			<a href="" style="text-decoration: none;">收藏本站</a><br />
			<a href="" style="text-decoration: none;">更多信息</a>
			<a href="" style="text-decoration: none;">加入我们</a>
	</div>

	<div id="secondTopZone">
	<div id="wenzhanfenlei">****** 文章分类 ******</div>
		<ul style="text-align: left; margin: 10px;padding: 0;">
			<li><a href="" style="text-decoration: none;">First</a></li>
			<li><a href="" style="text-decoration: none;">Second</a></li>
			<li><a href="" style="text-decoration: none;">Third</a></li>
		</ul>
	</div>


	<div id="thirdTopZone">
	<div id="zuixinwenzhang">****** 最新文章 ******</div>
		<ul style="text-align: left; margin: 10px;padding: 0;">
			<li><a href="" style="text-decoration: none;">aaa</a></li>
			<li><a href="" style="text-decoration: none;">bbb</a></li>
			<li><a href="" style="text-decoration: none;">ccc</a></li>
			<li><a href="" style="text-decoration: none;">ddd</a></li>
			<li><a href="" style="text-decoration: none;">eee</a></li>
			<li><a href="" style="text-decoration: none;">fff</a></li>
		</ul>
	</div>　




	 <div id="superLink">
 		<div id="youqinglianjie">****** 友情链接 ******</div>
			<ul style="text-align: left; margin: 10px;padding: 0;">
			<li><a href="http://www.baidu.com" style="text-decoration: none;">有问题？百度一下呀！</a></li>
			<li><a href="http://google.com" style="text-decoration: none;">还有问题 ？google呀！</a></li>
			<li><a href="http://tieba.baidu.com/f?kw=%E9%A3%8E%E6%9A%B4%E7%9C%BC%E5%B7%A5%E4%BD%9C%E5%AE%A4&ie=utf-8" style="text-decoration: none;">解题神器：风暴眼工作室</a></li>
    		</ul>
 	</div>

 	<div id="content1">
		<p style="text-align: left;margin: 5px;">C++中的虚函数的作用主要是实现了多态的机制。</p>

			<p>&nbsp&nbsp&nbsp&nbsp关于多态，简而言之就是用父类型别的指针指向其子类的实例，然后通过父类的指针调用实际子类的成员函数。这种技术可以让父类的指针有“多种形态”，这是一种泛型技术。所谓泛型技术，说白了就是试图使用不变的代码来实现可变的算法。比如：模板技术，RTTI技术，虚函数技术，要么是试图做到在编译时决议，要么试图做	到运行时决议。关于虚函数的使用方法，我在这里不做过多的阐述。大家可以看看相关的C++的书籍。在这篇文章中，我只想从虚函数的实现机制上面为大家 一个清晰的剖析。
			</p>
			<p>&nbsp&nbsp&nbsp&nbsp当然，相同的文章在网上也出现过一些了，但我总感觉这些文章不是很容易阅读，大段大段的代码，没有图片，没有详细的说明，没有比较，没有举一	反三。不利于学习和阅读，所以这是我想写下这篇文章的原因。也希望大家多给我提意见。
			</p>
 
		<p style="text-align: left;margin: 5px;">&nbsp&nbsp&nbsp&nbsp言归正传，让我们一起进入虚函数的世界。</p>
	 </div>
	
	<div id="content2">
		<p style="text-align: left;margin: 5px;">C++中的虚函数的作用主要是实现了多态的机制。</p>

			<p>&nbsp&nbsp&nbsp&nbsp关于多态，简而言之就是用父类型别的指针指向其子类的实例，然后通过父类的指针调用实际子类的成员函数。这种技术可以让父类的指针有“多种形态”，这是一种泛型技术。所谓泛型技术，说白了就是试图使用不变的代码来实现可变的算法。比如：模板技术，RTTI技术，虚函数技术，要么是试图做到在编译时决议，要么试图做	到运行时决议。关于虚函数的使用方法，我在这里不做过多的阐述。大家可以看看相关的C++的书籍。在这篇文章中，我只想从虚函数的实现机制上面为大家 一个清晰的剖析。
			</p>
			<p>&nbsp&nbsp&nbsp&nbsp当然，相同的文章在网上也出现过一些了，但我总感觉这些文章不是很容易阅读，大段大段的代码，没有图片，没有详细的说明，没有比较，没有举一	反三。不利于学习和阅读，所以这是我想写下这篇文章的原因。也希望大家多给我提意见。
			</p>
 
		<p style="text-align: left;margin: 5px;">&nbsp&nbsp&nbsp&nbsp言归正传，让我们一起进入虚函数的世界。</p>
	 </div>

	 <div id="content3">
		<p style="text-align: left;margin: 5px;">C++中的虚函数的作用主要是实现了多态的机制。</p>

			<p>&nbsp&nbsp&nbsp&nbsp关于多态，简而言之就是用父类型别的指针指向其子类的实例，然后通过父类的指针调用实际子类的成员函数。这种技术可以让父类的指针有“多种形态”，这是一种泛型技术。所谓泛型技术，说白了就是试图使用不变的代码来实现可变的算法。比如：模板技术，RTTI技术，虚函数技术，要么是试图做到在编译时决议，要么试图做	到运行时决议。关于虚函数的使用方法，我在这里不做过多的阐述。大家可以看看相关的C++的书籍。在这篇文章中，我只想从虚函数的实现机制上面为大家 一个清晰的剖析。
			</p>
			<p>&nbsp&nbsp&nbsp&nbsp当然，相同的文章在网上也出现过一些了，但我总感觉这些文章不是很容易阅读，大段大段的代码，没有图片，没有详细的说明，没有比较，没有举一	反三。不利于学习和阅读，所以这是我想写下这篇文章的原因。也希望大家多给我提意见。
			</p>
 
		<p style="text-align: left;margin: 5px;">&nbsp&nbsp&nbsp&nbsp言归正传，让我们一起进入虚函数的世界。</p>
	 </div>


</div>


<p>Copyright EOS</p>




</body>
</html>