--图片路径
PIC_PATH = "/var/touchelf/scripts/lianji_images/"
--点击任务
color_renwu = { 0x5AAECE, 16, 13, 0xBDE7EF, -1, 11, 0x4AA6C6, 12, 0, 0xB5E7EF, 16, 4, 0xCEF7F7, 19, 12, 0xC6EFF7, 2, -3, 0x63B6C6, 1, 0, 0x63AECE, 3, 3, 0x6BBED6, 8, 8, 0x9CDBE7 }
--挂机
color_guaji = { 0x082431, -32, -9, 0xA5EBF7, -27, -9, 0xA5E7EF, -22, -9, 0x8CCBCE, -24, -2, 0x94D3DE, -27, -2, 0x8CC7CE, -31, -2, 0x9CDBDE, -25, 5, 0xA5EBF7, -28, 5, 0xA5DBE7, -34, 8, 0xADEBF7, -23, 13, 0x9CDFE7, -34, 15, 0xADE7EF, -32, 9, 0xADE3E7 }
--任务眼
color_renwuyan = { 0x84E3F7, 0, -15, 0x84DBEF, -8, -3, 0x84DFEF, 0, 13, 0x7BD7EF, 8, 1, 0x8CE3F7, 5, -9, 0x84E7F7, -4, 8, 0x84E3F7 }
--退出队伍
color_tuichuduiwu = { 0x84DFF7, 10, 6, 0x84DFF7, -5, -9, 0x8CDFEF, -13, -12, 0x7BC7DE, -8, 13, 0x84DFF7, 0, 14, 0x84E7FF, 8, 14, 0x84E7F7, 5, 2, 0x84E3EF, 1, 0, 0x84DFEF, -5, -5, 0x8CDFEF, -5, -10, 0x8CDFE7, -10, 1, 0x8CEBF7, 13, 0, 0x84CFE7 }
--主函数
function main()
    --while true do
       luopan()
    --end
    
