--图片路径
PIC_PATH = "/var/touchelf/scripts/create_images/"
---角色进入游戏
color_juesejinru = { 0x42D7FF, 1, -12, 0x31BAFF, 4, 19, 0x4AE7FF, 2, 41, 0x4AFBFF, 4, 53, 0x52FBFF, 28, 25, 0xBDFFFF, 32, 0, 0xC6FFFF, 29, -9, 0xB5FFFF, 26, -21, 0xADFFFF, 26, -4, 0xCEFFFF, 30, 54, 0xC6FFFF }
color_yuren = { 0xE7E7E7, -9, 0, 0xFFFFFF, -11, 6, 0xF7FBF7, -16, 6, 0xF7F7F7, -8, 19, 0xF7FBFF, -5, 22, 0xFFFFFF, -3, 11, 0xFFF7F7, 1, 8, 0xF7FBF7 }
function main()
    --账号的创建
    create()
end
--创建账号
function create()
    while true do
        --运行游戏
        if not appRunning("com.zeus.cangqiongbian") then
            --启动游戏
            appRun("com.zeus.cangqiongbian")
        end
        --切换账号
        findPic("qiehuanzhanghao.bmp",90, 290,658 , 348,782 )
        --快速注册
        findPic("kuaisuzhuce.bmp",90,  64,629 , 125,770 )
        --账号注册
        findPic("zhanghaozhuce.bmp",90,  73,500 , 127,716 )
        --账号注册界面
        if findPic_boolean("zhanghao.bmp",90, 406,330 , 468,432 ) then
            --点击账号
            click(x,y)
            --生成8位随机字母
            s = randomStr("abcdefghijklmnopqrstuvwxyz", 8)
            --输入账号  6-16位,只能字母与数字,只能字母开头
            inputText(s)
            mSleep(1500)
            --点击密码
            findPic("mima.bmp",90, 313,324 , 387,423 )
            --输入密码   长度为6-20位
            inputText("a5531876")
            mSleep(1500)
            --点击done
            findPic("done_create.bmp",90,  10,921 ,  66,1050)
            --点击确定进行账号的注册
            findPic("sure.bmp",90, 199,510 , 259,618 )
            --如果出现进入游戏界面说明注册成功
            if findPic_boolean("jinruyouxi.bmp",90,  61,619 , 151,699 ) then
                --进行账号密码的写入
                notifyMessage("账号密码写入文件")
                mSleep(1500)
                local file = assert(io.open("/var/touchelf/scripts/cqb_create.txt", 'a'))
                file:write(s..",a5531876\n")
                file:close()
                notifyMessage("账号密码写入文件完毕")
                mSleep(1500)
                --进入游戏
                findPic("jinruyouxi.bmp",90,  61,619 , 151,699 )
                mSleep(5000)
                --进入游戏
                findPic("jinruyouxi.bmp",90,  61,619 , 151,699 )
                --选择元素师
                findPic("yuanshushi.bmp",90, 116,21  , 207,121 )
                if findPic_boolean("saizi.bmp",90,  31,622 ,  84,682 ) then
                    click(x,y)
                    --点击名字输入框
                    click(x,y-70)
                    --输入角色名字后缀名
                    inputText("裕仁")
                    mSleep(1500)
                    --点击return
                    findPic("return.bmp",90,  11,1022,  62,1085)
                    --裕仁结尾
                    if findMuColor_boolean(color_yuren,90,  40,469 ,  74,579 ) then
                        --确认创建
                        click(  50,1000)
                        --findMuColor(color_juesejinru,90,   2,888 , 113,1130)
                        mSleep(3000)
                        --进入游戏后重启游戏
                        notifyMessage("角色创建成功,重启游戏")
                        mSleep(2000)
                        --关闭游戏在开启游戏
                        appKill("com.zeus.cangqiongbian")
                        mSleep(4000)
                        appRun("com.zeus.cangqiongbian")
                        mSleep(5000)
                    end 
                end
            else
                --关闭游戏在开启
                notifyMessage("注册失败重启游戏")
                mSleep(2000)
                --关闭游戏在开启游戏
                appKill("com.zeus.cangqiongbian")
                mSleep(4000)
                appRun("com.zeus.cangqiongbian")
                mSleep(5000)
            end
        end
    end
