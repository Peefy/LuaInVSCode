
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
len = "dugu"
print(#len)
print(#"dugu")
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

**Lua循环**

循环类型|描述
-|-
`while` 循环|	在条件为 `true` 时，让程序重复地执行某些语句。执行语句前会先检查条件是否为 `true`。
`for 循环`|	重复执行指定语句，重复次数可在 `for` 语句中控制。
`repeat...until`|	重复执行循环，直到 指定的条件为真时为止
`循环嵌套`|	可以在循环内嵌套一个或多个循环语句（`while do ... end`;`for ... do ... end`;`repeat ... until`;）

**循环控制语句**

```lua
for i = 10, 1, -1 do
  repeat
    if i == 5 then
      print("continue code here")
      break
    end
    print(i, "loop code here")
  until true
end
```

*lua中没有continue语句*

```lua
for i = 10, 1, -1 do
  repeat
    if i == 5 then
      print("continue code here")
      break
    end
    print(i, "loop code here")
  until true
end
```

**lua流程控制**

控制结构的条件表达式结果可以是任何值，Lua认为false和nil为假，true和非nil为真。

*注意：要注意的是Lua中 0 为 true：*

lua中提供了以下控制语句

语句|描述
-|-
`if 语句`|	if 语句 由一个布尔表达式作为条件判断，其后紧跟其他语句组成。
`if...else 语句`|	if 语句 可以与 else 语句搭配使用, 在 if 条件表达式为 false 时执行 else 语句代码。
`if 嵌套语句`|	你可以在if 或 else if中使用一个或多个 if 或 else if 语句 。

```lua
--[ 定义变量 --]
a = 100;
b = 200;

--[ 检查条件 --]
if( a == 100 )
then
   --[ if 条件为 true 时执行以下 if 条件判断 --]
   if( b == 200 )
   then
      --[ if 条件为 true 时执行该语句块 --]
      print("a 的值为 100 b 的值为 200" );
   end
end
print("a 的值为 :", a );
print("b 的值为 :", b );
```

**lua函数**

在Lua中，函数是对语句和表达式进行抽象的主要方法。既可以用来处理一些特殊的工作，也可以用来计算一些值。

Lua 提供了许多的内建函数，可以很方便的在程序中调用它们，如print()函数可以将传入的参数打印在控制台上。

Lua 函数主要有两种用途：

* 完成指定的任务，这种情况下函数作为调用语句使用；
* 计算并返回值，这种情况下函数作为赋值语句的表达式使用。

```lua
--[[ 函数返回两个值的最大值 --]]
function max(num1, num2)
   if (num1 > num2) then
      result = num1;
   else
      result = num2;
   end
   return result;
end
-- 调用函数
print("两值比较最大值为 ",max(10, 4))
print("两值比较最大值为 ",max(5, 6))
```

lua中可以将函数作为参数传递给函数

```lua
myprint = function(param)
   print("这是打印函数 -   ##",param,"##")
end

function add(num1, num2, functionPrint)
   result = num1 + num2
   -- 调用传递的函数参数
   functionPrint(result)
end
myprint(10)
-- myprint 函数作为参数传递
add(2, 5, myprint)
```

**lua函数多返回值**

Lua函数可以返回多个结果值，比如string.find，其返回匹配串"开始和结束的下标"（如果不存在匹配串返回nil）

```lua
s, e = string.find("dugudugu", "du") 
print(s, e)
```

Lua函数中，在return后列出要返回的值的列表即可返回多值，如：

```lua
function maximum (a)
    local mi = 1             -- 最大值索引
    local m = a[mi]          -- 最大值
    for i,val in ipairs(a) do
       if val > m then
           mi = i
           m = val
       end
    end
    return m, mi
end
print(maximum({8, 10, 23, 12, 5}))
```

**lua可变参数**

Lua 函数可以接受可变数目的参数，和 C 语言类似，在函数参数列表中使用三点 ... 表示函数有可变的参数。

```lua
function add(...)  
local s = 0  
  for i, v in ipairs{...} do   --> {...} 表示一个由所有变长参数构成的数组  
    s = s + v  
  end  
  return s  
end  
print(add(3,4,5,6,7))  --->25
```

我们可以将可变参数赋值给一个变量。

例如，我们计算几个数的平均值：

```lua
function average(...)
   result = 0
   local arg={...}    --> arg 为一个表，局部变量
   for i,v in ipairs(arg) do
      result = result + v
   end
   print("总共传入 " .. #arg .. " 个数")
   return result/#arg
end

print("平均值为",average(10,5,3,4,5,6))
```

可以通过 select("#",...) 来获取可变参数的数量:

```lua
function average(...)
   result = 0
   local arg={...}
   for i,v in ipairs(arg) do
      result = result + v
   end
   print("总共传入 " .. select("#",...) .. " 个数")
   return result/select("#",...)
end

print("平均值为",average(10,5,3,4,5,6))
```

通常在遍历变长参数的时候只需要使用 `{…}`，然而变长参数可能会包含一些 `nil`，那么就可以用 `select` 函数来访问变长参数了：`select('#', …)` 或者 `select(n, …)`

* `select('#', …)` 返回可变参数的长度
* `select(n, …)` 用于访问 `n` 到 `select('#',…)` 的参数

```lua
do  
    function foo(...)  
        for i = 1, select('#', ...) do  -->获取参数总数
            local arg = select(i, ...); -->读取参数
            print("arg", arg);  
        end  
    end  
 
    foo(1, 2, 3, 4);  
end
```

**lua运算符**

运算符是一个特殊的符号，用于告诉解释器执行特定的数学或逻辑运算。Lua提供了以下几种运算符类型：

* 算术运算符
* 关系运算符
* 逻辑运算符
* 其他运算符

**lua算数运算符**

操作符|	描述|	实例
-|-|-
`+`|	加法|	A + B 输出结果 30
`-`|	减法|	A - B 输出结果 -10
`*`|	乘法|	A * B 输出结果 200
`/`|	除法|	B / A w输出结果 2
`%`|	取余	B % A 输出结果 0
`^`|	乘幂	A^2 输出结果 100
`-`|	负号	-A 输出结果 -10

```lua
a = 21
b = 10
c = a + b
print("Line 1 - c 的值为 ", c )
c = a - b
print("Line 2 - c 的值为 ", c )
c = a * b
print("Line 3 - c 的值为 ", c )
c = a / b
print("Line 4 - c 的值为 ", c )
c = a % b
print("Line 5 - c 的值为 ", c )
c = a^2
print("Line 6 - c 的值为 ", c )
c = -a
print("Line 7 - c 的值为 ", c )
```

**lua关系运算符**

下表列出了 Lua 语言中的常用关系运算符，设定 A 的值为10，B 的值为 20：

操作符|	描述|	实例
-|-|-
`==`|	等于，检测两个值是否相等，相等返回 true，否则返回 false|	(`A == B`) 为 false。
`~=`|	不等于，检测两个值是否相等，相等返回 false，否则返回 true|	(`A ~= B`) 为 true。
`>`|	大于，如果左边的值大于右边的值，返回 true，否则返回 false|	(`A > B`) 为 false。
`<`|	小于，如果左边的值大于右边的值，返回 false，否则返回 true|	(`A < B`) 为 true。
`>=`|	大于等于，如果左边的值大于等于右边的值，返回 true，否则返回 false|	(`A >= B`) 返回 false。
`<=`|	小于等于， 如果左边的值小于等于右边的值，返回 true，否则返回 false|	(`A <= B`) 返回 true。

```lua
a = 21
b = 10

if( a == b )
then
   print("Line 1 - a 等于 b" )
else
   print("Line 1 - a 不等于 b" )
end

if( a ~= b )
then
   print("Line 2 - a 不等于 b" )
else
   print("Line 2 - a 等于 b" )
end

if ( a < b )
then
   print("Line 3 - a 小于 b" )
else
   print("Line 3 - a 大于等于 b" )
end

if ( a > b )
then
   print("Line 4 - a 大于 b" )
else
   print("Line 5 - a 小于等于 b" )
end

-- 修改 a 和 b 的值
a = 5
b = 20
if ( a <= b )
then
   print("Line 5 - a 小于等于  b" )
end

if ( b >= a )
then
   print("Line 6 - b 大于等于 a" )
end
```

**lua逻辑运算符**

下表列出了 Lua 语言中的常用逻辑运算符，设定 A 的值为 true，B 的值为 false：

操作符|	描述|	实例
-|-|-
`and`|	逻辑与操作符。 若 A 为 false，则返回 A，否则返回 B。|	(A and B) 为 false。
`or`|	逻辑或操作符。 若 A 为 true，则返回 A，否则返回 B。|	(A or B) 为 true。
`not`|	逻辑非操作符。与逻辑运算结果相反，如果条件为 true，逻辑非为 false。|	not(A and B) 为 true。

```lua
a = true
b = true

if ( a and b )
then
   print("a and b - 条件为 true" )
end

if ( a or b )
then
   print("a or b - 条件为 true" )
end

print("---------分割线---------" )

-- 修改 a 和 b 的值
a = false
b = true

if ( a and b )
then
   print("a and b - 条件为 true" )
else
   print("a and b - 条件为 false" )
end

if ( not( a and b) )
then
   print("not( a and b) - 条件为 true" )
else
   print("not( a and b) - 条件为 false" )
end
```

**lua其他运算符**

操作符|	描述|	实例
-|-|-
`..`	|连接两个字符串	a..b ，其中 a 为 "Hello " ， b 为 "World", 输出结果为 "Hello World"。
`#`	|一元运算符，返回字符串或表的长度。	#"Hello" 返回 5

```lua
a = "Hello "
b = "World"

print("连接字符串 a 和 b ", a..b )

print("b 字符串长度 ",#b )

print("字符串 Test 长度 ",#"Test" )

print("la len: ",#"dugu" )
```

**lua运算符优先级**

```
^
not    - (unary)
*      /
+      -
..
<      >      <=     >=     ~=     ==
and
or
```

```lua
a = 20
b = 10
c = 15
d = 5

e = (a + b) * c / d;-- ( 30 * 15 ) / 5
print("(a + b) * c / d 运算值为  :",e )

e = ((a + b) * c) / d; -- (30 * 15 ) / 5
print("((a + b) * c) / d 运算值为 :",e )

e = (a + b) * (c / d);-- (30) * (15/5)
print("(a + b) * (c / d) 运算值为 :",e )

e = a + (b * c) / d;  -- 20 + (150/5)
print("a + (b * c) / d 运算值为   :",e )
```

**lua字符串**

字符串或串(String)是由数字、字母、下划线组成的一串字符。

Lua 语言中字符串可以使用以下三种方式来表示：

* 单引号间的一串字符。
* 双引号间的一串字符。
* `[[`和`]]`间的一串字符。

```lua
string1 = "Lua"
print("\"字符串 1 是\"", string1)
string2 = 'dugu.com'
print("字符串 2 是", string2)

string3 = [["dugu"]]
print("字符串 3 是", string3)
```

转义字符用于表示不能直接显示的字符，比如后退键，回车键，等。如在字符串转换双引号可以使用 "\""。

所有的转义字符和所对应的意义：

转义字符|意义|ASCII码值（十进制）
-|-|-
`\a`|响铃(BEL)|007
`\b`|退格(BS) ，将当前位置移到前一列|008
`\f`|换页(FF)，将当前位置移到下页开头|012
`\n`|换行(LF) ，将当前位置移到下一行开头|010
`\r`|回车(CR) ，将当前位置移到本行开头|013
`\t`|水平制表(HT) （跳到下一个TAB位置）|009
`\v`|垂直制表(VT)|011
`\\`|代表一个反斜线字符''\'|092
`\'`|代表一个单引号（撇号）字符|039
`\"`|代表一个双引号字符|034
`\0`|空字符(NULL)|000
`\ddd`|1到3位八进制数所代表的任意字符|三位八进制
`\xhh`|1到2位十六进制所代表的任意字符|二位十六进制

**字符串操作**

序号|	方法 & 用途
-|-
1|	`string.upper(argument)`: 字符串全部转为大写字母。
2|	`string.lower(argument)`: 字符串全部转为小写字母。
3|	`string.gsub(mainString,findString,replaceString,num)`: 在字符串中替换。mainString 为要操作的字符串， findString 为被替换的字符，replaceString 要替换的字符，num 替换次数（可以忽略，则全部替换），如：`> string.gsub("aaaa","a","z",3);` `zzza    3`
4|	`string.find (str, substr, [init, [end]])` 在一个指定的目标字符串中搜索指定的内容(第三个参数为索引),返回其具体位置。不存在则返回 nil。 `> string.find("Hello Lua user", "Lua", 1) ` `7    9`
5|	`string.reverse(arg)` 字符串反转 `> string.reverse("Lua")` `auL`
6|	`string.format(...)` 返回一个类似printf的格式化字符串 `> string.format("the value is:%d",4)` `the value is:4`
7|	`string.char(arg) 和 string.byte(arg[,int])` char 将整型数字转成字符并连接， byte 转换字符为整数值(可以指定某个字符，默认第一个字符)。 `> string.char(97,98,99,100)` `abcd` `> string.byte("ABCD",4)` `68` `> string.byte("ABCD")` `65` `>`
8|	`string.len(arg)` 计算字符串长度。 `string.len("abc") ``3`
9|	`string.rep(string, n)` 返回字符串string的n个拷贝 `> string.rep("abcd",2)` `abcdabcd`
10|	`..` 链接两个字符串 `> print("one".."two")` `onetwo`
11|	`string.gmatch(str, pattern)` 返回一个迭代器函数，每一次调用这个函数，返回一个在字符串 str 找到的下一个符合 pattern 描述的子串。如果参数 pattern 描述的字符串没有找到，迭代函数返回nil。 `> for word in string.gmatch("Hello Lua user", "%a+") do print(word) end` `Hello Lua user`
12|	`string.match(str, pattern, init)` string.match()只寻找源字串str中的第一个配对. 参数init可选, 指定搜寻过程的起点, 默认为1。 在成功配对时, 函数将返回配对表达式中的所有捕获结果; 如果没有设置捕获标记, 则返回整个配对字符串. 当没有成功的配对时, 返回nil。 `> = string.match("I have 2 questions for you.", "%d+ %a+")` `2 questions` `> = string.format("%d, %q", string.match("I have 2 questions for you.", "(%d+) (%a+)"))` `2, "questions"`

**字符串大小写转换**

```lua
string1 = "Lua";
print(string.upper(string1))
print(string.lower(string1))
```

**字符串查找与反转**

```lua
string = "Lua Tutorial"
-- 查找字符串
print(string.find(string,"Tutorial"))
reversedString = string.reverse(string)
print("新字符串为",reversedString)
```

**字符串格式化**

Lua 提供了 `string.format()` 函数来生成具有特定格式的字符串, 函数的第一个参数是格式 , 之后是对应格式中每个代号的各种数据。

由于格式字符串的存在, 使得产生的长字符串可读性大大提高了。这个函数的格式很像 C 语言中的 printf()。

以下实例演示了如何对字符串进行格式化操作：

格式字符串可能包含以下的转义码:

* %c - 接受一个数字, 并将其转化为ASCII码表中对应的字符
* %d, %i - 接受一个数字并将其转化为有符号的整数格式
* %o - 接受一个数字并将其转化为八进制数格式
* %u - 接受一个数字并将其转化为无符号整数格式
* %x - 接受一个数字并将其转化为十六进制数格式, 使用小写字母
* %X - 接受一个数字并将其转化为十六进制数格式, 使用大写字母
* %e - 接受一个数字并将其转化为科学记数法格式, 使用小写字母e
* %E - 接受一个数字并将其转化为科学记数法格式, 使用大写字母E
* %f - 接受一个数字并将其转化为浮点数格式 
* %g(%G) - 接受一个数字并将其转化为%e(%E, 对应%G)及%f中较短的一种格式
* %q - 接受一个字符串并将其转化为可安全被Lua编译器读入的格式
* %s - 接受一个字符串并按照给定的参数格式化该字符串

为进一步细化格式, 可以在%号后添加参数. 参数将以如下的顺序读入:

* 符号: 一个+号表示其后的数字转义符将让正数显示正号. 默认情况下只有负数显示符号.
* 占位符: 一个0, 在后面指定了字串宽度时占位用. 不填时的默认占位符是空格.
* 对齐标识: 在指定了字串宽度时, 默认为右对齐, 增加-号可以改为左对齐.
* 宽度数值
* 小数位数/字串裁切: 在宽度数值后增加的小数部分n, 若后接f(浮点数转义符, 如%6.3f)则设定该浮点数的小数只保留n位, 若后接s(字符串转义符, 如%5.3s)则设定该字符串只显示前n位.

```lua
string1 = "Lua"
string2 = "Tutorial"
number1 = 10
number2 = 20
-- 基本字符串格式化
print(string.format("基本格式化 %s %s",string1,string2))
-- 日期格式化
date = 2; month = 1; year = 2014
print(string.format("日期格式化 %02d/%02d/%03d", date, month, year))
-- 十进制格式化
print(string.format("%.4f",1/3))
```

```lua
string.format("%c", 83)                 -- 输出S
string.format("%+d", 17.0)              -- 输出+17
string.format("%05d", 17)               -- 输出00017
string.format("%o", 17)                 -- 输出21
string.format("%u", 3.14)               -- 输出3
string.format("%x", 13)                 -- 输出d
string.format("%X", 13)                 -- 输出D
string.format("%e", 1000)               -- 输出1.000000e+03
string.format("%E", 1000)               -- 输出1.000000E+03
string.format("%6.3f", 13)              -- 输出13.000
string.format("%q", "One\nTwo")         -- 输出"One\
                                        -- 　　Two"
string.format("%s", "monkey")           -- 输出monkey
string.format("%10s", "monkey")         -- 输出    monkey
string.format("%5.3s", "monkey")        -- 输出  mon
```

**字符与整数相互转换**

```lua
-- 字符转换
-- 转换第一个字符
print(string.byte("Lua"))
-- 转换第三个字符
print(string.byte("Lua",3))
-- 转换末尾第一个字符
print(string.byte("Lua",-1))
-- 第二个字符
print(string.byte("Lua",2))
-- 转换末尾第二个字符
print(string.byte("Lua",-2))

-- 整数 ASCII 码转换为字符
print(string.char(97))
```

**其他常用函数**

```lua
string1 = "one"
string2 = "two"
string3 = "three"
-- 使用 .. 进行字符串连接
print("连接字符串",string1..string2..string3)

-- 字符串长度
print("字符串长度 ",string.len(string2))

-- 字符串复制 2 次
repeatedString = string.rep(string2,2)
print(repeatedString)
```

**匹配模式**

Lua 中的匹配模式直接用常规的字符串来描述。 它用于模式匹配函数 `string.find`, `string.gmatch`, `string.gsub`, `string.match`。

你还可以在模式串中使用字符类。

字符类指可以匹配一个特定字符集合内任何字符的模式项。比如，字符类 `%d` 匹配任意数字。所以你可以使用模式串 `%d%d/%d%d/%d%d%d%d` 搜索 `dd/mm/yyyy` 格式的日期：

```lua
s = "Deadline is 30/05/1999, firm"
date = "%d%d/%d%d/%d%d%d%d"
print(string.sub(s, string.find(s, date)))    --> 30/05/1999
```

下面的表列出了Lua支持的所有字符类：

单个字符(除 ^$()%.[]*+-? 外): 与该字符自身配对

* .(点): 与任何字符配对
* %a: 与任何字母配对
* %c: 与任何控制符配对(例如\n)
* %d: 与任何数字配对
* %l: 与任何小写字母配对
* %p: 与任何标点(punctuation)配对
* %s: 与空白字符配对
* %u: 与任何大写字母配对
* %w: 与任何字母/数字配对
* %x: 与任何十六进制数配对
* %z: 与任何代表0的字符配对
* %x(此处x是非字母非数字字符): 与字符x配对. 主要用来处理表达式中有功能的字符(^$()%.[]*+-?)的配对问题, 例如%%与%配对
* `[数个字符类]`: 与任何[]中包含的字符类配对. 例如`[%w_]`与任何字母/数字, 或下划线符号(_)配对
* `[^数个字符类]`: 与任何不包含在[]中的字符类配对. 例如`[^%s]`与任何非空白字符配对

'%' 用作特殊字符的转义字符，因此 '%.' 匹配点；'%%' 匹配字符 '%'。转义字符 '%'不仅可以用来转义特殊字符，还可以用于所有的非字母的字符。

模式条目可以是：

* 单个字符类匹配该类别中任意单个字符；
* 单个字符类跟一个 '*'， 将匹配零或多个该类的字符。 这个条目总是匹配尽可能长的串；
* 单个字符类跟一个 '+'， 将匹配一或更多个该类的字符。 这个条目总是匹配尽可能长的串；
* 单个字符类跟一个 '-'， 将匹配零或更多个该类的字符。 和 '*' 不同， 这个条目总是匹配尽可能短的串；
* 单个字符类跟一个 '?'， 将匹配零或一个该类的字符。 只要有可能，它会匹配一个；
* %n， 这里的 n 可以从 1 到 9； 这个条目匹配一个等于 n 号捕获物（后面有描述）的子串。
* %bxy， 这里的 x 和 y 是两个明确的字符； 这个条目匹配以 x 开始 y 结束， 且其中 x 和 y 保持 平衡 的字符串。 意思是，如果从左到右读这个字符串，对每次读到一个 x 就 +1 ，读到一个 y 就 -1， 最终结束处的那个 y 是第一个记数到 0 的 y。 举个例子，条目 %b() 可以匹配到括号平衡的表达式。
* `%f[set]`， 指 边境模式； 这个条目会匹配到一个位于 set 内某个字符之前的一个空串， 且这个位置的前一个字符不属于 set 。 集合 set 的含义如前面所述。 匹配出的那个空串之开始和结束点的计算就看成该处有个字符 '\0' 一样。

模式：

模式 指一个模式条目的序列。 在模式最前面加上符号 '^' 将锚定从字符串的开始处做匹配。 在模式最后面加上符号 '$' 将使匹配过程锚定到字符串的结尾。 如果 '^' 和 '$' 出现在其它位置，它们均没有特殊含义，只表示自身。

捕获：

模式可以在内部用小括号括起一个子模式； 这些子模式被称为 捕获物。 当匹配成功时，由 捕获物 匹配到的字符串中的子串被保存起来用于未来的用途。 捕获物以它们左括号的次序来编号。 例如，对于模式 "(a*(.)%w(%s*))" ， 字符串中匹配到 "a*(.)%w(%s*)" 的部分保存在第一个捕获物中 （因此是编号 1 ）； 由 "." 匹配到的字符是 2 号捕获物， 匹配到 "%s*" 的那部分是 3 号。

作为一个特例，空的捕获 () 将捕获到当前字符串的位置（它是一个数字）。 例如，如果将模式 "()aa()" 作用到字符串 "flaaap" 上，将产生两个捕获物： 3 和 5 。

**lua数组**

lua数组的索引键值可以使用整数表示，数组的大小不是固定的

**一维数组**

一维数组是最简单的数组，其逻辑结构是线性表。一维数组可以用for循环出数组中的元素

```lua
array = {"Lua", "dugu"}
for i = 0, 2 do
   print(array[i])
end
```

可以使用整数索引来访问数组元素，如果输入的索引号没有值则返回nil

*注意：在lua索引值是以1为开始，但是也可以指定零开始，除此之外还可以指定负数作为索引*

```lua
array = {}
for i = 2, 2 do
   array[i] = i * 2
end

for i = -2, 2 do
   print(array[i])
end
```

**多维数组**

多维数组即数组中包含或一维数组的索引键值对应一个数组。

```lua
-- 初始化数组
array = {}
for i = 1, 3 do
   array[i] = {}
      for j = 1, 3 do
         array[i][j] = i * j
      end
end

-- 访问数组
for i = 1, 3 do
   for j = 1, 3 do
      print(array[i][j])
   end
end
```

**lua迭代器**

迭代器（iterator）是一种对象，它能够用来遍历标准模板库容器中的部分或全部元素，每个迭代器对象代表容器中的确定的地址。

在 Lua 中迭代器是一种支持指针类型的结构，它可以遍历集合的每一个元素。

**泛型for迭代器**

泛型for在自己内部保存迭代函数，实际上它保存三个值：迭代函数、状态常量、控制变量。

```lua
array = {"Google", "Runoob"}

for key,value in ipairs(array)
do
   print(key, value)
end
```

以上实例中使用了 Lua 默认提供的迭代函数 ipairs。

泛型 for 的执行过程：

* 初始化，计算 in 后面表达式的值，表达式应该返回泛型 for 需要的三个值：迭代函数、状态常量、控制变量；与多值赋值一样，如果表达式返回的结果个数不足三个会自动用 nil 补足，多出部分会被忽略。
* 将状态常量和控制变量作为参数调用迭代函数（注意：对于 for 结构来说，状态常量没有用处，仅仅在初始化时获取他的值并传递给迭代函数）。
* 将迭代函数返回的值赋给变量列表。
* 如果返回的第一个值为nil循环结束，否则执行循环体。
* 回到第二步再次调用迭代函数

在Lua中常常使用函数来描述迭代器，每次调用该函数就返回集合的下一个元素。Lua 的迭代器包含以下两种类型：

* **无状态的迭代器**

无状态的迭代器是指不保留任何状态的迭代器，因此在循环中可以利用无状态迭代器避免创建闭包花费额外的代价。

每一次迭代，迭代函数都是用两个变量（状态常量和控制变量）的值作为参数被调用，一个无状态的迭代器只利用这两个值可以获取下一个元素。

这种无状态迭代器的典型的简单的例子是 ipairs，它遍历数组的每一个元素。

以下实例使用了一个简单的函数来实现迭代器，实现 数字 n 的平方：

```lua
function square(iteratorMaxCount,currentNumber)
   if currentNumber<iteratorMaxCount
   then
      currentNumber = currentNumber+1
   return currentNumber, currentNumber*currentNumber
   end
end

for i,n in square,3,0
do
   print(i,n)
end
```

迭代的状态包括被遍历的表（循环过程中不会改变的状态常量）和当前的索引下标（控制变量），ipairs 和迭代函数都很简单，在 Lua 中可以这样实现：

```lua
function iter (a, i)
    i = i + 1
    local v = a[i]
    if v then
       return i, v
    end
end
 
function ipairs (a)
    return iter, a, 0
end
```

当 Lua 调用 ipairs(a) 开始循环时，他获取三个值：迭代函数 iter、状态常量 a、控制变量初始值 0；然后 Lua 调用 iter(a,0) 返回 1, `a[1]`（除非 `a[1]`=nil）；第二次迭代调用 iter(a,1) 返回 2, `a[2]`……直到第一个 nil 元素。

* **多状态的迭代器**

很多情况下，迭代器需要保存多个状态信息而不是简单的状态常量和控制变量，最简单的方法是使用闭包，还有一种方法就是将所有的状态信息封装到 table 内，将 table 作为迭代器的状态常量，因为这种情况下可以将所有的信息存放在 table 内，所以迭代函数通常不需要第二个参数。

```lua
array = {"Google", "Runoob"}

function elementIterator (collection)
   local index = 0
   local count = #collection
   -- 闭包函数
   return function ()
      index = index + 1
      if index <= count
      then
         --  返回迭代器的当前元素
         return collection[index]
      end
   end
end

for element in elementIterator(array)
do
   print(element)
end
```