end
----幻境罗盘打困难级别
function luopan()
    --while true do
    
    mSleep(2000)
    --获取焦点
    qiantai()
    --退队伍
    tuiDui()
    --开始幻境罗盘
    mSleep(3000)
    --点击日常
    findPic("richang.bmp",90, 460,938 , 560,1043)
    --向右滑动
    findPic("xiangyou.bmp",85, 294,1073, 348,1114)
    --clicktf( 321,1100)
    --向右滑动
    findPic("xiangyou.bmp",85, 294,1073, 348,1114)
    --clicktf( 321,1100)
    --判断次数用完
    if findPicLostColor_boolean("luopancishu.bmp",90, 204,616 , 225,635 ,0xFF00FF) then
        notifyMessage("罗盘次数已用2次")
        logD("罗盘次数已用2次")
        mSleep(1500)
        --关闭副本进入界面
        findPic("guanbifuben.bmp",90, 578,1073, 638,1131)
        return
    end
    --点击幻境罗盘
    findPic("hjlp.bmp",90, 155,544 , 344,725 )
    --点击困难级别
    findPic("kunnan.bmp",90,  62,585 , 180,714 )
    --点击自动匹配
    if findPic_boolean("zidongpipei.bmp",90,  24,575 ,  90,714 )then
        click(x,y)
        if findPic_boolean("zidongpipei.bmp",90,  24,575 ,  90,714 ) then
            notifyMessage("幻境罗盘没次数")
            mSleep(1500)
            logD("幻境罗盘没次数")
            --关闭副本进入界面
            findPic("guanbifuben.bmp",90, 578,1073, 638,1131)
            return
        end
    end
    --关闭副本进入界面
    findPic("guanbifuben.bmp",90, 578,1073, 638,1131)
    --点击挂机
    findMuColortf(color_guaji,90, 308,1040, 390,1131)
    
    --自动匹配次数计数
    local counts = 0
    --第一点时间
    time1 = os.time()
    while true do
        --没过2分钟进行一次副本匹配
        local time3 = os.time()
        if time3 % 120 < 10 and not findPic_boolean("tuichufb.bmp",90, 509,1035, 567,1094) then
            --退队伍
            tuiDui()
            --点击日常
            findPic("richang.bmp",90, 460,938 , 560,1043)
            --向右滑动
            findPic("xiangyou.bmp",85, 294,1073, 348,1114)
            --clicktf( 321,1100)
            --向右滑动
            findPic("xiangyou.bmp",85, 294,1073, 348,1114)
            --clicktf( 321,1100)
            --判断次数用完
            if findPicLostColor_boolean("luopancishu.bmp",90, 204,616 , 225,635 ,0xFF00FF) then
                notifyMessage("罗盘次数已用2次")
                logD("罗盘次数已用2次")
                mSleep(1500)
                --关闭副本进入界面
                findPic("guanbifuben.bmp",90, 578,1073, 638,1131)
                return
            end
            --点击幻境罗盘
            findPic("hjlp.bmp",90, 155,544 , 344,725 )
            --点击困难级别
            findPic("kunnan.bmp",90,  62,585 , 180,714 )
            --点击自动匹配
            if findPic_boolean("zidongpipei.bmp",90,  24,575 ,  90,714 )then
                clickTime(x,y)
                if findPic_boolean("zidongpipei.bmp",90,  24,575 ,  90,714 ) then
                    notifyMessage("幻境罗盘没次数")
                    mSleep(1500)
                    logD("幻境罗盘没次数")
                    if counts >=11 then
                        --进入副本
                        findPic("jinrufuben.bmp",90,   7,745 , 110,918 )
                    end
                    --关闭副本进入界面
                    findPic("guanbifuben.bmp",90, 578,1073, 638,1131)
                    return
                end
                counts = counts +1
            end
            --关闭副本进入界面
            findPic("guanbifuben.bmp",90, 578,1073, 638,1131)
        end 
        --异常之类窗口
        exception()
        --点击挂机
        findMuColortf(color_guaji,90, 308,1040, 390,1131)
        --确认副本进入界面
        findPictf("querenjinru.bmp",90, 202,423 , 252,529 )
        --取消提示
        findPictf("quxiaots.bmp",90, 190,593 , 263,720 )
        --转动转盘
        findPicTime("zhuandong.bmp",90,  44,477 , 115,649 )
        --副本超时 6分钟
        local time2 = os.time()
        if time2-time1 >360  then
            notifyMessage("副本超时")
            mSleep(1500)
            logD("副本超时")
            return
        end
    end
