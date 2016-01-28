--4. 幻境罗盘打地狱级需要讨伐令。讨伐令需要在（日常）（苍穹事务所）兑换讨伐令 困难不需要
--5. 塞尔坦沙漠打地狱级别的（最好手动打一遍试一试）如果点挂机可能停止不动
--图片路径
PIC_PATH = "/var/touchelf/scripts/cqb_images/"
--侦查任务
color_zhencha = { 0xE7E3E7, -8, -1, 0xEFF3F7, -1, -9, 0xFFF7F7, -2, 4, 0xFFFBFF, 3, 0, 0xEFF3EF, 3, 0, 0xEFF3EF, 3, 0, 0xEFF3EF }
--挂机
color_guaji = { 0x082431, -32, -9, 0xA5EBF7, -27, -9, 0xA5E7EF, -22, -9, 0x8CCBCE, -24, -2, 0x94D3DE, -27, -2, 0x8CC7CE, -31, -2, 0x9CDBDE, -25, 5, 0xA5EBF7, -28, 5, 0xA5DBE7, -34, 8, 0xADEBF7, -23, 13, 0x9CDFE7, -34, 15, 0xADE7EF, -32, 9, 0xADE3E7 }
--任务眼
color_renwuyan = { 0x84E3F7, 0, -15, 0x84DBEF, -8, -3, 0x84DFEF, 0, 13, 0x7BD7EF, 8, 1, 0x8CE3F7, 5, -9, 0x84E7F7, -4, 8, 0x84E3F7 }
--角色进入游戏
color_juesejinru = { 0x52F3FF, -19, -72, 0x84F3FF, 10, -75, 0x94F3FF, 22, -73, 0xB5FFFF, 19, -49, 0xC6FFFF, -6, -49, 0x4AEBFF, 14, -24, 0xADFFFF, 0, -33, 0x42DFFF, 1, -16, 0x4AF7FF, -4, 1, 0x4AF3FF, 22, 28, 0xB5FFFF, 21, 48, 0x94F7FF, 0, 46, 0x42E7FF, -5, 66, 0x42EFFF, 25, 62, 0xBDFFFF, 10, 15, 0x39C3FF }
--挂机
color_guaji = { 0x082431, -32, -9, 0xA5EBF7, -27, -9, 0xA5E7EF, -22, -9, 0x8CCBCE, -24, -2, 0x94D3DE, -27, -2, 0x8CC7CE, -31, -2, 0x9CDBDE, -25, 5, 0xA5EBF7, -28, 5, 0xA5DBE7, -34, 8, 0xADEBF7, -23, 13, 0x9CDFE7, -34, 15, 0xADE7EF, -32, 9, 0xADE3E7 }
--离线挂机      463,795
color_lixianguaji = { 0xDEFFFF, -9, -265, 0xFFFBFF, 6, -192, 0xCED3DE, -11, -224, 0x7396AD, 7, -224, 0xEFF3F7, -8, -234, 0xEFEFEF }
--离开副本
color_likaifuben = { 0xADEBEF, -7, -44, 0x84E7F7, -12, 35, 0xADEFFF }
--点击兑换
color_duihuan = { 0xADEBEF, 6, -9, 0xA5EFF7, -5, 6, 0x9CE7F7, -2, 20, 0xB5F3FF, 4, 20, 0xADEFF7 }
--兑换讨伐令
color_duihuantfl = { 0x42AACE, 2, -29, 0x39AED6, 10, -25, 0x3192B5, 11, 34, 0x319ABD }
--天蛇府弟子
color_tianshefu = { 0x42AECE, 3, -41, 0x3182A5, 2, -29, 0x185563, 2, -4, 0x42AECE, -6, 8, 0x29758C, 8, 35, 0x21657B, 1, 41, 0x215D73, -6, 36, 0x318EAD }
--断网重试
color_chongshi = { 0xB5F3FF, -6, 20, 0xB5F3FF, -1, 26, 0xADF7FF, -8, 35, 0xADEFF7, 5, 30, 0xADF3FF, 5, 23, 0xA5E3EF, 0, 0, 0xB5F3FF }
--点击事件
function clicktf(x,y)
    if x~=-1 and y~=-1 then
        touchDown(0,x,y)
        mSleep(math.random(100,200))
        touchUp(0)
        mSleep(3000)
    end
