--点击事件
function click(x,y)
    if x~=-1 and y~=-1 then

        touchDown(0,x,y)
        mSleep(math.random(100,500))
        touchUp(0)
        
        notifyMessage(x.."点击"..y,2000)
        
        mSleep(2000)
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

--奇遇--隔19分钟
function qiyu()
    local time = os.time()
    if time%1140 < 40 then
        
        notifyMessage("奇遇,2000")
        mSleep(2000)
        
        --打开奇遇界面
       findPic("qiyu.bmp",90 ,421,838, 606,1047 ) 
    end
end

--关闭招财界面       并打开背包
function open()
    --关闭招财界面
    x,y = findImageInRegionFuzzy(PIC_PATH.."zhaocai.bmp",90, 103,311 , 501,825 )
    if x~=-1 and y ~=-1 then
        
        notifyMessage("招财,2000")
        mSleep(2000)
        
        --关闭招财界面
        click( 615,1109)
        --打开背包
        click(  23,561 )
    end
end
--图片路径
PIC_PATH = "/var/touchelf/cqb_images/"
--关闭精彩内容    597,947
color_jingcai = { 0xEFFFFF, -8, -419, 0xFFFFFF, 4, -338, 0xFFFFFF, -11, -377, 0xCED7E7, 6, -369, 0xDEE7EF }
--怪物血条
color_xuetiao = { 0xEF1800, 5, 0, 0xF74D29, 2, -1, 0xC62C21 }
--离线挂机      463,795
color_lixianguaji = { 0xDEFFFF, -9, -265, 0xFFFBFF, 6, -192, 0xCED3DE, -11, -224, 0x7396AD, 7, -224, 0xEFF3F7, -8, -234, 0xEFEFEF }
--确定回城       229,473
color_quedinghuicheng = { 0x94CBD6, -18, -38, 0x104973, 15, 45, 0x104963, -6, -11, 0xA5E3EF, 6, 21, 0x7BB6BD, -8, 22, 0xA5EBEF, 7, -12, 0xADF3FF }
--药店商人          226,403
color_yaodianshangren = { 0x292842, 37, -8, 0x7B7584, -46, -21, 0x312C39 }
--地图药品商人
color_ditushangren = { 0xF7F3EF, -13, -19, 0xF7F3EF, -3, -21, 0xEFEBEF, -14, 10, 0xDEDBD6 }
--红药
color_hongyao = { 0x520000, -12, -7, 0xFFFB73, 11, 14, 0xE7B631, 19, -9, 0x8C9AA5, -14, 8, 0x634500 }
--挂机
color_guaji = { 0x082031, -32, -8, 0x73A6B5, -29, 0, 0x9CD3DE, -29, -4, 0x6B96A5, -29, 3, 0x6B929C, -29, 5, 0x638284, -27, 6, 0x9CD7DE, -32, 10, 0xA5DFE7, -30, 18, 0x9CDFEF, -32, 16, 0x9CD7DE, -21, 13, 0x8CCFD6, -29, 5, 0x638284, -26, 9, 0x8CC3C6, -30, 11, 0x9CDBDE, -25, 11, 0x8CC7CE }
--主函数
function main()
    findGame()
end


--买药
function maiyao()
    local time = os.time()
    if time%85320 < 40 then
        
        notifyMessage("开始取消挂机买药,2000")
        mSleep(2000)
        
        --23.7小时买次药 
        mSleep(2000)
        --左
        touchDown(0,  99,79  )
        mSleep(10000)
        touchUp(0)
        --等待5秒
        mSleep(5000)
        
        --右
        touchDown(0, 101,142 )
        mSleep(10000)
        touchUp(0)
        --等待5秒
        mSleep(5000)
        
        --上
        touchDown(0, 130,109 )
        mSleep(10000)
        touchUp(0)
        --等待5秒
        mSleep(5000)
        
        --下
        touchDown(0,  66,112 )
        mSleep(10000)
        touchUp(0)
        --等待5秒
        mSleep(5000)
        
        
        --点开地图
        click( 575,1065)
    end    
end
--确定回城并移动到药店
function huicheng()
    
    
    
    --确定回城
    x,y = findMultiColorInRegionFuzzy(color_quedinghuicheng,90, 180,393 , 266,543 )
    if x~=-1 and y~=-1 then
        
        notifyMessage("回城,2000")
        mSleep(2000)
        
        --点击确定回城
        click(x,y)
        --等待回城过程
        mSleep(20000)
        --打开地图
        click( 585,1068)
    end
    
end

--买红mai蓝
function maihonglan()
    mSleep(2000)
    --红药
    x,y = findMultiColorInRegionFuzzy(color_hongyao,90,  93,38  , 595,575 )
    if x~=-1 and y~=-1 then
        
        notifyMessage("买红买蓝,2000")
        mSleep(2000)
        
        
        click(x,y)
        --输入药的数量    最大99个
        click( 369,376 )
        inputText(999)
        click( 475,1059)
        --买红
        for i = 1,8 do
            --点击购买
            click( 287,419 )
            --点击确定购买
            click( 226,476 )
        end
        --蓝药
        click( 529,202 )
        --输入药的数量    最大99个
        click( 467,390 )
        inputText(999)
        click( 475,1059)
        --买蓝
        for i = 1,8 do
            --点击购买
            click( 380,420 )
            --点击确定购买
            click( 225,503 )
        end
        --关闭药品界面
        click( 612,1110)
        --回天蛇付刷怪
        shuaguai()
    end
    
    