end
--悬赏任务
function xuanshang()
    mSleep(2000)
    notifyMessage("开始悬赏")
    mSleep(1500)
    findPic("richang.bmp",90, 464,876 , 553,1038)
    --点击悬赏任务
    findPic("xuanshang.bmp",90, 265,456 , 400,586 )
    --一键征友
    findPic("zhengyou.bmp",90, 299,846 , 334,940 )
    --全部添加
    findPic("quantianjia.bmp",90,  25,855 ,  66,968 )
    --关闭征友界面
    findPic("guanbizhengyou.bmp",90, 583,1074, 639,1133)
    --点击纳戒
    findPic("najie.bmp",90, 192,20  , 286,127 )
    --点击日常
    findPic("richang.bmp",90, 464,876 , 553,1038)
    --点击悬赏任务
    findPic("xuanshang.bmp",90, 265,456 , 400,586 )
    --点击自动购买
    findPic("zidonggoumai.bmp",90,  21,554 ,  71,607 )
    --点击一键升星
    findPic("yijianshengxing.bmp",90,  24,859 ,  67,958 )
    --取消悬赏晶钻
    findPic("qxXsJz.bmp",90, 208,626 , 245,695 )
    --点击接受任务
    findPic("xuanshangjieshou.bmp",90,  24,220 ,  99,371 )
    --前往
    findPic("qianwang.bmp",90,  31,246 ,  89,358 )
    if findPic_boolean("xuanshangjieshou.bmp",90,  24,220 ,  99,371 ) then
        --关闭悬赏界面
        findPictf("guanbixuanshang.bmp",90, 578,1066, 638,1134)
        notifyMessage("悬赏没次数")
        logD("悬赏没次数")
        return
    end
    --第一点时间
    local time1 = os.time()
    while true do
        --断网异常判断
        exception()
        --超时7判断
        time2 = os.time()
        if time2 - time1 >420 then
            --重置时间
            time1 = os.time()
            notifyMessage("悬赏任务8分钟超时")
            logD("悬赏任务8分钟超时")
            return
        end
        --每过1分钟接受悬赏,并判断悬赏任务是否已完成
        local time4 = os.time()
        if time4%60 <10 then
            --点击日常
            findPic("richang.bmp",90, 464,876 , 553,1038)
            --点击悬赏任务
            findPic("xuanshang.bmp",90, 265,456 , 400,586 )
            --一键征友
            findPic("zhengyou.bmp",90, 299,846 , 334,940 )
            --全部添加
            findPic("quantianjia.bmp",90,  25,855 ,  66,968 )
            --关闭征友界面
            findPic("guanbizhengyou.bmp",90, 583,1074, 639,1133)
            --点击纳戒
            findPic("najie.bmp",90, 192,20  , 286,127 )
            --点击日常
            findPic("richang.bmp",90, 464,876 , 553,1038)
            --点击悬赏任务
            findPic("xuanshang.bmp",90, 265,456 , 400,586 )
            --点击自动购买
            findPic("zidonggoumai.bmp",90,  21,554 ,  71,607 )
            --点击一键升星
            findPic("yijianshengxing.bmp",90,  24,859 ,  67,958 )
            --取消悬赏晶钻
            findPic("qxXsJz.bmp",90, 208,626 , 245,695 )
            --点击接受任务
            findPic("xuanshangjieshou.bmp",90,  24,220 ,  99,371 )
            --前往
            findPic("qianwang.bmp",90,  31,246 ,  89,358 )
            if findPic_boolean("xuanshangjieshou.bmp",90,  24,220 ,  99,371 ) then
                notifyMessage("悬赏次数已用完")
                logD("悬赏次数已用完")
                --关闭悬赏界面
                findPictf("guanbixuanshang.bmp",90, 578,1066, 638,1134)
                return
            end
        end
    end
