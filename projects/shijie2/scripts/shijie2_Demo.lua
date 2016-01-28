--怪物坐标440.650

--图片路径
PIC_PATH = "/var/touchelf/scripts/shijie2_images/"
--一键装备
color_yijianzhuangbei = { 0xF9F9F9, -4, 1, 0xF1F1F1, -8, 1, 0xFFFFFF, -15, 1, 0xFDFDFD, -15, 5, 0xFAFAFA, -11, 25, 0xF9F9F9, -15, 25, 0xFCFCFC, -4, 33, 0xFDFDFD, -3, 51, 0xFDFDFD, -11, 51, 0xFEFEFE }
--英雄任务
color_yingxiongrenwu = { 0xFFFFFF, 0, 12, 0xFFFFFF, -6, 6, 0xFFFFFF, -14, -3, 0xFFFFFF, -14, 6, 0xFFFFFF, -14, 15, 0xFFFFFF, -22, -4, 0xFDFDFD, -7, 26, 0xFEFEFE, -19, 31, 0xF6F6F6, -19, 38, 0xF0F0F0 }
--委托任务
color_weituorenwu = { 0xFFFFFF, 0, 13, 0xFDFDFD, -7, 4, 0xF8F8F8, -4, -2, 0xFFFFFF, -9, -2, 0xEEEEEE, 10, 5, 0xFFFFFF, 15, 5, 0xFFFFFF, 5, 47, 0xFEFEFE, 8, 57, 0xEBEBEB, 1, 57, 0xF3F3F3, -7, 57, 0xDFDFDF }
--委托任务开始
color_weituokaishi = { 0xFFFFFF, -9, 0, 0xFFFFFF, -9, -8, 0xFFFFFF, -14, 15, 0xFFFFFF, -5, 31, 0xFDFDFD, -19, 21, 0xE8E8E8, -19, 31, 0xFDFDFD, -14, 15, 0xFFFFFF }
--委托任务胜利界面
color_victory = { 0xAF8945, 13, 39, 0xCBA160, -3, 78, 0xAE8844, 42, 121, 0xEFCE99, 6, 139, 0xBC9856, 35, 194, 0xEEC488, 2, 224, 0xB5904F, -20, 216, 0x9E7531, 3, 76, 0x2C0000, -10, 59, 0xFFFFFF, 56, 47, 0xFFF3DD }
--出战
color_chuzhan = { 0xFEFEFE, -9, 0, 0xFEFEFE, -9, 8, 0xFFFFFF, -9, -7, 0xFDFDFD, 0, 7, 0xFFFFFF, 3, 17, 0xE9E9E9, -2, 17, 0xFEFEFE, -8, 14, 0xF4F4F4, -8, 20, 0xFDFDFD, -7, 26, 0xFAFAFA, 1, 25, 0xFFFFFF }
--召集队伍
color_zhaojiduiwu = { 0xFBFBFB, 3, -32, 0xFFFFFF, 10, -32, 0xFFFFFF, 13, -22, 0xFFFFFF, 12, -7, 0xFAFAFA, 4, 27, 0xF2F2F2, 5, 49, 0xF9F9F9, -4, 47, 0xFDFDFD, -4, 55, 0xFAFAFA, 13, 50, 0xFFFFFF }
--组队界面的组队任务字样样色
color_zuduirenwu = { 0xFDFDFD, 8, -11, 0xFEFEFE, 12, -38, 0xFFFFFF, 12, -50, 0xFFFFFF, 15, -25, 0xFFFFFF, 15, 11, 0xFCFCFC, 11, 29, 0xFFFFFF, 12, 21, 0xF8F8F8, 13, 42, 0xFDFDFD, 10, 52, 0xFDFDFD, 2, 52, 0xEFEFEF }
--组队开始
color_zuduikaishi = { 0xFFFFFF, 0, 8, 0xFFFFFF, -5, 23, 0xFFFFFF, 6, 21, 0xFFFFFF, 6, 25, 0xFFFFFF, 2, 29, 0xFBFBFB, 3, 39, 0xFCFCFC, -10, 30, 0xF1F1F1 }
function main()
    --cleanWeiTuoCD()
    cleanWeiTuoBAS()
