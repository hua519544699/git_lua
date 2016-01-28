--图片路径
PIC_PATH = "/var/touchelf/scripts/cqb_images/"
--断开连接
color_duankailianjie = { 0xF7FFFF, -7, 35, 0xF7FBFF, 3, -53, 0xF7FFFF, -1, 103, 0xFFFFFF, -4, 93, 0xFFFBFF }
--地图药品商人
color_ditushangren = { 0xEFF3EF, -13, -31, 0xF7F3EF, -3, -31, 0xEFEFEF, 1, -26, 0xCECFCE, -12, -21, 0xEFEFF7, -13, -14, 0xE7EFEF, -8, -13, 0xE7E7E7, -1, -10, 0xEFEFEF, -9, -5, 0xF7F3EF, -8, 3, 0x8C969C }
--天蛇府弟子颜色
color_tianshefudizi = { 0x39AACE, -2, 23, 0x39AED6, -1, 37, 0x42AAC6, -4, 41, 0x319EBD, -5, 62, 0x39AECE }
--领取45级
color_45ji = { 0x9CDBE7, 9, 8, 0xADF3FF, 4, 38, 0x94C7CE, 0, 53, 0xA5EBF7, -2, 65, 0xA5E3EF, 4, 61, 0xADF7FF, 18, 72, 0xEFC7C6, 15, 75, 0xCED3D6, 22, 77, 0xD64142, 23, 80, 0xDE4142 }
--领取60级装备
color_60ji = { 0xADF3FF, 2, -29, 0xA5EBF7, -2, -6, 0xA5E3EF, -3, 24, 0xA5DFEF, -3, 37, 0xA5E3EF, 16, 44, 0x6B616B, 14, 47, 0xCED3D6, 18, 47, 0xBD2421, 21, 52, 0xD63839 }
--挂机
color_guaji = { 0x082431, -32, -9, 0xA5EBF7, -27, -9, 0xA5E7EF, -22, -9, 0x8CCBCE, -24, -2, 0x94D3DE, -27, -2, 0x8CC7CE, -31, -2, 0x9CDBDE, -25, 5, 0xA5EBF7, -28, 5, 0xA5DBE7, -34, 8, 0xADEBF7, -23, 13, 0x9CDFE7, -34, 15, 0xADE7EF, -32, 9, 0xADE3E7 }
--离线挂机      463,795
color_lixianguaji = { 0xDEFFFF, -9, -265, 0xFFFBFF, 6, -192, 0xCED3DE, -11, -224, 0x7396AD, 7, -224, 0xEFF3F7, -8, -234, 0xEFEFEF }
--角色进入游戏
color_juesejinru = { 0x52F3FF, -19, -72, 0x84F3FF, 10, -75, 0x94F3FF, 22, -73, 0xB5FFFF, 19, -49, 0xC6FFFF, -6, -49, 0x4AEBFF, 14, -24, 0xADFFFF, 0, -33, 0x42DFFF, 1, -16, 0x4AF7FF, -4, 1, 0x4AF3FF, 22, 28, 0xB5FFFF, 21, 48, 0x94F7FF, 0, 46, 0x42E7FF, -5, 66, 0x42EFFF, 25, 62, 0xBDFFFF, 10, 15, 0x39C3FF }
--断网重试
color_chongshi = { 0xA5E7EF, 8, -1, 0xA5EBF7, 11, 0, 0xADEFF7, -5, -1, 0x9CD3DE, 2, 19, 0xADF7FF, -4, 19, 0xA5E7EF }
--喊话UI
UI = {
    {'InputBox{}',          'contents',         '喊话内容：'}, 
};

function moveTo(x1,y1,x2,y2)
    logD("滑动屏幕")
    touchDown(0, x1, y1); 
    mSleep(100);            
    touchMove(0, x2, y2); 
    mSleep(100);            
    touchUp(0);             
end

function logD(con)
    time = os.time()
    tt = os.date("*t", time)
    logDebug(tt.month.."月"..tt.day.."日  :  "..con)
end

function hanhua()
    notifyMessage("开始喊话",2000)
    logD("开始喊话")
    mSleep(3000)
    --点击打开喊话窗口
    logD("打开喊话窗口")
    click(  85,581 )
    --点击切换到键盘
    findPic("jianpan.bmp",90,  31,567 , 210,705 )
    --点击输入框
    click(  61,756 )
    --输入内容
    logD("喊话内容："..contents)
    inputText(contents)
    click(  38,989 )
    --点击发送
    logD("发送")
    findPic("fasong.bmp",90,  25,862 , 249,981 )
        
    click( 590,956 )
    logD("关闭喊话窗口")
    mSleep(3000)
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
function tuizhan()
        notifyMessage("退战",2000)
        logD("退战")
        mSleep(3000)
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
end