end
--侦查
function zhencha()
    --后台到前台
    qiantai()
    notifyMessage("开始日常任务侦查",2000)
    logD("日常侦察任务开启")
    mSleep(3000)
    --点击日常
    findPic("richang.bmp",90, 460,938 , 560,1043)
    --事务所
    findPic("shiwusuo.bmp",90,  61,633 , 282,855 )
    --领取讨伐奖励
    findPic("tfjiangli.bmp",90,  23,253 ,  74,383 )
    --开始侦查
    findPic("kaishizhencha.bmp",90,   3,819 ,  98,994 )
    --如果已经开始那就是  继续侦查
    findPic("jixuzhencha.bmp",90,   4,825 ,  97,993 )
    --关闭事务所侦查界面
    findPic("guanbizhencha.bmp",90, 566,1066, 639,1133)
    --点开任务眼
    renwuzhencha()
    mSleep(5000)
    --第一点时间
    local time1 = os.time()
    while true do
        --清理背包  31分钟
        timebb = os.time()
        if timebb%1860<60 then
            --关闭npc对话
            findPictf("guanbiNPC.bmp",90, 575,277 , 638,327 )
            --关闭对话
            for i = 1,10 do
                findPic_boolean("duihua.bmp",90,   1,1091,  33,1121)
            end
            --跳过动画
            findPic_boolean("tiaoguo.bmp",90, 579,0   , 638,108 )
            --锻炉
            duanlu()
            clearBag()
            mSleep(5000)
        end
        --买药
        maiyao()
        --断网等操作
        exception()
        --进入游戏
        --登陆界面进入游戏
        findPic("jinruyouxi.bmp",90,  16,382 , 171,738 )
        findPic("jinruyouxi_2.bmp",90,16,382 , 171,738 )
        --角色进入
        findMuColor(color_juesejinru,90,   2,888 , 113,1130)
        --活动公告
        findPictf("huodong.bmp",90,  51,489 , 120,638 )
        --精彩内容
        findPictf("jingcaineirong.bmp",90, 539,887 , 625,981 )
        --精彩内容1
        findPictf("jingcaineirong1.bmp",90, 565,921 , 621,976 )
        --关闭离线挂机界面
        findPictf("guanbilixianguaji.bmp",90, 409,739 , 500,831 )
        --确定组队
        findPictf("chuanchengqueding.bmp",90, 209,435 , 246,517 )
        --获得新物品
        findMuColortf(color_huode,90, 269,115 , 305,243 )
        --间隔20
        local zcTime = os.time()
        if zcTime%20<2 then
            --点开任务眼
            renwuzhencha()
        end
        --关闭配件
        findPictf("guanbipeijian.bmp",90, 227,509 , 291,628 )
        --[[
        --关闭弹窗
        if not findPic_boolean("tijiaorenwu.bmp",90,28,8, 126,323 ) and
           not findPic_boolean("jieshourenwu.bmp",90,  34,9   , 127,325 ) then
            guanbi()
        end
        --]]
        --提交任务
        findPicTime("tijiaorenwu.bmp",90,28,8, 126,323 )
        --接受任务
        findPicTime("jieshourenwu.bmp",90,  34,9   , 127,325 )
        --取消网络选择
        findPictf("wangluoquxiao.bmp",90,  68,526 , 142,638 )
        --跳过动画
        findPictf("tiaoguo.bmp",90, 579,0   , 638,108 )
        --关闭过场动画
        findPictf("dianjijixu.bmp",90,   1,1079,  42,1129)
        --点击任务自动寻路侦查
        findMuColortf(color_zhencha,90, 248,10  , 368,188 )
        --使用获得的物品
        findMuColortf(color_huode,90, 269,115 , 305,243 )
        --立即装备
        findMuColortf(color_liji,90, 214,252 , 244,354 )
        --事务所
        findPictf("shiwusuo.bmp",90,  61,633 , 282,855 )
        --领取讨伐奖励
        findPictf("tfjiangli.bmp",90,  23,253 ,  74,383 )
        --开始侦查
        findPictf("kaishizhencha.bmp",90,   3,819 ,  98,994 )
        --如果已经开始那就是  继续侦查
        findPictf("jixuzhencha.bmp",90,   4,825 ,  97,993 )
        --断网重试
        findMuColortf(color_chongshi, 90,259,502 , 329,628 )
        --手机商城登陆取消
        findPictf("shangchengquxiao.bmp",90, 320,302 , 427,613 )
        --跳过对话
        findPictf("duihua.bmp",90,   1,1091,  33,1121)
        --跳过对话
        findPictf("duihua.bmp",90,   1,1091,  33,1121)
        --关闭npc对话
        findPictf("guanbiNPC.bmp",90, 575,277 , 638,327 )
        --点击任务自动寻路侦查
        findMuColortf(color_zhencha,90, 248,10  , 368,188 )
        --后台到前台
        qiantai()
        --超过7分钟还没提交任务或接受任务就执行死机操作,重启机子
        time2 = os.time()
        if (time2 - time1)>420 then
            --重置时间
            time1 = os.time()
            notifyMessage("进行重启",2000)
            mSleep(3000)
            logD("任务未接受提交重启操作")
            mSleep(1000)
            appKill("com.zeus.cangqiongbian")
            mSleep(4000)
            appRun("com.zeus.cangqiongbian")
            mSleep(5000)
        end
        ----[[
        --每过4分钟接受侦查,并判断侦查任务是否已完成150环
        local time4 = os.time()
        if time4%240 <7 then
            --关闭npc对话
            findPictf("guanbiNPC.bmp",90, 575,277 , 638,327 )
            --点击日常
            findPic("richang.bmp",90, 460,938 , 560,1043)
            --事务所
            findPic("shiwusuo.bmp",90,  61,633 , 282,855 )
            --领取讨伐奖励
            findPic("tfjiangli.bmp",90,   23,253 ,  74,383 )
            --[[
            if findMuColor_boolean(color_duihuan,90, 279,314 , 352,436 ) and
               not findPic_boolean("kaishizhencha.bmp",90,   3,819 ,  98,994 ) and
               not findPic_boolean("jixuzhencha.bmp",90,   4,825 ,  97,993 ) then
                notifyMessage("已完成150次侦查")
                mSleep(1500)
                logD("已完成150次侦查")
                return
            end
            --]]
            --开始侦查
            findPic("kaishizhencha.bmp",90,   3,819 ,  98,994 )
            --如果已经开始那就是  继续侦查
            findPic("jixuzhencha.bmp",90,   4,825 ,  97,993 )
            --关闭事务所侦查界面
            findPic("guanbizhencha.bmp",90, 566,1066, 639,1133)
        end
        --]]
        --案件完成时  下一个案件按钮
        if findPic_boolean("xiageanjian.bmp",90, 130,504 , 198,638 ) then
            logD("当前环侦查任务完成")
            mSleep(8000)
            --点击下个案件按钮
            clicktf(x,y)
            --换讨伐令
            --huantfl()
            --后台到前台
            qiantai()
            --点击日常
            findPic("richang.bmp",90, 460,938 , 560,1043)
            --事务所
            findPic("shiwusuo.bmp",90,  61,633 , 282,855 )
            --领取讨伐奖励
            findPic("tfjiangli.bmp",90,  23,253 ,  74,383 )
            --开始侦查
            findPic("kaishizhencha.bmp",90,   3,819 ,  98,994 )
            --如果已经开始那就是  继续侦查
            findPic("jixuzhencha.bmp",90,   4,825 ,  97,993 )
            --点开任务眼
            renwuzhencha()
            --关闭事务所侦查界面
            findPic("guanbizhencha.bmp",90, 566,1066, 639,1133)
            notifyMessage("开始下一环日常任务侦查",2000)
            logD("日常侦察任务开启")
            mSleep(3000)
        end
        --完成全部侦查案件
        if findPic_boolean("zhenchawan.bmp",90, 138,469 , 185,675 ) then
            click(x,y)
            notifyMessage("已完成150次侦查")
            mSleep(1500)
            logD("已完成150次侦查")
            return
        end
    end
