--图片路径
PIC_PATH = "/var/touchelf/scripts/cqb_images/"
--文件，一行，1,2，收钱名字，自己大区,是否发邮件
	local file,line,a1,a2
    local area = "默认大区"
    local is = "默认否"
    local name = "无"
function main()
    while true do
        mSleep(2000)
        getArea()
        notifyMessage("是否发邮件:"..is)
        mSleep(2000)
        notifyMessage("收钱号所在大区:"..area)
        mSleep(2000)
        name = getName()
        notifyMessage("收钱号角色名字:"..name)
    end
    
end
function getArea()
    
	file = io.open("/var/touchelf/scripts/name.txt","r")
	for line in file:lines() do
        local list = split(line,",")
        a1=list[1]
        a2=list[2]
        --获取大区和是否发邮件
        if a1 == "角色所在大区" then 
            area=a2
        elseif a1 == "是否发邮件" then
            is = a2
        end 
        if a1 == area then
            name = a2
            notifyMessage(name.."name = a2:"..a2)
            break
        end
	end 	
	file:close()
end
--获取收钱号角色名字
function getName()
	file = io.open("/var/touchelf/scripts/name.txt","r")
	for line in file:lines() do
        local list = split(line,",")
        a1=list[1]
        a2=list[2]
        notifyMessage("---a1的值为："..a1)
        mSleep(1500)
        notifyMessage("---a2的值为："..a2)
        mSleep(1500)
        notifyMessage("---area的值为："..area)
        mSleep(1500)
        if a1 == area then
            break
        end
    end
    file:close()
    return name
end 
	--分割字符串
--local list = Split("abc,123,345", ",")--示例
function split(szFullString, szSeparator)  
	local nFindStartIndex = 1  
	local nSplitIndex = 1  
	local nSplitArray = {}  
	while true do  
	   local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)  
	   if not nFindLastIndex then  
		nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))  
		break  
	   end  
	   nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)  
	   nFindStartIndex = nFindLastIndex + string.len(szSeparator)  
	   nSplitIndex = nSplitIndex + 1  
	end  
	return nSplitArray  
end  