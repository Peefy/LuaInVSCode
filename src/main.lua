
print("Hello World!")

print(type("Hello world")) --> string
print(type(10.4*3))             --> number
print(type(print))              --> function
print(type(type))               --> function
print(type(true))               --> boolean
print(type(nil))                --> nil
print(type(type(X)))            --> string

tab1 = { key1 = "val1", key2 = "val2", "val3" }
for k, v in pairs(tab1) do
    print(k .. " - " .. v)
end
 
tab1.key1 = nil
for k, v in pairs(tab1) do
    print(k .. " - " .. v)
end

print(type(true))
print(type(false))
print(type(nil))
 
if false or nil then
    print("至少有一个是 true")
else
    print("false 和 nil 都为 false!")
end

print(type(2))
print(type(2.2))
print(type(0.2))
print(type(2e+1))
print(type(0.2e-1))
print(type(7.8263692594256e-06))

string1 = "this is string1"
string2 = 'this is string2'

html = [[
    <html>
    <head></head>
    <body>
        <a href="https://github.com/Peefy/">dugu</a>
    </body>
    </html>
]]

print(html)

print("2" + 6)
print("2" + "6")
print("2 + 6")
print("-2e2" * "6")
print("error" + 1)

print("a" .. 'b')
print(157 .. 428)

len = "www.runoob.com"
print(#len)
print(#"www.runoob.com")

local tbl1 = {}
local tbl2 = {"apple", "pear", "orange", "grape"}

a = {}
a["key"] = "value"
key = 10
a[key] = 22
a[key] = a[key] + 11
for k, v in pairs(a) do
    print(k .. " : " .. v)
end

local tbl = {"apple", "pear", "orange", "grape"}
for key, val in pairs(tbl) do
    print("Key", key)
end

a3 = {}
for i = 1, 10 do
    a3[i] = i
end
a3["key"] = "val"
print(a3["key"])
print(a3["none"])

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

for i = 10, 1, -1 do
    repeat
      if i == 5 then
        print("continue code here")
        break
      end
      print(i, "loop code here")
    until true
end

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

do  
    function foo(...)  
        for i = 1, select('#', ...) do  -->获取参数总数
            local arg = select(i, ...); -->读取参数
            print("arg", arg);  
        end  
    end  
 
    foo(1, 2, 3, 4);  
end
