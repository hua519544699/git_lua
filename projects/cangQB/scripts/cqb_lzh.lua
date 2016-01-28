--点击事件
function click(x,y)
    if x~=-1 and y~=-1 then
        touchDown(0,x,y)
        mSleep(math.random(100,500))
        touchUp(0)
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

--买药
function maiyao()
    --23.7小时买次药 
    local time = os.time()
    if time%85320 < 80 then
        
        while true do
            --判断血条是否存在        干掉当前怪物
            x,y = findMultiColorInRegionFuzzy({ 0xEF1800, 5, 0, 0xF74D29, 2, -1, 0xC62C21 }, 563,473 , 629,633 )
            if x==-1 and y==-1 then
                --点击方向取消挂机
                click( 121,132 )
                --等待退出战斗
                mSleep(5000)
                break
            end
            
        end
        --点开地图
        click( 575,1065)
        
    end 
end
--确定回城并移动到药店
function huicheng()
    --确定回城
    findPic("quedinghuicheng.bmp",90, 138,334 , 494,820 )
    --等待回城过程
    mSleep(5000)
    --打开地图
    click( 582,1067)
end

--买红mai蓝
function maihonglan()
    x,y = findImageInRegionFuzzy(PIC_PATH.."hongyao.bmp",90, 234,114 , 599,554 )
    if x~=-1 and y~=-1 then
        click(x,y)
        --输入药的数量    最大99个
        click( 371,382 )
        inputText(999)
        click( 475,1059)
        --买红
        for i = 1,9 do
            --点击购买
            click( 287,419 )
            --点击确定购买
            click( 226,476 )
        end
    end
    x,y = findImageInRegionFuzzy(PIC_PATH.."lanyao.bmp",90, 234,114 , 599,554 )
    if x~=-1 and y~=-1 then
        click(x,y)
        --输入药的数量    最大99个
        click( 468,390 )
        inputText(999)
        click( 475,1059)
        --买蓝
        for i = 1,9 do
            --点击购买
            click( 380,420 )
            --点击确定购买
            click( 225,503 )
        end
        --关闭药品界面
        click( 612,1110)
    end
end

--传送刷怪地图
function shuaguai()
    x,y = findImageInRegionFuzzy(PIC_PATH.."zhucheng.bmp",90, 102,6, 633,1026)
    if x~=-1 and y~=-1 then
        --打开地图
        click( 584,1076)
        --点击世界地图
        click(  48,893 )
        --点击黑狱平原
        findPic("heiyupingyuan.bmp",90, 125,351 , 314,576 )
        --点击天蛇府弟子
        findPic("tianshefudizi.bmp",90,  29,775 , 609,1045)
        --确定传送
        findPic("chuansong.bmp",90, 200,382 , 398,749 )
    end
    
end

--奇遇--隔19分钟
function qiyu()
    local time = os.time()
    if time%1140 < 30 then
        --打开奇遇界面
       findPic("qiyu.bmp",90 ,421,838, 606,1047 ) 
    end
end

--关闭招财界面       并打开背包
function open()
    --关闭招财界面
    x,y = findImageInRegionFuzzy(PIC_PATH.."zhaocai.bmp",90, 103,311 , 501,825 )
    if x~=-1 and y ~=-1 then
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


--主函数
function main()
    findGame()
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
        findPic("guaji.bmp",90, 297,1042, 411,1133)
        
        ----23.7小时买次药   退出战斗状态   点开地图    
        maiyao()
        
        --点击回城
        findPic("huicheng.bmp",90,   2,799 , 100,982 )
        
        --确定回城   并打开主城地图
        huicheng()
        
        --点击地图买药NPC
        x,y = findImageInRegionFuzzy(PIC_PATH.."huichengditu.bmp",90, 137,414 , 518,839 )
        if x~=-1 and y ~=-1 then
            --点击卖药NPC
            click( 321,513 )
            --关闭地图
            click( 613,1109)
            --点击方向1秒
            touchDown(0, 119,85  )
            mSleep(900)
            touchUp(0)
        end      
        ---点击买药NPC
        findPic("yaodian.bmp",90,  36,119 ,583,1080)
        
        --点击药品按钮
        findPic("yaoping.bmp",90, 256,7, 380,335 )
        
        --买红蓝药
        maihonglan()
        
        --传送刷挂地图
        shuaguai()
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
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
        for i = 1,10 do
            --一件放入
            findPic("fangru.bmp",90,   1,247 , 103,443 )
            --一件合成
            findPic("hecheng.bmp",90,   1,247 , 103,443 )
        end
        
        --随身商店
        findPic("suishenshangdian.bmp",90,   2,816 ,  98,993 )
        
        --出售白装提示
        findPic("maibaizhuang.bmp",90, 153,384 , 298,580 )
        
        --关闭商店界面
        findPic("guanbi.bmp",90, 551,1039, 637,1131)  
    end
    
end