end
--随机字符串
function randomStr(str, num)
    local reStr ='';
    math.randomseed(tostring(os.time()):sub(5):reverse());
    for i = 1, num do
        local getStr = math.random(1, string.len(str));
        reStr = reStr .. string.sub(str, getStr, getStr);
    end
    return reStr;
end
--手机IP更换
function router()
	local index = id
	index = string.match(index,"%s*(.-)%s*$")	
	url = 'id%3d'..index..'%26type%3ddown%26shell_data%3dinternet%253DMAC_VLAN%2binterface%253Dwan1%26r%3d0.43528579045092863'	
	local tt = os.time()
	local ipAddress = 0
	while true do
		ipAddress = httpGet('http://ip.3322.net/')
		local ret = string.match(ipAddress,'%d+')
		if ret ~= nil then
			notifyMessage('ip:'..ipAddress)
			break
		elseif ret == nil then
			notifyMessage('联网失败,请等待')
			mSleep(5000)
		elseif os.difftime(os.time(),tt) > 90 then
			os.execute('reboot')
		end	
	end
	
	routerControl(getDeviceID(),url)
	mSleep(10000)
	local count = 0
	while true do
		local curIp = httpGet('http://ip.3322.net/')
		notifyMessage(curIp)
		--[[local curRet = string.match(curIp,'%d+')--]]
		if curRet ~= '' and curIp ~= ipAddress then
			notifyMessage('断网成功')
			break
		elseif count > 5 then
			for i = 1,10 do
				notifyMessage('断网5次还没断成功,请人工干预一下,断网5次还没断成功,请人工干预一下,断网5次还没断成功,请人工干预一下,断网5次还没断成功,请人工干预一下,断网5次还没断成功,请人工干预一下,断网5次还没断成功,请人工干预一下,断网5次还没断成功,请人工干预一下,断网5次还没断成功,请人工干预一下!断网5次还没断成功,请人工干预一下!断网5次还没断成功,请人工干预一下!断网5次还没断成功,请人工干预一下!断网5次还没断成功,请人工干预一下!断网5次还没断成功,请人工干预一下!断网5次还没断成功,请人工干预一下!断网5次还没断成功,请人工干预一下!断网5次还没断成功,请人工干预一下!')
				mSleep(2000)
			end
		else
			notifyMessage('断网失败,继续请求')
			routerControl(getDeviceID(),url)
			count = count + 1
		end
	end
end
function routerControl(deviceId,url)
	--[[local data = httpGet('http://192.168.1.200:8080/makemoney/android/ad/router?action=control&sn='..getDeviceID()..'&url='..url)--]]
	local data = httpGet('http://192.168.240.122:8080/makemoney/android/ad/router?action=control&sn='..getDeviceID()..'&url='..url)
	local i,j = string.find(data,'ok')
	if i~=nil and j~=nil then
		notifyMessage('断网请求成功')
		mSleep(5000)
	else
		notifyMessage('断网请求失败')
		mSleep(5000)
	end	
end
--点开任务
function diankairenwu()
    if not findMuColor_boolean(color_renwuyan,90, 254,3 , 316,68 ) then
        --logD("任务眼关闭状态下打开任务眼")
        --点击打开任务眼
        findMuColor(color_renwu,90, 288,0, 408,94)
    end
--[[
    --发现进入游戏   退出
    x,y = findMultiColorInRegionFuzzy(color_juesejinru,90,   2,888 , 113,1130)
    if x ~= -1 and y ~= -1 then
        return
    end
--]]
    --下
    --立即装备
    findMuColor(color_liji,90, 214,252 , 244,354 )
    touchDown(0,  66,112 )
    mSleep(500)
    touchUp(0)
    --上
    mSleep(200)
    touchDown(0, 130,110 )
    mSleep(500)
    touchUp(0)
    --点击挂机
    if findMuColor_boolean(color_guaji,90, 308,1040, 390,1131) then
        touchDown(0,x,y)
        mSleep(math.random(100,200))
        touchUp(0)
    end
    
    --点击任务自动寻路
    findMuColor(color_zhuxian,90, 342,74, 373,112 )
    --立即装备
    findMuColor(color_liji,90, 214,252 , 244,354 )
    mSleep(6000)