--买药
function maiyao()

    notifyMessage("买药",2000)
    logD("买药")
    mSleep(3000)
---[[
    
    --点开地图
    
    click( 585,1065)
    --点回城
    --click(  46,1052)
    findPic("huicheng.bmp",90,   3,956 , 100,1133)
    --确定回城
    --click( 229,475 )
    findPic("quedinghuicheng.bmp",90, 193,413 , 262,534 )
    --10秒
    mSleep(10000)

    --点开地图
    click( 585,1065)
    --点击药NPC寻路
    findMuColor(color_ditushangren,90, 243,427 , 430,722 )
    mSleep(3000)
    --关闭地图
    --click( 614,1110)
    findPic("guanbiditu.bmp",90, 571,1063, 638,1132)
    
    --点击药店商人
    click( 205,541 )
    --点按钮买药
    --click( 321,148 )
    findPic("yaopinganniu.bmp",90, 271,8   , 376,327 )

    --买红
    --click( 435,200 )
    findPic("hong.bmp",90, 242,133 , 592,361 )
    --点输入数量
    click( 373,392 )
    inputText(999)
    click( 467,1060)
    --多次买
    for i = 1,2 do
        --买
        --click( 290,421 )
        findPic("goumaih.bmp",90, 140,337 , 549,524 )
        --购买确定
        --click( 229,478 )
        findPic("maiquedingh.bmp",90, 187,404 , 266,544 )
    end
    
    --买蓝
    click( 532,200 )
    --findPic("lan.bmp",90, 461,130 , 585,254 )
    --点输入数量
    click( 468,391 )
    inputText(999)
    click( 467,1060)
    --多次买
    for i = 1,5 do
        --买
        --click( 381,423 )
        findPic("goumail.bmp",90, 351,359 , 420,481 )
        --购买确定
        --click( 228,477 )
        findPic("maiquedingl.bmp",90, 193,413 , 267,543 )
    end

    --关闭药店
    findPic("guanbiyaodian.bmp",90, 568,1058, 639,1134)
--]]
    --回天蛇付
    huitsf()
    
    
end

function huitsf()
    notifyMessage("回天蛇付",2000)
    logD("huitsf回天蛇付")
    mSleep(3000)
    --点开地图
    click( 580,1074)
    --点击世界地图
    --click(  50,895 )
    findPic("sjditu.bmp",90,   4,808 ,  99,981 )
    --点黑狱平原
    findPic("heiyupingyuan.bmp",90, 143,384 , 265,525 )
    --点天蛇府弟子
    findMuColor(color_tianshefudizi,90,  36,794 , 583,1005)
    --选择移动过去
    findPic("tsfyidong.bmp",90, 259,577 , 326,702 )
    mSleep(70000)
end


--奇遇
function qiyu()
    notifyMessage("奇遇",2000)
    logD("开始奇遇")
    mSleep(3000)
    --点击奇遇
    findPic("qiyu.bmp",90, 452,878 , 554,985 )
    --招财
    findPic("zhaocai.bmp",90, 311,261 , 490,451 )
    --摩擦神灯
    findPic("shendeng.bmp",90, 128,389 , 460,768 )
    --取消使用金砖
    findPic("quxiaoJZ.bmp",90, 187,584 , 273,730 )
    --关闭招财
    findPic("guanbizhaocai.bmp",90, 551,1045, 638,1132)
    
    --领奖
    lingjiang()
    --天降神兵
    shenbing()
    --锻炉
    duanlu()
end

function duanlu()
    --开始锻炉
    notifyMessage("锻炉",2000)
    logD("锻炉")
    mSleep(3000)
    --打开背包
    click(  31,568 )
    --点击锻炉
    findPic("duanlu.bmp",90,   2,547 ,  88,700 )
    --一件放入，一件合成
    for i = 1,6 do
        --放入
        findPic("fangru.bmp",90,   7,262 ,  99,430 )
        --合成
        findPic("hecheng.bmp",90,   7,270 ,  99,437 )
    end
    --随身商店
    findPic("suishenshangdian.bmp",90,   3,822 ,  94,983 )
    --点击出售白装提示
    findPic("baizhuangqueding.bmp",90, 193,407 , 263,543 )
    --关闭背包
    findPic("guanbibeibao.bmp",90, 568,1051, 639,1131)
    --
    mSleep(2000)
    
