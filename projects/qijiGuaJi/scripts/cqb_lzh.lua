function main()
    findSome()
    
end
--点击事件
function click(x,y)
    if x~=-1 and y~=-1 then
        touchDown(0,x,y)
        touchUp(0)
        mSleep(3000)
    end
    
end

--每天
function doBuy(time)
    --23.7小时买次药 
    if time%85320 < 80 then
        --取消挂机
        x, y = findMultiColorInRegionFuzzy({ 0x6B9EB5, -26, -19, 0x94D3CE, -19, 28, 0x8CC3CE, -25, -1, 0x8CBABD }, 90, 329, 1070, 355, 1117);
        click(x,y)
        --打开地图
        click( 606,1084)
        --回城
        click(  49,1055)
        --确定回城
        click( 229,476 )
        --等待10秒
        mSleep(10000)
        --操作方向5秒
        touchDown(0,  85,90  )
        mSleep(5000)
        touchUp(0)
        --点击药店npc
        click( 458,56  ) 
        --等待走路5秒
        mSleep(5000)
        --药品商人按钮
        click( 323,154 )
        --点击生命药水
        click( 440,200 )
        --点击购买数量
        click( 369,385 )
        --输入购买数量，最大只能99
        inputText(999)
        --
        click( 474,1054)
        --购买次数
        for j = 1,9 do
            --点击购买
            click( 288,423 )
            --确定
            click( 226,478 )
        end
        --点击魔法药水
        click( 535,204 )
        --点击数量
        click( 467,378 )
        --输入购买数量，最大只能99
        inputText(999)
        --
        click( 474,1054)
        --购买次数
        for j = 1,9 do
            --点击购买
            click( 383,423 )
            --确定
            click( 226,474 )
        end
        --关闭界面
        click( 613,1111)
        --打开地图
        click( 597,1076)
        --世界地图
        click(  46,894 )
        --黑狱平原
        click( 216,460 )
        --天蛇府弟子
        click( 326,897 )
        --确定传送
        click( 329,896 )
        mSleep(5000)
        
        
    end
end

--每半小时
function doSome(time)
    if time%1800 < 20 then
        --招财神灯
        --奇遇
        click( 515,933 )
        --招财神灯
        click( 418,363 )
        --招财
        click( 290,557 )
        
        --关闭金砖不足界面
        x,y = findMultiColorInRegionFuzzy({ 0xADF3FF, -13, -35, 0x084984, 21, 46, 0x184963 },90, 189,591 , 258,722 )
        click(x,y)
        
        --关闭界面
        click( 614,1106)
        
        
        --清理装备  
        --打开背包
        click(  30,568 )
        --点击锻炉
        click(  43,631 )
        --一键锻炉
        for i = 1,21 do
            --一键锻炉
            click(  43,350 )
        end
        --打开随身商店
        click(  39,902 )
        --判断出售白装提示
        --click()
        --关闭界面
        click( 615,1108)
        
    end
        
end

function findSome()
    local x,y
    local time = os.time();
    while true do 
        --每半个小时神灯和锻炉装备
        doSome(time)
        
        --每天买药
        doBuy(time)
        
        --是否为挂机状态, --点击挂机
        x, y = findImageInRegionFuzzy("/var/touchelf/cqb_images/guaji.bmp",90, 312,1053, 405,1129)
        click(x,y)
        
        --判断程序是否正在运行
        if appRunning("com.zeus.cangqiongbian") then 
        else
            --运行程序
            appRun("com.zeus.cangqiongbian")
        end
        
        --判断是否在登陆界面掉线,--进入游戏
        x,y = findMultiColorInRegionFuzzy({ 0x84DFFF, -29, -85, 0x21B2EF, 16, 133, 0x73CFF7, -24, 46, 0x10AEEF },90,            20,336 , 176,741 )
        click(x,y)
        
        
        if MulColor() then
            
            click(x,y)
        end
        
        --角色界面进入游戏,--点击进入游戏
        x,y = findMultiColorInRegionFuzzy({ 0xA5FFFF, -16, -52, 0x31AEFF, 12, 88, 0xE7FFFF, -18, 47, 0x42DFFF },90,               2,859 , 134,1130)
        click(x,y)
        
        --关闭弹出的活动公告
        x, y = findMultiColorInRegionFuzzy({ 0x9CD7DE, -9, -36, 0x8CCBD6, 7, 38, 0xADF7FF }, 90, 80, 531, 96, 605)
        click(x,y)
        
        --关闭精彩内容界面
        x, y = findMultiColorInRegionFuzzy({ 0xF7FFFF,-9,-422, 0xEFF3EF, 3, -338, 0xFFFFFF }, 90, 589, 525, 601, 947)
        click(x,y)
        
         --关闭离线挂机窗口
        x,y = findMultiColorInRegionFuzzy({ 0xDEFFFF, -11, -266, 0xF7FFFF, 4, -193, 0xF7FFFF, -8, -235, 0xFFFFFF,               5, -237, 0xFFFBF7 },90, 386,466 , 513,848 )
        click(x,y)
    end
    
end

