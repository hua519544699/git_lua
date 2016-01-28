--图片路径
PIC_PATH = "/var/touchelf/scripts/clash_Images/"
function main()
    mSleep(3000)
    move_rec(300,500,200,300,20)
 
end
--1移到右边                              2移到下边                     
--clickMove(300,500,300-base,500,1)   clickMove(300,500,300,500-base,1)
--3移到左边                             0移到上边
--clickMove(300,500,300+base,500,1)    clickMove(300,500,300,500+base,1)
--移动   300,500
function move_rec(x0,y0,bianc,dzbc,quan)
    --1移到右边     2移到下边       3移到左边       0移到上边   
    local fangxiang = 1
    for j = 1,quan do
        while true do
            --每次移动100像素  移动次数
            local cishu = bianc/100
            --移到右边
            if fangxiang%4 == 1 then
                for i = 1,cishu do
                    clickMove(x0,y0,x0-100,y0,2)
                    if findPicLostColor_boolean("1jiguai.bmp",90, 115,327 , 560,727 ,0xFF00FF) then
                        click(x+60,y-50)
                        mSleep(1000)
                        if findPic_boolean("gongji_zg.bmp",90, 282,784 , 355,842 ) then
                            click(x,y)
                            return
                        end
                    end
                end
                bianc = bianc + dzbc
                fangxiang = fangxiang +1
                --移到下边
            elseif fangxiang%4 == 2 then
                for i = 1,cishu do
                    clickMove(x0,y0,x0,y0-100,2)
                    if findPicLostColor_boolean("1jiguai.bmp",90, 115,327 , 560,727 ,0xFF00FF) then
                        click(x+60,y-50)
                        mSleep(1000)
                        if findPic_boolean("gongji_zg.bmp",90, 282,784 , 355,842 ) then
                            click(x,y)
                            return
                        end
                    end
                end
                fangxiang = fangxiang +1
                --移到左边
            elseif fangxiang%4 == 3 then
                for i = 1,cishu do
                    clickMove(x0,y0,x0+100,y0,2)
                    if findPicLostColor_boolean("1jiguai.bmp",90, 115,327 , 560,727 ,0xFF00FF) then
                        click(x+60,y-50)
                        mSleep(1000)
                        if findPic_boolean("gongji_zg.bmp",90, 282,784 , 355,842 ) then
                            click(x,y)
                            return
                        end
                    end
                end
                bianc = bianc + dzbc
                fangxiang = fangxiang +1
                --移到上边
            elseif fangxiang%4 == 0 then
                for i = 1,cishu do
                    clickMove(x0,y0,x0,y0+100,2)
                    if findPicLostColor_boolean("1jiguai.bmp",90, 115,327 , 560,727 ,0xFF00FF) then
                        click(x+60,y-50)
                        mSleep(1000)
                        if findPic_boolean("gongji_zg.bmp",90, 282,784 , 355,842 ) then
                            click(x,y)
                            return
                        end
                    end
                end
                fangxiang = fangxiang +1
            end
            --
            if fangxiang%4 == 0 then
                break
            end
        end
    end
end
function clickMove(x1,y1,x2,y2,n)
    local w = math.abs(x2-x1);
    local h = math.abs(y2-y1);
    touchDown(0,x1,y1);
    mSleep(50);
    if x1 < x2 then
        w1 = n; 
    else
        w1 = -n;
    end
    if y1 < y2 then
        h1 = n; 
    else
        h1 = -n;
    end
    if w >= h then
        for i = 1 , w,n do 
            x1 = x1 + w1;
            if y1 == y2 then
            else
                y1 = y1 + math.ceil(h*h1/w);
            end
            touchMove(0,x1,y1);
            mSleep(10);
        end
    else
        for i = 1 ,h,n do 
            y1 = y1 + h1;
            if x1 ==x2 then
            else
                x1 = x1 + math.ceil(w*w1/h);
            end
            touchMove(0,x1,y1);
            mSleep(5);
        end
    end
    mSleep(5);
    touchUp(0);
end
--function movebyround(zx,zy,ldian,banj,dzbj,quanshu)
--    local x0,y0,rr,l,n,r,x,y,shouc,yans
--    shouc=1
--    --设置圆心坐标
--    x0,y0=zx,zy
--    --r=半径
--    r=banj
--    --rr=递增半径
--    rr=dzbj
--    --l=两点间的距离
--    l=ldian
--    --初始化角度
--    n=0
--    --设置第一圈半径
--    --r=30
--    --设置画圆圈数
--    --延时
--    yans=5
--    touchDown(0, x0,y0)

--    for i=1,quanshu do
--        while n<3.1415926*2 do
--            x=x0+r*math.cos(n)
--            y=y0+r*math.sin(n)
--            if shouc==1 then
--                touchDown(0, x0,y0)
--                shouc=2	
--            end 
--            touchMove(0, x, y)
--            mSleep(yans);
--            n=n+l/r
--        end 
--        n=0
--        r=r+rr
--    end
--    touchUp(0)
--    return -1,-1
--end
--function main()
--    mSleep(3000)

--    local a,b = movebyround( 321,470 ,200,300,400,1)
--    if a>-1 and b >-1 then
--        notifyMessage("找到",300)
--        mSleep(1000)
--        click(a,b)
--        if findPic_boolean("gongji.bmp",90, 282,785 , 354,839 ) then
--            click(x,y)
--        end
--        if findPic_boolean("chuzheng_zg.bmp",90, 431,1038, 506,1086) then
--            click(x,y)
--        end
--    else
--        notifyMessage("未找到找到",300)
--        mSleep(1000)
--    end
----    while true do
----        zhaoguai()
----    end
--end
--function zhaoguai()
--    --local time1 = os.time()
--    --while true do
--        if findPic_boolean("1jiguai.bmp",90,   1,251 , 635,785 ) or
--        findPicLostColor_boolean("1jiguai_lc.bmp",90,1,251 , 635,785,0xFF00FF)then
--            click(x+50,y-60)
--        end
--        if findPic_boolean("gongji.bmp",90, 282,785 , 354,839 ) then
--            click(x,y)
--        end
--        if findPic_boolean("chuzheng_zg.bmp",90, 431,1038, 506,1086) then
--            click(x,y)
--        end
--        --local time2 = os.time()
--        --if time2 - time1 >2 then
--            --break
--        --end
--    --end
--end
--找图返回boolean值
function findPic_boolean(path,per,x1,y1,x2,y2)
    x,y = findImageInRegionFuzzy(PIC_PATH..path,per,x1,y1,x2,y2)
    if x~=-1 and y~=-1 then
        return true
    else
        return false
    end
end
--bool = true
--点击事件短时间
function click(x,y)
    if x~=-1 and y~=-1 then
        if bool then
            notifyMessage(x.."-"..y,500)
            mSleep(1000)
        end
        touchDown(0, x + math.random(-3, 3), y + math.random(-3, 3))
        mSleep(math.random(15,40))
        touchUp(0)
        mSleep(math.random(700,900))
    end
end
--找图忽略色返回boolean
function findPicLostColor_boolean(path,per,x1,y1,x2,y2)
    x,y = findImageInRegionFuzzy(PIC_PATH..path,per,x1,y1,x2,y2,0xFF00FF)
    if x~=-1 and y~=-1 then
        return true
    else
        return false
    end
end