end
--看是否在天蛇府
function isTsf()
    notifyMessage("判断是否在天蛇府",1500)
    logD("判断是否在天蛇府")
    mSleep(2000)
    --点开地图
    click( 580,1074)
    --点击世界地图
    --click(  50,895 )
    findPic("sjditu.bmp",90,   4,808 ,  99,981 )
    x,y = findImageInRegionFuzzy(PIC_PATH.."tianshefu.bmp",90, 215,386 , 258,425 )
    if x==-1 and y ==-1 then
        logD("不在天蛇府")
        --点黑狱平原
        findPic("heiyupingyuan.bmp",90, 143,384 , 265,525 )
        --点天蛇府弟子
        findMuColor(color_tianshefudizi,90,  36,794 , 583,1005)
        --选择床送过去
        findPic("chuansongtsf.bmp",90, 264,444 , 322,557 )
        --关闭地图
        findPic("guanbisjditu.bmp",90, 571,1063, 638,1132)
        mSleep(15000)
    else
        logD("在天蛇府")
        --关闭地图
        findPic("guanbisjditu.bmp",90, 571,1063, 638,1132)
    end
    
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
    logD("抽取天降神兵")
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
---------------------------------------------------------------------------------------------------------------------------------
--断网计数
function duanwang(counts)
    --断网重试
    x,y = findImageInRegionFuzzy("gantanhao.bmp",90, 166,464 , 200,504 )
    if x~=-1 and y ~= -1 then
        x,y = findMultiColorInRegionFuzzy(color_chongshi, 90, 282,539 , 311,591 )
        if x~=-1 and y ~= -1 then
            click(x,y)
            counts = counts + 1 
            logD("断线次数"..counts)
        end
    end
    
    if counts >5 then
        logD("断网重启操作")
        os.execute("reboot")
    end
    return counts
end

function jiesuo()
    logD("屏幕解锁")
    mSleep(1000)
    --点亮屏幕
    keyDown("HOME");    -- HOME键按下
    mSleep(100);        --延时100毫秒
    keyUp("HOME");  
    mSleep(1000)
    -- HOME键抬起
    --滑动解锁
    moveTo(  63,978 , 598,983 )
    mSleep(3000)
end
--关闭弹窗
function guanbi()
    --账号界面登陆
        findPic("denglu.bmp",90, 147,470 , 268,658 )
        --立即登录
        findPic("lijidenglu.bmp",90, 221,492 , 287,646 )
        --断线登陆界面进入游戏    
        findPic("jinruyouxi.bmp",90,  16,382 , 171,738 )
        findPic("jinruyouxi_2.bmp",90,16,382 , 171,738 )
        --全部领取
        findPic("quanbulingqu.bmp",90,  43,471 , 150,655 )
        --登陆错误
        findPic("quedingcuowu.bmp",90, 204,498 , 276,625 )
        findPic("dlcwqd.bmp",90, 197,484 , 282,628 )
        findPic("denglucuowu_2.bmp",90, 200,510 , 283,621 )
        --立即登录
        findPic("lijidenglu.bmp",90, 221,492 , 287,646 )
        --角色进入
        findMuColor(color_juesejinru,90,   2,888 , 113,1130)
        --活动公告
        findPic("huodong.bmp",90,  51,489 , 120,638 )
        --精彩内容
        findPic("jingcaineirong.bmp",90, 539,887 , 625,981 )
        --关闭离线挂机界面
        findPic("guanbiguaji.bmp",90, 427,755 , 492,834 )
        --sim卡提示
        findPic("SIMhao.bmp",90, 208,385 , 313,821 )
        --取消家族boss提示
        findPic("jiazuboss.bmp",90, 193,595 , 267,727 )
        --取消家族boss进入提示
        findPic("bossjinru.bmp",90, 194,595 , 271,726 )
        --关闭界面
        findPic("guanbijiemian.bmp",90, 567,1065, 639,1133)
        --关闭窗口
        findPic("guanbick.bmp",90, 582,1074, 638,1133)
        --手机商城登陆取消
        findPic("shangchengquxiao.bmp",90, 320,302 , 427,613 )
        
        --关闭界面
        findPic("guanbijiemian.bmp",90, 567,1065, 639,1133)
        --关闭bg窗口
        findPic("guanbibeibao.bmp",90, 573,1065, 639,1133)
        --断网重试
        findMuColor(color_chongshi, 90,259,502 , 329,628 )
        
        --关闭NPC对话  天蛇府弟子
        findPic("guanbiNPC_1.bmp",90, 575,268 , 638,328 )
    
