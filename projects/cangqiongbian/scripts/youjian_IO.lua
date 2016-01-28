--图片路径
PIC_PATH = "/var/touchelf/scripts/cqb_images/"
color_shezhi = { 0x5ABEDE, -1, -9, 0x5AB6D6, 16, 2, 0xC6FBFF, -2, 10, 0x52B2DE, -7, 1, 0x52B2D6, 7, 4, 0xA5E7F7, 11, 10, 0xCEF7FF, -1, 11, 0x5AB6D6, 10, -9, 0xCEF7F7, 1, 4, 0x6BBEDE }
color_fayoujian = { 0xE7EFF7, -5, -14, 0xF7FBF7, 5, -18, 0xF7F3F7, 4, 7, 0xBDCBD6, -1, 28, 0xE7EBEF, 5, 28, 0xEFF3EF, -8, 7, 0xBDCBD6, 0, 0, 0xE7EFF7 }
--输入收件人
color_shoujianren = { 0xADF3FF, -4, 0, 0xADF7FF, 7, -2, 0xADEFF7, 4, -12, 0xADF3FF, -3, 38, 0xADEFF7 }
color_youjianneirong = { 0xADF3FF, -6, -2, 0x9CDBE7, 7, -6, 0xB5F3FF, 6, 16, 0xADF3FF, 1, 36, 0xA5E3E7, 7, 40, 0xB5F3F7, 0, 64, 0xADF7FF, 6, 64, 0xADF3FF }
UI = {
    {'DropList{星陨阁|焚炎谷|圣丹塔|魔炎神谷|黑角魔域|云莲宗|迦南学院|加玛帝国|苍穹之巅|斗气大陆|冰崖原|风暴岭|落雁湾|海心崖|天蛇谷|云兰山|黑狱平原|乌兰城|风雷谷|神罗天下|迦南天池|大岭湿地|万化剑山|净莲妖地|皇天城|埋骨地|黄泉湖|鹰翼峡|青莲火山|幽海湖|风韵五洲|大罗天阁|万毒宗|妖凤空间|无量谷|天翼宗|冰河城|万剑盟|古龙湖|灼火山脉|蛮荒古城|天目山脉|天星山脉|灸火山脉|初出茅庐|炎帝现身|王者归来|上古石碑|古族萧家|极魔之道|慕兰谷|万剑阁|古圣城|天冥宗|古龙岛|冰河谷|冰皇原|风雷阁|风雷山脉|炼狱山谷|万箭齐发|云起龙骧|笑傲江湖|剑走偏锋|不羁天涯|剑啸九天|瀚海长空|策马屠龙|气贯长虹|问鼎天下|技冠群雄|鸾回凤舞|龙隐江湖|天道无极|震天动地|纵横天下|天苍穹月|气压山河|力挽狂澜|仗剑江湖|群雄争霸|问鼎苍穹|烽火燎原|儿女情长|情动苍穹|斗鱼1服}',    'playerArea',     '角色所在区:' },
    
};
function main()
    while true do
        --开始邮件
        mSleep(2000)
        fayoujian()
  
    end
end

--获取文件中的信息  是否发邮件，角色大区，收钱号名字
function getName()
    --文件，一行，1,2，收钱名字，自己大区,是否发邮件
	local file,line,a1,a2,a3,name,is
	file = io.open("/var/touchelf/scripts/name.txt","r")
	for line in file:lines() do
        local list = split(line,",")
        a1=list[1]
        a2=list[2]
        a3=list[3]
        --获取大区和是否发邮件
        if a1 == playerArea then
            is=a2
            name=a3
            break 
        end
	end 	
	file:close()
    return is,name
