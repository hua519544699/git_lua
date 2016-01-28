--图片路径
PIC_PATH = "/var/touchelf/scripts/cqb_images/"
--地图药品商人
color_ditushangren = { 0xEFF3EF, -13, -31, 0xF7F3EF, -3, -31, 0xEFEFEF, 1, -26, 0xCECFCE, -12, -21, 0xEFEFF7, -13, -14, 0xE7EFEF, -8, -13, 0xE7E7E7, -1, -10, 0xEFEFEF, -9, -5, 0xF7F3EF, -8, 3, 0x8C969C }
--天蛇府弟子
color_tianshefu = { 0x42AECE, 3, -41, 0x3182A5, 2, -29, 0x185563, 2, -4, 0x42AECE, -6, 8, 0x29758C, 8, 35, 0x21657B, 1, 41, 0x215D73, -6, 36, 0x318EAD }
--挂机
color_guaji = { 0x42AECE, 3, -41, 0x3182A5, 2, -29, 0x185563, 2, -4, 0x42AECE, -6, 8, 0x29758C, 8, 35, 0x21657B, 1, 41, 0x215D73, -6, 36, 0x318EAD, 29, 203, 0x5ABEC6, -1, 191, 0x6B828C, 5, 192, 0xADF3FF, 10, 192, 0xADEFF7, 10, 199, 0x94D3DE, 6, 199, 0x63929C, 3, 198, 0x94CBD6, 3, 196, 0x7BAAB5, 0, 202, 0xA5DBDE, 11, 206, 0x639AAD, 0, 206, 0x84969C, 5, 208, 0x527584, 0, 215, 0x9CDBE7, 2, 217, 0xA5DFE7, 8, 214, 0x8CC3CE }

--点击事件
function click(x,y)
    if x~=-1 and y~=-1 then
        touchDown(0,x,y)
        mSleep(math.random(100,200))
        touchUp(0)
        mSleep(3000)
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
function tuizhan()
    mSleep(2000)
        --左
        touchDown(0,  99,79  )
        mSleep(10000)
        touchUp(0)
        --等待5秒
        mSleep(5000)
        
        --右
        touchDown(0, 101,142 )
        mSleep(10000)
        touchUp(0)
        --等待5秒
        mSleep(5000)
        
        --上
        touchDown(0, 130,109 )
        mSleep(10000)
        touchUp(0)
        --等待5秒
        mSleep(5000)
        
        --下
        touchDown(0,  66,112 )
        mSleep(10000)
        touchUp(0)
        --等待5秒
        mSleep(5000)
end

--买药
function maiyao()
    notifyMessage("开始买药",2000)
    mSleep(3000)
    --退出战斗
    tuizhan()
    --点开地图
    click( 585,1065)
    --点回城
    --click(  46,1052)
    findPic("huicheng.bmp",90,   3,956 , 100,1133)
    --确定回城
    --click( 229,475 )
    findPic("quedinghuicheng.bmp",90, 193,413 , 262,534 )
    --10秒
    mSleep(10000)

    --点开地图
    click( 585,1065)
    --点击药NPC寻路
    findMuColor(color_ditushangren,90, 243,427 , 430,722 )
    mSleep(3000)
    --关闭地图
    --click( 614,1110)
    findPic("guanbiditu.bmp",90, 571,1063, 638,1132)
    
    --点击药店商人
    click( 205,541 )
    --点按钮买药
    --click( 321,148 )
    findPic("yaopinganniu.bmp",90, 271,8   , 376,327 )

    --买红
    --click( 435,200 )
    findPic("hong.bmp",90, 242,133 , 592,361 )
    --点输入数量
    click( 373,392 )
    inputText(999)
    click( 467,1060)
    --多次买
    for i = 1,8 do
        --买
        --click( 290,421 )
        findPic("goumaih.bmp",90, 140,337 , 549,524 )
        --购买确定
        --click( 229,478 )
        findPic("maiquedingh.bmp",90, 187,404 , 266,544 )
    end
    
    --买蓝
    --click( 532,200 )
    findPic("lan.bmp",90, 461,130 , 585,254 )
    --点输入数量
    click( 468,391 )
    inputText(999)
    click( 467,1060)
    --多次买
    for i = 1,8 do
        --买
        --click( 381,423 )
        findPic("goumail.bmp",90, 351,359 , 420,481 )
        --购买确定
        --click( 228,477 )
        findPic("maiquedingl.bmp",90, 193,413 , 267,543 )
    end

    --关闭药店
    findPic("guanbiyaodian.bmp",90, 568,1058, 639,1134)

    
    --点开地图
    click( 580,1074)
    --点击世界地图
    --click(  50,895 )
    findPic("sjditu.bmp",90,   4,808 ,  99,981 )
    --点黑狱平原
    findPic("heiyupingyuan.bmp",90, 143,384 , 265,525 )
    --点天蛇府弟子
    findMuColor(color_tianshefu,90,  36,794 , 583,1005)
    --选择传送
    findPic("tsfchuansong.bmp",90, 255,435 , 331,568 )
    mSleep(10000)
end

--主函数
function main()
    while true do
        --买药
        maiyao()
        --挂机
        findMuColor(color_guaji,90, 304,1039, 404,1132)
        
        
    
    end
    
end