end
--异常与固定弹窗
function exception()
    --取消开启自动下载
    findPictf("quxiaoIOS.bmp",90, 170,376 , 227,484 )
	--领取红包
    findPictf("hongbao.bmp",90, 471,737 , 528,800 )
	--取消网络选择
    findPictf("wangluoquxiao.bmp",90,  68,526 , 142,638 )
    --账号界面登陆
    findPictf("denglu.bmp",90, 147,470 , 268,658 )
    --立即登录
    findPictf("lijidenglu.bmp",90, 221,492 , 287,646 )
    --断线登陆界面进入游戏    
    findPictf("jinruyouxi.bmp",90,  16,382 , 171,738 )
    findPictf("jinruyouxi_2.bmp",90,16,382 , 171,738 )
    --全部领取
    findPictf("quanbulingqu.bmp",90,  43,471 , 150,655 )
    --登陆错误
    findPictf("quedingcuowu.bmp",90, 204,498 , 276,625 )
    findPictf("dlcwqd.bmp",90, 197,484 , 282,628 )
    findPictf("denglucuowu_2.bmp",90, 200,510 , 283,621 )
    --立即登录
    findPictf("lijidenglu.bmp",90, 221,492 , 287,646 )
    --关闭离线挂机界面
    findPictf("guanbilixianguaji.bmp",90, 409,739 , 500,831 )
    --角色进入
    findMuColortf(color_juesejinru,90,   2,888 , 113,1130)
    --活动公告
    findPictf("huodong.bmp",90,  51,489 , 120,638 )
    --精彩内容
    findPictf("jingcaineirong.bmp",90, 539,887 , 625,981 )
    --关闭离线挂机界面
    findPictf("guanbiguaji.bmp",90, 427,755 , 492,834 )
    --sim卡提示
    findPictf("SIMhao.bmp",90, 208,385 , 313,821 )
    --取消家族boss提示
    findPictf("jiazuboss.bmp",90, 193,595 , 267,727 )
    --取消家族boss进入提示
    findPictf("bossjinru.bmp",90, 194,595 , 271,726 )
	--断网重试
    findMuColortf(color_chongshi, 90,259,502 , 329,628 )
	--点击纳戒
    findPictf("najie.bmp",90, 192,20  , 286,127 )
    --获得新物品
    findMuColor(color_huode,90, 269,115 , 305,243 )
    --确定组队
    findPictf("chuanchengqueding.bmp",90, 209,435 , 246,517 )
	--点开任务眼
    if not findMuColor_boolean(color_renwuyan,90, 254,3 , 316,68 ) then
        --logD("任务眼关闭状态下打开任务眼")
        --点击打开任务眼
        findMuColortf(color_renwu,90, 288,0, 408,94)
    end
	
	
    
	--后台到前台
    qiantai()
	--失去连接重启游戏
    if findMuColor_boolean(color_duankailianjie,90, 154,452 , 203,665 ) then
        mSleep(3000)
        if findMuColor_boolean(color_duankailianjie,90, 154,452 , 203,665 ) then
            logD("失去连接重启游戏")
            --关闭游戏在开启游戏
            appKill("com.zeus.cangqiongbian")
            mSleep(4000)
            appRun("com.zeus.cangqiongbian")
            mSleep(5000)  
        end
    end
	--游戏获取焦点
    qiantai()
	--连接资源
    if findPic_boolean("lianjieziyuan.bmp",90, 223,367 , 403,756 ) or 
       findPic_boolean("lianjieziyuan_1.bmp",90, 223,367 , 403,756 ) then
        logD("连接资源卡死。重启")
        --os.execute("reboot")
        --关闭游戏在开启游戏
        appKill("com.zeus.cangqiongbian")
        mSleep(4000)
        appRun("com.zeus.cangqiongbian")
        mSleep(5000)
    end
	--登陆界面卡死，无账号区号信息
    if findPic_boolean("noaccount.bmp",90, 179,378 , 336,762 ) then
        logD("无账号区号信息卡死。重启")
        --关闭游戏在开启游戏
        appKill("com.zeus.cangqiongbian")
        mSleep(4000)
        appRun("com.zeus.cangqiongbian")
        mSleep(5000)
    end