end
--发邮件
function fayoujian()
    is,name = getName()
    if is == "是" and string.len(name)>1 then
        notifyMessage("发邮件")
        mSleep(2000)
        --点击邮件
        findPic("youjian.bmp",90, 464,80  , 526,142 )
        --点设置   没发现邮件的话
        findMuColor(color_shezhi,90, 458,2, 533,77)
        --点击邮件
        findPic("youjian.bmp",90, 464,80  , 526,142 )
        --点击发邮件
        findMuColor(color_fayoujian,90, 524,259 , 583,414 )
        --点击    请输入收件人名称
        findMuColor(color_shoujianren,90, 470,158 , 521,370 )
        --输入收件人名字
        inputText(name)
        --点击done
        findPic("done.bmp",90, 315,1   , 535,1003)
        --写邮件内容
        findMuColor(color_youjianneirong,90, 426,160 , 469,284 )
        --输入邮件内容
        inputText("邮件内容")
        --点击done
        findPic("done.bmp",90, 315,1   , 535,1003)
        --放入邮寄物品并发送
        fangru() 
    end
end
--放入邮寄物品
function fangru()
    --开始放入
    notifyMessage("放入")
    mSleep(2000)
    
        local wz = 0 
        while wz < 5 do
            --y方向间隔78 
            --起始范围  65,221         结束范围     100,293
            --第一个格子坐标  85,250   橙色  0xE7E363    紫色为 0xBD38C6    蓝色  0x08344A       
            if findOneColor_bool(0xE7E363,85,65,221+wz*78,100,293+wz*78) or 
                findOneColor_bool(0xBD38C6,85,65,221+wz*78,100,293+wz*78) or 
                findOneColor_bool(0x08344A,85,65,221+wz*78,100,293+wz*78) then
                click(x,y)
                --寄出
                findPic("jichu.bmp",90,    1,2   ,148,312 )
                --装备寄出
                findPic("zhuangbeijichu.bmp",90,  17,42  ,  56,128 )
            else
                --退出方法
                return
            end
            wz = wz + 1
        end
        --点击金币输入框
        click( 151,739 )
        --输入金币数量
        inputText("99999999")
        --点击done
        findPic("done.bmp",90, 315,1   , 535,1003)
        --点击发送
        notifyMessage("发送",1000)
        mSleep(2000)
        findPic("fasongyoujian.bmp",90, 115,826 , 192,986 )
        --确定发送
        findPic("quedingfasong.bmp",90, 172,422 , 231,537 )
        --关闭界面
        findPic("guanbiyoujian.bmp",90, 575,1068, 639,1134)
        notifyMessage("邮件发送完毕")
        mSleep(3000)
    
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


--找图返回boolean值
function findPic_bool(path,per,x1,y1,x2,y2)
    x,y = findImageInRegionFuzzy(PIC_PATH..path,per,x1,y1,x2,y2)
    if x~=-1 and y ~=-1 then
        return true
    else
        return false
    end
end

--找多色返回boolean值
function findMuColor_bool(table,per,x1,y1,x2,y2)
    x,y = findMultiColorInRegionFuzzy(table,per,x1,y1,x2,y2)
    if x~=-1 and y ~=-1 then
        return true
    else
        return false
    end
end
--找单色返回boolean值
function findOneColor_bool(one,per,x1,y1,x2,y2)
    x,y = findColorInRegionFuzzy(one,per,x1,y1,x2,y2)
    if x~=-1 and y ~=-1 then
        return true
    else
        return false
    end
end

function logD(con)
    time = os.time()
    tt = os.date("*t", time)
    logDebug(tt.month.."月"..tt.day.."日  :  "..con)
end

--点击事件
function click(x,y)
    if x~=-1 and y~=-1 then
        touchDown(0,x,y)
        mSleep(math.random(100,200))
        touchUp(0)
        mSleep(4000)
    end
end

--寻找图片
function findPic(path,per,x1,y1,x2,y2)
    x,y = findImageInRegionFuzzy(PIC_PATH..path,per,x1,y1,x2,y2)
    click(x,y)
end

--多点找色
function findMuColor(table,per,x1,y1,x2,y2)
    x,y = findMultiColorInRegionFuzzy(table,per,x1,y1,x2,y2)
    click(x,y)
end