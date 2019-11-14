
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

Lua默认只有一种number类型 -- double（双精度类型）类型（默认类型可以修改luaconf.h里面的定义，一下几种写法都被看做number类型）

```lua
print(type(2))
print(type(2.2))
print(type(0.2))
print(type(2e+1))
print(type(0.2e-1))
print(type(7.8263692594256e-06))
```

**string（字符串）**

字符串由一对双引号或单引号来表示

```lua
string1 = "this is string1"
string2 = 'this is string2'
```

也可以用两个方括号`[[]]`来表示一块字符串

```lua
html = [[
    <html>
    <head></head>
    <body>
        <a href="https://github.com/Peefy/">dugu</a>
    </body>
    </html>
]]
```

```lua
print("2" + 6)
print("2" + "6")
print("2 + 6")
print("-2e2" * "6")
print("error" + 1)
```

字符串连接使用的是 `..`

```lua
print("a" .. 'b')
print(157 .. 428)
```

使用 # 来计算字符串的长度，放在字符串前面

```lua
len = "www.runoob.com"
print(#len)
print(#"www.runoob.com")
```

**table(表)**

在 Lua 里，table 的创建是通过"构造表达式"来完成，最简单构造表达式是{}，用来创建一个空表。也可以在表里添加一些数据，直接初始化表:

```lua
local tbl1 = {}
local tbl2 = {"apple", "pear", "orange", "grape"}
```

Lua 中的表（table）其实是一个"关联数组"（associative arrays），数组的索引可以是数字或者是字符串。

```lua
a = {}
a["key"] = "value"
key = 10
a[key] = 22
a[key] = a[key] + 11
for k, v in pairs(a) do
    print(k .. " : " .. v)
end
```

不同于其他语言的数组把 0 作为数组的初始索引，在 Lua 里表的默认初始索引一般以 1 开始,与matlab相同

```lua
local tbl = {"apple", "pear", "orange", "grape"}
for key, val in pairs(tbl) do
    print("Key", key)
end
```

table 不会固定长度大小，有新数据添加时 table 长度会自动增长，没初始的 table 都是 nil。

```lua
a3 = {}
for i = 1, 10 do
    a3[i] = i
end
a3["key"] = "val"
print(a3["key"])
print(a3["none"])
```

在 Lua 中，函数是被看作是"第一类值（First-Class Value）"，函数可以存在变量里

```lua
function factorial1(n)
    if n == 0 then
        return 1
    else
        return n * factorial1(n - 1)
    end
end
print(factorial1(5))
factorial2 = factorial1
print(factorial2(5))
```

function 可以以匿名函数（anonymous function）的方式通过参数传递

```lua
function testFun(tab, fun)
        for k ,v in pairs(tab) do
                print(fun(k,v));
        end
end


tab={key1="val1",key2="val2"};
testFun(tab,
function(key,val)--匿名函数
        return key.."="..val;
end
);
```

**thread(线程)**

在 Lua 里，最主要的线程是`协同程序（coroutine）`。它跟`线程（thread）`差不多，拥有自己独立的栈、局部变量和指令指针，可以跟其他协同程序共享全局变量和其他大部分东西。

线程跟协程的区别：线程可以同时多个运行，而协程任意时刻只能运行一个，并且处于运行状态的协程只有被`挂起（suspend）`时才会暂停。

**userdata(自定义类型)**

userdata 是一种用户自定义数据，用于表示一种由应用程序或 C/C++ 语言库所创建的类型，可以将任意 C/C++ 的任意数据类型的数据（通常是 struct 和 指针）存储到 Lua 变量中调用。

**Lua变量**

变量在使用前，必须在代码中进行声明，即创建该变量。

编译程序执行代码之前编译器需要知道如何给语句变量开辟存储区，用于存储变量的值。

Lua变量有三种类型:

* **全局变量**-lua中的变量全是全局变量，哪怕是语句块或者函数里面，除非用`local`显式声明为局部变量
* **局部变量**-局部变量的作用于位从声明位置开始到所在语句块结束
* **表中的域**-变量的默认值为nil

```lua
a = 5         -- 全局变量
local b = 5   -- 局部变量

function joke()  
    c = 5          -- 全局变量
    local d = 6    -- 局部变量
end

joke()
print(c, d)       --> 5 nil

do
    local a = 6   -- 局部变量
    b = 6
    print(a, b);
end

print(a, b)
```

**赋值语句**

赋值是改变一个变量的值和改变表域的最基本的方法。

```lua
a = "hello" .. "world"
t.n = t.n + 1
a, b = 10, 2 * x       <-->       a=10; b=2*x
x, y = y, x                     -- swap 'x' for 'y'
a[i], a[j] = a[j], a[i]         -- swap 'a[i]' for 'a[j]'
```

```lua
a, b, c = 0, 1
print(a,b,c)             --> 0   1   nil
 
a, b = a+1, b+1, b+2     -- value of b+2 is ignored
print(a,b)               --> 1   2
 
a, b, c = 0
print(a,b,c)             --> 0   nil   nil
```

**索引**

对 table 的索引使用方括号 []。Lua 也提供了 . 操作。

```lua
t[i]
t.i                 -- 当索引为字符串类型时的一种简化写法
gettable_event(t,i) -- 采用索引访问本质上是一个类似这样的函数调用
```

```lua
site = {}
site["key"] = "value"
print(site["key"])
print(site.key)
```
