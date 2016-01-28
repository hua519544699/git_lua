--图片路径
PIC_PATH = "/var/touchelf/scripts/cqb_images/"
--角色进入游戏
color_juesejinru = { 0x42D7FF, 1, -12, 0x31BAFF, 4, 19, 0x4AE7FF, 2, 41, 0x4AFBFF, 4, 53, 0x52FBFF, 28, 25, 0xBDFFFF, 32, 0, 0xC6FFFF, 29, -9, 0xB5FFFF, 26, -21, 0xADFFFF, 26, -4, 0xCEFFFF, 30, 54, 0xC6FFFF }
function main()
    while true do 
        jiemiankasi()
    end
end
function jiemiankasi()
    time1 = os.time()
    while true do
        time2 = os.time()
        --4分钟重启
        if time2 - time1 > 240 then
            notifyMessage("无社区卡死重启")
            mSleep(1500)
            os.execute("reboot")
        end
        -------------------------------------------------------------------------------------------11111111111111111111111111111111
        --登陆界面进入游戏
        x,y = findImageInRegionFuzzy(PIC_PATH.."denglujinru.bmp",90,  48,577 , 155,708 )
        if x~=-1 and y~=-1 then
            notifyMessage("有登陆界面无卡死")
            mSleep(1500)
            click(x,y)
            return
        end
        
        --角色进入   
        x,y = findMultiColorInRegionFuzzy(color_juesejinru,90,   2,888 , 113,1130)
        if x~=-1 and y~=-1 then
            notifyMessage("有角色进入界面无卡死")
            mSleep(1500)
            click(x,y)
            return
        end
        --社区图标
        x,y = findImageInRegionFuzzy(PIC_PATH.."shequ.bmp",90, 536,639 , 634,857 )
        if x~=-1 and y~=-1 then
            notifyMessage("有社区界面无卡死")
            mSleep(1500)
            return
        end
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
--多点找色
function findMuColor(table,per,x1,y1,x2,y2)
    x,y = findMultiColorInRegionFuzzy(table,per,x1,y1,x2,y2)
    click(x,y)
end
--寻找图片
function findPic(path,per,x1,y1,x2,y2)
    x,y = findImageInRegionFuzzy(PIC_PATH..path,per,x1,y1,x2,y2)
    click(x,y)
end