end
--日志打印
function logD(con)
    time = os.time()
    tt = os.date("*t", time)
    logDebug(tt.month.."月"..tt.day.."日  :  "..con)
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
function moveTo(x1,y1,x2,y2)
    logD("滑动屏幕")
    touchDown(0, x1, y1); 
    mSleep(100);            
    touchMove(0, x2, y2); 
    mSleep(100);            
    touchUp(0);             
end

--寻找图片      并重置时间
function findPicTime(path,per,x1,y1,x2,y2)
    x,y = findImageInRegionFuzzy(PIC_PATH..path,per,x1,y1,x2,y2)
    if x~=-1 and y~=-1 then
        logD("时间重置")
        time1 = os.time()
        clicktf(x,y)
    end
    
end

--寻找图片
function findPic(path,per,x1,y1,x2,y2)
    x,y = findImageInRegionFuzzy(PIC_PATH..path,per,x1,y1,x2,y2)
    clicktf(x,y)
end

--多点找色
function findMuColor(table,per,x1,y1,x2,y2)
    x,y = findMultiColorInRegionFuzzy(table,per,x1,y1,x2,y2)
    clicktf(x,y)
end
--讨伐任务
function zhencha()
    notifyMessage("开始日常任务侦查",2000)
    logD("日常侦察任务开启")
    mSleep(3000)
---[[    
    --点击日常
    findPic("richang.bmp",90, 460,938 , 560,1043)
    --事务所
    findPic("shiwusuo.bmp",90,  61,633 , 282,855 )
    --开始侦查
    findPic("kaishizhencha.bmp",90,   3,819 ,  98,994 )
    --如果已经开始那就是  继续侦查
    findPic("jixuzhencha.bmp",90,   4,825 ,  97,993 )
    --点开任务眼
    diankairenwu()
   
   
    --第一点时间
    time1 = os.time()
   
   
    while true do
        --断线登陆界面退出循环    
        
        x,y = findImageInRegionFuzzy(PIC_PATH.."jinruyouxi.bmp",90, 16,382 , 171,738 )
        if x~=-1 and y ~=-1 then
            
            logD("登陆界面退出日常侦查任务")
            
            clicktf(x,y)
            mSleep(2000)
            
            --断线登陆界面进入游戏
            findPic("jinruyouxi.bmp",90,  16,382 , 171,738 )
            findPic("jinruyouxi_2.bmp",90,16,382 , 171,738 )
            --账号界面登陆
            findPic("denglu.bmp",90, 147,470 , 268,658 )
            --登陆错误
            findPic("denglucuowu.bmp",90, 191,436 , 287,733 )
            mSleep(10000)
            
            
            
            --角色进入
            findMuColor(color_juesejinru,90,   2,888 , 113,1130)
            mSleep(20000)
            --活动公告
            findPic("huodong.bmp",90,  51,489 , 120,638 )
            --精彩内容
            findPic("jingcaineirong.bmp",90, 539,887 , 625,981 )
            --关闭离线挂机界面
            findPic("guanbiguaji.bmp",90, 427,755 , 492,834 )
            --sim卡提示
            findPic("SIMhao.bmp",90, 208,385 , 313,821 )
            
            
            mSleep(20000)
            return
        end
        
        --点开任务眼
        diankairenwu()
--[[
        --点击任务
        time = os.time()
        if time%300<10 then
            
            mSleep(3000)
            --左
            touchDown(0,  99,79  )
            mSleep(500)
            touchUp(0)
            --等待5秒
            mSleep(500)
            
            --右
            touchDown(0, 101,142 )
            mSleep(500)
            touchUp(0)
            --等待5秒
            mSleep(500)
            
            --上
            touchDown(0, 130,109 )
            mSleep(500)
            touchUp(0)
            --等待5秒
            mSleep(500)
            
            --下
            touchDown(0,  66,112 )
            mSleep(500)
            touchUp(0)
            --等待5秒
            mSleep(500)
            --点击任务
            clicktf( 276,119 )
        end
--]]
        ----------------------------------------------------------------------------------------------------------------------
        --提交任务
        findPicTime("tijiaorenwu.bmp",90,28,8, 126,323 )
        --接受任务
        findPicTime("jieshourenwu.bmp",90,  34,9   , 127,325 )
        
        --跳过动画
        findPicTime("tiaoguo.bmp",90, 579,0   , 638,108 )
        --关闭过场动画
        findPic("dianjijixu.bmp",90,   1,1079,  42,1129)
        --关闭npc对话
        findPic("guanbiNPC.bmp",90, 575,277 , 638,327 )
        
        --断网重试
        findMuColor(color_chongshi, 90,259,502 , 329,628 )
        --手机商城登陆取消
        findPic("shangchengquxiao.bmp",90, 320,302 , 427,613 )
        
        --超过15分钟还没提交任务或接受任务就执行死机操作,重启机子
        time2 = os.time()
        if (time2 - time1)>900 then
            notifyMessage("进行重启",2000)
            mSleep(3000)
            logD("死机重启操作")
            os.execute("reboot")
        end
        
        ---------------------------------------------------------------------------------------------------------------------
        
        --案件完成时  下一个案件按钮
        x,y = findImageInRegionFuzzy(PIC_PATH.."xiageanjian.bmp",90, 130,504 , 198,638 )
        if x~=-1 and y ~=-1 then
            logD("侦查任务完成退出任务")
            --点击下个案件按钮
            clicktf(x,y)
            break;
        end
    end
--]] 
    --关闭事务所侦查界面
    findPic("guanbizhencha.bmp",90, 566,1066, 639,1133)
    
    notifyMessage("侦查任务当前环完成了",2000)
    mSleep(3000)
    
    --换讨伐令
    huantfl()
    --幻境罗盘
    hjlp()
    --塞尔谈沙漠
    setsm()
    
    