end
--关闭弹窗
function guanbi()
    --离开副本
    findMuColor(color_likaifuben,90,  18,957 ,  70,1098)
    --退出签到
    findPic("tuichuqiandao.bmp",90, 557,841 , 612,904 )
    --后台到前台
    qiantai()
    --连接资源
    if findPic_boolean("lianjieziyuan.bmp",90, 223,367 , 403,756 ) then
        logD("连接资源卡死。重启")
        --os.execute("reboot")
        --关闭游戏在开启游戏
        appKill("com.zeus.cangqiongbian")
        mSleep(4000)
        appRun("com.zeus.cangqiongbian")
        mSleep(5000)
    end
    --连接资源
    if findPic_boolean("lianjieziyuan_1.bmp",90, 223,367 , 403,756 ) then
        logD("连接资源1卡死。重启")
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
    
    --关闭队伍界面
    findPic("guanbiduiwu.bmp",90, 578,1067, 638,1134)
    --领取红包
    findPic("hongbao.bmp",90, 471,737 , 528,800 )
    --取消网络选择
    findPic("wangluoquxiao.bmp",90,  68,526 , 142,638 )
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
    --关闭副本难度选择
    findPic("guanbifb_1.bmp",90, 572,1068, 639,1133)
    --关闭界面
    findPic("guanbijiemian.bmp",90, 567,1065, 639,1133)
    --关闭bg窗口
    findPic("guanbibeibao.bmp",90, 573,1065, 639,1133)
    --断网重试
    findMuColor(color_chongshi, 90,259,502 , 329,628 )
    --关闭移动
    findPic("guanbiyidong.bmp",90, 432,703 , 491,761 )
    --关闭世界地图
    findPic("guanbishijie.bmp",90, 579,1076, 640,1134)
    --关闭副本1
    findPic("guanbifuben_1.bmp",90, 576,1070, 639,1134)
    --关闭NPC对话  天蛇府弟子
    findPic("guanbiNPC_1.bmp",90, 575,268 , 638,328 )
    --离开副本
    findMuColor(color_likaifuben,90, 3,932 ,  78,1110)
    --关闭设置
    findPic("guanbishezhi.bmp",90, 485,732 , 602,853 )
    --纳戒已完成
    findPic("wancheng.bmp",90, 171,112 , 301,357 )
    --断线登陆界面进入游戏
    findPic("jinruyouxi.bmp",90,  16,382 , 171,738 )
    findPic("jinruyouxi_2.bmp",90,16,382 , 171,738 )
    --账号界面登陆
    findPic("denglu.bmp",90, 147,470 , 268,658 )
    --登陆错误
    findPic("denglucuowu.bmp",90, 191,436 , 287,733 )

    --角色进入
    findMuColor(color_juesejinru,90,   2,888 , 113,1130)
    --活动公告
    findPic("huodong.bmp",90,  51,489 , 120,638 )
    --关闭邮件界面
    findPic("guanbiyoujian.bmp",90, 575,1068, 639,1134)
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
    --关闭背包满提示
    findPic("guanbitishi.bmp",90, 432,744 , 492,813 )
    --手机商城登陆取消
    findPic("shangchengquxiao.bmp",90, 320,302 , 427,613 )
    
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
--寻找图片  并点击并重置时间
function findPicTime(path,per,x1,y1,x2,y2)
    time1 = os.time()
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
        mSleep(2000)
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
    local time = os.time()
    local tt = os.date("*t", time)
    logDebug(tt.month.."月"..tt.day.."日  :  "..con)
end
--后台到前台
function qiantai()
    --电池
    x,y = findImageInRegionFuzzy(PIC_PATH.."dianchi.bmp",90, 540,2   , 636,39  )
    if x~=-1 and y~=-1 then
        logD("电池启动游戏")
        appRun("com.zeus.cangqiongbian")
    end
end