end
function kuobao()
    notifyMessage("扩包")
    mSleep(1500)
        local hh = 0
        local lh = 0
        local counts = 0
        --while lh < 4 then
        while hh < 4 do
            --l相隔12            --h相隔8
            --行方向间隔101      --列方向102
            --起始范围  428,560         结束范围     525,660
            --第一个格子坐标    橙色  0xFFFFB5    紫色为 0xE751E7    蓝色  0xC6DBEF   绿色   0x29D7BD
            --[[
            if findPicLostColor_boolean("kuobao.bmp",85,428-lh*102,560 +hh*101,525-lh*102,660+hh*101,0xFF00FF)then
                click(x,y)
            end
            --]]
            if findPicLostColor_boolean("kuobao.bmp",85, 355,563 ,453,665 ,0xFF00FF)then
                click(x,y)
            end
            
            
            hh = hh + 1
            if hh>=4 then
                hh = 0
                lh = lh+1
            end
            if lh>=4 then
                notifyMessage("重置列的值")
                mSleep(1500)
                lh = 0
                hh = 0
                --滑动屏幕
                myMove_RL( 159,736 ,1200,778,20)
                --计数
                counts = counts + 1
            end
            if counts >=10 then
                notifyMessage("背包清理完毕")
                mSleep(1500)
                return
            end
        end