end

--传送刷怪地图
function shuaguai()
    
    notifyMessage("刷怪,2000")
        mSleep(2000)
    
    
    mSleep(2000)
    --打开地图
    click( 584,1076)
    --判断是否在主城
    x,y = findMultiColorInRegionFuzzy(color_ditushangren,90,  36,153 , 567,959 )
    if x~=-1 and y~=-1 then
        --点击世界地图
        click(  48,893 )
        --点击黑狱平原
        findPic("heiyupingyuan.bmp",90, 125,351 , 314,576 )
        --点击天蛇府弟子
        findMuColor({ 0x42AECE, -7, -41, 0x3192B5, 6, 43, 0x39A6C6 },90,  14,780 , 593,1018)
        --确定传送
        findPic("chuansong.bmp",90, 200,382 , 398,749 )
    else
        --关闭地图
        findPic("dituguanbi.bmp",90, 562,1055, 637,1132)
    end
end


--合成
function hecheng()
    x,y =findImageInRegionFuzzy("fangru.bmp",90,   1,247 , 103,443)
    if x~=-1 and y~=-1 then
        
        notifyMessage("合成",2000)
        mSleep(2000)
        
        
        for i = 1,10 do
            --一件放入
            click(x,y)
            --一件合成
            findPic("hecheng.bmp",90,   1,247 , 103,443 )
        end
    end
    
end


--主程序
function findGame()
    
    while true do
        --判断程序是否启动
        if appRunning("com.zeus.cangqiongbian") == false then
            appRun("com.zeus.cangqiongbian")
        end
        --登陆界面或掉线界面
        findPic("denglu.bmp",90,   4,322 , 174,750 )
        
        --角色进入游戏
        findPic("jinru.bmp",90,   3,866 , 108,1132)
        
        --关闭活动公告
        findPic("gonggao.bmp",90,  49,496 , 126,642 )
        
        --关闭精彩内容
        findMuColor("color_jingcai",90, 489,294 , 631,1004)
        
        --关闭离线挂机界面
        findMuColor("color_lixianguaji",  70,214 , 562,984 )
        
        --挂机刷怪
        findMuColor(color_guaji,90, 313,1050, 394,1131)
        --findPic("guaji.bmp",90, 297,1042, 411,1133)
        
        
        
        
        ----[[
        ----23.7小时买次药   退出战斗状态   点开地图    
        maiyao()
        
        --点击回城
        findPic("huicheng.bmp",90,   4,971 ,  93,1132)
        
        --确定回城   并打开主城地图
        huicheng()
        
        --点击地图找买药NPC
        
        x,y = findMultiColorInRegionFuzzy(color_ditushangren,90,  36,153 , 567,959 )
        if x~=-1 and y ~=-1 then
            
            notifyMessage("找买药NPC",2000)
            mSleep(2000)
            
            
            --点击地图买药NPC
            click(x,y)
            --关闭地图
            click( 613,1109)
            mSleep(5000)
            --点击方向1秒
            touchDown(0, 121,88  )
            mSleep(1000)
            touchUp(0)
            
            mSleep(2000)
            
            
            ---点击买药NPC
            click( 227,674 )
        end   
        --]]
        
        ---点击买药NPC
        --------------------findMuColor({ 0x4A494A, 33, 0, 0x6B617B, 3, 29, 0xFFFFFF },90,  13,27  , 629,1041)
        
        --点击药品按钮
        findPic("yaoping.bmp",90, 256,7, 380,335 )
        
        --买红蓝药
        maihonglan()
        
        --传送刷挂地图
        -----------shuaguai()
        
        
        
        
        
        
        --奇遇和锻炉     --奇遇--隔19分钟
        qiyu()
        
        --点击招财神灯
        findPic("shendeng.bmp",90, 280,213 , 492,457 )
        
        --进行招财
        findPic("zhaocai.bmp",90, 133,322 , 526,825 )
        
        --关闭晶砖不足界面
        findPic("jingzhuanbuzu.bmp",90, 136,530 , 284,747 )
        
        --关闭招财界面       并打开背包
        open()
        
        --锻炉
        findPic("duanlu.bmp",90,   3,546 ,  94,709 )
        
        --进行放入和锻造
        
        --合成
        
        hecheng()
        
        
        
        
        
        --随身商店
        findPic("suishenshangdian.bmp",90,   2,816 ,  98,993 )
        
        --出售白装提示
        findPic("maibaizhuang.bmp",90, 153,384 , 298,580 )
        
        --关闭商店界面
        findPic("guanbi.bmp",90, 551,1039, 637,1131)  
    end
    
end