end
--换取讨伐令
function huantfl()
    notifyMessage("换取讨伐令",2000)
    logD("换取讨伐令")
    mSleep(3000)
    --点击日常
    findPic("richang.bmp",90, 460,938 , 560,1043)
    --事务所
    findPic("shiwusuo.bmp",90,  61,633 , 282,855 )
    
    --点击兑换
    findMuColor(color_duihuan,90, 279,314 , 352,436 )
    --兑换讨伐令
    findMuColor(color_duihuantfl,90, 140,432 , 233,560 )
    --确认兑换
    findPic("querenduihuan.bmp",90, 159,497 , 242,654 )
    
    mSleep(2000)
    --兑换讨伐令
    findMuColor(color_duihuantfl,90, 140,432 , 233,560 )
    --确认兑换
    findPic("querenduihuan.bmp",90, 159,497 , 242,654 )
    
    --关闭兑换界面
    findPic("guanbiduihuan.bmp",90, 559,1055, 639,1134)
    notifyMessage("兑换讨伐令完毕",2000)
    mSleep(3000)
    --关闭兑换界面
    findPic("guanbiduihuan.bmp",90, 559,1055, 639,1134)
end

----幻境罗盘打地狱级副本
function hjlp()
    --开始幻境罗盘
    
    mSleep(3000)
    --点击日常
    findPic("richang.bmp",90, 460,938 , 560,1043)
    --向右滑动
    clicktf( 321,1100)
    --向右滑动
    clicktf( 321,1100)
    --点击幻境罗盘
    findPic("hjlp.bmp",90, 155,544 , 344,725 )
    --点击地狱级
    findPic("diyu.bmp",90,   9,756 , 217,954 )
    --进入副本
    findPic("jinrufuben.bmp",90,   7,745 , 110,918 )
    --判断是否有次数
    x,y = findImageInRegionFuzzy(PIC_PATH.."jinrufuben.bmp",90,   7,745 , 110,918 )
    if x~=-1 and y ~=-1 then
        notifyMessage("幻境罗盘副本次数已用完",2000)
        logD("幻境罗盘副本无次数")
        mSleep(1000)
        --关闭界面
        clicktf( 615,1108)
        return
    end
    notifyMessage("开始幻境罗盘副本",2000)
    logD("开始幻境罗盘副本")
    mSleep(10000)
    
    --点击挂机
    findMuColor(color_guaji,90, 308,1040, 390,1131)
    
    --取消提示
    findPic("quxiaots.bmp",90, 190,593 , 263,720 )
    --点击挂机
    findMuColor(color_guaji,90, 308,1040, 390,1131)
    --等待转盘
    mSleep(10000)
    
    mSleep(5000)
    --点击挂机
    findMuColor(color_guaji,90, 308,1040, 390,1131)
    
    mSleep(5000)
    --点击挂机
    findMuColor(color_guaji,90, 308,1040, 390,1131)
    
    mSleep(5000)
    --点击挂机
    findMuColor(color_guaji,90, 308,1040, 390,1131)
    
    mSleep(5000)
    --点击挂机
    findMuColor(color_guaji,90, 308,1040, 390,1131)
    
    mSleep(5000)
    --点击挂机
    findMuColor(color_guaji,90, 308,1040, 390,1131)
    
    mSleep(5000)
    --点击挂机
    findMuColor(color_guaji,90, 308,1040, 390,1131)
    --等待6分钟
    --副本持续时间
    mSleep(360000)
    --副本结束
    notifyMessage("副本结束",2000)
    
    mSleep(3000)
    
    --纳戒已完成
        findPic("wancheng.bmp",90, 171,112 , 301,357 )
