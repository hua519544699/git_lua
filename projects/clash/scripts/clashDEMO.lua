--图片路径
PIC_PATH = "/var/touchelf/scripts/clash_Images/"
function main()
    --while true do
    mSleep(5000)
    shoujiziyuan()
    --end
end
--收集资源
function shoujiziyuan()
    notifyMessage("收集资源",300)
    logD("收集资源")
    mSleep(1000)
    --向上移动
                            myMove_RL(  111,220 ,529,785 ,20)
end
--找图忽略色返回boolean
function findPicLostColor_boolean(path,per,x1,y1,x2,y2)
    x,y = findImageInRegionFuzzy(PIC_PATH..path,per,x1,y1,x2,y2,0xFF00FF)
    if x~=-1 and y~=-1 then
        if bool then
            notifyMessage("1",300)
            mSleep(1000)
        end
        return true
    else
        return false
    end
end
--多点找色返回boolean值
function findMuColor_boolean(table,per,x1,y1,x2,y2)
    x,y = findMultiColorInRegionFuzzy(table,per,x1,y1,x2,y2)
    if x~=-1 and y~=-1 then
        if bool then
            notifyMessage("1",300)
            mSleep(1000)
        end
        return true
    else
        return false
    end
end
--找单色返回boolean值
function findOneColor_boolean(one,per,x1,y1,x2,y2)
    x,y = findColorInRegionFuzzy(one,per,x1,y1,x2,y2)
    if x~=-1 and y ~=-1 then
        if bool then
            notifyMessage("1",300)
            mSleep(1000)
        end
        return true
    else
        return false
    end
end
--找图返回boolean值
function findPic_boolean(path,per,x1,y1,x2,y2)
    x,y = findImageInRegionFuzzy(PIC_PATH..path,per,x1,y1,x2,y2)
    if x~=-1 and y~=-1 then
        if bool then
            notifyMessage("1",300)
            mSleep(1000)
        end
        return true
    else
        return false
    end
end
--找图忽略色返回boolean
function findPicLostColor(path,per,x1,y1,x2,y2)
    x,y = findImageInRegionFuzzy(PIC_PATH..path,per,x1,y1,x2,y2,0xFF00FF)
    click(x,y)
end
--多点找色返回boolean值
function findMuColor(table,per,x1,y1,x2,y2)
    x,y = findMultiColorInRegionFuzzy(table,per,x1,y1,x2,y2)
    click(x,y)
end
--找单色返回boolean值
function findOneColor(one,per,x1,y1,x2,y2)
    x,y = findColorInRegionFuzzy(one,per,x1,y1,x2,y2)
    click(x,y)
end
--找图返回boolean值
function findPic(path,per,x1,y1,x2,y2)
    x,y = findImageInRegionFuzzy(PIC_PATH..path,per,x1,y1,x2,y2)
    click(x,y)
end
--点击事件短时间
function click(x,y)
    if x~=-1 and y~=-1 then
--        if bool then
--            notifyMessage(x.."-"..y,300)
--            mSleep(1000)
--        end
        touchDown(0, x + math.random(-3, 3), y + math.random(-3, 3))
        mSleep(math.random(15,40))
        touchUp(0)
        mSleep(math.random(600,900))
    end
end
--上下滑动函数
function myMove_RL(x1, y1, x2, y2,speed)
    local step = speed
    if y2 > y1 then step = -speed end 
    local cnt = math.abs((y2 - y1) /speed)
    if cnt == 0 then
        cnt = 1
        step = math.abs(y2 - y1)
    end
    touchDown(0, x1, y1)
    mSleep(50)
    for i = 1, cnt do
        mSleep(50)
        y1 = y1 - step
        touchMove(0, x1, y1)
    end
    touchUp(0)
    mSleep(1000)
end	
--左右滑动函数
--同myMove_UD
function myMove_UD(x1, y1, x2, y2,speed)
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
    mSleep(1000)
end
--打印log日志
function logD(con)
    local time = os.time()
    local tt = os.date("*t", time)
    logDebug(tt.month.."月"..tt.day.."日  :  "..con.."10")
    mSleep(200)
end
--获取焦点
function focus()
    --电池
    x,y = findImageInRegionFuzzy(PIC_PATH.."dianchi.bmp",90, 540,2   , 636,39  )
    if x~=-1 and y~=-1 then
        logD("电池启动游戏")
        appRun("com.idreamsky.cqb.pp")
    end
end