end
--防卡死不动
function kasi()
    --下
    touchDown(0,  66,112 )
    mSleep(500)
    touchUp(0)
    --上
    mSleep(200)
    touchDown(0, 130,110 )
    mSleep(500)
    touchUp(0)
    --挂机
    findMuColor(color_guaji,90, 308,1040, 390,1131)
    mSleep(3000)
end

--主函数
function main()
    
    
    
    --运行游戏
    if appRunning("com.zeus.cangqiongbian") then
    else
        mSleep(5000)
        --进行解锁
        jiesuo()                                 
        --横屏SIM卡提示
        findPic("SIMhao_hengp.bmp",90, 210,581 , 438,663 )
        --sim卡提示
        findPic("SIMhao.bmp",90, 208,385 , 313,821 )
    
        logD("while外启动游戏")
        appRun("com.zeus.cangqiongbian")
        mSleep(10000)
        --手机商城登陆取消
        findPic("shangchengquxiao.bmp",90, 301,282 , 637,607 )
        --sim卡提示
        findPic("SIMhao.bmp",90, 208,385 , 313,821 )
        mSleep(50000)
    end
    --sim卡提示
    findPic("SIMhao.bmp",90, 208,385 , 313,821 )
    --登陆界面进入游戏
    findPic("jinruyouxi.bmp",90,  16,382 , 171,738 )
    --登陆界面进入游戏
    findPic("jinruyouxi.bmp",90,  16,382 , 171,738 )
    findPic("jinruyouxi_2.bmp",90,16,382 , 171,738 )
    mSleep(5000)
    --角色进入
    findMuColor(color_juesejinru,90,   2,888 , 113,1130)
    mSleep(10000)
    --活动公告
    findPic("huodong.bmp",90,  51,489 , 120,638 )
    --精彩内容
    findPic("jingcaineirong.bmp",90, 539,887 , 625,981 )
    --关闭离线挂机界面
    findPic("guanbilixianguaji.bmp",90, 409,739 , 500,831 )
    
    --回天蛇府
    isTsf()
    --断线计数
    counts = 0
    while true do
        --运行游戏
        if appRunning("com.zeus.cangqiongbian") then
        else
            logD("while内启动游戏")
            appRun("com.zeus.cangqiongbian")
            --mSleep(30000)
        end
       ------------------------------------------------------------------------------
        --断网计数
        counts = duanwang(counts)
        
        --关闭一些弹窗和挂机
        guanbi()
        
        x,y = findPic("zhaoziyuan.bmp",85, 291,447 , 339,677 )
        if x~=-1 and y~=-1 then
            mSleep(3000)
            x,y = findPic("zhaoziyuan.bmp",85, 291,447 , 339,677 )
            if x~=-1 and y~=-1 then
                logD("失去连接重启操作")
                os.execute("reboot")
            end
        end
        
        --断网重启
        x,y = findMultiColorInRegionFuzzy(color_duankailianjie,90, 154,452 , 203,665 )
        if x~=-1 and y~=-1 then
            mSleep(3000)
            x,y = findMultiColorInRegionFuzzy(color_duankailianjie,90, 154,452 , 203,665 )
            if x~=-1 and y~=-1 then
                logD("失去连接重启操作")
                os.execute("reboot")
            end
            
        end
        
        
        --买药   10小时
        time = os.time()
        if time%35940<280 then
            --断网重试
            findMuColor(color_chongshi, 259,502 , 329,628 )
            --关闭界面
            findPic("guanbijiemian.bmp",90, 567,1065, 639,1133)
            
            notifyMessage("现在时间为："..time,2000)
            mSleep(3000)
            --退出战斗
            tuizhan()
            --买药
            maiyao()
        end
        --是否在天蛇府    58fenz
        time = os.time()
        if time%3480<10 then
            isTsf()
        end
--[[ 
        --关闭npc对话
        findPic("guanbiNPC.bmp",90, 575,277 , 638,327 )
        --没过9分钟走动，防止卡主不动的情况
        time = os.time()
        if time %541 <10 then
            
        end
--]]        
        --关闭一些弹窗和挂机
        guanbi()
        --防卡死
        kasi()
        --挂机
        findMuColor(color_guaji,90, 308,1040, 390,1131)
        
        
        --奇遇和锻炉         23分钟
        time = os.time()
        if time%1380<120 then
            --断网重试
            findMuColor(color_chongshi, 259,502 , 329,628 )
            --关闭界面
            findPic("guanbijiemian.bmp",90, 567,1065, 639,1133)
            
            notifyMessage("现在时间为："..time,2000)
            mSleep(3000)
            qiyu()
        end
        
        
        
        
        --15.1分钟喊话
        time = os.time()
        if time%906 <20   then
            hanhua()
        end
        
    end
    
end







