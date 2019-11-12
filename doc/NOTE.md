
**Lua简介**

Lua 是一种轻量小巧的脚本语言，用标准C语言编写并以源代码形式开放， 其设计目的是为了嵌入应用程序中，从而为应用程序提供灵活的扩展和定制功能。

**Lua特性**

* **轻量级**-它用标准C语言编写并以源代码形式开放，编译后仅仅一百余K，可以很方便的嵌入别的程序里。
* **可扩展**-Lua提供了非常易于使用的扩展接口和机制：由宿主语言(通常是C或C++)提供这些功能，Lua可以使用它们，就像是本来就内置的功能一样。
* **其它特性:**-

1. 支持`面向过程(procedure-oriented)编程`和`函数式编程(functional programming)`
2. `自动内存管理`；只提供了一种通用类型的表（table），用它可以实现数组，哈希表，集合，对象
3.  `语言内置模式匹配`；闭包(closure)；函数也可以看做一个值；提供多线程（协同进程，并非操作系统所支持的线程）支持
4. 通过闭包和table可以很方便地支持面向对象编程所需要的一些关键机制，比如数据抽象，虚函数，继承和重载等

**Lua应用场景**

* 游戏开发
* 独立应用脚本
* Web 应用脚本
* 扩展和数据库插件如：MySQL Proxy 和 MySQL WorkBench
* 安全系统，如入侵检测系统

**运行Lua脚本**

```lua
lua hello.lua
```

**Lua基本语法**

*Lua提供了交互编程模式，可以在命令行中输入程序并立即查看效果,通过命令lua -i或lua来启用*

**Lua注释**

Lua单行注释是两个减号，多行注释是如下形式

```lua
--[[
    多行注释
    多行注释
]]--
```

**Lua标识符**

Lua 标示符用于定义一个变量，函数获取其他用户定义的项。标示符以一个字母 A 到 Z 或 a 到 z 或下划线 _ 开头后加上0个或多个字母，下划线，数字（0到9）。

最好不要使用下划线加大写字母的标示符，因为Lua的保留字也是这样的。

Lua 不允许使用特殊字符如 @, $, 和 % 来定义标示符。 Lua 是一个区分大小写的编程语言。以下列出了一些正确的标示符：

```lua
mohd         zara      abc     move_name    a_123
myname50     _temp     j       a23b9        retVal
```

**Lua关键字**

-|-|-|-
-|-|-|-
and|	break|	do|	else
elseif|	end|	false|	for
function|	if|	in|	local
nil|	not|	or|	repeat
return|	then|	true|	until
while|

一般约定，以下划线开头连接一串大写字母的名字(比如 `_VERSION`)被保留用于Lua内部全局变量

**全局变量**

在默认情况下，变量总是认为是全局的。全局变量不需要声明，给一个变量赋值后即创建了这个全局变量，访问一个没有初始化的全局变量也不会出错，只不过得到的结果是：nil。

**Lua数据类型**

Lua是动态类型语言，变量不要类型定义，只需要为变量赋值。值可以存储在变量中，作为参数传递或结果返回。

Lua中有8个基本类型分别为：`nil`、`boolean`、`number`、`string`、`userdata`、`funciton`、`thread`和`table`

数据类型|描述
-|-
nil|这个最简单，只有值nil属于该类，表示一个无效值（在条件表达式中相当于false）。
boolean|	包含两个值：false和true。
number|	表示双精度类型的实浮点数
string|	字符串由一对双引号或单引号来表示
function|	由 C 或 Lua 编写的函数
userdata|	表示任意存储在变量中的C数据结构
thread|	表示执行的独立线路，用于执行协同程序
table|	Lua 中的表（table）其实是一个"关联数组"（associative arrays），数组的索引可以是数字、字符串或表类型。在 Lua 里，table 的创建是通过"构造表达式"来完成，最简单构造表达式是{}，用来创建一个空表。

可以使用type函数测试给定变量或者值的类型

```lua
print(type("Hello world")) --> string
print(type(10.4*3))             --> number
print(type(print))              --> function
print(type(type))               --> function
print(type(true))               --> boolean
print(type(nil))                --> nil
print(type(type(X)))            --> string
```

**nil(空)**

nil类型表示一种没有任何有效值，它只有一个值 --nil，例如打印一个没有赋值的变量，便会输出一个nil值

对于全局变量和table，nil还有删除作用，给全局变量或者table表里的变量赋一个nil值，等同于把它们删除，执行下面的代码：

```lua
tab1 = { key1 = "val1", key2 = "val2", "val3" }
for k, v in pairs(tab1) do
    print(k .. " - " .. v)
end
 
tab1.key1 = nil
for k, v in pairs(tab1) do
    print(k .. " - " .. v)
end
```

*注意：nil作比较时应该加上双引号`"`*

```lua
> type(X)
nil
> type(X)==nil
false
> type(X)=="nil"
true
>
```

**boolean(布尔)**

boolean 类型只有两个可选值：true（真） 和 false（假），Lua 把 false 和 nil 看作是"假"，其他的都为"真":

```lua
print(type(true))
print(type(false))
print(type(nil))
 
if false or nil then
    print("至少有一个是 true")
else
    print("false 和 nil 都为 false!")
end
```

**number(数字)**
