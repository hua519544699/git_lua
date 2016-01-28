--主线任务
function zhuxian()
    notifyMessage("开始主线")
    logD("开始主线")
    mSleep(2000)
    --变强次数
    local counts = 0
    --练级主线
    time1 = os.time()
    while true do
        if counts>=5 then
            logD("主线任务已做完")
            notifyMessage("主线任务已做完")
            mSleep(2000)
            findPictf("guanbibianqiang.bmp",90, 550,903 , 610,962 )
            return
        end
        --超时10分钟
        local time2 = os.time()
        if time2 - time1 >600 then
            time1 = os.time()
            logD("主线超时重启")
            --重启游戏
            notifyMessage("主线超时重启游戏")
            mSleep(2000)
            --退出副本
            findPictf("tuichufuben.bmp",85, 513,1038, 565,1090)
            findMuColortf(color_tuichufuben,90, 509,1035, 567,1094)
            --退出副本
            findMuColortf(color_tuichufuben,90, 509,1035, 567,1094)
            --退出副本
            findPictf("tuichufb.bmp",90, 509,1035, 567,1094)
            --确定退出
            findPictf("quedingtuichu.bmp",90, 207,434 , 246,521 )
            --确定退出
            findPictf("quedingtuichu.bmp",90, 207,434 , 246,521 )
            --确定退出
            findPictf("quedingtuichu.bmp",90, 207,434 , 246,521 )
            mSleep(15000)
            --关闭游戏在开启游戏
            appKill("com.zeus.cangqiongbian")
            mSleep(4000)
            appRun("com.zeus.cangqiongbian")
            mSleep(5000)
        end
        --奇遇  40分钟
        timebb = os.time()
        if timebb%2400<30 then
            --准备阶段
            zhunbei()
            mSleep(1000)
            --奇遇,领奖,神兵,锻炉,纳戒,清理背包
            qiyu()
            mSleep(5000)
        end
        --社区图标
        if not findPic_boolean("shequ.bmp",90, 536,639 , 634,857 ) then
            --点击挂机
            findMuColortf(color_guaji,90, 308,1040, 390,1131)
        end
        --设置红蓝条
        honglan()
        --释放技能
        if findMuColor_boolean(color_jineng,90, 421,38  , 543,149 ) then
            --释放技能
            clicktf(89,1052)
        end
        findPiclp("guanbiditu.bmp",90, 571,1063, 638,1132)
        --回城复活
        findPiclp("huichengfuhuo.bmp",90, 196,436 , 251,551 )
        --点醒纳戒
        findPiclp("dianxing.bmp",90, 500,823 , 547,894 )
        --关闭配件
        findPiclp("guanbipeijian.bmp",90, 227,509 , 291,628 )
        --跳过动画
        findPiclp("tiaoguo.bmp",90, 601,65  , 633,99  )
        --领取红包
        findPiclp("hongbao.bmp",90, 477,749 , 526,798 )
        --发现退出副本,说明在副本里面,点击挂机
        if findPic_boolean("tuichufb.bmp",90, 509,1035, 567,1094)then
            --点击挂机
            findMuColorlp(color_guaji,90, 308,1040, 390,1131)
        end
        if findPic_boolean("tuichufuben.bmp",85, 513,1038, 565,1090)then
            --点击挂机
            findMuColorlp(color_guaji,90, 308,1040, 390,1131)
        end
        --退回
        --findPictf("tuihui.bmp",90, 586,1, 638,56)
        --离开副本
        if findPicLostColor_boolean("likaifuben.bmp",90,  18,957 ,  70,1098,0xFF00FF) then
            notifyMessage("离开副本")
            logD("离开副本")
            mSleep(8000)
            clicklp(x,y)
        end
        --转动转盘
        findPicTime("zhuandong.bmp",90,  44,477 , 115,649 )
        
        --进入游戏
        --登陆界面进入游戏
        findPictf("jinruyouxi.bmp",90,  16,382 , 171,738 )
        findPictf("jinruyouxi_2.bmp",90,16,382 , 171,738 )
        --角色进入
        findMuColorlp(color_juesejinru,90,   2,888 , 113,1130)
        --取消传承
        if findPic_boolean("chuanchengjiemian.bmp",90, 407,535 , 444,602 )then
            --取消传承
            findPiclp("quxiaochuancheng.bmp",90, 196,603 , 259,720 )
        end
        --获得新物品
        findMuColorlp(color_huode,90, 269,115 , 305,243 )
        --关闭离线挂机界面
        findPiclp("guanbiguaji.bmp",90, 427,755 , 492,834 )
        --关闭对话
        for i = 1,10 do
            findPiclp("duihua.bmp",90,   1,1091,  33,1121)
        end
        --跳过动画
        if findPic_boolean("tiaoguo.bmp",90, 579,0   , 638,108 ) then
            notifyMessage("跳过动画")
            logD("跳过动画")
            mSleep(2000)
            clicklp(x,y)
            --关闭界面
            findPictf("guanbijuese.bmp",90, 577,1072, 639,1134)
            for i =1,6 do
                mSleep(500)
                --界面回退
                findPiclp("huitui.bmp",90, 586,2, 637,59  )
            end
        end
        --关闭左边NPC对话
        if not findPicTime("tijiaorenwu.bmp",90,28,8, 126,323 )and
           not findPicTime("jieshourenwu.bmp",90,  34,9   , 127,325 )then
            findPiclp("guanbicebianNPC.bmp",90, 585,281 , 638,333 )
        end
        --提交任务
        findPicTime("tijiaorenwu.bmp",90,28,8, 126,323 )
        --接受任务
        findPicTime("jieshourenwu.bmp",90,  34,9   , 127,325 )
        --提交任务
        findPicTime("tijiaorenwu.bmp",90,28,8, 126,323 )
        --立即装备
        findMuColorlp(color_liji,90, 214,252 , 244,354 )
        --关闭斗气界面
        --findPic("guanbidouqi.bmp",90, 578,1073, 639,1133)
        --获得新物品
        findMuColorlp(color_huode,90, 269,115 , 305,243 )
        --间隔31秒
        local rwTime = os.time()
        if rwTime%20<=2 then
            --点开任务眼
            diankairenwu()
        end
        --点击主线任务自动寻路
        local timezx = os.time()
        if timezx%4<2 then
            --点击主线任务自动寻路
            findMuColorlp(color_zhuxian,90, 342,74, 373,112 )
        end
        
        --人物点击
        if findMuColor_boolean(color_juese,90, 586,212 , 623,359 ) then
            --点击角色
            clicklp( 602,44  )
        end
        --提示修炼斗魂
        if findMuColor_boolean(color_douhun,90, 511,325 , 541,385 ) then
            --点击斗魂
            clicklp( 486,85  )
        end
        --提示斗魂修炼
        if findMuColor_boolean(color_xiulian,90, 140,557 , 171,666 ) then
            --点击斗魂修炼
            clicklp(  53,969 )
            while true do
                --超时1分钟
                local time2 = os.time()
                if time2 - time1 >60 then
                    time1 = os.time()
                    notifyMessage("主线斗气修炼超时")
                    logD("主线斗气修炼超时")
                    mSleep(1500)
                    --关闭斗气界面
                    findPiclp("guanbidouqi.bmp",90, 578,1073, 639,1133)
                    break
                end
                --异常之类判断
                exception()
                --斗魂修炼
                findMuColorlp(color_douhunxiulian,90,   5,888 ,  91,1096)
                --突破
                findPiclp("tupo.bmp",90,  10,1012,  85,1121)
                --点击修炼
                findPicTime("xiulian.bmp",90,  16,1014,  87,1125)
                --跳过动画
                findPiclp("tiaoguo.bmp",90, 601,65  , 633,99  )
                --斗气不足
                if findPic_boolean("douqibuzu.bmp",90, 219,526 , 252,601 ) then
                    clicktf(x,y)
                    --关闭斗气界面
                    findPiclp("guanbidouqi.bmp",90, 578,1073, 639,1133)
                    notifyMessage("主线斗气修炼完毕")
                    mSleep(5000)
                    break
                end
            end
        end
        --斗魂修炼
        findMuColorlp(color_douhunxiulian,90,   5,888 ,  91,1096)
        --点击修炼
        findPiclp("xiulian.bmp",90,  16,1014,  87,1125)
        --斗气不足
        if findPic_boolean("douqibuzu.bmp",90, 219,526 , 252,601 )then
            clicktf(x,y)
            --关闭斗气界面
            clicklp( 616,1111)
        end
        --提示点击日常
        if findMuColor_boolean(color_richang,90, 464,626 , 525,732 ) then
            --点击日常
            clicklp( 514,994 )
        end
        --死亡矿洞
        if findMuColor_boolean(color_kuangdong,90, 425,223 , 466,381 ) then
            --点击死亡矿洞
            clicklp( 392,634 )
        end
        --提示开始挑战
        if findMuColor_boolean(color_tiaozhan,90, 131,468 , 189,612 ) then
            logD("主线提示开始挑战")
            notifyMessage("主线提示开始挑战")
            mSleep(2000)
            --点击开始挑战
            clicktf(  56,831 )
            mSleep(5000)
            --点击挂机
            findMuColorlp(color_guaji,90, 308,1040, 390,1131)
        end
        --关闭-------------------------------------------------------------------------------------------------------
        --点击纳戒
        findPiclp("najie.bmp",90, 192,20  , 286,127 )
        --离开副本
        if findPicLostColor_boolean("likaifuben.bmp",90,  18,957 ,  70,1098,0xFF00FF) then
            mSleep(8000)
            clicklp(x,y)
        end
        --幻境罗盘提示
        if findMuColor_boolean(color_luopan,90, 304,230 , 367,390 ) then
            --点击幻境罗盘副本
            clicklp( 257,630 )
        end
        --选择幻境罗盘难度
        if findMuColor_boolean(color_luopannandu,90, 174,725 , 238,877 ) then
            --点击选择难度
            clicklp( 114,439 )
        end
        --进入幻境罗盘副本
        if findMuColor_boolean(color_jinruhuanjing,90, 143,498 , 178,583 ) then
            logD("主线进入幻境罗盘副本")
            notifyMessage("主线进入幻境罗盘副本")
            mSleep(2000)
            clicklp(  56,845 )
            mSleep(5000)
            --点击挂机
            findMuColorlp(color_guaji,90, 308,1040, 390,1131)
        end
        --取消传承
        if findPic_boolean("chuanchengjiemian.bmp",90, 407,535 , 444,602 )then
            --取消传承
            findPiclp("quxiaochuancheng.bmp",90, 196,603 , 259,720 )
        end
        --提示点击风云争霸
        if findMuColor_boolean(color_fengyun,90, 341,328 , 378,421 ) then
            --点击进入风云争霸
            clicklp( 245,634 )
        end
        --提示查看风云信息
        if findMuColor_boolean(color_xinxi,90, 131,757 , 163,846 ) then
            --点击查看信息
            clicklp(  41,305 )
        end
        --提示挑战
        if findMuColor_boolean(color_fengyuntiaozhan,90, 259,815 , 321,914) then
            --点击擂台挑战
            clicklp( 193,568 )
        end
        --领取擂台奖励
        if findMuColor_boolean(color_leitaijiangli,90, 236,827 , 271,902 ) then
            --点击领取奖励
            clicklp( 230,1096)
        end
        --提示返回斗气大陆
        if findMuColor_boolean(color_fanhuidalu,90, 562,812 , 605,932 ) then
            --点击返回
            clicklp( 615,1110)
        end
        --提示进入悬赏任务
        if findMuColor_boolean(color_xuanshang,90, 396,188 , 433,321 ) then
            clicklp( 325,514 )
        end
        --提示为好友提升星级
        if findMuColor_boolean(color_tisheng,90, 396,343 , 437,433 ) then
            logD("主线好友提升星级")
            notifyMessage("主线好友提升星级")
            mSleep(2000)
            --点击
            clicktf( 317,880 )
            mSleep(3000)
            clicktf( 267,283 )
        end
        --出现变强界面退出循环
        if findPic_boolean("bianqiang.bmp",85, 545,168 , 610,232 ) or
           findPic_boolean("bianqiang1.bmp",85, 338,193 , 395,251 ) then
            --关闭变强界面
            clicklp( 583,935 )
            --点击任务自动寻路
            findMuColortf(color_zhuxian,90, 342,74, 373,112 )
            counts = counts +1
            notifyMessage(counts)
            mSleep(1500)
        end
        --一键征友
        findPicLostColor("zhengyou.bmp",90, 299,846 , 334,940 ,0xFF00FF)
        --全部添加
        if findPic_boolean("quantianjia.bmp",90,  25,855 ,  66,968 )then
            --点击全部添加
            click(x,y)
            --关闭征友界面
            findPiclp("guanbizhengyou.bmp",90, 583,1074, 639,1133)
        end
        --点击悬赏任务
        --findPic("xuanshang.bmp",90, 298,471 , 401,584 )
        --点击接受悬赏任务
        --findPictf("xuanshangjieshou.bmp",90,  32,234 ,  91,363 )
        --断网等操作
        exception()
    end
end