end

--点开任务
function diankairenwu()
    x,y = findMultiColorInRegionFuzzy(color_renwuyan,90, 254,3 , 316,68 )
    if x == -1 and y == -1 then
        logD("任务眼关闭状态下打开任务眼")
        --点击打开任务眼
        clicktf( 356,38  )
    end
    --下
    touchDown(0,  66,112 )
    mSleep(500)
    touchUp(0)
    --上
    mSleep(200)
    touchDown(0, 130,110 )
    mSleep(500)
    touchUp(0)
    --点击任务自动寻路
    findMuColor(color_zhencha,90, 248,10  , 368,188 )
    mSleep(6000)
end
-- 塞尔坦沙漠打地狱级别的
function setsm()
    
    mSleep(3000)
    --点击日常
    findPic("richang.bmp",90, 460,938 , 560,1043)
    --向右滑动
    clicktf( 321,1100)
    --向右滑动
    clicktf( 321,1100)
    --点击塞尔谈沙漠开始
    findPic("shamo.bmp",90, 221,417 , 425,615 )
    --点击地狱级别
    findPic("diyushamo.bmp",90,   6,749 , 223,956 )
    
    --进入沙漠副本
    findPic("jintushamo.bmp",90,   4,737 , 111,919 )
    --判断是否有次数
    x,y = findImageInRegionFuzzy(PIC_PATH.."jintushamo.bmp",90,   9,744 , 116,926 )
    --判断副本是否有次数
    if x~=-1 and y ~=-1 then
        notifyMessage("沙漠副本次数已用完",2000)
        logD("沙漠副本无次数")
        mSleep(1000)
        --关闭界面
        clicktf( 615,1108)
        return
    end
    
    notifyMessage("塞尔谈沙漠开始",2000)
    logD("开始沙漠副本")
    mSleep(3000)
    --------------------------------------------------------------------------------------------------------------------------------
    while true do
         --判断是否有次数
        x,y = findImageInRegionFuzzy(PIC_PATH.."jintushamo.bmp",90,9,744 , 116,926 )
        --判断副本是否有次数
        if x~=-1 and y ~=-1 then
            return
        end
        --是否在副本里面
        x,y = findImageInRegionFuzzy(PIC_PATH.."fbguanbi.bmp",90,9,744 , 116,926 )
        if x~=-1 and y ~=-1 then
            return
        end
        --断线登陆界面退出循环   
        x,y = findImageInRegionFuzzy(PIC_PATH.."jinruyouxi.bmp",90, 16,382 , 171,738 )
        if x~=-1 and y ~=-1 then
            logD("沙漠副本掉线")
            clicktf(x,y)
            --角色进入
            findMuColor(color_juesejinru,90,   2,888 , 113,1130)
            mSleep(20000)
            return
        end
        
        --取消网络选择
        findPic("wangluoquxiao.bmp",90,  68,526 , 142,638 )
        --防卡死不动
        kasi()
        --开始挂机
        findMuColor(color_guaji,90, 308,1040, 390,1131)
        --立即使用
        findPic("lijishiyong.bmp",90, 166,7   , 349,380 )
        --断网重试
        findMuColor(color_chongshi, 90,259,502 , 329,628 )
        --手机商城登陆取消
        findPic("shangchengquxiao.bmp",90, 320,302 , 427,613 )
        
        --副本退出图标
        x,y = findImageInRegionFuzzy("fbchukou.bmp",90,   2,622 , 636,1132)
        if x==-1 and y == -1 then
            mSleep(10000)
            x,y = findImageInRegionFuzzy("fbchukou.bmp",90,   2,622 , 636,1132)
            if x==-1 and y == -1 then
                return
            end
        end
        
        --关闭副本
        --findPic("guanbifb.bmp",90, 562,1063, 638,1132)
        --离开副本提示
        --notifyMessage("离开副本判断")
        --mSleep(2000)
        
        ----------------------------------------------------------------------------------------------------------------------------
        --退出确定
        x,y = findMultiColorInRegionFuzzy(color_likaifuben,90, 3,932 ,  78,1110)
        if x~=-1 and y~=-1 then
            logD("退出沙漠副本")
            mSleep(5000)
            --点击退出确定
            clicktf(x,y)
            mSleep(5000)
            findMuColor(color_likaifuben,90, 3,932 ,  78,1110)
            notifyMessage("退出副本",2000)
            mSleep(5000)
            
            break
        end
        
    end
    
    notifyMessage("赛坛沙漠副本结束",2000)
    mSleep(5000)
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
--回天蛇付
function huitsf()
    notifyMessage("回天蛇付",2000)
    logD("回天蛇府")
    mSleep(3000)
    --点开地图
    clicktf( 580,1074)
    --点击世界地图
    --clicktf(  50,895 )
    findPic("sjditu.bmp",90,   4,808 ,  99,981 )
    --点黑狱平原
    findPic("heiyupingyuan.bmp",90, 143,384 , 265,525 )
    --点天蛇府弟子
    findMuColor(color_tianshefu,90,  36,794 , 583,1005)
    --选择移动过去
    findPic("tsfyidong.bmp",90, 259,577 , 326,702 )
    mSleep(70000)
    
    --挂机
    findMuColor(color_guaji,90, 308,1040, 390,1131)