end
--清理B级以上的任务组队
function cleanWeiTuoBAS()
    notifyMessage("开始清理BAS任务")
    mSleep(1500)
        
    --设置计数
    counts = 1
    while true do
        --点击任务
        findPic("renwu.bmp",90, 251,1045, 333,1131)
        --点击委托任务界面
        if findMuColor_boolean(color_weituorenwu,90, 474,12, 533,147 ) then
            click(x,y)
            --判断是否有S级和AB级任务
            if findPicLostColor_boolean("Bjirenwu.bmp",90,     83,4       , 480,283 ,0xFF00FF) or
                findPicLostColor_boolean("Ajirenwu.bmp",90,    83,4     , 480,283 ,0xFF00FF) or
                findPicLostColor_boolean("Sjirenwu.bmp",90,    83,4     , 480,283 ,0xFF00FF) then
                clickTime(x,y)
            else
                --findMuColor_boolean(color_zuduirenwu,90, 501,90  , 559,257 ) then
                --关闭委托任务界面
                findPicLostColor("guanbiweituo.bmp",90, 589,1081, 639,1134,0xFF00FF)  
                notifyMessage("没发现SAB任务退出")
                mSleep(1500)
                return
                
            end
        end
        click(440,650)
        --开始委托任务
        if findMuColor_boolean(color_weituokaishi,90,  84,997 , 126,1066) then
            --召集队伍
            findMuColor(color_zhaojiduiwu,90, 289,973 , 327,1087)
        else
            click(480,650)
        end
        --召集队伍
        findMuColor(color_zhaojiduiwu,90, 289,973 , 327,1087)
        
--[[    
        time2 = os.time()
        --如果超时10分钟就退出循环
        if time2 - time1 >600 then
            --关闭委托任务界面
            findPicLostColor("guanbiweituo.bmp",90, 589,1081, 639,1134,0xFF00FF)
            notifyMessage("超时退出清理SAB")
            mSleep(1500)
            return
        end
--]]
        
--[[
        --组队人员确定
        if findPicLostColor_boolean("ok_button.bmp",90, 224,522 , 269,628 ,0xFF00FF) then
            --点击确定加入
            click(x,y)
            --消息已过期确定
            findPicLostColor("ok_button.bmp",90, 242,534 , 300,595 ,0xFF00FF)
            --如果队伍有人就开始任务
            if not findPic_boolean("meiren.bmp",90, 119,656 , 222,749 ) then
                --组队委托任务开始
                if findMuColor_boolean(color_weituokaishi,90,  84,997 , 126,1066) then
                    clickTime(x,y)
                else
                    --关闭组队界面
                    findPicLostColor("guanbizudui.bmp",90, 524,1023, 584,1081,0xFF00FF)
                    --确定退出组队界面
                    findPic("shi.bmp",90, 236,485 , 293,546 )
                    --回公会
                    findPic("huigonghui.bmp",90,2,1052,  83,1133)
                    notifyMessage("SAB组队任务已清空")
                    mSleep(1500)
                    return
                end
            end
        end
--]]    
        for i =1,10 do
            tanchuangBAS()
        end
        
        --如果队伍有人就开始任务
        if not findPic_boolean("meiren.bmp",90, 119,656 , 222,749 ) then
            --组队人员确定
            findPicLostColor("ok_button.bmp",90, 224,522 , 269,628 ,0xFF00FF)
            --消息已过期确定
            findPicLostColor("ok_button.bmp",90, 242,534 , 300,595 ,0xFF00FF)
            --组队委托任务开始
            if findMuColor_boolean(color_weituokaishi,90,  94,888 , 245,1033) then
                clickTime(x,y)
            else
                --关闭组队界面
                findPicLostColor("guanbizudui.bmp",90, 524,1023, 584,1081,0xFF00FF)
                --确定退出组队界面
                findPic("shi.bmp",90, 236,485 , 293,546 )
                --回公会
                findPic("huigonghui.bmp",90,2,1052,  83,1133)
                return
            end
        end
        --点击自动
        findPic("zidong.bmp",90, 576,979 , 637,1049)
        --委托任务胜利界面
        findMuColor(color_victory,90, 358,404 , 452,731 )
        --战利品ok界面
        findPic("ok_zhanliping.bmp",90,  78,490 , 136,635 )
        --级别提升界面        x,y直接点  该界面无反应   x+120  
        if findPic_boolean("shengjitishi.bmp",90, 378,389 , 467,542 ) then
            click(x+120,y)
        end
        --级别提升ok界面
        findPicLostColor("ok_button.bmp",90,  21,525 ,  73,638 ,0xFF00FF)
        mSleep(1500)
    end
end
--BAS弹窗
function tanchuangBAS()
    --队伍召集讯息已发送至区域频道
        findPicLostColor("ok_duiwuzhaoji.bmp",90, 250,538 , 300,594,0xFF00FF)
        --加速软体警告
        findPicLostColor("ok_duiwuzhaoji.bmp",90, 250,538 , 300,594,0xFF00FF)
        --组队人员确定
        findPicLostColor("ok_zudui.bmp",90, 224,522 , 269,628 ,0xFF00FF)
        --消息已过期确定
        findPicLostColor("ok_duiwuzhaoji.bmp",90, 242,534 , 300,595 ,0xFF00FF)
end

