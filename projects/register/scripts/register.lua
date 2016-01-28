--图片路径
PIC_PATH = "/var/touchelf/scripts/register_images/"
--跳过引导
color_yindao = { 0xD3D3D3, -12, -6, 0x949494, -4, -4, 0xBCBCBC, -3, 12, 0xC3C2C2, -2, 25, 0xC9C9C9, -4, 12, 0xBEBEBE, -1, 31,               0xCDCDCC, -9, 37, 0xA4A4A4 }
--菜单
color_caidan = { 0xFCFCFC, 0, 7, 0xF9F9F9, -6, 3, 0xF0EFEF, -10, 3, 0xFEFEFE, -12, 24, 0xE6E5E5, -9, 23, 0xE9E8E8, -2, 25, 0xF6F6F6,                0, 20, 0xEBEBEB, -10, 5, 0xFEFEFE, -14, -3, 0xFAFAFA }
--功能设定
color_sheding = { 0xF4F4F4, 0, -25, 0xF2F2F2, 9, -26, 0xDCDBDB, 8, -19, 0xF7F7F7, -1, -17, 0xFCFCFC, 8, -3, 0xFBFBFB, -1, -3,                   0xFFFFFF, -3, 13, 0xFEFEFE, 4, 13, 0xFCFCFC, 1, 25, 0xEFEFEF }
--切换账号
color_qiehuan = { 0xFEFEFE, 6, 0, 0xFEFEFE, -3, 11, 0xFFFFFF, 5, 12, 0xFEFEFE, 2, 34, 0xFFFFFF, -6, 34, 0xFCFCFC, -4, 40, 0xFCFCFC,                 2, 54, 0xFFFFFF, -3, 66, 0xFFFFFF }
--D:\触摸精灵开发环境\projects\register\scripts
--UI界面
UI = {
	{'InputBox{}', 'id',    '宽带编号:' },
};
function main()
    time1 = os.time()
    while true do
        --注册账号
        register()
    end
end
--后台到前台
function qiantai()
    --电池
    x,y = findImageInRegionFuzzy(PIC_PATH.."dianchi.bmp",90, 540,2   , 636,39  )
    if x~=-1 and y~=-1 then
        appRun("com.efunfun.twii")
    end