end

---------------------------------------------------------------------------------------------------------------------------

--关闭弹窗
function guanbi()
    --账号界面登陆
        findPic("denglu.bmp",90, 147,470 , 268,658 )
        --断线登陆界面进入游戏
        findPic("jinruyouxi.bmp",90,  16,382 , 171,738 )
        findPic("jinruyouxi_2.bmp",90,16,382 , 171,738 )
        
        --登陆错误
        findPic("quedingcuowu.bmp",90, 204,498 , 276,625 )
        findPic("dlcwqd.bmp",90, 197,484 , 282,628 )
        findPic("denglucuowu_2.bmp",90, 200,510 , 283,621 )
        
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
        
        --手机商城登陆取消
        findPic("shangchengquxiao.bmp",90, 320,302 , 427,613 )
        --关闭副本难度选择
        findPic("guanbifb_1.bmp",90, 572,1068, 639,1133)
        --关闭界面
        findPic("guanbijiemian.bmp",90, 567,1065, 639,1133)
        --关闭bg窗口
        findPic("guanbibeibao.bmp",90, 573,1065, 639,1133)
        --断网重试
        findMuColor(color_chongshi, 90,259,502 , 329,628 )
        
        --关闭NPC对话  天蛇府弟子
        findPic("guanbiNPC_1.bmp",90,   0,795 ,  56,862 )
        
        --关闭设置
        findPic("guanbishezhi.bmp",90, 485,732 , 602,853 )
        --纳戒已完成
        findPic("wancheng.bmp",90, 171,112 , 301,357 )
        --断线登陆界面进入游戏
        findPic("jinruyouxi.bmp",90,  16,382 , 171,738 )
        findPic("jinruyouxi_2.bmp",90,16,382 , 171,738 )
        --账号界面登陆
        findPic("denglu.bmp",90, 147,470 , 268,658 )
        mSleep(5000)
        --登陆错误
        findPic("denglucuowu.bmp",90, 191,436 , 287,733 )
        --角色进入
        findMuColor(color_juesejinru,90,   2,888 , 113,1130)
        mSleep(20000)
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
        
        --手机商城登陆取消
        findPic("shangchengquxiao.bmp",90, 320,302 , 427,613 )
end

--主程序
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
        logD("while循环外开启游戏")
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
    
    --回天蛇付      挂机
    --huitsf()
    
    while true do
        
        --运行游戏
        if appRunning("com.zeus.cangqiongbian") then
        else
            logD("while循环内开启游戏")
            appRun("com.zeus.cangqiongbian")
            --等待加载一分钟
            notifyMessage("等待加载一分钟",2000)
            mSleep(60000)
        end
        
        
        --关闭一些弹窗和挂机
        guanbi()
        
        
        --每天完成侦查讨伐令任务   5.3小时
        time = os.time()
        --if time%19080<50 then
            --时间
            notifyMessage("现在时间为："..time)
            --侦查任务
            zhencha()
            --换讨伐令
            --huantfl()
            --幻境罗盘
            --hjlp()
            --塞尔谈沙漠
            --setsm()
            --回天蛇付      挂机
            --huitsf()
        --end
        
        --幻境罗盘打地狱级副本
        --hjlp()
        -- 塞尔坦沙漠打地狱级别的
        --setsm()
        
        --换取讨伐令
        --huantfl()
        
        
        
        
    end
end
