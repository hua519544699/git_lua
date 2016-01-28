--图片路径
PIC_PATH = "/var/touchelf/scripts/cqb_images/"
--角色进入游戏
color_juesejinru = { 0x52F3FF, -19, -72, 0x84F3FF, 10, -75, 0x94F3FF, 22, -73, 0xB5FFFF, 19, -49, 0xC6FFFF, -6, -49, 0x4AEBFF, 14, -24, 0xADFFFF, 0, -33, 0x42DFFF, 1, -16, 0x4AF7FF, -4, 1, 0x4AF3FF, 22, 28, 0xB5FFFF, 21, 48, 0x94F7FF, 0, 46, 0x42E7FF, -5, 66, 0x42EFFF, 25, 62, 0xBDFFFF, 10, 15, 0x39C3FF }
--忽略色找图返回boolean
function findPicLostColor_boolean(path,per,x1,y1,x2,y2,color)
    x,y = findImageInRegionFuzzy(PIC_PATH..path,per,x1,y1,x2,y2,color)
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
function main()
    while true do
        
        mSleep(5000)
        zhaojuese()
    end  
end
--找角色
function zhaojuese()
    mSleep(2000)
    x,y = findMultiColorInRegionFuzzy(color_juesejinru,90,2,888,113,1130)
    if x ~= -1 and y ~= -1 then
        notifyMessage("开始判断角色")
        mSleep(2000)
        if findPicLostColor_boolean("60duo.bmp",85, 410,94  , 482,421 ,0xFF00FF) then
            notifyMessage("点击角色1")
            mSleep(2000)
            click( 443,65  )
            --角色进入
            findMuColor(color_juesejinru,90,   2,888 , 113,1130)
        end
        if findPicLostColor_boolean("60duo.bmp",85, 309,76  , 380,421 ,0xFF00FF) then
            notifyMessage("点击角色2")
            mSleep(2000)
            click( 347,65  )
            --角色进入
            findMuColor(color_juesejinru,90,   2,888 , 113,1130)
        end
        if findPicLostColor_boolean("60duo.bmp",85, 218,93  , 292,421 ,0xFF00FF) then
            notifyMessage("点击角色3")
            mSleep(2000)
            click( 245,65  )
            --角色进入
            findMuColor(color_juesejinru,90,   2,888 , 113,1130)
        end
        if findPicLostColor_boolean("60duo.bmp",85, 128,103 , 190,421 ,0xFF00FF) then
            notifyMessage("点击角色4")
            mSleep(2000)
            click( 150,65)
            --角色进入
            findMuColor(color_juesejinru,90,   2,888 , 113,1130)
        end
    end
end
--多点找色
function findMuColor(table,per,x1,y1,x2,y2)
    x,y = findMultiColorInRegionFuzzy(table,per,x1,y1,x2,y2)
    click(x,y)
end
