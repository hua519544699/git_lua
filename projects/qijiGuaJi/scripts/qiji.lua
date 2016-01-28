function main()
        findSome()
end
--点击事件
function click(x,y)
    if x~=-1 and y~=-1 then
        touchDown(0,x,y)
        touchUp(0)
        mSleep(2000)
    end
    
end
function manbeibao(x,y)
    if x~=-1 and y~=-1 then
        click(x,y)
        --回收
        x,y = findImageInRegionFuzzy("/var/touchelf/qjImages/huishou.bmp",90, 15,628 ,  89,796  )
        click(x,y)
        --勾选绿装
        
        click( 130,283 )
        
        --立即回收
        x,y = findImageInRegionFuzzy("/var/touchelf/qjImages/lijihuishou.bmp",90,  20,172 , 102,345 )
        click(x,y)
        
        --关闭跳出的界面
        x,y = findImageInRegionFuzzy("/var/touchelf/qjImages/guanbi.bmp",90,560,1040,635,1130)
        click(x,y)
    end
    
end
--是否点击自动任务
function renwu(x,y)
    if x~= -1 and y~=-1 then
        x,y = findMultiColorInRegionFuzzy({ 0xD6C0D1, -15, -21, 0x3E0775, 21, 30, 0x1F0A5A },90,   6,984 , 149,1127)
        click( x,y)
        --是否正在寻路
        x,y = findImageInRegionFuzzy("/var/touchelf/qjImages/xunlu.bmp",90,454,423 , 507,508 )
        if x== -1 and y==-1 then
            click(381,58)
            end
        mSleep(2000)
    end
end
--转生
function zhuansheng(x,y)
    if x~=-1 and y~=-1 then
        click(x,y)
        mSleep(2000)
        --转生按钮
        x,y = findImageInRegionFuzzy("/var/touchelf/qjImages/zhuansheng.bmp",90,  20,737 , 101,1030)
        click(x,y)
        mSleep(2000)
        --转生完确定按钮
        x,y = findImageInRegionFuzzy("/var/touchelf/qjImages/zhuanshengqueding.bmp",90,75,430,184,714 )
        click(x,y)
        mSleep(2000)
        --关闭界面
        x,y = findImageInRegionFuzzy("/var/touchelf/qjImages/zhuanshengguanbi.bmp",90,560,1040,635,1130)
        click(x,y)
    end
end
--创建角色
function cjjs(x,y)
    if x~=-1 and y~=-1 then
        --创建角色
        click(x,y)
        mSleep(2000)
        --重名确定
        x,y = findImageInRegionFuzzy("/var/touchelf/qjImages/cmqd.bmp",90, 151,537 , 251,738 )
        click(x,y)
        mSleep(2000)
        --色子随机名字
        x,y = findImageInRegionFuzzy("/var/touchelf/qjImages/sezi.bmp",90,  11,688 , 108,797 )
        click(x,y)
        mSleep(2000)
    end  
end
--注册账号
function zhuce(x,y)
    if x~=-1 and y~=-1 then
        --点击进入注册页面
        click(x,y)
        --点击账号输入框
        click( 507,702 )
        --清除输入框内信息20
        inputText("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b")
        local file = io.open("/var/touchelf/scripts/users.txt","r")
        if file then
            mSleep(3000)
            for line in io.lines("/var/touchelf/scripts/users.txt") do
                inputText(line)
            end
            --点击密码输入框
            click( 411,711 )
            --清除输入框内信息20
            inputText("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b")
            inputText("1234567")
            mSleep(2000)
            --提交注册
            click( 410,867 )
            mSleep(2000)
        
        else
            notifyMessage("文件不存在");  
        end
        
        
        
    end
end 
--换区
function huanqu(x,y)
    if x~=-1 and y~=-1 then
        --换区
        click(x,y)
        --选大区
        click( 326,206 )
        --选区996
        click( 336,498 )
    end
    
end

