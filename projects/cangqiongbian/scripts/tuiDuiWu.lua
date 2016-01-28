--图片路径
PIC_PATH = "/var/touchelf/scripts/cqb_images/"
--退出队伍
color_tuichuduiwu = { 0x84DFF7, 10, 6, 0x84DFF7, -5, -9, 0x8CDFEF, -13, -12, 0x7BC7DE, -8, 13, 0x84DFF7, 0, 14, 0x84E7FF, 8, 14, 0x84E7F7, 5, 2, 0x84E3EF, 1, 0, 0x84DFEF, -5, -5, 0x8CDFEF, -5, -10, 0x8CDFE7, -10, 1, 0x8CEBF7, 13, 0, 0x84CFE7 }
function main()
    while true do
        tuiDui()
    end
end

--退出队伍
function tuiDui()
    notifyMessage("退出队伍")
    mSleep(2000)
    --退出队伍
    findMuColor(color_tuichuduiwu,85, 290,19  , 332,58  )
    --点击队伍图标
    findPic("duiwu.bmp",90, 401,14  , 442,65  )
    --退出队伍
    findMuColor(color_tuichuduiwu,85, 290,19  , 332,58  )
    --关闭队伍界面
    findPic("guanbiduiwu.bmp",90, 578,1067, 638,1134)
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