end
--退出队伍并关闭自动同意邀请
function tuiDui()
    notifyMessage("退出队伍")
    logD("退出队伍")
    mSleep(2000)
    --退出队伍
    findMuColor(color_tuichuduiwu,85, 290,19  , 477,90  )
    --点击队伍图标
    findPic("duiwu.bmp",90, 401,14  , 442,65  )
    --退出队伍
    findMuColor(color_tuichuduiwu,85, 290,19  , 332,58  )
    --关闭队伍界面
    findPic("guanbiduiwu.bmp",90, 578,1067, 638,1134)
--[[
    --关闭自动同意
    --点击队伍图标
    findPic("duiwu.bmp",90, 401,14  , 442,65  )
    --关闭自动同意
    findPic("zidongzudui.bmp",90, 481,929 , 525,971 )
    --关闭队伍界面
    findPic("guanbiduiwu.bmp",90, 578,1067, 638,1134)
--]]
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
--多点找色  并点击
function findMuColortf(table,per,x1,y1,x2,y2)
    x,y = findMultiColorInRegionFuzzy(table,per,x1,y1,x2,y2)
    clicktf(x,y)
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
--找单色返回boolean值
function findOneColor_boolean(one,per,x1,y1,x2,y2)
    x,y = findColorInRegionFuzzy(one,per,x1,y1,x2,y2)
    if x~=-1 and y ~=-1 then
        return true
    else
        return false
    end
end
--寻找图片讨伐
function findPictf(path,per,x1,y1,x2,y2)
    x,y = findImageInRegionFuzzy(PIC_PATH..path,per,x1,y1,x2,y2)
    clicktf(x,y)
end
--寻找图片  并点击
function findPic(path,per,x1,y1,x2,y2)
    x,y = findImageInRegionFuzzy(PIC_PATH..path,per,x1,y1,x2,y2)
    click(x,y)
end
--寻找图片  并点击并重置时间
function findPicTime(path,per,x1,y1,x2,y2)
    
    x,y = findImageInRegionFuzzy(PIC_PATH..path,per,x1,y1,x2,y2)
    if x~=-1 and y~=-1 then
        time1 = os.time()
        clicktf(x,y)
    end
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
--点击事件短时间
function clicktf(x,y)
    if x~=-1 and y~=-1 then
        touchDown(0, x + math.random(-3, 3), y + math.random(-3, 3))
        mSleep(math.random(15,40))
        touchUp(0)
        mSleep(math.random(500,800))
    end
end
--点击事件
function click(x,y)
    if x~=-1 and y~=-1 then
        touchDown(0,x,y)
        mSleep(math.random(100,200))
        touchUp(0)
        mSleep(3000)
    end
end
--重置时间的点击事件
function clickTime(x,y)
    if x~=-1 and y~=-1 then
        time1 = os.time()
        touchDown(0, x + math.random(-3, 3), y + math.random(-3, 3))
        mSleep(math.random(15,40))
        touchUp(0)
        mSleep(math.random(500,800))
    end
end
--左右滑动函数
--同myMove_UD
function myMove_RL(x1, y1, x2, y2,speed)
    local step = speed
    if x2 > x1 then step = -speed end 
    local cnt = math.abs((x2 - x1) / speed)
    if cnt == 0 then
        cnt = 1
        step = math.abs(x2 - x1)
    end
    touchDown(0, x1, y1)
	mSleep(50)
    for i = 1, cnt do
        mSleep(50)
        x1 = x1 - step
        touchMove(0, x1, y1)
    end
    touchUp(0)
    mSleep(100)
end
--滑动
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
    local time = os.time()
    local tt = os.date("*t", time)
    logDebug(tt.month.."月"..tt.day.."日  :  "..con)
end
--获取焦点
function qiantai()
    --电池
    x,y = findImageInRegionFuzzy(PIC_PATH.."dianchi.bmp",90, 540,2   , 636,39  )
    if x~=-1 and y~=-1 then
        logD("电池启动游戏")
        appRun("com.zeus.cangqiongbian")
    end
end