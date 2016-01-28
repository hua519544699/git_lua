--图片路径
PIC_PATH = "/var/touchelf/scripts/cqb_images/"
--领取45级装备
color_45ji = { 0x9CDBE7, 9, 8, 0xADF3FF, 4, 38, 0x94C7CE, 0, 53, 0xA5EBF7, -2, 65, 0xA5E3EF, 4, 61, 0xADF7FF, 18, 72, 0xEFC7C6, 15, 75, 0xCED3D6, 22, 77, 0xD64142, 23, 80, 0xDE4142 }
--领取60级装备
color_60ji = { 0xADF3FF, 2, -29, 0xA5EBF7, -2, -6, 0xA5E3EF, -3, 24, 0xA5DFEF, -3, 37, 0xA5E3EF, 16, 44, 0x6B616B, 14, 47, 0xCED3D6, 18, 47, 0xBD2421, 21, 52, 0xD63839 }
--挂机
color_guaji = { 0x082431, -32, -9, 0xA5EBF7, -27, -9, 0xA5E7EF, -22, -9, 0x8CCBCE, -24, -2, 0x94D3DE, -27, -2, 0x8CC7CE, -31, -2, 0x9CDBDE, -25, 5, 0xA5EBF7, -28, 5, 0xA5DBE7, -34, 8, 0xADEBF7, -23, 13, 0x9CDFE7, -34, 15, 0xADE7EF, -32, 9, 0xADE3E7 }
--离线挂机      463,795
color_lixianguaji = { 0xDEFFFF, -9, -265, 0xFFFBFF, 6, -192, 0xCED3DE, -11, -224, 0x7396AD, 7, -224, 0xEFF3F7, -8, -234, 0xEFEFEF }
--角色进入游戏
color_juesejinru = { 0x52F3FF, -19, -72, 0x84F3FF, 10, -75, 0x94F3FF, 22, -73, 0xB5FFFF, 19, -49, 0xC6FFFF, -6, -49, 0x4AEBFF, 14, -24, 0xADFFFF, 0, -33, 0x42DFFF, 1, -16, 0x4AF7FF, -4, 1, 0x4AF3FF, 22, 28, 0xB5FFFF, 21, 48, 0x94F7FF, 0, 46, 0x42E7FF, -5, 66, 0x42EFFF, 25, 62, 0xBDFFFF, 10, 15, 0x39C3FF }
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
--领奖
function lingjiang()
    notifyMessage("开始领奖",2000)
    mSleep(3000)
    --点击界面领奖
    findPic("lingjiang.bmp",90, 541,938 , 630,1035)
    --点击界面领奖2
    findPic("lingjiang_1.bmp",90, 541,944 , 635,1037)
    findPic("lingjiang1.bmp",90, 541,938 , 630,1035)
    --点击在线礼包
    findPic("zaixianlibao.bmp",90, 300,404 , 516,593 )
    --全部领取
    findPic("quanbulingqu.bmp",90,  43,471 , 150,655 )
    
    --签到
    
    --点击界面领奖
    findPic("lingjiang.bmp",90, 541,938 , 630,1035)
    --点击界面领奖2
    findPic("lingjiang_1.bmp",90, 541,944 , 635,1037)
    findPic("lingjiang1.bmp",90, 541,938 , 630,1035)
    --点击30日签到
    findPic("qiandao.bmp",90, 290,569 , 502,753 )
    --点击签到领奖
    findPic("qiandaolingjiang.bmp",90,  42,721 , 129,883 )
    --全部领取
    findPic("quanbulingqu.bmp",90,  43,471 , 150,655 )
    
    --退出领奖界面
    click( 361,953 )
    
    notifyMessage("领奖完毕",2000)
    mSleep(3000)
end
--天降神兵
function shenbing()
    mSleep(2000)
    notifyMessage("开始神兵抽取",2000)
    mSleep(3000)
    --点击奇遇
    findPic("qiyu.bmp",90, 452,878 , 554,985 )
    --点击天降神兵
    findPic("tianjiangshenbing.bmp",90, 106,229 , 321,430 )
    --抽取一次45级
    findMuColor(color_45ji,90, 149,179 , 217,301 )
    --关闭界面
    click( 401,1032)
    --点击60级装备
    findPic("60ji.bmp",90, 190,448 , 489,683 )
    --抽取一次60级装备
    findMuColor(color_60ji,90, 146,446 , 213,572 )
    --关闭界面
    click( 401,1032)
    --关闭天降神兵界面
    findPic("guanbishenbing.bmp",90, 563,1058, 639,1132)
    notifyMessage("神兵抽取结束",2000)
    mSleep(3000)
end

--主函数
function main()
    
    --运行游戏
        if appRunning("com.zeus.cangqiongbian") then
        else
            appRun("com.zeus.cangqiongbian")
            --等待加载一分钟
            notifyMessage("等待加载一分钟",2000)
            mSleep(60000)
        end
        --纳戒已完成
        findPic("wancheng.bmp",90, 171,112 , 301,357 )
        --断线登陆界面进入游戏
        findPic("jinruyouxi.bmp",90,  16,382 , 171,738 )
        --登陆错误
        findPic("quedingcuowu.bmp",90, 204,498 , 276,625 )
        mSleep(5000)
        --角色进入
        findMuColor(color_juesejinru,90,   2,888 , 113,1130)
        mSleep(20000)
        --活动公告
        findPic("huodong.bmp",90,  51,489 , 120,638 )
        --精彩内容
        findPic("jingcaineirong.bmp",90, 539,887 , 625,981 )
        --关闭离线挂机界面
        findPic("guanbiguaji.bmp",90, 427,755 , 492,834 )
    
    while true do 
        
        --运行游戏
        if appRunning("com.zeus.cangqiongbian") then
        else
            appRun("com.zeus.cangqiongbian")
            --等待加载一分钟
            notifyMessage("等待加载一分钟",2000)
            mSleep(60000)
        end
        --纳戒已完成
        findPic("wancheng.bmp",90, 171,112 , 301,357 )
        --断线登陆界面进入游戏
        findPic("jinruyouxi.bmp",90,  16,382 , 171,738 )
        --登陆错误
        findPic("quedingcuowu.bmp",90, 204,498 , 276,625 )
        
        --角色进入
        findMuColor(color_juesejinru,90,   2,888 , 113,1130)
        
        --活动公告
        findPic("huodong.bmp",90,  51,489 , 120,638 )
        --精彩内容
        findPic("jingcaineirong.bmp",90, 539,887 , 625,981 )
        --关闭离线挂机界面
        findPic("guanbiguaji.bmp",90, 427,755 , 492,834 )
        
        --领奖     
        time = os.time()
        --if time%3540<200 then
            lingjiang()
        --end
        
        --11.7小时另一次
        time = os.time()
        --if time%42120 <60 then
            notifyMessage(time,2000)
            mSleep(3000)
            --天降神兵
            shenbing()
        --end
        
    end
    
end