--清理所有C-D级委托任务
function cleanWeiTuoCD()
    notifyMessage("开始清理CD任务")
    mSleep(1500)
    --设置第一点时间
    time1 = os.time()
    while true do
        --点击任务
        findPic("renwu.bmp",90, 251,1045, 333,1131)
        --点击委托任务界面
        --findMuColor(color_weituorenwu,90, 474,12, 533,147 )
        if findMuColor_boolean(color_weituorenwu,90, 474,12, 533,147 ) then
            click(x,y)
            --向上滑动
            moveTo( 162,136 , 432,119 )
            --向上滑动
            moveTo( 162,136 , 432,119 )
            mSleep(3000)
            --判断是否有D级和C级任务
            if findPicLostColor_boolean("Djirenwu.bmp",90,  98,7   , 480,283 ,0xFF00FF) or
                findPicLostColor_boolean("Cjirenwu.bmp",90,  98,7   , 480,283 ,0xFF00FF) then
                clickTime(x,y)
            else
                --关闭委托任务界面
                findPicLostColor("guanbiweituo.bmp",90, 589,1081, 639,1134,0xFF00FF)
                notifyMessage("没发现CD任务退出")
                mSleep(1500)
                return
            end
        end
        time2 = os.time()
        --如果超时5分钟就退出循环
        if time2 - time1 >300 then
            --关闭委托任务界面
            findPicLostColor("guanbiweituo.bmp",90, 589,1081, 639,1134,0xFF00FF)
            notifyMessage("超时退出清理CD")
            mSleep(1500)
            return
        end
        --C级委托任务
        --findPicLostColor_boolean("Cjirenwu.bmp",90,  98,7   , 480,283 ,0xFF00FF)
        --D级委托任务
        --findPicLostColor_boolean("Djirenwu.bmp",90,  98,7   , 480,283 ,0xFF00FF)
        --点击怪物
        click(440,650)
        --开始委托任务
        if findMuColor_boolean(color_weituokaishi,90,  84,997 , 126,1066) then
            click(x,y)
        else
            click(480,650)
        end
        --点击开始委托任务
        findMuColor(color_weituokaishi,90,  84,997 , 126,1066)
        --点击自动
        findPic("zidong.bmp",90, 576,979 , 637,1049)
        --委托任务胜利界面
        findMuColor(color_victory,90, 358,404 , 452,731 )
        --战利品ok界面
        findPic("ok_zhanliping.bmp",90,  78,490 , 136,635 )
        --级别提升界面        x,y直接点  该界面无反应   x+120  
        if findPic_boolean("shengjitishi.bmp",90, 378,389 , 467,542 ) then
            click(x+120,y)
        end
        --级别提升ok界面
        findPicLostColor("ok_button.bmp",90,  21,525 ,  73,638 ,0xFF00FF)
        mSleep(2000)
    end
end
--找图忽略色
function findPicLostColor(path,per,x1,y1,x2,y2,color)
    x,y = findImageInRegionFuzzy(PIC_PATH..path,per,x1,y1,x2,y2,color)
    if x~=-1 and y~=-1 then
        click(x,y)
    end
end
--找图忽略色返回boolean
function findPicLostColor_boolean(path,per,x1,y1,x2,y2,color)
    x,y = findImageInRegionFuzzy(PIC_PATH..path,per,x1,y1,x2,y2,color)
    if x~=-1 and y~=-1 then
        return true
    else
        return false
    end
end
--多点找色  并点击
function findMuColor(table,per,x1,y1,x2,y2)
    x,y = findMultiColorInRegionFuzzy(table,per,x1,y1,x2,y2)
    click(x,y)
end
--多点找色返回boolean值
function findMuColor_boolean(table,per,x1,y1,x2,y2)
    x,y = findMultiColorInRegionFuzzy(table,per,x1,y1,x2,y2)
    if x~=-1 and y~=-1 then
        return true
    else
        return false
    end
end
--寻找图片  并点击
function findPic(path,per,x1,y1,x2,y2)
    x,y = findImageInRegionFuzzy(PIC_PATH..path,per,x1,y1,x2,y2)
    click(x,y)
end
--找图返回boolean值
function findPic_boolean(path,per,x1,y1,x2,y2)
    x,y = findImageInRegionFuzzy(PIC_PATH..path,per,x1,y1,x2,y2)
    if x~=-1 and y~=-1 then
        return true
    else
        return false
    end
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
function moveTo(x1,y1,x2,y2)
    logD("滑动屏幕")
    touchDown(0, x1, y1); 
    mSleep(100);            
    touchMove(0, x2, y2); 
    mSleep(100);            
    touchUp(0);             
end
--打印log日志
function logD(con)
    time = os.time()
    tt = os.date("*t", time)
    logDebug(tt.month.."月"..tt.day.."日  :  "..con)
end
function clickTime(x,y)
    time1 = os.time()
    click(x,y)
end

--关闭弹窗
function guanbi()
    
end
