--图片路径
PIC_PATH = "/var/touchelf/scripts/cqb_images/"

function logD(con)
    time = os.time()
    tt = os.date("*t", time)
    logDebug(tt.month.."月"..tt.day.."日  :  "..con)
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
--主函数
function main()
    yewaiBOSS()
end
--野外boss双头蛇
function yewaiBOSS()
    mSleep(3000)
    findPic("yewaiBOSS.bmp",90, 405,931 , 474,1034)
    --取随机数，             3
    ran = math.random(0,12)
    notifyMessage("随机数为："..ran,1000)
        mSleep(1500)
    if 3<ran and ran<8 then
        --打双头火灵蛇王
        findPic("shewang.bmp",90, 354,674 , 433,768 )
        notifyMessage("打蛇王",1000)
        mSleep(1500)
        logD("打蛇王")
    elseif ran<=3 then
        --打狮王
        findPic("shiwang.bmp",90, 418,666 , 500,760 )
        notifyMessage("打狮王",1000)
        mSleep(1500)
        logD("打狮王")
    elseif ran>=8 then
        --打云王行
        findPic("yunwangxing.bmp",90, 295,672 , 369,755 )
        notifyMessage("打云王行",1000)
        mSleep(1500)
        logD("打云王行")
    end
    --前往
    findPic("Bossqianwang.bmp",90,  20,573 ,  98,715 )
    --关闭界面
    findPic("guanbiBOSS.bmp",90, 573,1066, 640,1133)
    
end

