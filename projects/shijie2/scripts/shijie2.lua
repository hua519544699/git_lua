function main()
    
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
--找图忽略色
function findPicLostColor(path,per,x1,y1,x2,y2,color)
    x,y = findImageInRegionFuzzy(PIC_PATH..path,per,x1,y1,x2,y2,color)
    if x~=-1 and y~=-1 then
        click(x,y)
    end
end
--忽略色找图返回boolean
function findPicLostColor_boolean(path,per,x1,y1,x2,y2,color)
    x,y = findImageInRegionFuzzy(PIC_PATH..path,per,x1,y1,x2,y2,color)
    if x~=-1 and y~=-1 then
        return true
    else
        return false
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
--寻找图片  并点击
function findPic(path,per,x1,y1,x2,y2)
    x,y = findImageInRegionFuzzy(PIC_PATH..path,per,x1,y1,x2,y2)
    click(x,y)
end
--多点找色  并点击
function findMuColor(table,per,x1,y1,x2,y2)
    x,y = findMultiColorInRegionFuzzy(table,per,x1,y1,x2,y2)
    click(x,y)
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