end
--注册账号
function register()
    time2 = os.time()
    --5分钟超时重启游戏
    if time2-time1>300 then
        time1 = os.time()
        appKill("com.efunfun.twii")
        mSleep(3000)
        appRun("com.efunfun.twii")
    end
    --获得焦点
    qiantai()
    --黑屏重启游戏
    --findPic("heiping.bmp",90,)
    --断网重试
    findPic("chongshi.bmp",90, 263,532 , 300,598 )
    --判断游戏是否启动
    if not appRunning("com.efunfun.twii") then
        appRun("com.efunfun.twii")
    end
    --掉线确定
    findPic("ok.bmp",90, 250,542 , 300,593 )
    --当前环境无法登陆确定
    findPic("queren.bmp",90, 227,521 , 282,610 )
    --读取时间过久
    findPic("ok_duqu.bmp",90, 212,537 , 269,596 )
    --主界面点击进入游戏
    findPic("interface.bmp",90, 341,934 , 485,1002)
    --创建角色界面点击ok确定
    findPicLostColor("ok_create.bmp",90,  96,952 , 129,1007,0xFF00FF)
    --跳过引导
    findMuColor(color_yindao,90,   2,2   ,  43,128 )
    --创建公会界面
    --点击随机公会名称
    findPic("suiji.bmp",90, 313,704 , 353,739 )
    --点击随机公会名称
    findPic("suiji.bmp",90, 313,704 , 353,739 )
    --点击随机公会名称
    findPic("suiji.bmp",90, 313,704 , 353,739 )
    --点击ok创建公会
    findPic("ok.bmp",90, 214,540 , 266,591 )
    --长度有误
    findPic("ok_changdu.bmp",90, 238,537 , 291,599 )
    --公会重名确定
    findPic("ok.bmp",90, 206,379 , 438,777 )
    --跳过引导
    findMuColor(color_yindao,90,2,2,43,128 )
    --点击跳过
    click(1,731 )
    --点击公告
    findPic("ok_gonggao.bmp",90,  60,537 , 117,594 )
    --点击菜单
    findMuColor(color_caidan,90, 567,1070, 602,1124)
    --点击功能设定
    findMuColor(color_sheding,90, 527,943 , 573,1046)
    if not findPic_boolean("face.bmp",90, 231,415 , 278,467 ) then
        --点击切换账号
        findMuColor(color_qiehuan,90, 238,427 , 281,547 )
    end
    --取消直接玩
    findPic("quxiao.bmp",90, 165,387 , 216,476 )
    --点击账号登陆
    findPic("accountLogin.bmp",90, 104,486 , 154,644 )
    --点击进入注册界面
    findPic("register.bmp",90,  88,948 , 122,1063)
    --取消连接
    findPic("quxiao_1.bmp",90, 221,355 , 285,501 )
    --点击确定
    findPic("register_sure.bmp",90, 207,495 , 260,650 )
    if findPic_boolean("sure.bmp",90 , 103,514 , 152,611 ) then
        --点击输入账号
        click( 415,464 )
        --生成11位随机字母    账号名只能是6----32位
        s = randomStr("abcdefghijklmnopqrstuvwxyz", 11)
        --输入10位字符串
        inputText(s)
        --点击输入密码
        click( 419,188 )
        --输入密码
        inputText("jun6249377")
        --点击再次输入密码
        click( 371,177 )
        --再次输入密码
        inputText("jun6249377")
        mSleep(2000)
        --点击done
        findPic("done_queren.bmp",90,   8,947 ,  64,1085)
        --findPic("sure.bmp",90 ,257,527 , 374,591 )
        mSleep(15000)
        --如果祖册成功吧账号写入文件中
        if findPic_boolean("zhucechenggong.bmp",90, 294,489 , 347,643 )  then
            time1 = os.time()
            --写入文件
            local file = assert(io.open("/var/touchelf/scripts/account.txt", 'a'))
            file:write(s.."\n")
            file:close()
        else
			appKill("com.efunfun.twii")
			mSleep(1500)
			appRun("com.efunfun.twii")
			mSleep(1500)
		end
        mSleep(1500)
        --取消连接
        findPic("quxiao_1.bmp",90, 221,355 , 285,501 )
        --点击确定
        findPic("register_sure.bmp",90, 207,495 , 260,650 )
        mSleep(15000)
        --换IP
        router()
    end
    --取消连接
    findPic("quxiao_1.bmp",90, 221,355 , 285,501 )
    --点击确定
    findPic("register_sure.bmp",90, 207,495 , 260,650 )
end
function randomStr(str, num)
    local reStr ='';
    math.randomseed(tostring(os.time()):sub(5):reverse());
    for i = 1, num do
        local getStr = math.random(1, string.len(str));
        reStr = reStr .. string.sub(str, getStr, getStr);
    end
    return reStr;
end

--时间点击事件
function click(x,y)
    if x~=-1 and y~=-1 then
        touchDown(0,x,y)
        mSleep(math.random(100,200))
        touchUp(0)
        mSleep(4000)
    end
end
--多点找色  并点击
function findMuColor(table,per,x1,y1,x2,y2)
    x,y = findMultiColorInRegionFuzzy(table,per,x1,y1,x2,y2)
    click(x,y)
end
--找图忽略色
function findPicLostColor(path,per,x1,y1,x2,y2,color)
    x,y = findImageInRegionFuzzy(PIC_PATH..path,per,x1,y1,x2,y2,color)
    if x~=-1 and y~=-1 then
        click(x,y)
    end
end
--寻找图片
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

--黄迪桥192.168.1.200:8080
function routerControl(deviceId,url)
	local data = httpGet('http://192.168.1.200:8080/makemoney/android/ad/router?action=control&sn='..getDeviceID()..'&url='..url)
	--local data = httpGet('http://192.168.1.8:8080/makemoney/android/ad/router?action=control&sn='..getDeviceID()..'&url='..url)
	local i,j = string.find(data,'ok')
	if i~=nil and j~=nil then
		notifyMessage('断网请求成功')
		mSleep(5000)
	else
		notifyMessage('断网请求失败')
		mSleep(5000)
	end	
end