--找图
function findSome()
    while true do
        local x,y
        --开启征程
        x,y = findImageInRegionFuzzy("/var/touchelf/qjImages/kaishizhengcheng.bmp",90,110,690,240,960)
        click(x,y)
        
        --启动程序
        if appRunning("com.tianmashikong.qmqj.apps") then
        else
            appRun("com.tianmashikong.qmqj.apps")
            mSleep(6000)
        end
        
        --创建角色
        x,y = findImageInRegionFuzzy("/var/touchelf/qjImages/cjjs.bmp",90,2,682 , 119,1108)
        cjjs(x,y)
        --注册账号
        x,y = findImageInRegionFuzzy("/var/touchelf/qjImages/zhuce.bmp",90, 179,703 , 351,1036)
        zhuce(x,y)
        
        --换区
        x,y = findMultiColorInRegionFuzzy({ 0xBBBFE1, 10, 36, 0xCACEF2, 19, 93, 0xC8CBEF },90, 194,664 , 297,843 )
        huanqu(x,y)
        
        --领取奖励
        x,y = findImageInRegionFuzzy("/var/touchelf/qjImages/lingqujiangli.bmp",90,100,790,230,1120)
        click(x,y)
        
        --jinru
        x,y = findImageInRegionFuzzy("/var/touchelf/qjImages/jinru.bmp",90,   5,697 , 196,1131)
        click(x,y)
        
        --jinrujs
        x,y = findImageInRegionFuzzy("/var/touchelf/qjImages/jinrujs.bmp",90,   3,386 , 196,1131)
        click(x,y)
        
        --佩戴
        x,y = findImageInRegionFuzzy("/var/touchelf/qjImages/peidai.bmp",90,95,660,180,800)
        click(x,y)
        
        --转生queren
        x,y = findImageInRegionFuzzy("/var/touchelf/qjImages/zsqr.bmp",90,75,430,184,714 )
        click(x,y)
        
        --转生关闭
        x,y = findMultiColorInRegionFuzzy({ 0xE8CFBD, -23, -20, 0x4D1D0B, 18, 18, 0x613E33 },90, 547,1040, 634,1129)
        click(x,y)
        
        --道具提升
        x,y = findImageInRegionFuzzy("/var/touchelf/qjImages/daojutisheng.bmp",90,90,730,200,940)
        click(x,y)
        
        --确认
        x,y = findImageInRegionFuzzy("/var/touchelf/qjImages/queren.bmp",90,100,460,200,660)
        click(x,y)
        --立即前往
        x,y = findImageInRegionFuzzy("/var/touchelf/qjImages/lijiqianwang.bmp",90,120,810,200,1000)
        click(x,y)
        --打开关闭的任务栏
        x,y = findImageInRegionFuzzy("/var/touchelf/qjImages/bihe.bmp",90,400,200,450,250)
        click(430,17)
        --滑动
        x,y = findImageInRegionFuzzy("/var/touchelf/qjImages/move.bmp",90,180,840,390,1125)
        click(x,y)
        --确定
        x,y = findImageInRegionFuzzy("/var/touchelf/qjImages/queding.bmp",90,0,800,150,1125)
        click(x,y)
        
        --满背包
        x,y = findMultiColorInRegionFuzzy({0x46301B,-17,-24,0x9C6521,26,32,0xB76E18},90, 295,829 , 418,992 )
        manbeibao(x,y)
        
        --关闭界面
        x,y = findImageInRegionFuzzy("/var/touchelf/qjImages/guanbi1.bmp",90, 563,1058, 633,1130)
        click(x,y)
        
        --关闭人物界面
        x,y = findImageInRegionFuzzy("/var/touchelf/qjImages/peopleclose.bmp",90, 554,1055, 635,1131)
        click(x,y)
        --跳过
        x,y = findMultiColorInRegionFuzzy({ 0xDD992F,-19,-34,0xC57A39,19,120,0xF8CA07},90,12,871,105,1093)
        click(x,y)
        --转生
        x,y = findMultiColorInRegionFuzzy({ 0xDADA00,-8,-5,0xA1A008,9,31,0xF9F900 },90, 181,381 , 231,448 )
        zhuansheng(x,y)
        
        --手
        x,y = findImageInRegionFuzzy("/var/touchelf/qjImages/shou.bmp",90,1,904,122,1128)
        click(x,y)
        --掉线重连
        x,y = findImageInRegionFuzzy("/var/touchelf/qjImages/chonglian.bmp",90,150,460,330,770)
        click(x,y)
        
        --登陆
        --x,y = findImageInRegionFuzzy("/var/touchelf/qjImages/denglu.bmp",90, 281,714 , 408,1045)
        --click(x,y)
        
        --使用
        x,y = findImageInRegionFuzzy("/var/touchelf/qjImages/shiyong.bmp",90,94,663,172,800)
        click(x,y)
        --是否需要点击任务
        --是否在主界面
        x,y = findMultiColorInRegionFuzzy({ 0x752C25, -19, -21, 0x582F19, 20, 21, 0x5E351B },90, 2,236 ,83,346 )
        renwu(x,y)
    end
       
end