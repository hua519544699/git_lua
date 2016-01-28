--图片路径
PIC_PATH = "/var/touchelf/scripts/cqb_images/"
--天蛇府弟子
color_tianshefudizi = { 0x39AACE, -2, 23, 0x39AED6, -1, 37, 0x42AAC6, -4, 41, 0x319EBD, -5, 62, 0x39AECE }
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
function main()
    while true do
    --判断是否回天蛇府
        isTsf()
    end

end
function isTsf()
    notifyMessage("判断是否在天蛇府",1500)
    mSleep(2000)
    --点开地图
    click( 580,1074)
    --点击世界地图
    --click(  50,895 )
    findPic("sjditu.bmp",90,   4,808 ,  99,981 )
    x,y = findImageInRegionFuzzy(PIC_PATH.."tianshefu.bmp",90, 215,386 , 258,425 )
    if x==-1 and y ==-1 then
        notifyMessage("不在天蛇府")
        mSleep(2000)
        --点黑狱平原
        findPic("heiyupingyuan.bmp",90, 143,384 , 265,525 )
        --点天蛇府弟子
        findMuColor(color_tianshefudizi,90,  36,794 , 583,1005)
        --选择床送过去
        findPic("chuansongtsf.bmp",90, 264,444 , 322,557 )
        mSleep(15000)
    else
        notifyMessage("在天蛇府")
        mSleep(2000)
        --关闭地图
        findPic("guanbisjditu.bmp",90, 571,1063, 638,1132)
    end
    
end


