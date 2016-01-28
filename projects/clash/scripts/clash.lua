--图片路径
PIC_PATH = "/var/touchelf/scripts/clash_Images/"
PACKAGE_NAME = "com.elex-tech.ClashOfKings"
--      false    true
bool = false
clickbool = false

function main()
    mSleep(5000)
    --fazhanshunxu()
--    while true do
--        jianzaotiandi()
--    end
    shengjiziyuan()
--    yindao()
--    shezhi()
--    --bindBlog()
--    clearBag()
--    renwulingjiang()
--    lingquyoujian()
--    kaiqichuizi()
    shouhuoziyuan()
    local timezy = os.time()
    local timefz = os.time()
    local timecj = os.time()
    local timejx = os.time()
    local timesh = os.time()
    local time = os.time()
    while true do

        --采集资源
        time = os.time()
        if time - timecj > 60 then
            --0 - 8 点
            if time%86400 < 28800 then
                --采木头
                caijimutou()
                --8 -   16 点
            elseif time%86400 > 28800 and time%86400 < 57600 then
                --采粮食
                caijiliangshi()
                --16 -   24 点
            elseif time%86400 > 57600 and time%86400 < 86400 then
                --采矿

            end
            timecj = os.time()
        end
--        --间隔15分钟发展
--        time = os.time()
--        if time - timefz > 350 then
        fazhanshunxu()
--            timefz = os.time()
--        end
        --每小时收集次资源
        time = os.time()
        if time - timezy > 3600 then
            shouhuoziyuan()
            kaiqichuizi()
            kaifangquyu()
            clearBag()
            lingzhujineng()
            lingquyoujian()
            lingquchengjiu()
            shijianjiangli()
            timezy = os.time()
        end
        --每隔4小时判断联盟捐献
        time = os.time()
        if time - timejx > 14400 then
            lianmengjuanxian()
            timejx = os.time()
        end
        --每隔23.1小时购买守护
        time = os.time()
        if time - timesh > 83160 then
            rongyugoumai()
            timesh = os.time()
        end
    end
    while true do
        notifyMessage("完成",300)
        logD("完成")
        mSleep(1500)
    end



--    while true do
--        --清理背包
--        clearBag()
--        lingzhujineng()
--        lingquchengjiu()
--        kaifangquyu()
--        kaiqichuizi()
--        renwulingjiang()
--        lingquyoujian()
    --    --收获资源 1小时
    --    local time = os.time()
    --    if time - ziyuantime > 3600 then
    --        ziyuantime = os.time()
    --        shouhuoziyuan()
    --    end
--    end
end

--[[
--左移动
myMove_UD(  111,220 ,529,400 ,5)
--右移动  4次到最右边
myMove_UD( 529,400 , 111,220 ,5)
--向上移动
myMove_RL(  111,220 ,529,400 ,10)
--下移动
myMove_RL( 529,785 , 111,220 ,100)
--]]

--发展顺序
function fazhanshunxu()
    --发展顺序
    fazhantemp = 0
    jiasutemp = 0
    bingying()
    if fazhantemp > 0 then
        return
    end
    if jiasutemp == 0 then
        chengbao()
    end
    if fazhantemp > 0 then
        return
    end
    junshixueyuan()
    if fazhantemp > 0 then
        return
    end
    ziyuanxueyuan()
    if fazhantemp > 0 then
        return
    end
    if jiasutemp == 0 then
        jianzaotiandi()
    end
    if fazhantemp > 0 then
        return
    end
    if jiasutemp == 0 then
        shengjiziyuan()
    end
    if fazhantemp > 0 then
        return
    end
    if jiasutemp == 0 then
        jiaochang()
    end
    if fazhantemp > 0 then
        return
    end
    if jiasutemp == 0 then
        liaowangta()
    end


end
--采集粮食    caijiziyuan(300,500,200,300,20)
function caijiliangshi()
    notifyMessage("采集粮食",300)
    logD("采集粮食")
    mSleep(1000)
    local chaoshi = os.time()
    --暗色回退
    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
    --界面回退
    for i = 1,3 do
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
    end
    exception()
    while true do
        exception()
        local time = os.time()
        if time - chaoshi > 600 then
            notifyMessage("采集粮食超时",300)
            logD("采集粮食超时")
            mSleep(1000)
            chaoshi = os.time()
            return
        end
        if findPic_boolean("zhanling_cj.bmp",75,   1,285 , 635,874 ) then
            click(x,y)
        elseif findPicLostColor_boolean("liangshi_cj.bmp",75, 115,327 , 560,727 ,0xFF00FF) then
            click(x+10,y+10)
            mSleep(1000)
        end
        --采集说明
        if findPic_boolean("caijishuoming.bmp",90, 289,147 , 420,197 ) then
            click( 601,175 ) 
        end
        --点击地图进入打野界面
        if findPic_boolean("iconditu.bmp",90,  27,1062, 108,1128) then
            click(x,y)
            --出征
        elseif findPic_boolean("chuzhengjiemian.bmp",90, 283,12  , 357,60  ) then
            --点击出征按钮
            if findPic_boolean("chuzhenganniu.bmp",90, 420,1033, 511,1083) then
                click(x,y)
                mSleep(1000)
            end
        elseif findPic_boolean("zhanling_cj.bmp",75,   1,285 , 635,874 ) then
            click(x,y)
        elseif findPicLostColor_boolean("liangshi_cj.bmp",75, 115,327 , 560,727 ,0xFF00FF) then
            click(x+5,y+5)
            mSleep(1000)
        elseif findPic_boolean("fanhui_cj.bmp",90, 169,132 , 241,230 ) or
        findPic_boolean("fanhui1_cj.bmp",90, 169,132 , 241,230 )then
            notifyMessage("采集正在返回中",300)
            logD("采集正在返回中")
            mSleep(1000)
            findPic("iconchengbao_cj.bmp",90,  43,1068,  96,1125)
            return


        elseif findPic_boolean("jiasu_cj.bmp",90, 169,132  , 241,230 ) then
            notifyMessage("采集正在加速中",300)
            logD("采集正在加速中")
            mSleep(1000)
            findPic("iconchengbao_cj.bmp",90,  43,1068,  96,1125)
            return
        elseif findPic_boolean("iconchengbao_cj.bmp",90,  43,1068,  96,1125) then
            --采集粮食
            caiji(300,500,200,300,20,"liangshi_cj.bmp","zhanling_cj.bmp")
        end
        --caiji(300,500,200,300,20,"mucai_cj.bmp","zhanling_cj.bmp")
        --caiji(300,500,200,300,20,"tiekuang_cj.bmp","zhanling_cj.bmp")
    end
end
--采集木头
function caijimutou()
    notifyMessage("采集木头",300)
    logD("采集木头")
    mSleep(1000)
    local chaoshi = os.time()
    --暗色回退
    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
    --界面回退
    for i = 1,3 do
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
    end
    exception()
    while true do
        exception()
        local time = os.time()
        if time - chaoshi > 600 then
            notifyMessage("采集粮食超时",300)
            logD("采集粮食超时")
            mSleep(1000)
            chaoshi = os.time()
            return
        end
        if findPic_boolean("zhanling_cj.bmp",75,   1,285 , 635,874 ) then
            click(x,y)
        elseif findPicLostColor_boolean("mutou_cj.bmp",75, 115,327 , 560,727 ,0xFF00FF) then
            click(x+10,y+10)
            mSleep(1000)
        end
        --采集说明
        if findPic_boolean("caijishuoming.bmp",90, 289,147 , 420,197 ) then
            click( 601,175 ) 
        end
        --点击地图进入打野界面
        if findPic_boolean("iconditu.bmp",90,  27,1062, 108,1128) then
            click(x,y)
            --出征
        elseif findPic_boolean("chuzhengjiemian.bmp",90, 283,12  , 357,60  ) then
            --点击出征按钮
            if findPic_boolean("chuzhenganniu.bmp",90, 420,1033, 511,1083) then
                click(x,y)
                mSleep(1000)
            end
        elseif findPic_boolean("fanhui_cj.bmp",90, 169,132 , 232,174 )  or
        findPic_boolean("fanhui1_cj.bmp",90, 169,132 , 241,230 )then
            notifyMessage("采集正在返回中",300)
            logD("采集正在返回中")
            mSleep(1000)
            findPic("iconchengbao_cj.bmp",90,  43,1068,  96,1125)
            return
        elseif findPic_boolean("jiasu_cj.bmp",90, 169,132 , 233,173 ) then
            notifyMessage("采集正在加速中",300)
            logD("采集正在加速中")
            mSleep(1000)
            findPic("iconchengbao_cj.bmp",90,  43,1068,  96,1125)
            return
        elseif findPic_boolean("zhanling_cj.bmp",75,   1,285 , 635,874 ) then
            click(x,y)
        elseif findPicLostColor_boolean("liangshi_cj.bmp",75, 115,327 , 560,727 ,0xFF00FF) then
            click(x+5,y+5)
            mSleep(1000)

        elseif findPic_boolean("iconchengbao_cj.bmp",90,  43,1068,  96,1125) then
            --采集粮食
            caiji(300,500,200,300,20,"mutou_cj.bmp","zhanling_cj.bmp")
        end
        --caiji(300,500,200,300,20,"mucai_cj.bmp","zhanling_cj.bmp")
        --caiji(300,500,200,300,20,"tiekuang_cj.bmp","zhanling_cj.bmp")
    end
end
--x0,y0中心点,bianc初始边长,dzbc递增边长,quan圈数,ld两点距离,每次滑动的距离
function caiji(x0,y0,bianc,dzbc,quan,bitmap1,bitmap2)
    --1移到右边     2移到下边       3移到左边       0移到上边   
    local fangxiang = 1
    local chaoshi = os.time()
    for j = 1,quan do
        while true do
            --每次移动100像素  移动次数
            local cishu = bianc/100
            --移到右边
            if fangxiang%4 == 1 then
                for i = 1,cishu do
                    clickMove(x0,y0,x0-70,y0,2)
                    exception()

                    if findPicLostColor_boolean(bitmap1,75, 115,327 , 560,727 ,0xFF00FF) then
                        click(x+5,y+5)
                        mSleep(1000)
                        if findPic_boolean("shuoming_cj.bmp",75,   1,285 , 635,874 ) then
                            if findPic_boolean(bitmap2,75,   1,285 , 635,874 ) then
                                click(x,y)
                                return
                            end
                        end
                    end
                end
                bianc = bianc + dzbc
                fangxiang = fangxiang +1
                --移到下边
            elseif fangxiang%4 == 2 then
                for i = 1,cishu do
                    clickMove(x0,y0,x0,y0-70,1)
                    exception()
                    if findPicLostColor_boolean(bitmap1,90, 115,327 , 560,727 ,0xFF00FF) then
                        click(x+5,y+5)
                        mSleep(1000)
                        if findPic_boolean("shuoming_cj.bmp",75,   1,285 , 635,874 ) then
                            if findPic_boolean(bitmap2,75,   1,285 , 635,874 ) then
                                click(x,y)
                                return
                            end
                        end
                    end
                end
                fangxiang = fangxiang +1
                --移到左边
            elseif fangxiang%4 == 3 then
                for i = 1,cishu do
                    clickMove(x0,y0,x0+70,y0,2)
                    exception()
                    if findPicLostColor_boolean(bitmap1,90, 115,327 , 560,727 ,0xFF00FF) then
                        click(x+5,y+5)
                        mSleep(1000)
                        if findPic_boolean("shuoming_cj.bmp",75,   1,285 , 635,874 ) then
                            if findPic_boolean(bitmap2,75,   1,285 , 635,874 ) then
                                click(x,y)
                                return
                            end
                        end
                    end
                end
                bianc = bianc + dzbc
                fangxiang = fangxiang +1
                --移到上边
            elseif fangxiang%4 == 0 then
                for i = 1,cishu do
                    clickMove(x0,y0,x0,y0+70,1)
                    exception()
                    if findPicLostColor_boolean(bitmap1,90, 115,327 , 560,727 ,0xFF00FF) then
                        click(x+5,y+5)
                        mSleep(1000)
                        if findPic_boolean("shuoming_cj.bmp",75,   1,285 , 635,874 ) then
                            if findPic_boolean(bitmap2,75,   1,285 , 635,874 ) then
                                click(x,y)
                                return
                            end
                        end
                    end
                end
                fangxiang = fangxiang +1
            end
            if findPic_boolean("fanhui_cj.bmp",90, 169,132 , 232,174 )  or
            findPic_boolean("fanhui1_cj.bmp",90, 169,132 , 241,230 ) or
            findPic_boolean("jiasu_cj.bmp",90, 169,132 , 233,173 ) then
                notifyMessage("找资源返回加速退出",300)
                logD("找资源返回加速退出")
                mSleep(1000)
                findPic("iconchengbao_cj.bmp",90,  43,1068,  96,1125)
                findPic("iconchengbao_cj.bmp",90,  43,1068,  96,1125)
                return
            end
            local time = os.time()
            if time - chaoshi > 360 then
                notifyMessage("找资源超市",300)
                logD("找资源超市")
                mSleep(1000)
                findPic("iconchengbao_cj.bmp",90,  43,1068,  96,1125)
                findPic("iconchengbao_cj.bmp",90,  43,1068,  96,1125)
                return
            end
            --转完一圈
            if fangxiang%4 == 0 then
                break
            end
        end
    end
end
--升级校场
function jiaochang()
    notifyMessage("升级校场",300)
    logD("升级校场")
    mSleep(1000)
    --暗色回退
    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
    --界面回退
    for i = 1,3 do
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
    end
    exception()
    local chaoshi = os.time()
    while true do
        local time = os.time()
        if time - chaoshi > 30 then
            notifyMessage("升级校场1分发展超时",300)
            logD("升级校场1分发展超时")
            mSleep(1000)
            findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
            findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
            chaoshi = os.time()
            return
        end
        exception()
        if findPic_boolean("youshangditu.bmp",90, 536,413 , 615,473 ) then
            notifyMessage("找到右上角地块",300)
            logD("找到右上角地块")
            mSleep(1000)
            for i = 1,2 do
                --左移动
                myMove_UD( 250,300 , 560,516 ,5)
            end
            mSleep(1000)
            findPic("nvtouxiang_xy.bmp",90, 199,444 , 300,561 )
            findPic("duihuanvwang.bmp",90, 175,443 , 217,486 )
            findPic("duihuanvwang.bmp",90, 175,443 , 217,486 )
            while true do
                local time1 = os.time()
                if time1 - chaoshi > 30 then
                    notifyMessage("升级校场发展超时",300)
                    logD("升级校场发展超时")
                    mSleep(1000)
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    chaoshi = os.time()
                    return
                end
                exception()
                if findPic_boolean("jiasu_td.bmp",90, 455,574 , 547,702 ) then
                    --界面后退
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    notifyMessage("加速中退出",300)
                    logD("加速中退出")
                    mSleep(1000)
                    jiasutemp = jiasutemp +1
                    return
                    --跳转红色
                elseif findPic_boolean("tiaozhuan_fz.bmp",90, 422,553 , 571,712 ) then
                    --界面后退
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    notifyMessage("跳转中退出",300)
                    logD("跳转中退出")
                    mSleep(1000)
                    return
                    --点击校场
                elseif findPic_boolean("jiaochang.bmp",90, 103,740 , 258,836 ) then
                    click(x,y)
                    --升级校场
                elseif findPic_boolean("Iconshengji_jc.bmp",90, 176,846 , 283,946 ) then
                    click(x,y)
                    --点击升级按钮
                elseif findPic_boolean("shengji_jc.bmp",90, 412,909 , 478,958 ) then
                    click(x,y)
                    --点击协助图标
                    findPic("Iconxiezhu_jc.bmp",90, 129,597 , 239,699 )
                    notifyMessage("升级校场退出",300)
                    logD("升级校场退出")
                    mSleep(1000)
                    return
                elseif findPic_boolean("Iconxiezhu_jc.bmp",90, 129,597 , 239,699 ) then
                    click(x,y)
                end
            end
        else
            notifyMessage("找右上角",300)
            mSleep(1000)
            --左移动
            myMove_UD(529,400 ,  111,220 ,50)
            --上移动
            myMove_RL(  300,220 ,529,785 ,50)
            mSleep(800)
        end
    end
end
--领取新手物资和时间宝箱
function shijianjiangli()
    notifyMessage("新手物资和时间宝箱",300)
    logD("新手物资和时间宝箱")
    mSleep(1000)
    local chaoshi = os.time()
    local temp = 0
    --暗色回退
    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
    --界面回退
    for i = 1,3 do
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
    end
    exception()
    while true do
        local time = os.time()
        if time - chaoshi > 120 then
            notifyMessage("新手物资和时间宝箱2分超时",300)
            logD("新手物资和时间宝箱2分超时")
            mSleep(1000)
            findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
            findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
            chaoshi = os.time()
            return
        end
        if temp >2 then
            notifyMessage("领取完毕",300)
            logD("领取完毕")
            mSleep(1000)
            return
        end
        exception()
        if findPic_boolean("youshangditu.bmp",90, 423,404 , 529,491 ) then
            notifyMessage("找到右上角地块",300)
            mSleep(1000)
            --左移动
            myMove_UD( 150,300 , 560,516 ,5)
            mSleep(1000)
            findPic("nvtouxiang_xy.bmp",90, 199,444 , 300,561 )
            findPic("duihuanvwang.bmp",90, 175,443 , 217,486 )
            findPic("duihuanvwang.bmp",90, 175,443 , 217,486 )
            --宝箱和新手物资
            if findPic_boolean("shijianbaoxiang_sj.bmp",90,  98,270 , 636,738 ) then
                click(x,y)
            end
            if findPic_boolean("xinshouwuzi_sj.bmp",90,  98,270 , 636,738 ) then
                click(x,y)
            end
            --收取物资
            if findPic_boolean("shouquwuzi_sj.bmp",90, 255,742 , 386,801 ) then
                click(x,y)
            end
            findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
            --领取奖励
            findPic("lingqujiangli_sj.bmp",90, 260,615 , 376,671 )

            temp = temp +1
        else
            notifyMessage("找右上角",300)
            mSleep(1000)
            --左移动
            myMove_UD(529,400 ,  111,220 ,50)
            --上移动
            myMove_RL(  300,220 ,529,785 ,50)
            mSleep(800)
        end
    end

end
--升级瞭望塔
function liaowangta()
    notifyMessage("升级瞭望塔",300)
    logD("升级瞭望塔")
    mSleep(1000)
    --暗色回退
    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
    --界面回退
    for i = 1,3 do
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
    end
    exception()
    local chaoshi = os.time()
    while true do
        local time = os.time()
        if time - chaoshi > 30 then
            notifyMessage("瞭望塔1分超时",300)
            logD("瞭望塔1分超时")
            mSleep(1000)
            findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
            findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
            chaoshi = os.time()
            return
        end
        exception()
        if findPic_boolean("youshangditu.bmp",90, 423,404 , 529,491 ) then
            notifyMessage("找到右上角地块",300)
            mSleep(1000)
            for i = 1,2 do
                --左移动
                myMove_UD( 250,300 , 560,516 ,5)
            end
            mSleep(1000)
            findPic("nvtouxiang_xy.bmp",90, 199,444 , 300,561 )
            findPic("duihuanvwang.bmp",90, 175,443 , 217,486 )
            findPic("duihuanvwang.bmp",90, 175,443 , 217,486 )
            while true do
                local time1 = os.time()
                if time1 - chaoshi > 30 then
                    notifyMessage("瞭望塔超时",300)
                    logD("瞭望塔超时")
                    mSleep(1000)
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    chaoshi = os.time()
                    return
                end
                if findPic_boolean("jiasu_td.bmp",90, 455,574 , 547,702 ) then
                    --界面后退
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    notifyMessage("加速中退出",300)
                    logD("加速中退出")
                    mSleep(1000)
                    jiasutemp = jiasutemp +1
                    return
                    --跳转红色
                elseif findPic_boolean("tiaozhuan_fz.bmp",90, 422,553 , 571,712 ) then
                    --界面后退
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    notifyMessage("跳转中退出",300)
                    logD("跳转中退出")
                    mSleep(1000)
                    return
                    --点击瞭望塔
                elseif findPic_boolean("liaowangta_lw.bmp",90, 411,686 , 458,728 ) then
                    click(x,y)
                elseif findPic_boolean("Iconshengji_lw.bmp",90, 372,757 , 470,861 ) then
                    click(x,y)
                    --点击升级按钮
                elseif findPic_boolean("shengji_jc.bmp",90, 412,909 , 478,958 ) then
                    click(x,y)
                    --点击协助图标
                    findPic("Iconxiezhu_lw.bmp",90, 372,499 , 465,607 )
                    notifyMessage("升级瞭望塔退出",300)
                    logD("升级瞭望塔退出")
                    mSleep(1000)
                    return
                elseif findPic_boolean("Iconxiezhu_lw.bmp",90, 372,499 , 465,607 ) then
                    click(x,y)
                end
            end
        else
            notifyMessage("找右上角",300)
            mSleep(1000)
            --左移动
            myMove_UD(529,400 ,  111,220 ,50)
            --上移动
            myMove_RL(  300,220 ,529,785 ,50)
            mSleep(800)
        end
    end
end
----升级农田和伐木场
--function shengjitiandi()
--    notifyMessage("升级农田和牧场",300)
--    logD("升级农田和牧场")
--    mSleep(1000)
--    if findPic_boolean("iconditu.bmp",90,  27,1062, 108,1128) then
--        local tempziyuan = 0
--        while true do
--            if findPic_boolean("youxiaditu.bmp",90, 556,738 , 617,796 ) then
--                notifyMessage("找到右下角地块",300)
--                logD("找到右下角地块")
--                mSleep(1000)
--                local fangxiang = 0
--                local cishu = 0
--                while true do
--                    --小麦和木头和铁矿
--                    if findPic_boolean("mucai_ziyuan.bmp",80,   1,330 , 636,970 ) then
--                        click(x,y)
--                    elseif findPic_boolean("xiaomai_ziyuan.bmp",80,   1,330 , 636,970) then
--                        click(x,y)
--                    elseif findPic_boolean("tiekuang_ziyuan.bmp",80,   1,445 , 637,970 ) then
--                        click(x,y)
--                    elseif findPic_boolean("jiasu_td.bmp",90, 455,574 , 547,702 ) then
--                        --界面后退
--                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
--                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
--                        notifyMessage("加速中退出",300)
--                        logD("加速中退出")
--                        mSleep(1000)
--                        return
--                        --升级按钮
--                    elseif findPic_boolean("shengji_td.bmp",90, 407,907 , 481,962 ) then
--                        click(x,y)
--                        --免费
--                    elseif findPic_boolean("mianfei5.bmp",90, 42,137,57,152) or
--            findPic_boolean("mianfei.bmp",90,  40,138 ,  85,189 ) or
--            findPic_boolean("mianfei1.bmp",90, 48,143 ,  83,178 ) or
--              findPic_boolean("mianfeixia.bmp",90,50,260,63,269) or
--            findPic_boolean("mianfei4.bmp",90,  42,137,57,152)then
--                        click(x,y)

--                        mSleep(1000)
--                          
--                    elseif findPic_boolean("iconshengji_td.bmp",90,   1,330 , 635,983 ) then
--                        notifyMessage("点击升级",300)
--                        mSleep(1000)
--                        click(x,y)
--                    elseif findPic_boolean("nongtian_td.bmp",75,   1,330 , 634,875 ) or
--                    findPic_boolean("nongtian1_td.bmp",75,   1,330 , 634,875)then
--                        notifyMessage("找到农田",300)
--                        mSleep(1000)
--                        click(x,y)
--                    elseif findPic_boolean("famuchang_td.bmp",75,   1,330 , 634,875 ) or
--                    findPic_boolean("famuchang1_td.bmp",75,   1,330 , 634,875)then
--                        notifyMessage("找到伐木场",300)
--                        mSleep(1000)
--                        click(x,y)



--                    else
--                        if fangxiang == 0 then
--                            --移到左边
--                            myMove_UD(  250,220  ,500,785,10)
--                            --下移动
--                            myMove_RL( 529,785 , 111,220 ,50)
--                            mSleep(500)
--                            cishu = cishu +1
--                            if cishu >= 3 then
--                                fangxiang = fangxiang +1
--                                cishu = 0
--                            end
--                        elseif fangxiang == 1 then
--                            --上移动
--                            myMove_RL(  111,400 ,529,600 ,10)
--                            fangxiang = fangxiang +1
--                        elseif fangxiang == 2 then
--                            --移到右边
--                            myMove_UD( 500,785, 250,220  ,10)
--                            cishu = cishu +1
--                            if cishu >= 4 then
--                                fangxiang = fangxiang +1
--                                cishu = 0
--                            end
--                        elseif fangxiang == 3 then
--                            --上移动
--                            myMove_RL(  111,400 ,529,500 ,10)
--                            fangxiang = fangxiang +1
--                        elseif fangxiang == 4 then
--                            notifyMessage("升级田地完毕")
--                            logD("升级田地完毕")
--                            mSleep(1000)
--                            return
--                        end
--                    end
--                end
--            else
--                --右移动
--                myMove_UD(  529,785 ,111,220 ,50)
--                --下移动
--                myMove_RL( 529,785 , 111,220 ,50)
--            end
--        end
--    end
--end
--建造农田和牧场
function jianzaotiandi()
    notifyMessage("建造农田和牧场",300)
    logD("建造农田和牧场")
    mSleep(1000)
    --暗色回退
    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
    --界面回退
    for i = 1,3 do
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
    end
    local chaoshi = os.time()
    exception()
    if findPic_boolean("iconditu.bmp",90,  27,1062, 108,1128) then
        local tempziyuan = 0
        while true do
            local time = os.time()
            if time - chaoshi > 60 then
                notifyMessage("建造资源1分发展超时",300)
                logD("建造资源1分发展超时")
                mSleep(1000)
                findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                chaoshi = os.time()
                return
            end
            exception()
            if findPic_boolean("youxiaditu.bmp",90, 556,738 , 617,796 ) then
                notifyMessage("找到右下角地块jianzaotiandi",300)
                logD("找到右下角地块jianzaotiandi")
                mSleep(1000)
                local fangxiang = 0
                local cishu = 0
                while true do
                    local time1 = os.time()
                    if time1 - chaoshi > 480 then
                        notifyMessage("建造资源发展超时",300)
                        logD("建造资源发展超时")
                        mSleep(1000)
                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                        chaoshi = os.time()
                        return
                    end
                    exception()
                    if findPic_boolean("jiasu_td.bmp",90, 455,574 , 547,702 ) then
                        --界面后退
                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                        notifyMessage("加速中退出",300)
                        logD("加速中退出")
                        mSleep(1000)
                        jiasutemp = jiasutemp +1
                        return
                    elseif findPic_boolean("jianzaoz_td.bmp",90, 287,883 , 352,940 ) then
                        --如果是农田和伐木场就建造
                        if findPic_boolean("icontian_td.bmp",85, 437,415 , 496,457 ) or
                        findPic_boolean("iconfamu_td.bmp",85, 437,415 , 496,457 ) or
                        findPic_boolean("iconfamu1_td.bmp",85, 408,376 , 516,485 )then
                            findPic("jianzaoz_td.bmp",90, 287,883 , 352,940 )
                        else
                            --界面后退
                            findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                            findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                            notifyMessage("农田和伐木场已全部建完",300)
                            logD("农田和伐木场已全部建完")
                            mSleep(1000)
                            return
                        end
                    elseif findPic_boolean("jianzaoy_td.bmp",90, 404,909 , 482,961 ) then
                        click(x,y)
                        --免费
                    elseif findPic_boolean("mianfei5.bmp",90, 42,137,57,152) or
                    findPic_boolean("mianfei.bmp",90,  40,138 ,  85,189 ) or
                    findPic_boolean("mianfei1.bmp",90, 48,143 ,  83,178 ) or
                    findPic_boolean("mianfeixia.bmp",90,50,260,63,269) or
                    findPic_boolean("mianfei4.bmp",90,  42,137,57,152)then
                        click(x,y)
                        fazhantemp = fazhantemp +1
                        return
                    elseif findPic_boolean("kongdi1_td.bmp",90,   2,334 , 635,870 ) or
                    --findPic_boolean("kongdi2_td.bmp",90,   2,334 , 635,870 ) or
                    findPic_boolean("kongdi3_td.bmp",90,   2,334 , 635,870 ) or
                    findPic_boolean("kongdi4_td.bmp",90,   2,334 , 635,870) then
                        click(x,y)

                    else
                        if fangxiang == 0 then
                            --移到左边
                            myMove_UD(  250,220  ,500,785,10)
                            --下移动
                            myMove_RL( 529,785 , 111,220 ,50)
                            mSleep(500)
                            cishu = cishu +1
                            if cishu >= 3 then
                                fangxiang = fangxiang +1
                                cishu = 0
                            end
                        elseif fangxiang == 1 then
                            --上移动
                            myMove_RL(  111,400 ,529,600 ,10)
                            fangxiang = fangxiang +1
                        elseif fangxiang == 2 then
                            --移到右边
                            myMove_UD( 500,785, 250,220  ,10)
                            cishu = cishu +1
                            if cishu >= 4 then
                                fangxiang = fangxiang +1
                                cishu = 0
                            end
                        elseif fangxiang == 3 then
                            --上移动
                            myMove_RL(  111,400 ,529,500 ,10)
                            fangxiang = fangxiang +1
                        elseif fangxiang == 4 then
                            notifyMessage("建造田地完毕",300)
                            logD("建造田地完毕")
                            mSleep(1000)
                            return
                        end
                    end
                end
            else
                --右移动
                myMove_UD(  529,785 ,111,220 ,50)
                --下移动
                myMove_RL( 529,785 , 111,220 ,50)
            end
        end
    end
end
--联盟捐献
function lianmengjuanxian()
    if findPic_boolean("ditu_sl.bmp",90,  28,1061, 103,1125) then
        notifyMessage("联盟捐献",300)
        logD("联盟捐献")
        mSleep(1000)
        local chaoshi = os.time()
        local mutou,xiaomai = panduanziyuan()
        if mutou == 1 and xiaomai == 1 then
            while true do
                local time = os.time()
                if time - chaoshi > 360 then
                    notifyMessage("联盟捐献超时",300)
                    logD("联盟捐献超时")
                    mSleep(1000)
                    return
                end
                if findPic_boolean("lianmeng_jx.bmp",90, 545,1069, 594,1124) then
                    click(x,y)
                elseif findPic_boolean("juanxian_jx.bmp",90,  18,632 ,  96,695 ) then
                    click(x,y)
                elseif findPic_boolean("xingxing_jx.bmp",90, 158,270 , 543,1101) then
                    click(x,y)
                    --1000右边捐献
                elseif findPic_boolean("youjuanxian_jx.bmp",90, 398,799 , 486,853 ) then
                    click(x,y)
                    --200左边捐献
                elseif findPic_boolean("zuojuanxian_jx.bmp",90, 128,796 , 213,854 ) then
                    click(x,y)
                elseif findPic_boolean("putongjuanxian_jx.bmp",90, 218,671 , 290,722 ) then
                    click(x,y)
                elseif findPic_boolean("qingchu_jx.bmp",90, 287,657 , 353,711 ) then
                    findPic("anhuitui2_jx.bmp",90,   5,4   ,  73,72  )
                    findPic("anhuitui1_jx.bmp",90,   8,7   ,  70,71  )
                    findPic("huitui_jx.bmp",90,   8,7   ,  70,71  )
                    findPic("huitui_jx.bmp",90,   8,7   ,  70,71  )
                    notifyMessage("捐献时间已满退出",300)
                    logD("捐献时间已满退出")
                    mSleep(1000)
                    return
                end
            end
        else
            notifyMessage("资源不足500K不捐献",300)
            logD("资源不足500K不捐献")
            mSleep(1000)
        end
    end
end
--判断木材和小麦数是否不少于500K
function panduanziyuan()
    if findPic_boolean("ditu_sl.bmp",90,  28,1061, 103,1125) then
        notifyMessage("判断资源数",300)
        logD("判断资源数")
        mSleep(1000)
        local mutoushu = 0
        local xiaomaishu = 0
        while true do
            --判断木头输
            if findPicLostColor_boolean("M.bmp",80, 121,1   , 206,45 ,0xFF00FF ) then
                notifyMessage("木头超过1M",300)
                logD("木头超过1M")
                mSleep(1000)
                mutoushu = 1
            elseif findPicLostColor_boolean("K.bmp",80, 175,15  , 189,34  ,0xFF00FF ) then
                --判断第一位数是否大于5
                if findPicLostColor_boolean("5.bmp",80, 128,9   , 140,35  ,0xFF00FF) or
                findPicLostColor_boolean("6.bmp",80, 128,9   , 140,35  ,0xFF00FF) or
                findPicLostColor_boolean("7.bmp",80, 128,9   , 140,35  ,0xFF00FF) or
                findPicLostColor_boolean("8.bmp",80, 128,9   , 140,35  ,0xFF00FF) or
                findPicLostColor_boolean("9.bmp",80, 128,9   , 140,35  ,0xFF00FF) then
                    mutoushu = 1
                    notifyMessage("木头三位数超过500K"..mutoushu,300)
                    logD("木头三位数超过500K")
                    mSleep(1000)

                else
                    mutoushu = 2
                    notifyMessage("木头三位数不足500K"..mutoushu,300)
                    logD("木头三位数不足500K")
                    mSleep(1500)
                end
            else
                mutoushu = 2
                notifyMessage("木头不足500K"..mutoushu,300)
                logD("木头不足500K")
                mSleep(1500)

            end


            --判断小麦数
            if findPicLostColor_boolean("M.bmp",80, 243,4   , 322,41  ,0xFF00FF ) then
                notifyMessage("小麦超过1M",300)
                logD("小麦超过1M")
                mSleep(1000)
                xiaomaishu = 1
            elseif findPicLostColor_boolean("K.bmp",80, 2,15  , 313,34  ,0xFF00FF ) then
                --判断第一位数是否大于5
                if findPicLostColor_boolean("5.bmp",80, 243,10  , 256,38  ,0xFF00FF) or
                findPicLostColor_boolean("6.bmp",80, 243,10  , 256,38  ,0xFF00FF) or
                findPicLostColor_boolean("7.bmp",80, 243,10  , 256,38  ,0xFF00FF) or
                findPicLostColor_boolean("8.bmp",80, 243,10  , 256,38  ,0xFF00FF) or
                findPicLostColor_boolean("9.bmp",80, 243,10  , 256,38  ,0xFF00FF) then
                    xiaomaishu = 1
                    notifyMessage("小麦三位数超过500K"..xiaomaishu,300)
                    logD("小麦三位数超过500K")
                    mSleep(1000)

                else
                    xiaomaishu = 2
                    notifyMessage("小麦三位数不足500K"..xiaomaishu,300)
                    logD("小麦三位数不足500K")
                    mSleep(1500)
                end
            else
                xiaomaishu = 2
                notifyMessage("小麦不足500K"..xiaomaishu,300)
                logD("小麦不足500K")
                mSleep(1500)

            end
            --返回木头和小麦数
            if xiaomaishu >0 and mutoushu >0 then
                notifyMessage("木头书:"..mutoushu.."---".."小买书:"..xiaomaishu)
                mSleep(1500)
                return mutoushu,xiaomaishu
            end
        end
    else
        notifyMessage("不在主界面")
        mSleep(1500)
    end
end
--资源技能
function ziyuanxueyuan()
    notifyMessage("学院资源研究",300)
    logD("学院资源研究")
    mSleep(1000)
    --暗色回退
    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
    --界面回退
    for i = 1,3 do
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
    end
    exception()
    local chaoshi = os.time()
    if findPic_boolean("iconditu.bmp",90,  27,1062, 108,1128) then
        while true do
            local time = os.time()
            if time - chaoshi > 60 then
                notifyMessage("学院1分发展超时",300)
                logD("学院1分发展超时")
                mSleep(1000)
                findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                chaoshi = os.time()
                return
            end
            exception()
            if findPic_boolean("youshangditu.bmp",90, 423,404 , 529,491 ) then
                notifyMessage("找到右上角地块ziyuanxueyuan",300)
                logD("找到右上角地块ziyuanxueyuan")
                mSleep(1000)
                for i =1,2 do
                    --左移动
                    myMove_UD( 150,300 , 639,516 ,5)
                end
                mSleep(1000)
                findPic("nvtouxiang_xy.bmp",90, 199,444 , 300,561 )
                findPic("duihuanvwang.bmp",90, 175,443 , 217,486 )
                findPic("duihuanvwang.bmp",90, 175,443 , 217,486 )
                if findPic_boolean("xueyuan_xy.bmp",90, 180,593 , 252,663 ) then
                    click(x,y)
                    --点击研究
                    if findPic_boolean("yanjiuIcon_xy.bmp",90, 175,443 , 401,783 ) then
                        click(x,y)
                        while true do
                            local time1 = os.time()
                            if time1 - chaoshi > 480 then
                                notifyMessage("学院发展超时",300)
                                logD("学院发展超时")
                                mSleep(1000)
                                findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                                findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                                chaoshi = os.time()
                                --暗色回退
                                findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
                                --界面回退
                                for i = 1,3 do
                                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                                end
                                return
                            end
                            exception()
                            --正在研究退出        发现详情
                            if findPic_boolean("xiangqing_xy.bmp",90, 468,846 , 530,891 ) then
                                --界面回退
                                for i = 1,3 do
                                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                                end
                                notifyMessage("学院正在研究中退出",300)
                                logD("学院正在研究中退出")
                                mSleep(1000)
                                return
                            else
                                --开始研究资源栏
                                if findPic_boolean("ziyuanlan_zy.bmp",90, 107,173 , 259,328 ) then
                                    click(x,y)
                                    --轮耕制度
                                elseif findPic_boolean("lungengzhiduan_zy.bmp",90, 446,149 , 517,226 ) then
                                    click(x,y)
                                    --仓库
                                elseif findPic_boolean("cangkuan_zy.bmp",90, 284,295 , 356,375 )then
                                    click(x,y)
                                    --兽耕
                                elseif findPic_boolean("shougengan_zy.bmp",90, 446,458 , 531,535 ) then
                                    click(x,y)
                                    --双人锯
                                elseif findPic_boolean("shuangrenjuan_zy.bmp",90, 116,457 , 210,544 ) then
                                    click(x,y)
                                    --鼓风炉
                                elseif findPic_boolean("gufengluan_zy.bmp",90, 277,622 , 362,699 ) then
                                    click(x,y)
                                    --矿车
                                elseif findPic_boolean("kuangchean_zy.bmp",90, 293,780 , 369,854 ) then
                                    click(x,y)
                                    --铁镐
                                elseif findPic_boolean("tiegaoan_zy.bmp",90, 282,938 , 359,1012) then
                                    click(x,y)
                                end


                                --正在研究时   退出
                                if findPic_boolean("jiasu_xy.bmp",90, 463,590 , 533,811 ) then
                                    notifyMessage("技能正在研究中退出",300)
                                    logD("技能正在研究中退出")
                                    mSleep(1000)
                                    --暗色回退
                                    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
                                    --界面回退
                                    for i = 1,3 do
                                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                                    end
                                    return
                                    --需要科技  退出
                                elseif findPic_boolean("xuyaokeji_xy.bmp",90, 114,586 , 229,771 ) then
                                    notifyMessage("需要科技退出",300)
                                    logD("需要科技退出")
                                    mSleep(1000)
                                    --暗色回退
                                    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
                                    --界面回退
                                    for i = 1,3 do
                                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                                    end
                                    return
                                elseif findPic_boolean("xueyuanbugou_xy.bmp",90, 119,584 , 247,769 ) then
                                    --退出学院界面
                                    --暗色回退
                                    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
                                    --界面回退
                                    for i = 1,3 do
                                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                                    end
                                    notifyMessage("学院等级不足退出",300)
                                    logD("学院等级不足退出")
                                    mSleep(1000)
                                    return
                                    --点击研究
                                elseif findPic_boolean("yanjiu_xy.bmp",90, 388,466 , 457,518 ) then
                                    click(x,y)
                                    --暗色回退
                                    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
                                    --回退
                                    for i = 1,3 do
                                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                                    end
                                    notifyMessage("研究退出",300)
                                    logD("研究退出")
                                    mSleep(1000)
                                    return
                                end
                            end
                        end
                    end
                end
            else
                notifyMessage("找右上角",300)
                mSleep(1000)
                --左移动
                myMove_UD(529,400 ,  111,220 ,100)
                --上移动
                myMove_RL(  300,220 ,529,785 ,100)
                mSleep(800)
            end
        end 
    end
end
--学院发展亮色
function xueyuanliang()
    notifyMessage("军事发展亮",300)
    logD("军事发展亮")
    mSleep(1000)
    local chaoshi = os.time()
    if findPic_boolean("iconditu.bmp",90,  27,1062, 108,1128) then
        local chaoshi = os.time()
        while true do
            local time = os.time()
            if time - chaoshi > 60 then
                notifyMessage("学院1分发展超时",300)
                logD("学院1分发展超时")
                mSleep(1000)
                findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                chaoshi = os.time()
                return
            end
            exception()
            if findPic_boolean("youshangditu.bmp",90, 423,404 , 529,491 ) then
                notifyMessage("找到右上角地块xueyuanliang",300)
                logD("找到右上角地块xueyuanliang")
                mSleep(1000)
                for i =1,2 do
                    --左移动
                    myMove_UD( 150,300 , 639,516 ,5)
                end
                mSleep(1000)
                findPic("nvtouxiang_xy.bmp",90, 199,444 , 300,561 )
                findPic("duihuanvwang.bmp",90, 175,443 , 217,486 )
                findPic("duihuanvwang.bmp",90, 175,443 , 217,486 )
                if findPic_boolean("xueyuan_xy.bmp",90, 180,593 , 252,663 ) then
                    click(x,y)
                    --点击研究
                    if findPic_boolean("yanjiuIcon_xy.bmp",90, 175,443 , 401,783 ) then
                        click(x,y)
                        while true do
                            local time = os.time()
                            if time - chaoshi > 360 then
                                notifyMessage("军事发展亮",300)
                                logD("军事发展亮")
                                mSleep(1000)
                                return
                            end

                            --开始研究军事蓝
                            if findPic_boolean("junshi_xy.bmp",90, 414,475 , 510,571 ) then
                                click(x,y)
                                --募兵术
                            elseif findPic_boolean("mubingshuli_xy.bmp",90, 223,81  , 413,267 ) then
                                click(x,y)
                                --制图学
                            elseif findPic_boolean("zhituxueli_xy.bmp",90, 223,81  , 413,267 ) then
                                click(x,y)
                                --军团
                            elseif findPic_boolean("juntuanli_xy.bmp",90, 223,81  , 413,267) then
                                click(x,y)
                                --领导力
                            elseif findPic_boolean("lingdaolili_xy.bmp",90, 223,81  , 413,267) then
                                click(x,y)
                                --中级军团
                            elseif findPic_boolean("zhongjijuntuanan_xy.bmp",90, 223,81  , 413,267) then
                                click(x,y)
                                --中级募兵术
                            elseif findPic_boolean("zhongjimubingan_xy.bmp",90, 223,81  , 413,267) then
                                click(x,y)
                                --中级制图学
                            elseif findPic_boolean("zhongjizhituan_xy.bmp",90, 223,81  , 413,267) then
                                click(x,y)
                                --中级领导力
                            elseif findPic_boolean("zhongjilingdaoan_xy.bmp",90, 223,81  , 413,267) then
                                click(x,y)
                                --高级军团
                            elseif findPic_boolean("gaojijuntuanan_xy.bmp",90, 223,81  , 413,267) then
                                click(x,y)




                            else
                                --下移动
                                myMove_RL( 529,500 , 111,405 ,5)
                            end
                            --正在研究时   退出
                            if findPic_boolean("jiasu_xy.bmp",90, 463,590 , 533,811 ) then
                                notifyMessage("技能正在研究中退出",300)
                                logD("技能正在研究中退出")
                                mSleep(1000)
                                return
                            end
                            --需要科技  退出
                            if findPic_boolean("xuyaokeji_xy.bmp",90, 114,586 , 229,771 ) then
                                notifyMessage("需要科技退出",300)
                                logD("需要科技退出")
                                mSleep(1000)
                                return
                            end
                            --资源界面,使用资源
                            if findPic_boolean("ziyuanjiemian_xy.bmp",90, 277,13  , 355,59  ) then
                                if findPic_boolean("shiyong_xy.bmp",90, 491,228 , 597,346 ) then
                                    click(x,y)
                                    --使用资源最大
                                    if findPic_boolean("huakuai.bmp",90,  89,570 , 157,640 ) then
                                        click( 347,606 )
                                        findPic("shiyongziyuan.bmp",90, 281,673 , 353,726 )
                                    end
                                    --暗色回退
                                    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
                                    --回退
                                    for i = 1,3 do
                                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                                    end
                                else
                                    --暗色回退
                                    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
                                    --回退
                                    for i = 1,3 do
                                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                                    end
                                    --关闭资源界面
                                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                                    notifyMessage("资源不足退出",300)
                                    logD("资源不足退出")
                                    mSleep(1000)
                                    return
                                end
                            end
                            --点击研究
                            if findPic_boolean("yanjiu_xy.bmp",90, 388,466 , 457,518 ) then
                                click(x,y)
                                --回退
                                for i = 1,3 do
                                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                                end
                                notifyMessage("研究退出",300)
                                logD("研究退出")
                                mSleep(1000)
                                return
                            elseif findPic_boolean("xueyuanbugou_xy.bmp",90, 119,584 , 247,769 ) then
                                if findPic_boolean("juntuanjiemian_xy.bmp",90, 284,161 , 356,208 ) then
                                    --退出学院界面
                                    --暗色回退
                                    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
                                    --界面回退
                                    for i = 1,3 do
                                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                                    end
                                    --去升级学院
                                    xueyuanshengji()
                                else
                                    --退出学院界面
                                    --暗色回退
                                    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
                                    --界面回退
                                    --回退
                                    for i = 1,3 do
                                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                                    end
                                    notifyMessage("学院等级不足退出",300)
                                    logD("学院等级不足退出")
                                    mSleep(1000)
                                    return
                                end
                                --资源不足时获得更多
                                if findPic_boolean("huodegengduo_xy.bmp",90, 427,578 , 548,774 ) then
                                    click(x,y)
                                end
                            end   
                        end
                    end
                end
            else
                notifyMessage("找右上角",300)
                mSleep(1000)
                --左移动
                myMove_UD(529,400 ,  111,220 ,100)
                --上移动
                myMove_RL(  300,220 ,529,785 ,100)
                mSleep(800)
            end
        end 
    end
end
--学院发展
function junshixueyuan()
    notifyMessage("学院军事研究",300)
    logD("学院军事研究")
    mSleep(1000)
    --暗色回退
    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
    --界面回退
    for i = 1,3 do
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
    end
    local chaoshi = os.time()
    exception()
    if findPic_boolean("iconditu.bmp",90,  27,1062, 108,1128) then
        local chaoshi = os.time()
        while true do
            local time = os.time()
            if time - chaoshi > 60 then
                notifyMessage("学院1分发展超时",300)
                logD("学院1分发展超时")
                mSleep(1000)
                findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                chaoshi = os.time()
                return
            end
            exception()
            if findPic_boolean("youshangditu.bmp",90, 423,404 , 529,491 ) then
                notifyMessage("找到右上角地块junshixueyuan",300)
                logD("找到右上角地块junshixueyuan")
                mSleep(1000)
                for i =1,2 do
                    --左移动
                    myMove_UD( 150,300 , 639,516 ,5)
                end
                mSleep(1000)
                findPic("nvtouxiang_xy.bmp",90, 199,444 , 300,561 )
                findPic("duihuanvwang.bmp",90, 175,443 , 217,486 )
                findPic("duihuanvwang.bmp",90, 175,443 , 217,486 )
                if findPic_boolean("xueyuan_xy.bmp",90, 180,593 , 252,663 ) then
                    click(x,y)
                    --点击研究
                    if findPic_boolean("yanjiuIcon_xy.bmp",90, 175,443 , 401,783 ) then
                        click(x,y)
                        while true do
                            local time1 = os.time()
                            if time1 - chaoshi > 480 then
                                notifyMessage("学院发展超时",300)
                                logD("学院发展超时")
                                mSleep(1000)
                                --暗色回退
                                findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
                                --界面回退
                                for i = 1,3 do
                                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                                end
                                chaoshi = os.time()
                                return
                            end
                            exception()
                            --正在研究退出        发现详情
                            if findPic_boolean("xiangqing_xy.bmp",90, 468,846 , 530,891 ) then
                                notifyMessage("学院正在研究中退出",300)
                                logD("学院正在研究中退出")
                                mSleep(1000)
                                --暗色回退
                                findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
                                --界面回退
                                for i = 1,3 do
                                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                                end
                                return
                            end
                            --开始研究军事蓝
                            if findPic_boolean("junshi_xy.bmp",90, 414,475 , 510,571 ) then
                                click(x,y)
                                --募兵术
                            elseif findPic_boolean("mubingshuan_xy.bmp",90, 223,81  , 413,267 ) then
                                click(x,y)
                                --制图学
                            elseif findPic_boolean("zituxuean_xy.bmp",90, 223,81  , 413,267 ) then
                                click(x,y)
                                --军团
                            elseif findPic_boolean("juntuanan_xy.bmp",90, 223,81  , 413,267) then
                                click(x,y)
                                --领导力
                            elseif findPic_boolean("lingdaolian_xy.bmp",90, 223,81  , 413,267) then
                                click(x,y)
                                --中级军团
                            elseif findPic_boolean("zhongjijuntuanan_xy.bmp",90, 223,81  , 413,267) then
                                click(x,y)
                                --中级募兵术
                            elseif findPic_boolean("zhongjimubingan_xy.bmp",90, 223,81  , 413,267) then
                                click(x,y)
                                --中级制图学
                            elseif findPic_boolean("zhongjizhituan_xy.bmp",90, 223,81  , 413,267) then
                                click(x,y)
                                --中级领导力
                            elseif findPic_boolean("zhongjilingdaoan_xy.bmp",90, 223,81  , 413,267) then
                                click(x,y)
                                --高级军团
                            elseif findPic_boolean("gaojijuntuanan_xy.bmp",90, 223,81  , 413,267) then
                                click(x,y)




                            else
                                --下移动
                                myMove_RL( 529,500 , 111,405 ,5)
                            end
                            --正在研究时   退出
                            if findPic_boolean("jiasu_xy.bmp",90, 463,590 , 533,811 ) then
                                notifyMessage("技能正在研究中退出",300)
                                logD("技能正在研究中退出")
                                mSleep(1000)
                                --暗色回退
                                findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
                                --界面回退
                                for i = 1,3 do
                                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                                end
                                return
                            end
                            --需要科技  退出
                            if findPic_boolean("xuyaokeji_xy.bmp",90, 114,586 , 229,771 ) then
                                notifyMessage("需要科技退出",300)
                                logD("需要科技退出")
                                mSleep(1000)
                                --暗色回退
                                findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
                                --界面回退
                                for i = 1,3 do
                                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                                end
                                return
                            end
                            --资源界面,使用资源
                            if findPic_boolean("ziyuanjiemian_xy.bmp",90, 277,13  , 355,59  ) then
                                if findPic_boolean("shiyong_xy.bmp",90, 491,228 , 597,346 ) then
                                    click(x,y)
                                    --使用资源最大
                                    if findPic_boolean("huakuai.bmp",90,  89,570 , 157,640 ) then
                                        click( 347,606 )
                                        findPic("shiyongziyuan.bmp",90, 281,673 , 353,726 )
                                    end
                                else
                                    --暗色回退
                                    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
                                    --回退
                                    for i = 1,3 do
                                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                                    end
                                    --关闭资源界面
                                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                                    notifyMessage("资源不足退出",300)
                                    logD("资源不足退出")
                                    mSleep(1000)
                                    return
                                end
                            end
                            --点击研究
                            if findPic_boolean("yanjiu_xy.bmp",90, 388,466 , 457,518 ) then
                                click(x,y)
                                --暗色回退
                                findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
                                --界面回退
                                for i = 1,3 do
                                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                                end
                                notifyMessage("研究退出",300)
                                logD("研究退出")
                                mSleep(1000)
                                return
                            elseif findPic_boolean("xueyuanbugou_xy.bmp",90, 119,584 , 247,769 ) then
                                if findPic_boolean("juntuanjiemian_xy.bmp",90, 284,161 , 356,208 ) then
                                    --退出学院界面
                                    --暗色回退
                                    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
                                    --界面回退
                                    for i = 1,3 do
                                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                                    end
                                    --去升级学院
                                    xueyuanshengji()
                                    return
                                else
                                    --退出学院界面
                                    --暗色回退
                                    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
                                    --回退
                                    for i = 1,3 do
                                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                                    end
                                    notifyMessage("学院等级不足退出",300)
                                    logD("学院等级不足退出")
                                    mSleep(1000)
                                    return
                                end
                                --资源不足时获得更多
                                if findPic_boolean("huodegengduo_xy.bmp",90, 427,578 , 548,774 ) then
                                    click(x,y)
                                end
                            end   
                        end
                    end
                end
            else
                notifyMessage("找右上角",300)
                mSleep(1000)
                --左移动
                myMove_UD(529,400 ,  111,220 ,100)
                --上移动
                myMove_RL(  300,220 ,529,785 ,100)
                mSleep(800)
            end
        end 
    end
end

--学院升级
function xueyuanshengji()
    notifyMessage("学院升级",300)
    logD("学院升级")
    mSleep(1000)
    local chaoshi = os.time()
    while true do
        local time = os.time()
        if time - chaoshi > 120 then
            notifyMessage("学院升级超时",300)
            logD("学院升级超时")
            mSleep(1000)
            return
        end
        if findPic_boolean("youshangditu.bmp",90, 423,404 , 529,491 ) then
            notifyMessage("找到右上角地块xueyuanshengji",300)
            logD("找到右上角地块xueyuanshengji")
            mSleep(1000)
            for i =1,2 do
                --左移动
                myMove_UD( 150,300 , 639,516 ,5)
            end
            mSleep(1000)
            findPic("nvtouxiang_xy.bmp",90, 199,444 , 300,561 )
            findPic("duihuanvwang.bmp",90, 175,443 , 217,486 )
            findPic("duihuanvwang.bmp",90, 175,443 , 217,486 )
            if findPic_boolean("xueyuan_xy.bmp",90, 180,593 , 252,663 ) then
                click(x,y) 
                if findPic_boolean("shengjiIcon_xy.bmp",90, 211,712 , 302,807 ) then
                    click(x,y)
                end
            end
            --确定升级学院
            if findPic_boolean("shengjianniu_xy.bmp",90, 406,911 , 475,964 ) then
                click(x,y)
                notifyMessage("学院升级",300)
                logD("学院升级")
                mSleep(1000)
                --暗色回退
                findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
                --界面回退
                for i = 1,3 do
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                end
                return
            end
        else
            notifyMessage("找右上角",300)
            mSleep(1000)
            --左移动
            myMove_UD(529,400 ,  111,220 ,100)
            --上移动
            myMove_RL(  300,220 ,529,785 ,100)
            mSleep(800)
        end
    end
end
--城堡发展
function chengbao()
    notifyMessage("城堡发展",300)
    logD("城堡发展")
    mSleep(1000)
    --暗色回退
    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
    --界面回退
    for i = 1,3 do
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
    end
    local chaoshi = os.time()
    exception()
    while true do
        local time = os.time()
        if time - chaoshi > 30 then
            notifyMessage("城堡1分发展超时",300)
            logD("城堡1分发展超时")
            mSleep(1000)
            findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
            findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
            chaoshi = os.time()
            return
        end
        exception()
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
        for i =1,6 do
            --免费
            if findPic_boolean("mianfei5.bmp",90, 42,137,57,152) or
            findPic_boolean("mianfei.bmp",90,  40,138 ,  85,189 ) or
            findPic_boolean("mianfei1.bmp",90, 48,143 ,  83,178 ) or
            findPic_boolean("mianfeixia.bmp",90,50,260,63,269) or
            findPic_boolean("mianfei4.bmp",90,  42,137,57,152)then
                click(x,y)
                fazhantemp = fazhantemp +1
                return
            end
        end
        if findPic_boolean("zuoshangditu.bmp",90,  43,607 , 110,674 ) then
            notifyMessage("找到左上角地块chengbao",300)
            logD("找到左上角地块chengbao")
            mSleep(1000)
            while true do
                local time1 = os.time()
                if time1 - chaoshi > 30 then
                    notifyMessage("城堡发展超时",300)
                    logD("城堡发展超时")
                    mSleep(1000)
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    chaoshi = os.time()
                    return
                end
                exception()
                --点击城堡
                if findPic_boolean("chengbao_cb.bmp",90, 454,455 , 510,509 ) then
                    click(x,y)
                elseif findPic_boolean("jiasu_fz.bmp",90, 453,570 , 558,702 ) then
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    notifyMessage("城堡加速退出",300)
                    logD("城堡加速退出")
                    mSleep(1000)
                    jiasutemp = jiasutemp +1
                    return
                elseif findPic_boolean("shengjichengbao_cb.bmp",90, 424,498 , 488,562 ) then
                    click(x,y)
                elseif findPic_boolean("huodegengduo_cb.bmp",90, 436,566 , 551,753 ) then
                    click(x,y)
                elseif findPic_boolean("tiaozhuan_cb.bmp",90, 449,573 , 544,756 ) then
                    click(x,y)




                end




                --免费
                if findPic_boolean("mianfei5.bmp",90, 42,137,57,152) or
                findPic_boolean("mianfei.bmp",90,  40,138 ,  85,189 ) or
                findPic_boolean("mianfei1.bmp",90, 48,143 ,  83,178 ) or
                findPic_boolean("mianfeixia.bmp",90,50,260,63,269) or
                findPic_boolean("mianfei4.bmp",90,  42,137,57,152)then
                    click(x,y)
                    chaoshi = os.time()
                    fazhantemp = fazhantemp +1
                    return
                end
                --加速
                if findPic_boolean("jiasu_fz.bmp",90, 453,570 , 558,702 ) then
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    notifyMessage("加速退出",300)
                    logD("加速退出")
                    mSleep(1000)
                    jiasutemp = jiasutemp +1
                    return
                end
                --跳转红色
                if findPic_boolean("tiaozhuan_fz.bmp",90, 422,553 , 571,712 ) then
                    click(x,y)
                    mSleep(200)
                    chaoshi = os.time()
                end
                --城堡升级提示
                --if findPic_boolean("chengbaoshoushi_fz.bmp",90, 314,350 , 401,423 ) then
                --点击城堡
                findPic("chengbaodianji_fz.bmp",90, 213,417 , 298,495 )
                --点击升级城堡
                findPic("shengjiIcon_fz.bmp",90, 273,474 , 426,573 )

                --end
                --农田升级
                if findPic_boolean("nongtian3ji_fz.bmp",90, 242,543 , 411,625 ) then
                    click( 318,585 )
                    if findPic_boolean("shengjiIcon_fz.bmp",90, 313,621 , 430,731 ) then
                        click(x,y)
                        chaoshi = os.time()
                    else
                        click( 318,585 )
                    end
                    findPic("shengjiIcon_fz.bmp",90, 313,621 , 430,731 )
                end
                --城墙升级
                if findPic_boolean("chengqiang_fz.bmp",90, 259,505 , 389,599 ) or
                findPic_boolean("chengqiang6ji_fz.bmp",90, 278,511 , 366,571 ) then
                    --点击城墙
                    click(x,y)
                    findPic("shengjiIcon_fz.bmp",90, 313,621 , 430,731 )
                    chaoshi = os.time()
                end
                --学院升级
                if findPic_boolean("xueyuan_fz.bmp",90, 261,515 , 363,617 ) then
                    click(x,y)
                    findPic("shengjiIcon_fz.bmp",90, 261,635 , 377,744 )
                    chaoshi = os.time()
                end

                --资源不足时获得更多
                if findPic_boolean("huodegengduo_by.bmp",90, 423,567 , 547,784 ) then
                    click(x,y)
                elseif findPic_boolean("huodegengduo1_by.bmp",90, 423,567 , 547,784 ) then
                    click(x,y)
                    --建筑升级右边
                elseif findPic_boolean("shengji_fz.bmp",90, 403,903 , 481,969 ) then
                    click(x,y)
--                    notifyMessage("正在升级退出",300)
--                    logD("正在升级退出")
--                    mSleep(1000)
--                    jiasutemp = jiasutemp +1
--                    return
                    --建筑建造右边
                elseif findPic_boolean("jianzaoyou_fz.bmp",90, 403,906 , 481,963 ) then
                    click(x,y)
--                    notifyMessage("正在建造退出",300)
--                    logD("正在建造退出")
--                    mSleep(1000)
--                    jiasutemp = jiasutemp +1
--                    return
                end

                --升级仓库
                if findPic_boolean("cangku_cb.bmp",90, 257,334 , 366,466 ) then
                    click(x,y)
                end







                --顺带收集资源
                for i= 1,5 do
                    findPic("mucai_ziyuan.bmp",80,  63,330 , 637,643 )
                    findPic("xiaomai_ziyuan.bmp",80,63,330 , 637,643 )
                end
                --资源界面,使用资源
                if findPic_boolean("ziyuanjiemian_xy.bmp",90, 277,13  , 355,59  ) then
                    if findPic_boolean("shiyong_xy.bmp",90, 491,228 , 599,348 ) then
                        click(x,y)
                        --使用资源最大
                        if findPic_boolean("huakuai.bmp",90,  89,570 , 157,640 ) then
                            click( 347,606 )
                            findPic("shiyongziyuan.bmp",90, 281,673 , 353,726 )
                        end
                    else
                        --暗色回退
                        findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
                        --回退
                        for i = 1,3 do
                            findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                        end
                        --关闭资源界面
                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                        notifyMessage("资源不足退出",300)
                        logD("资源不足退出")
                        mSleep(1000)
                        return
                    end
                end
            end
        else
            notifyMessage("找左上角",300)
            mSleep(1000)
            --左移动
            myMove_UD(  111,220 ,529,400 ,50)
            --上移动
            myMove_RL(  300,220 ,529,785 ,50)
            mSleep(800)
        end
    end
end
--兵营发展
function bingying()
    notifyMessage("兵营发展",300)
    logD("兵营发展")
    mSleep(1000)
    --暗色回退
    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
    --界面回退
    for i = 1,3 do
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
    end
    local chaoshi = os.time()
    exception()
    while true do
        local time = os.time()
        if time - chaoshi > 40 then
            notifyMessage("兵营1分发展超时",300)
            logD("兵营1分发展超时")
            mSleep(1000)
            findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
            findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
            chaoshi = os.time()
            return
        end
        exception()
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )

        if findPic_boolean("zuoshangditu.bmp",90,  43,607 , 110,674 ) then
            notifyMessage("找到左上角地块bingying",300)
            logD("找到左上角地块bingying")
            mSleep(1000)
            --右移动  
            myMove_UD( 400,400 , 250,220 ,5)
            --下移动
            myMove_RL( 529,685 , 300,400 ,5)
            mSleep(800)

            --超时时间
            while true do
                exception()
                local time1 = os.time()
                if time1 - chaoshi >40 then
                    notifyMessage("兵营发展超时",300)
                    logD("兵营发展超时")
                    mSleep(1000)
                    return
                end
                --训练+完成点击
                for i =1,5 do
                    findPic("xunlianwanbi_fz.bmp",90,  26,293 , 365,670 )
                    findPic("xunlianwanbi1_fz.bmp",90, 210,381 , 583,722 )
                    findPic("xunlianwanbi2_fz.bmp",90,  241,172 , 432,361 )
                end
                --点击战车工坊训练2级冲车
                if findPic_boolean("zhanchegongfang_fz.bmp",90, 189,307 , 450,467 )
                or findPic_boolean("zhanchegongfang1_fz.bmp",90, 189,307 , 450,467 ) then
                    click(x,y)
                    --训练
                    findPic("xunlianIcon2_fz.bmp",90, 348,447 ,  570,603 )
                    --升级中的训练
                    findPic("xunlianIcon2sj_fz.bmp",90, 436,450 , 585,584 )
                    mSleep(1000)

                end

                if findPic_boolean("xunliananniu_fz.bmp",90, 399,1048, 490,1112) or
                findPic_boolean("jiasujinbijiemian_by.bmp",90, 441,969 , 540,1020) then
                    --训练2级冲车
                    if findPic_boolean("chongche2ji_fz.bmp",85, 393,349 , 502,455 ) then
                        mSleep(1000)
                        --点击训练按钮
                        findPic("xunliananniu_fz.bmp",90, 399,1048, 490,1112)
                        --暗色回退
                        findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
                        --正在训练中的时候界面回退
                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )


                        --点击靶场训练1级兵
                        if findPic_boolean("bachang_fz.bmp",90, 2,437 , 236,640 ) then
                            click(x,y)
                            --点击训练
                            findPic("xunlianIcon_fz.bmp",90,   1,392 , 636,780 )
                            --点击训练按钮
                            findPic("xunliananniu_fz.bmp",90, 399,1048, 490,1112)
                            --暗色回退
                            findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
                            --正在训练中的时候界面回退
                            findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                        end
                        --点击兵营训练1级兵
                        if findPic_boolean("bingying_fz.bmp",90,180,490 , 519,700) then
                            click(x,y)
                            --点击训练
                            findPic("xunlianIcon1_fz.bmp",80,   1,392 , 636,780 )
                            findPic("xunlianIcon1_fz.bmp",80,   1,392 , 636,780 )
                            findPic("xunlianIcon1-1_fz.bmp",80, 388,679 , 501,777)
                            --点击训练按钮
                            findPic("xunliananniu_fz.bmp",90, 399,1048, 490,1112)
                            --暗色回退
                            findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
                            --正在训练中的时候界面回退
                            findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                        end
                    elseif findPic_boolean("toushiche_fz.bmp",90, 383,343 , 514,462 ) then
                        mSleep(800)
                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                        if findPic_boolean("zhanchegongfang_fz.bmp",90, 189,307 , 450,467 ) or
                        findPic_boolean("zhanchegongfang1_fz.bmp",90, 189,307 , 450,467 ) then
                            click(x,y)
                        end
                        --升级战车工坊
                        if findPic_boolean("shengjiIcon_fz.bmp",90, 275,447 , 388,557 ) then
                            click(x,y)

                            --确定升级
                            if findPic_boolean("shengji_fz.bmp",90, 403,903 , 481,969 ) then
                                click(x,y)
                                notifyMessage("战车升级退出",300)
                                logD("战车升级退出")
                                mSleep(1000)
                                jiasutemp = jiasutemp +1
                                return
                            end
                        end
                    end
                end
                --[[点击马厩训练1级兵
                if findPic_boolean("majiu_fz.bmp",90, 300,381 , 637,650) then
                    click(x,y)
                    --点击训练
                    findPic("xunlianIcon2_fz.bmp",90,   1,392 , 636,780 )
                    --点击训练按钮
                    findPic("xunliananniu_fz.bmp",90, 399,1048, 490,1112)
                end
                --]]

                --战车工坊未建地块
                if findPic_boolean("gongfangweijian_fz.bmp",90, 127,322 , 459,469 ) then
                    click(x,y)
                    chaoshi = os.time()
                end
                --点击建造
                findPic("jianzao_fz.bmp",90, 281,887 , 355,940 )
                --免费
                if findPic_boolean("mianfei5.bmp",90, 42,137,57,152) or
                findPic_boolean("mianfei.bmp",90,  40,138 ,  85,189 ) or
                findPic_boolean("mianfei1.bmp",90, 48,143 ,  83,178 ) or
                findPic_boolean("mianfeixia.bmp",90,50,260,63,269) or
                findPic_boolean("mianfei4.bmp",90,  42,137,57,152)then
                    click(x,y)
                    chaoshi = os.time()
--                    fazhantemp = fazhantemp +1
--                    return
                end
                --加速
                if findPic_boolean("jiasu_fz.bmp",90, 453,570 , 558,702 ) then
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    notifyMessage("加速退出",300)
                    logD("加速退出")
                    mSleep(1000)
                    return
                end
                --跳转红色
                if findPic_boolean("tiaozhuan_fz.bmp",90, 422,553 , 571,712 ) then
                    click(x,y)
                    mSleep(200)
                    chaoshi = os.time()
                end
                --城堡升级提示
                --if findPic_boolean("chengbaoshoushi_fz.bmp",90, 314,350 , 401,423 ) then
                --点击城堡
                findPic("chengbaodianji_fz.bmp",90, 213,417 , 298,495 )
                --点击升级城堡
                findPic("shengjiIcon_fz.bmp",90, 273,474 , 426,573 )

                --end
                --顺带收集资源
                for i= 1,5 do
                    findPic("mucai_ziyuan.bmp",80,  63,330 , 637,643 )
                    findPic("xiaomai_ziyuan.bmp",80,63,330 , 637,643 )
                end
                --农田升级
                if findPic_boolean("nongtian3ji_fz.bmp",90,  94,407 , 612,643 ) or
                findPic_boolean("nongtian3ji1_fz.bmp",90,  94,407 , 612,643 )then
                    click( 318,585 )
                    if findPic_boolean("shengjiIcon_fz.bmp",90, 313,621 , 430,731 ) then
                        click(x,y)
                        chaoshi = os.time()
                        jiasutemp = jiasutemp +1
                        notifyMessage("兵营农田升级",300)
                        logD("兵营农田升级")
                        mSleep(1000)
                    else
                        click( 318,585 )
                    end
                    findPic("shengjiIcon_fz.bmp",90, 313,621 , 430,731 )
                end
                --城墙升级
                if findPic_boolean("chengqiang_fz.bmp",90, 259,505 , 389,599 ) or
                findPic_boolean("chengqiang1ji_fz.bmp",90, 205,537 , 290,610 ) then
                    --点击城墙
                    click(x,y)
                    findPic("shengjiIcon_fz.bmp",90, 313,621 , 430,731 )
                    chaoshi = os.time()
                end
                --资源不足时获得更多
                if findPic_boolean("huodegengduo_by.bmp",90, 423,567 , 547,784 ) then
                    click(x,y)
                elseif findPic_boolean("huodegengduo1_by.bmp",90, 423,567 , 547,784 ) then
                    click(x,y)
                    --建筑升级右边
                elseif findPic_boolean("shengji_fz.bmp",90, 403,903 , 481,969 ) then
                    click(x,y)
--                    notifyMessage("正在升级退出",300)
--                    logD("正在升级退出")
--                    mSleep(1000)
--                    return
                    --建筑建造右边
                elseif findPic_boolean("jianzaoyou_fz.bmp",90, 403,906 , 481,963 ) then
                    click(x,y)
--                    notifyMessage("正在建造退出",300)
--                    logD("正在建造退出")
--                    mSleep(1000)
--                    return
                end



                --资源界面,使用资源
                if findPic_boolean("ziyuanjiemian_xy.bmp",90, 277,13  , 355,59  ) then
                    if findPic_boolean("shiyong_xy.bmp",90, 491,228 , 596,347 ) then
                        click(x,y)
                        --使用资源最大
                        if findPic_boolean("huakuai.bmp",90,  89,570 , 157,640 ) then
                            click( 347,606 )
                            findPic("shiyongziyuan.bmp",90, 281,673 , 353,726 )
                        end
                    else
                        --暗色回退
                        findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
                        --回退
                        for i = 1,3 do
                            findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                        end
                        --关闭资源界面
                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                        notifyMessage("资源不足退出",300)
                        logD("资源不足退出")
                        mSleep(1000)
                        return
                    end
                end


            end
        else
            notifyMessage("找左上角",300)
            mSleep(1000)
            --左移动
            myMove_UD(  111,220 ,529,400 ,50)
            --上移动
            myMove_RL(  300,220 ,529,785 ,50)
            mSleep(800)
        end
    end
end
--收集资源
function shouhuoziyuan()
    notifyMessage("收货资源",300)
    logD("收货资源")
    mSleep(1000)
    --暗色回退
    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
    --回退
    for i = 1,3 do
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
    end
    exception()
    local chaoshi = os.time()
    if findPic_boolean("iconditu.bmp",90,  27,1062, 108,1128) then
        local tempziyuan = 0
        while true do
            exception()
            local time = os.time()
            if time - chaoshi > 30 then
                notifyMessage("收货资源1分超时",300)
                logD("收货资源1分超时")
                mSleep(1000)
                return
            end
            if findPic_boolean("zuoxiaditu.bmp",90, 288,745 , 442,875 ) then
                notifyMessage("找到左下角地块shouhuoziyuan",300)
                logD("找到左下角地块shouhuoziyuan")
                mSleep(1000)
                --左移动次数
                local zuoyitemp = 0
                while true do
                    local time = os.time()
                    if time - chaoshi > 30 then
                        notifyMessage("收货资源超时",300)
                        logD("收货资源超时")
                        mSleep(1000)
                        return
                    end
                    exception()
                    --暗色回退
                    findPic("huituijiemianan_ziyuan.bmp",90,   7,9   ,  69,71  )
                    --界面回退
                    findPic("houtui_ziyuan.bmp",90,   8,6   ,  70,68  )
                    --小麦和木头和铁矿

                    --findPic("maitian_ziyuan.bmp",80,   1,330 , 636,970)

                    --小麦和木头和铁矿
                    if findPic_boolean("mucai_ziyuan.bmp",80,   1,330 , 636,970 ) or
                    findPic_boolean("mucai1_ziyuan.bmp",80,    1,330 , 636,970 )then
                        click(x,y)
                    elseif findPic_boolean("xiaomai_ziyuan.bmp",80,   1,330 , 636,970) then
                        click(x,y)
                    elseif findPic_boolean("tiekuang_ziyuan.bmp",80,   1,445 , 637,970 ) or
                    findPic_boolean("tiekuang1_ziyuan.bmp",80,   1,445 , 637,970 )then
                        click(x,y)
                    else
                        if tempziyuan == 0 then
                            --右移动  4次到最右边
                            myMove_UD( 480,480 , 120+math.random(-10,10),480 ,5)
                            chaoshi = os.time()
                        elseif tempziyuan == 1 then
                            --向上移动
                            myMove_RL(  120,120 ,529,450 ,10)
                            tempziyuan = tempziyuan +1
                            chaoshi = os.time()
                        elseif tempziyuan == 2 then
                            --左移动
                            myMove_UD(  120+math.random(-10,10),480 ,480,480 ,5)
                            zuoyitemp = zuoyitemp +1
                            chaoshi = os.time()
                            if zuoyitemp >=5 then
                                --暗色回退
                                findPic("huituijiemianan_ziyuan.bmp",90,   7,9   ,  69,71  )
                                --界面回退
                                findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                                findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                                notifyMessage("资源全部收集完毕",300)
                                logD("资源全部收集完毕")
                                mSleep(1000)
                                return
                            end
                        end
                    end

                    --找到右下角
                    if findPic_boolean("youxiaditu.bmp",90, 556,738 , 617,796 ) then
                        notifyMessage("找到右下角地块",300)
                        mSleep(1000)
                        tempziyuan = 1
                    end
                end
            else
                --左移动
                myMove_UD(  111,220 ,529,785 ,50)
                --下移动
                myMove_RL( 529,785 , 111,220 ,50)
            end
        end
    end
end
--升级田地和铁矿
function shengjiziyuan()
    notifyMessage("升级资源",300)
    logD("升级资源")
    mSleep(1000)
    --暗色回退
    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
    --界面回退
    for i = 1,3 do
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
    end
    exception()
    if findPic_boolean("iconditu.bmp",90,  27,1062, 108,1128) then
        local tempziyuan = 0
        local chaoshi = os.time()
        while true do
            local time = os.time()
            if time - chaoshi > 60 then
                notifyMessage("升级资源1分发展超时",300)
                logD("升级资源1分发展超时")
                mSleep(1000)
                findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                chaoshi = os.time()
                return
            end
            exception()
            --免费
            if findPic_boolean("mianfei5.bmp",90, 42,137,57,152) or
            findPic_boolean("mianfei.bmp",90,  40,138 ,  85,189 ) or
            findPic_boolean("mianfei1.bmp",90, 48,143 ,  83,178 ) or
            findPic_boolean("mianfeixia.bmp",90,50,260,63,269) or
            findPic_boolean("mianfei4.bmp",90,  42,137,57,152)then
                click(x,y)

                mSleep(1000)
                fazhantemp = fazhantemp +1
                return
            end
            if findPic_boolean("zuoxiaditu.bmp",90, 288,745 , 442,875 ) then
                notifyMessage("找到左下角地块",300)
                mSleep(1000)
                --左移动次数
                local zuoyitemp = 0
                while true do
                    local time1 = os.time()
                    if time1 - chaoshi > 120 then
                        notifyMessage("升级资源发展超时",300)
                        logD("升级资源发展超时")
                        mSleep(1000)
                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                        chaoshi = os.time()
                        return
                    end
                    exception()
                    --暗色回退
                    findPic("huituijiemianan_ziyuan.bmp",90,   7,9   ,  69,71  )

                    if findPic_boolean("gengduoxinxi.bmp",90, 140,907 , 249,952 ) then
                        --界面回退
                        findPic("huitui2.bmp",90,   6,5   ,  73,69  )
                    end


                    --木材
                    if findPic_boolean("mucai_ziyuan.bmp",80,   1,330 , 636,970 ) or
                    findPic_boolean("mucai1_ziyuan.bmp",80,    1,330 , 636,970 )then
                        click(x,y)

                        click(x,y+80)
                        --小麦
                    elseif findPic_boolean("xiaomai_ziyuan.bmp",80,   1,330 , 636,970) then
                        click(x,y)

                        click(x,y+80)
                        --铁矿
                    elseif findPic_boolean("tiekuang_ziyuan.bmp",80,   1,445 , 637,970 ) or
                    findPic_boolean("tiekuang1_ziyuan.bmp",80,   1,445 , 637,970 )then
                        click(x,y)

                        click(x,y+80)
                    else
                        if tempziyuan == 0 then
                            --右移动  4次到最右边
                            myMove_UD( 480,480 , 120+math.random(-10,10),480 ,5)
                            --下移动
                            myMove_RL( 529,785 , 111,220 ,50)
                        elseif tempziyuan == 1 then
                            --向上移动
                            myMove_RL(  120,120 ,529,450 ,10)
                            tempziyuan = tempziyuan +1
                        elseif tempziyuan == 2 then
                            --左移动
                            myMove_UD(  120+math.random(-10,10),480 ,480,480 ,5)
                            zuoyitemp = zuoyitemp +1
                            if zuoyitemp >=5 then
                                --暗色回退
                                findPic("huituijiemianan_ziyuan.bmp",90,   7,9   ,  69,71  )
                                --界面回退
                                findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                                findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                                notifyMessage("资源全部升级",300)
                                logD("资源全部升级")
                                mSleep(1000)
                                return
                            end
                        end
                    end

                    if findPic_boolean("jiasu_td.bmp",90, 455,574 , 547,702 )then
                        --界面后退
                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                        notifyMessage("加速中退出",300)
                        logD("加速中退出")
                        mSleep(1000)
                        jiasutemp = jiasutemp +1
                        return
                        --跳转后退
                    elseif findPic_boolean("tiaozhuan_td.bmp",90,455,574 , 547,702) then
                        --界面后退
                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                        --升级按钮
                    elseif findPic_boolean("shengji_td.bmp",90, 407,907 , 481,962 ) then
                        click(x,y)
--                        notifyMessage("升级中退出",300)
--                        logD("升级中退出")
--                        mSleep(1000)
--                        return

                    elseif findPic_boolean("iconshengji_td.bmp",90,   1,330 , 635,983 ) then
                        notifyMessage("点击升级",300)
                        mSleep(1000)
                        click(x,y)
                    end
                    --找到右下角
                    if findPic_boolean("youxiaditu.bmp",90, 556,738 , 617,796 ) then
                        notifyMessage("找到右下角地块",300)
                        mSleep(1000)
                        tempziyuan = tempziyuan +1
                    end
                end
            else
                --左移动
                myMove_UD(  111,220 ,529,785 ,50)
                --下移动
                myMove_RL( 529,785 , 111,220 ,50)
            end
        end
    end
end
--开放区域1
function kaifangquyu()
    notifyMessage("开放区域",300)
    logD("开放区域")
    mSleep(1000)
    local kaifang = 0
    --暗色回退
    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
    --界面回退
    for i = 1,3 do
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
    end
    exception()
    local chaoshi = os.time()
    if findPic_boolean("iconditu.bmp",90,  27,1062, 108,1128) then
        while true do
            local time = os.time()
            if time - chaoshi > 30 then
                notifyMessage("开放区域超时",300)
                logD("开放区域超时")
                mSleep(1000)
                return
            end
            if findPic_boolean("youxiaditu.bmp",90, 556,738 , 617,796 ) then
                notifyMessage("找到右下角地块",300)
                logD("找到右下角地块")
                mSleep(1000)
                --第二块开放区域
                if findPic_boolean("kaifangquyu2.bmp",90, 196,479 , 246,538 ) then
                    click(x,y)
                    mSleep(500)
                    if findPic_boolean("jiesuo_kaifang.bmp",90, 279,887 , 352,946 ) then
                        click(x,y)
                        notifyMessage("开放区域2成功",300)
                        logD("开放区域2成功")
                        mSleep(1000)
                        kaifang = kaifang +1
                        --暗色的解锁
                    elseif findPic_boolean("jiesuoan_kaifang.bmp",90,279,887 , 352,946) then
                        --界面回退
                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                        notifyMessage("资源不足无法开放区域",300)
                        logD("资源不足无法开放区域")
                        mSleep(1000)
                        kaifang = kaifang +1
                    end
                elseif findPic_boolean("weikaifang2.bmp",90, 138,425 , 201,482 ) then
                    notifyMessage("区域2未开放",300)
                    logD("区域2未开放")
                    mSleep(1000)
                end
                --上移动
                myMove_RL(  111,220 ,529,785 ,20)
                if findPic_boolean("kaifangquyu1.bmp",90,  41,623 , 354,899 ) then
                    click(x,y)
                    mSleep(500)
                    if findPic_boolean("jiesuo_kaifang.bmp",90, 279,887 , 352,946 ) then
                        click(x,y)
                        notifyMessage("开放区域1成功",300)
                        logD("开放区域1成功")
                        mSleep(1000)
                        return
                        --暗色的解锁
                    elseif findPic_boolean("jiesuoan_kaifang.bmp",90,279,887 , 352,946) then
                        --界面回退
                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                        notifyMessage("资源不足无法开放区域",300)
                        logD("资源不足无法开放区域")
                        mSleep(1000)
                        return
                    end
                end
            else
                --右移动
                myMove_UD( 529,785 , 111,220 ,50)
                --下移动
                myMove_RL( 529,785 , 111,220 ,50)
            end
        end
    end
end
--开启锤子
function kaiqichuizi()
    notifyMessage("开启锤子,建筑工人",300)
    logD("开启锤子,建筑工人")
    mSleep(1000)
    --暗色回退
    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
    --界面回退
    for i = 1,3 do
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
    end
    exception()
    local chaoshi = os.time()
    if findPic_boolean("iconditu.bmp",90,  27,1062, 108,1128) then
        while true do
            local time = os.time()
            if time - chaoshi >30  then
                notifyMessage("开启锤子超时",300)
                logD("开启锤子超时")
                mSleep(1000)
                return
            end
            if findPic_boolean("guyong.bmp",90, 274,650 , 358,710 ) then
                --点击雇佣
                click(x,y)
                mSleep(1000)
                if findPic_boolean("huodejinbi.bmp",90, 246,747 , 392,816 ) then
                    --关闭获得金币界面
                    click( 325,256 )
                    notifyMessage("金币不足",300)
                    logD("金币不足")
                    mSleep(1500)
                    return
                else
                    notifyMessage("锤子开启成功",300)
                    logD("锤子开启成功")
                    mSleep(1500)
                    return
                end
            elseif findPic_boolean("jinchuizi.bmp",90,  50,278 ,  82,305 ) then
                click(x,y)
            elseif findPic_boolean("jinchuizi1.bmp",90,   2,229 ,  97,333 ) then
                click(x,y)
            elseif findPic_boolean("jinchuizi2.bmp",90,   2,229 ,  97,333 ) then
                click(x,y)
            elseif findPic_boolean("jinchuizi3.bmp",90,   2,229 ,  97,333 ) then
                click(x,y)
            elseif findPic_boolean("jinchuizi4.bmp",90,   2,229 ,  97,333 ) then
                click(x,y)
            elseif findPic_boolean("jinchuizi5.bmp",90,   2,229 ,  97,333 ) then
                click(x,y)

            end
        end
    end
end
--领取成就
function lingquchengjiu()
    notifyMessage("领取成就奖励",300)
    logD("领取成就奖励")
    mSleep(1000)
    --暗色回退
    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
    --界面回退
    for i = 1,3 do
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
    end
    exception()
    local chaoshi = os.time()
    if findPic_boolean("iconditu.bmp",90,  27,1062, 108,1128) then
        click(  45,31  )
        while true do
            local time = os.time()
            if time - chaoshi > 60 then
                notifyMessage("领取成就奖励超时",300)
                logD("领取成就奖励超时")
                mSleep(1000)
                return
            end
            if findPic_boolean("iconchengjiu_cj.bmp",90, 121,1052, 194,1125) then
                click(x,y)
            elseif findPic_boolean("lingjiang_cj.bmp",90, 278,434 , 354,489 ) then
                click(x,y)
            else
                notifyMessage("成就领取完毕",300)
                logD("成就领取完毕")
                mSleep(1000)
                findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                return
            end
        end
    end
end
--学技能
function lingzhujineng()
    notifyMessage("学领主技能",300)
    logD("学领主技能")
    mSleep(1000)
    --暗色回退
    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
    --界面回退
    for i = 1,3 do
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
    end
    exception()
    local chaoshi = os.time()
    if findPic_boolean("iconditu.bmp",90,  27,1062, 108,1128) then
        while true do
            local time = os.time()
            if time - chaoshi >360 then
                notifyMessage("学领主技能超时",300)
                logD("学领主技能超时")
                mSleep(1000)
                return
            end
            exception()
            if findPic_boolean("chengzhutouxiang_jn.bmp",90,  21,14  ,  65,56  ) then
                click(x,y)
            elseif findPic_boolean("jinengjiemian_jn.bmp",90, 440,1044, 499,1103) then
                click(x,y)
            elseif findPic_boolean("jinengdianwei0_jl.bmp",90, 256,12  , 377,57  ) then
                notifyMessage("技能点用完",300)
                logD("技能点用完")
                --退出技能界面
                for i = 1,5 do
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                end
                return
---------是否在技能界面,进行技能学习---------------------是否在技能界面,进行技能学习-------------------------------------------------
            elseif findPic_boolean("jinengdian_jn.bmp",90, 231,10  , 338,59  ) then
                --部队负重技能
                if findPic_boolean("buduifuzhong_jnl.bmp",90, 242,198 , 396,338 ) then
                    click(x,y)
                    --全部加满
                    if findPic_boolean("quanbujiaman_jn.bmp",90, 373,714 , 463,757 ) then
                        click(x,y)
                    else
                        --暗色的回退
                        findPic("anhuitui.bmp",90,   6,6   ,  74,72  )
                    end
                end
                --点击暗色发展技能树
                findPic("fazhanshu_jna.bmp",90, 300,91  , 367,134 )
                --技能加速建造1
                if findPic_boolean("jiasujianzao_jnl.bmp",90,   3,181 , 630,503 )then
                    click(x,y)
                    --全部加满
                    findPic("quanbujiaman_jn.bmp",90, 373,714 , 463,757 )
                    --暗色的回退
                    findPic("anhuitui.bmp",90,   6,6   ,  74,72  )
                end
                --研究加速1
                if findPic_boolean("yanjiujiasu1_jn.bmp",90,   3,181 , 630,503 )then
                    click(x,y)
                    --全部加满
                    findPic("quanbujiaman_jn.bmp",90, 373,714 , 463,757 )
                    --暗色的回退
                    findPic("anhuitui.bmp",90,   6,6   ,  74,72  )
                end
                --丰收
                if findPic_boolean("fengshou_jn.bmp",90,   3,181 , 630,503 )then
                    click(x,y)
                    --全部加满
                    findPic("quanbujiaman_jn.bmp",90, 373,714 , 463,757 )
                    --暗色的回退
                    findPic("anhuitui.bmp",90,   6,6   ,  74,72  )
                end
                --
                if findPic_boolean("fengshou_jn.bmp",90,   3,181 , 630,503 )then
                    click(x,y)
                    --全部加满
                    findPic("quanbujiaman_jn.bmp",90, 373,714 , 463,757 )
                    --暗色的回退
                    findPic("anhuitui.bmp",90,   6,6   ,  74,72  )
                end







                myMove_RL(300,480,300,310,5)
                mSleep(2000)
                --暗色的回退
            elseif findPic_boolean("anhuitui.bmp",90,   6,6   ,  74,72  ) then
                click(x,y)
            end




        end 
    end

end
--判断联盟荣誉
function panduanrongyu()
    notifyMessage("判断联盟荣誉",300)
    logD("判断联盟荣誉")
    mSleep(1000)
    --暗色回退
    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
    --界面回退
    for i = 1,3 do
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
    end
    exception()
    while true do
        if findPic_boolean("lianmengshop_ry.bmp",90, 121,100 , 204,153 ) then
            mSleep(1000)
            if findPic_boolean("rongyu100K+.bmp",90, 332,212 , 345,236 ) then
                if findPicLostColor_boolean("4_ry.bmp",90, 294,209, 314,233,0xff00ff) then
                    notifyMessage("联盟荣誉400K+4",300)
                    logD("联盟荣誉400K+4")
                    mSleep(1000)
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    return 2
                elseif findPicLostColor_boolean("5_ry.bmp",90, 294,209, 314,233,0xff00ff) then
                    notifyMessage("联盟荣誉400K+5",300)
                    logD("联盟荣誉400K+5")
                    mSleep(1000)
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    return 2
                elseif findPicLostColor_boolean("6_ry.bmp",90, 294,209, 314,233,0xff00ff) then
                    notifyMessage("联盟荣誉400K+6",300)
                    logD("联盟荣誉400K+6")
                    mSleep(1000)
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    return 2
                elseif findPicLostColor_boolean("7_ry.bmp",90, 294,209, 314,233,0xff00ff) then
                    notifyMessage("联盟荣誉400K+7",300)
                    logD("联盟荣誉400K+7")
                    mSleep(1000)
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    return 2
                elseif findPicLostColor_boolean("8_ry.bmp",90, 294,209, 314,233,0xff00ff) then
                    notifyMessage("联盟荣誉400K+8",300)
                    logD("联盟荣誉400K+8")
                    mSleep(1000)
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    return 2
                elseif findPicLostColor_boolean("9_ry.bmp",90, 294,209, 314,233,0xff00ff) then
                    notifyMessage("联盟荣誉400K+9",300)
                    logD("联盟荣誉400K+9")
                    mSleep(1000)
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    return 2
                else
                    notifyMessage("联盟荣誉100K+",300)
                    logD("联盟荣誉100K+")
                    mSleep(1000)
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    return 1
                end
            else
                notifyMessage("联盟荣誉不足100K",300)
                logD("联盟荣誉不足100K")
                mSleep(1000)
                findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                return 0
            end
            --进入联盟商店
        elseif findPic_boolean("lianmeng_qc.bmp",90, 546,1070, 597,1128) then
            click(x,y)
        elseif findPic_boolean("lianmengshangdian_qc.bmp",90,  10,716 , 102,783 ) then
            click(x,y)
            mSleep(2500)
        end
    end
end
--加入联盟
function jiarulianmeng()
    notifyMessage("申请加入联盟",300)
    logD("申请加入联盟")
    mSleep(1000)
    --暗色回退
    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
    --界面回退
    for i = 1,3 do
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
    end
    exception()
    local chaoshitime = os.time()
    while true do
        exception()
        local time = os.time()
        if time - chaoshitime > 300 then
            notifyMessage("加入联盟超时",300)
            logD("加入联盟超时")
            mSleep(1000)
            restart()
            chaoshitime = os.time()
        end
        --关闭联盟提示
        if findPic_boolean("guanbitishi_lm.bmp",90, 529,298 , 583,349 ) then
            click(x,y)
        elseif findPic_boolean("iconlianmeng_lm.bmp",90, 535,1055, 601,1129) then
            click(x,y)
            --加入联盟
        elseif findPic_boolean("jiaru_qc.bmp",90, 282,857 , 356,906 ) then
            click(x,y)
        elseif findPic_boolean("lianmengshengqing_qc.bmp",90, 276,1057, 371,1121) then
            click(x,y)
            --发送申请消息
        elseif findPic_boolean("fasong_qc.bmp",90, 406,826 , 492,883 ) then
            click(x,y)
            findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
            findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
            findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
            notifyMessage("联盟已申请",300)
            logD("联盟已申请")
            mSleep(1000)
            return
            --申请消息
        elseif findPic_boolean("shenqingkuang_qc.bmp",90, 253,290 , 390,349 ) then
            click( 248,574 )
            inputText("长期在线")
            findPic("shenqingkuang_qc.bmp",90, 253,290 , 390,349 )
            --点击要加入的联盟
        elseif findPic_boolean("rumeng_qc.bmp",90, 341,735 , 394,785 ) then
            findPic("sousuo_qc.bmp",90, 513,95  , 590,143 )
            findPic("rumeng_qc.bmp",90, 341,735 , 394,785 )
        elseif findPic_boolean("jiarulianmeng_qc.bmp",90, 267,1067, 369,1122) then
            click(x,y)
            findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
            findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
            findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
            notifyMessage("联盟已加入",300)
            logD("联盟已加入")
            mSleep(1000)
            return
        elseif findPic_boolean("sousuo_qc.bmp",90, 513,95  , 590,143 ) then
            click(x,y)
        end
    end
end
--购买联盟迁城
function rongyugoumai()
    notifyMessage("联盟购买守护迁城",300)
    logD("联盟购买守护迁城")
    mSleep(1000)
    --暗色回退
    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
    --界面回退
    for i = 1,3 do
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
    end
    exception()
    --判断是否有守护
    local qc = panduanshouhu()
    --判断联盟荣誉是否有100K
    local ry = panduanrongyu()
    --点击联盟
    if findPic_boolean("lianmeng_qc.bmp",90, 546,1070, 597,1128) then
        click(x,y)
        mSleep(1000)
        if findPic_boolean("lianmengjiemian_qc.bmp",90, 271,11  , 364,61  ) then

            --购买高级迁城
            if ry == 2 then
                --关闭界面
                findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                --购买高级迁城
                goumaiqiancheng()
            elseif qc == 0 and ry == 1 then
                --关闭界面
                findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                --购买战争守护
                goumaishouhu()
            end
        elseif findPic_boolean("jiarulmjiemian_qc.bmp",90, 242,7   , 376,62  ) then
            --关闭界面
            findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
            findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
            jiarulianmeng()
        end
    end
end
--购买守护
function goumaishouhu()
    notifyMessage("购买守护",300)
    logD("购买守护")
    mSleep(1000)
    --暗色回退
    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
    --界面回退
    for i = 1,3 do
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
    end
    exception()
    local chaoshitime = os.time()
    while true do
        local time = os.time()
        if time - chaoshitime >60 then
            notifyMessage("联盟没有守护",300)
            logD("联盟没有守护")
            mSleep(1000)
            findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
            findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
            findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
            tuichulianmeng()
            mSleep(1000)
            return
        end
        --进入联盟商店界面
        if findPic_boolean("lianmengshangdian_qc.bmp",90,  10,716 , 102,783 ) then
            click(x,y)
            mSleep(2500)
        elseif findPic_boolean("lianmeng_qc.bmp",90, 546,1070, 597,1128) then
            click(x,y)
        elseif findPic_boolean("shangcheng_qc.bmp",90, 128,102 , 204,149 ) then
            if findPic_boolean("shouhu_qc.bmp",75,  28,235 , 613,1064) then
                click(x,y)
            else
                --下滑
                myMove_RL( 318,900 , 318,781 ,4)
                myMove_RL( 318,900 , 318,781 ,4)
            end
        end
        --购买守护
        if findPic_boolean("goumai_qc.bmp",90, 284,743 , 358,798 ) then
            --click(x,y)
            notifyMessage("购买守护成功",300)
            logD("购买守护成功")
            mSleep(1000)
            return
        end
    end
end
--购买高级迁城
function goumaiqiancheng()
    notifyMessage("购买高级迁城",300)
    logD("购买高级迁城")
    mSleep(1000)
    --暗色回退
    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
    --界面回退
    for i = 1,3 do
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
    end
    exception()
    local chaoshitime = os.time()
    while true do
        local time = os.time()
        if time - chaoshitime >300 then
            notifyMessage("联盟没有守护",300)
            logD("联盟没有守护")
            mSleep(1000)
            findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
            findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
            findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
            tuichulianmeng()
            mSleep(1000)
            return
        end
        --进入联盟商店界面
        if findPic_boolean("lianmengshangdian_qc.bmp",90,  10,716 , 102,783 ) then
            click(x,y)
            mSleep(2500)
        elseif findPic_boolean("lianmeng_qc.bmp",90, 546,1070, 597,1128) then
            click(x,y)
        elseif findPic_boolean("shangcheng_qc.bmp",90, 128,102 , 204,149 ) then
            if findPic_boolean("gaojiqiancheng_qc.bmp",75,  28,235 , 613,1064) then
                click(x,y)
            else
                --下滑
                myMove_RL( 318,900 , 318,781 ,4)
                myMove_RL( 318,900 , 318,781 ,4)
            end
        end
        --购买高级迁城
        if findPic_boolean("goumai_qc.bmp",90, 284,743 , 358,798 ) then
            --click(x,y)
            notifyMessage("购买高级迁城成功",300)
            logD("购买高级迁城成功")
            mSleep(1000)
            return
        end
    end
end
function tuichulianmeng()
    notifyMessage("退出联盟",300)
    logD("退出联盟")
    mSleep(1000)
    --暗色回退
    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
    --界面回退
    for i = 1,3 do
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
    end
    exception()
    local chaoshitime = os.time()
    while true do
        exception()
        local time = os.time()
        if time - chaoshitime > 300 then
            notifyMessage("退出联盟",300)
            logD("退出联盟")
            mSleep(1000)
            restart()
            chaoshitime = os.time()
            return
        end
        if findPic_boolean("lianmengguanli_lm.bmp",90, 521,1060, 581,1124) then
            click(x,y)
        elseif findPic_boolean("iconlianmeng_lm.bmp",90, 535,1055, 601,1129) then
            click(x,y)
        elseif findPic_boolean("tuichulianmeng_lm.bmp",90, 264,545 , 369,645 ) then
            click(x,y)
        elseif findPic_boolean("tuichuqueding_lm.bmp",90, 275,668 , 350,721 ) then
            click(x,y)
            notifyMessage("联盟退出成功",300)
            logD("联盟退出成功")
            mSleep(2000)
            return
        end
    end
end
--判断背包是否有随机迁城
function panduanshouhu()
    notifyMessage("判断背包迁城",300)
    logD("判断背包迁城")
    mSleep(1000)
    --打开背包界面
    if findPic_boolean("beibao_bag.bmp",90, 294,1066, 359,1128) then
        click(x,y)
        local hh = 0
        --滑动次数
        local counts = 0
        while true do
            --行方向间隔145      --列方向160
            --第一个格子坐标 100,280
            --第一个格子范围  174 343
            --点开格子
            click(101+145*hh,265)


            --使用物品
            if findPic_boolean("shouhu_pd.bmp",75,  37,377 , 158,424 ) then
                notifyMessage("找到守护",300)
                logD("找到守护")
                mSleep(1000)
                --关闭背包界面
                findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                return 1
            else
                --关闭格子
                click(101+145*hh,265)
            end


            --暗色回退
            findPic("anhuitui_bag.bmp",90,   4,4   ,73,73)
            hh = hh + 1
            if hh>=4 then
                hh = 0
                --滑动屏幕
                myMove_RL( 318,900 , 318,781 ,4)
                mSleep(500)
                counts = counts +1
                if counts >=10 then
                    notifyMessage("次数无随机迁城",300)
                    logD("次数无随机迁城")
                    mSleep(1000)
                    --关闭背包界面
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    return 0
                end
                if findPic_boolean("konggezi_bag.bmp",90,  22,191 , 177,353  ) then
                    notifyMessage("空格无随机迁城")
                    logD("空格无随机迁城")
                    mSleep(1500)
                    --关闭背包界面
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    return 0
                end
            end   
        end
    end
end

--清理背包
function clearBag()
    notifyMessage("清理背包",300)
    logD("清理背包")
    mSleep(1000)
    local chaoshi = os.time()
    --暗色回退
    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
    --界面回退
    for i = 1,3 do
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
    end
    exception()
    --打开背包界面
    if findPic_boolean("beibao_bag.bmp",90, 294,1066, 359,1128) then
        click(x,y)
        local hh = 0
        --滑动次数
        local counts = 0
        local beibaocishu = 0
        while true do
            local time = os.time()
            if time - chaoshi > 300 then
                notifyMessage("清理背包超时",300)
                logD("清理背包超时")
                mSleep(1000)
            end
            if findPic_boolean("wuping_bag.bmp",90, 285,13  , 356,58  ) or
            findPic_boolean("wupingan_bag.bmp",90, 285,13  , 356,58  )then
                exception()
                --行方向间隔145      --列方向160
                --第一个格子坐标 100,280
                --第一个格子范围  174 343
                local temp = 0
                --点开格子
                click(101+145*hh,265)


                --使用物品
                if findPic_boolean("cailiaoxiang1h_bag.bmp",75,  13,356 , 319,558 ) then
                    temp = 1
                    notifyMessage("找到",300)
                    mSleep(1000)
                elseif findPic_boolean("xiaocailiao1h_bag.bmp",75,  13,356 , 319,558 ) then
                    temp = 1
                    notifyMessage("找到",300)
                    mSleep(1000)
                elseif findPic_boolean("jianzhuqiyue_bag.bmp",75,  37,375 , 152,425 ) then
                    temp = 1
                    notifyMessage("找到",300)
                    mSleep(1000)
                elseif findPic_boolean("tili_bag.bmp",75,  93,450 , 202,495 ) then
                    temp = 1
                    notifyMessage("找到",300)
                    mSleep(1000)
                elseif findPic_boolean("ziyuanbaoxiang_bag.bmp",70,  68,380 , 192,428 ) then
                    temp = 1    
                    notifyMessage("找到",300)
                    mSleep(1000)
                elseif findPic_boolean("shiyonghou_bag.bmp",75,  35,454 , 117,493 ) or
                findPic_boolean("shiyonghou1_bag.bmp",75,  35,454 , 117,493 ) then
                    temp = 1    notifyMessage("找到",300)
                    mSleep(1000)
                elseif findPic_boolean("ziyuanbaoxiang_bag.bmp",75,  77,380 , 191,423 ) then
                    temp = 1    
                    notifyMessage("找到",300)
                    mSleep(1000)
                elseif findPic_boolean("VIP_bag.bmp",75,  33,379 , 104,422 ) then
                    temp = 1    
                    notifyMessage("找到",300)
                    mSleep(1000)
                elseif findPic_boolean("VIPdianshu_bag.bmp",75,  37,455 ,  96,493 ) then
                    temp = 1    
                    notifyMessage("找到",300)
                    mSleep(1000)



                else
                    --关闭格子
                    click(101+145*hh,265)
                end

                if  temp == 1 then
                    --使用
                    if findPic_boolean("shiyong_bag.bmp",80, 448,463 , 595,537 ) then
                        click(x,y)
                        mSleep(1500)
                        hh = hh -1
                    end
                    --使用资源最大
                    if findPic_boolean("huakuai.bmp",90,  89,570 , 157,640 ) then
                        click( 347,606 )
                        if findPic_boolean("shiyongziyuan.bmp",90, 281,673 , 353,726 ) then
                            click(x,y)
                            mSleep(1500)
                        end
                    end
                    --确定使用
                    if findPic_boolean("quedingshiyong_bag.bmp",90, 267,662 , 356,724 ) then
                        click(x,y)
                        mSleep(2500)
                    end
                end
                --暗色回退
                findPic("anhuitui_bag.bmp",90,   4,4   ,73,73)
                hh = hh + 1
                if hh>=4 then
                    hh = 0
                    --滑动屏幕
                    myMove_RL( 318,900 , 318,781 ,4)
                    mSleep(500)
                    counts = counts +1
                    if counts >=5 then
                        notifyMessage("退出清理背包",300)
                        logD("退出清理背包")
                        mSleep(1000)
                        --关闭背包界面
                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                        return
                    end
                    if findPic_boolean("konggezi_bag.bmp",90,  22,191 , 177,353  ) then
                        notifyMessage("清理背包完毕",300)
                        logD("清理背包完毕")
                        mSleep(1000)
                        --关闭背包界面
                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                        return 
                    end
                end
            else
                beibaocishu = beibaocishu +1
                if beibaocishu >= 5 then
                    notifyMessage("退出背包清理",300)
                    logD("退出背包清理")
                    mSleep(1000)
                    return
                end

            end
        end
    end
end

--领取邮箱物品
function lingquyoujian()
    notifyMessage("邮件领奖",300)
    logD("邮件领奖")
    mSleep(1000)
    local chaoshitime = os.time()
    --暗色回退
    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
    --界面回退
    for i = 1,3 do
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
    end
    exception()
    while true do
        local time = os.time()
        if time - chaoshitime >60 then
            notifyMessage("邮件领奖1分超市",300)
            logD("邮件领奖1分超市")
            mSleep(1000)
            return
        end
        exception()
        --点击任务图标
        if findPic_boolean("youjian.bmp",90, 422,1069, 480,1124) then
            click(x,y)
            if findPic_boolean("xitongxinxi.bmp",90,  16,596 ,  90,664 ) then
                click(x,y)
                while true do
                    --超时
                    local time = os.time()
                    if time - chaoshitime >120 then
                        notifyMessage("邮件超时",300)
                        logD("邮件超时")
                        chaoshitime = os.time()
                        return
                    end
                    exception()
                    if findPic_boolean("youjian.bmp",90, 422,1069, 480,1124) then
                        click(x,y)
                    end
                    --系统邮件
                    if findPic_boolean("xixin_xtyj.bmp",90,  22,107 ,  99,172 ) then
                        click(x,y)
                    elseif findPic_boolean("VIP_xtyj.bmp",90,  16,106 , 112,177 ) then
                        click(x,y)
                    elseif findPic_boolean("xitongyjjiemian_xtyj.bmp",90, 278,10  , 362,59  ) then
                        findPic("youjianhoutui_xtyj.bmp",90,   7,5   ,  70,71  )
                        notifyMessage("系统邮件领取完毕",300)
                        logD("系统邮件领取完毕")
                        mSleep(1000)
                    end
                    --活动邮件
                    if findPic_boolean("heima_xtyj.bmp",90,   1,87  , 118,194 ) then
                        click(x,y)
                    elseif findPic_boolean("huodongxinxi_xtyj.bmp",90,   1,87  , 118,194 ) then
                        click(x,y)
                    elseif findPic_boolean("huodong_xtyj.bmp",90,  16,390 ,  95,469 ) then
                        click(x,y)
                    elseif findPic_boolean("huodongjiemian_xtyj.bmp",90, 277,12  , 360,64  ) then
                        findPic("youjianhoutui_xtyj.bmp",90,   7,5   ,  70,71  )
                        notifyMessage("活动邮件领取完毕",300)
                        logD("活动邮件领取完毕")
                        mSleep(1000)
                    end

                    --收取
                    if findPic_boolean("shouqu_xtyj.bmp",75, 241,430 , 382,1044) then
                        click(x,y)
                        chaoshitime = os.time()
                    elseif findPic_boolean("shouquVIP_xtyj.bmp",75, 237,328 , 398,1056) then
                        click(x,y)
                        chaoshitime = os.time()
                    elseif findPic_boolean("shanchu_xtyj.bmp",90, 411,1059, 465,1125) or
                    findPic_boolean("shanchu2_xtyj.bmp",90, 411,1059, 465,1125) or
                    findPic_boolean("shanchu1_xtyj.bmp",90, 483,1060, 533,1125) then
                        --下移动
                        myMove_RL(  300,785 ,529,280 ,50)
                        mSleep(1000)
                        --收取
                        if findPic_boolean("shouqu_xtyj.bmp",75, 241,430 , 382,1044) then
                            click(x,y)
                            chaoshitime = os.time()
                        elseif findPic_boolean("shouquVIP_xtyj.bmp",75, 237,328 , 398,1056) then
                            click(x,y)
                            chaoshitime = os.time()
                        else
                            findPic("shanchu_xtyj.bmp",90, 411,1059, 465,1125)
                            findPic("shanchu1_xtyj.bmp",90, 483,1060, 533,1125)
                        end
                        --确定删除
                    elseif findPic_boolean("quedingshanchu_xtyj.bmp",90, 276,657 , 350,724 ) then
                        click(x,y)
                    end


                    --游戏工作室邮件清理
                    if findPic_boolean("gongzuo_yj.bmp",90,  17,498 ,  92,567 ) then
                        click(x,y)
                    elseif findPic_boolean("gongzuoxinxi_yj.bmp",90,  14,94  , 101,172 ) then
                        click(x,y)
                    elseif findPic_boolean("liewangjiemian_yj.bmp",90, 147,13  , 231,60  ) then
                        findPic("youjianhoutui_xtyj.bmp",90,   7,5   ,  70,71  )
                        notifyMessage("工作室邮件领取完毕",300)
                        logD("工作室邮件领取完毕")
                        mSleep(1000)
                    end


                    --联盟邮件清理
                    if findPic_boolean("lianmeng_yj.bmp",90,   6,181 ,  92,258 ) then
                        click(x,y)
                    elseif findPic_boolean("lianmengyoujian_yj.bmp",90,  14,108 ,  94,166 ) then
                        click(x,y)
                    elseif findPic_boolean("lianmengyjjiemian_yj.bmp",90, 274,11  , 361,60  ) then
                        for i = 1,5 do
                            findPic("youjianhoutui_xtyj.bmp",90,   7,5   ,  70,71  )
                        end
                        notifyMessage("联盟邮件领取完毕",300)
                        logD("联盟邮件领取完毕")
                        mSleep(1000)
                        return
                    end



                end
            end
        end


    end
end
--领取任务奖励
function renwulingjiang()
    notifyMessage("任务领奖",300)
    logD("任务领奖")
    mSleep(1000)
    local chaoshitime = os.time()
    --暗色回退
    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
    --界面回退
    for i = 1,3 do
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
    end
    exception()
    while true do
        exception()
        if findPic_boolean("renwubaoxiang.bmp",90, 509,128 , 605,208 ) then
            chaoshitime = os.time()
            click(x,y)
        elseif findPic_boolean("renwulingjiang_rw.bmp",90, 498,642 , 568,700 ) then
            click(x,y)
            chaoshitime = os.time()
            --任务领奖界面
        elseif findPic_boolean("renwulingjiang.bmp",90, 492,383 , 569,438 ) then
            click(x,y)
            chaoshi = os.time()
            if findPic_boolean("renwulingjiang1.bmp",90, 502,848 , 573,912 ) or
            findPic_boolean("renwulingjiang2.bmp",90, 495,1062, 577,1123) then
                click(x,y)
                chaoshi = os.time()
            end
        elseif findPic_boolean("queding.bmp",90, 274,668 , 358,724 ) then
            click(x,y)
        elseif findPic_boolean("renwubaoxianglingjiang.bmp",90, 262,848 , 359,906 ) then
            chaoshi = os.time()
            click(x,y)
        elseif findPic_boolean("renwuqianwang.bmp",90, 492,383 , 569,438) then
            --暗色回退
            findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
            --界面回退
            for i = 1,3 do
                findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
            end
            notifyMessage("领取完毕",300)
            logD("领取完毕")
            mSleep(1000)
            return
        elseif findPic_boolean("iconrenwu.bmp",90, 169,1056, 242,1128) then
            click(x,y)
        end
        local time = os.time()
        if time - chaoshitime >60 then
            notifyMessage("任务领奖超时",300)
            logD("任务领奖超时")
            chaoshitime = os.time()
            mSleep(1000)
            restart()
            mSleep(10000)
        end
    end
end
--获取文件中的账号
function getAccount()
    --获取文件中的微博账号
    local file,line
    local temp = {"1","2"}
    local counts = 0
    file = io.open("/var/touchelf/scripts/accounts.txt","r")
    for line in file:lines() do
        counts = counts +1
        temp[counts] = line
        notifyMessage(counts.."---"..temp[counts])
        mSleep(1500)
    end 	
    file:close()
    return temp
end
--读令牌参数
function readyindao()
    local file,temp
    file = io.open("/var/touchelf/scripts/yindao.txt","r")
    if file == nil then
        return 0
    end
    for line in file:lines() do
        temp = line
    end
    file:close()
    return temp
end
--绑定微博账号
function bindBlog()
    notifyMessage("微博绑定",300)
    logD("微博绑定")
    mSleep(1000)
    local chaoshi = os.time()
    local accounts = getAccount()
    --暗色回退
    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
    --界面回退
    for i = 1,3 do
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
    end
    exception()
    while true do
        local time = os.time()
        if time - chaoshi > 240 then
            notifyMessage("微博绑定超时重启",300)
            logD("微博绑定超时重启")
            restart()
        end
        exception()
        if findPic_boolean("iconditu.bmp",90,  27,1062, 108,1128) then
            click(  44,27  )
        elseif findPic_boolean("jiechuweibo.bmp",90, 268,299 , 429,356 ) then
            notifyMessage("微博绑定成功",300)
            logD("微博绑定成功")
            mSleep(1000)
            for i = 1,5 do
                findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
            end
            return
        elseif findPic_boolean("shezhi.bmp",90, 553,1052, 631,1130) then
            click(x,y)
        elseif findPic_boolean("zhanghaoshezhi.bmp",90,  47,225 , 146,320 ) then
            click(x,y)
        elseif findPic_boolean("bangdingzhanghao.bmp",90, 262,472 , 380,522 ) then
            click(x,y)
        elseif findPic_boolean("weibobangding.bmp",90, 303,304 , 420,349 ) then
            click(x,y)
        elseif findPic_boolean("accountIcon.bmp",90,  10,450 ,  82,532 ) then
            click( 205,491 )
            inputText("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b")
            mSleep(600)
            --输入账号
            inputText(accounts[1])
            mSleep(1000)
            if findPic_boolean("pwd.bmp",90,   9,396 ,  86,476 ) then
                click( 205,441 )
                inputText("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b")
                mSleep(600)
                --输入密码
                inputText(accounts[2])
                mSleep(1000)
                --识别验证码
                shibiema()
                mSleep(1500)
                if findPic_boolean("huanyizhang.bmp",90, 225,398 , 358,474 ) then
                    click( 147,529 )
                    --输入验证码
                    inputText("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b")
                    mSleep(600)
                    inputText(code)
                    mSleep(600)
                    if findPic_boolean("weibodenglu.bmp",90, 248,438 , 395,523 ) then
                        click(x,y)
                    end
                end
            end
            mSleep(2000)
            --如果绑定成功
            if findPic_boolean("bangdingchenggong.bmp",90, 366,160 , 478,263 ) then
                if findPic_boolean("chenggongqueren.bmp",90, 242,521 , 380,605 ) then
                    click(x,y)
                    mSleep(1500)
                    findPic_boolean("guanbiweibo.bmp",90,   3,7   ,  96,78  )
                end
            else
                --关闭微博登陆界面
                findPic("guanbiweibo.bmp",90,   3,7   ,  96,78  )
            end
        end
    end
end
--验证码识别
function shibiema()
    mSleep(1500)
    cloudOcrInit(0)
    code = cloudOcrText("jdwl2014|5C10F12D6EA33ED6","3005",   2,395 , 212,476 ,600)
    if code == "" then
        notifyMessage("识别失败");
    else
        notifyMessage(string.format("识别成功: %s", code));
    end
    mSleep(1200)
end
--设置选项
function shezhi()
    notifyMessage("进行设置",300)
    logD("进行设置")
    mSleep(1000)
    --暗色回退
    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
    --界面回退
    for i = 1,3 do
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
    end
    exception()
    local chaoshi = os.time()
    while true do
        exception()
        local time = os.time()
        if time - chaoshi > 120 then
            notifyMessage("设置超时",300)
            logD("设置超时")
            mSleep(1000)
            return
        end
        --判断设置是否全关闭
        if findPic_boolean("iconditu.bmp",90,  27,1062, 108,1128) then
            if not findPic_boolean("shuoming.bmp",90,  23,535 ,  77,587 ) and 
            not findPic_boolean("tishi.bmp",80,   5,906 ,  72,974 ) then
                notifyMessage("设置完毕",300)
                logD("设置完毕")
                mSleep(1000)
                return
            end
        end
        if findPic_boolean("shuoming.bmp",90,  23,535 ,  77,587 ) then
            click(x,y)
        elseif findPic_boolean("quedingshuoming.bmp",90, 280,664 , 353,723 ) then
            click(x,y)
        elseif findPic_boolean("guanbibangzhu.bmp",90,  17,23  ,  85,63  ) then
            click(x,y)
        elseif findPic_boolean("iconditu.bmp",90,  27,1062, 108,1128) then
            click(  48,30  )
        elseif findPic_boolean("shezhi.bmp",90, 553,1052, 631,1130) then
            click(x,y)
        elseif findPic_boolean("xuanxiang.bmp",90,  47,402 , 146,497 ) then
            click(x,y)
        elseif findPic_boolean("shezhihuakuai.bmp",90, 306,196 , 380,263 ) then
            click(x,y)
            click( 343,300)
        elseif findPic_boolean("shezhihuakuai3.bmp",90, 303,497 , 378,571 ) then
            click(x,y)
        elseif findPic_boolean("shezhihuakuai4.bmp",90, 307,739 , 380,818 ) then
            click(x,y)
        elseif findPic_boolean("xuanxiangjiemian.bmp",90, 281,11  , 351,56  ) then
            for i = 1,4 do
                findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
            end
        end
    end
end
--幸运轮盘
function lunpan()
    notifyMessage("幸运轮盘",300)
    logD("幸运轮盘")
    mSleep(1000)
    while true do
        if findPic_boolean("zuoshangditu.bmp",90,  43,607 , 110,674 ) then
            click(x,y)
            notifyMessage("找到左上角",300)
            logD("找到左上角")
            mSleep(1000)
            while true do
                if findPic_boolean("iconlunpan.bmp",90, 278,861 , 376,949 ) then
                    click(x,y)
                elseif findPic_boolean("lunpanfangzi.bmp",90, 176,801 , 267,876 ) then
                    click(x,y)
                end


                if findPic_boolean("bencimianfei.bmp",90, 308,828 , 383,868 ) then
                    --滑动轮盘
                    myMove_UD( 500,785, 250,220  ,50)
                    mSleep(5000)
                elseif findPic_boolean("tongbibuzu.bmp",90, 269,1037, 353,1083) then
                    --轮盘界面后退
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                    notifyMessage("铜币不足退出轮盘",300)
                    logD("铜币不足退出轮盘")
                    mSleep(1000)
                    return
                elseif findPic_boolean("mianfeianniu.bmp",90, 271,668 , 376,723 ) then
                    click(x,y)
                    --确定放弃
                elseif findPic_boolean("quedingfangqi.bmp",90, 264,669 , 365,726 ) then
                    click(x,y)
                    --幸运宝箱提示
                elseif findPic_boolean("baoxiangtishi.bmp",90,  62,127 , 106,168 ) then
                    click(x,y)
                elseif findPic_boolean("xipai.bmp",90, 231,1017, 288,1062) then
                    click(x,y)
                elseif findPic_boolean("fangqi.bmp",90, 284,1010, 357,1065) then
                    if findPic_boolean("fanpai.bmp",90, 294,570 , 341,625 ) then
                        click(x,y)
                    elseif findPic_boolean("fangqi.bmp",90, 284,1010, 357,1065) then
                        click(x,y)
                    end
                end
            end
        else
            notifyMessage("找左上角",300)
            mSleep(1000)
            --左移动
            myMove_UD(  111,220 ,529,400 ,50)
            --上移动
            myMove_RL(  300,220 ,529,785 ,50)
            mSleep(800)
        end
    end
end
--新手引导
function yindao()
    local renwulingjiang = 0
    local yindao = readyindao()
    local xinshoulibao = 0
    local daye = 0
    local chaoshitime = os.time()
    notifyMessage("引导开始",300)
    logD("引导开始")
    mSleep(1000)
    --暗色回退
    findPic("jiemianhoutuian_xy.bmp",90,   7,9   ,  69,71  )
    --界面回退
    for i = 1,3 do
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
    end
    exception()
    if yindao == 0 then
        while true do
            --超时
            local time = os.time()
            if time - chaoshitime >600 then
                notifyMessage("引导超时重启",300)
                logD("引导超时重启")
                mSleep(1000)
                chaoshitime = os.time()
                restart()
            end
            exception()
            --收货
            findPic("shouhuo_yd.bmp",90, 251,755 , 327,811 )
            if findPic_boolean("guyong.bmp",90, 274,650 , 358,710 ) then
                click(  40,943 )
            end
            --地图
            if findPic_boolean("iconditu.bmp",90,  27,1062, 108,1128) then
                --小麦和木头和铁矿
                findPic("mucai1_ziyuan.bmp",80,    1,330 , 636,970 )
                findPic("xiaomai_ziyuan.bmp",80,   1,330 , 636,970)
                findPic("tiekuang1_ziyuan.bmp",80,   1,445 , 637,970 )

                findPic("mucai1_ziyuan.bmp",80,    1,330 , 636,970 )
                findPic("maitian_ziyuan.bmp",80,   1,330 , 636,970)
                findPic("tiekuang1_ziyuan.bmp",80,   1,445 , 637,970 )
            end
            if xinshoulibao == 0 then
                --使用新手礼包
                if findPicLostColor_boolean("3jichengzhu_yd.bmp",90,   5,53  ,   19,68  ,0xFF00FF) then
                    local libaotime = os.time()
                    while true do
                        --打开背包
                        if findPic_boolean("beibao_bag.bmp",90, 287,1052, 372,1132) then
                            click(x,y)
                            mSleep(1000)
                            if findPic_boolean("beibaojiemian.bmp",90, 276,12  , 356,58  ) then
                                xinshoulibao = xinshoulibao +1
                            end
                            --使用新手礼包
                        elseif findPic_boolean("shiyong_xishoubag.bmp",90, 480,471 , 560,528 ) then
                            click(x,y)
                            --界面后退
                            findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                            xinshoulibao = xinshoulibao +1
                            notifyMessage("使用新手礼包",300)
                            logD("使用新手礼包")
                            mSleep(1000)
                            break
                        elseif findPic_boolean("xinshoulibao_bag.bmp",90,  53,249 , 123,318 ) then
                            click(x,y)
                        end

                        --超时1分钟
                        local time2 = os.time()
                        if time2 - libaotime >40 then
                            --界面后退
                            findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
                            break
                        end
                    end
                end
            end
            --关闭活动界面
            if findPic_boolean("huodongzhongxin.bmp",90, 252,13  , 385,60  ) or
            findPic_boolean("gengduoxinxi_yd.bmp",90, 271,907 , 375,951 ) or
            findPic_boolean("gengduoxinxi1_yd.bmp",90, 386,906 , 502,955 )then
                --界面回退
                findPic("huitui2.bmp",90,   6,5   ,  73,69  )
            end

            --主动技能
            if findPic_boolean("zhudongjineng_yd.bmp",90, 256,751 , 378,798 ) then
                click(  40,944 )
            end
            if findPic_boolean("bingxiangqing_yd.bmp",90, 278,115 , 345,161 ) then
                click( 590,144 )
            end
            --点击农田
            if findPic_boolean("nongtiantishi_yd.bmp",90, 424,408 , 543,458 ) then
                click( 319,564 )
                --找一级怪  并点击攻击
            elseif findPic_boolean("ditutuzhi.bmp",90,   4,881 ,  89,971 ) and
            findPicLostColor_boolean("3jichengzhu_yd.bmp",90,   5,53  ,   19,68  ,0xFF00FF) then
                if daye <= 0 then

                    if not findPic_boolean("dayejiasu.bmp",90, 179,134 , 233,170 ) and
                    not findPic_boolean("fanhui_cj.bmp",90, 169,192 , 241,230 ) and
                    not findPic_boolean("fanhui1_cj.bmp",90, 169,192 , 241,230 ) and
                    not findPic_boolean("zhanlingnongtian.bmp",90, 268,536 , 340,586 )then
                        notifyMessage("找怪",300)
                        logD("找怪")
                        mSleep(1000)
                        move_rec(300,500,200,300,20)

                    end
                    --退出打野界面
                elseif findPic_boolean("iconfanhuichengbao.bmp",90,  26,1065,  98,1124) then
                    click(x,y)
                end
            end 


            --出征
            if findPic_boolean("chuzhengjiemian.bmp",90, 283,12  , 357,60  ) then
                --点击出征按钮
                if findPic_boolean("chuzhenganniu.bmp",90, 420,1033, 511,1083) then
                    click(x,y)
                    mSleep(1000)
                    if findPic_boolean("dayejiasu.bmp",90, 179,134 , 233,170 ) or
                    findPic_boolean("fanhui_cj.bmp",90, 169,192 , 241,230 ) or
                    findPic_boolean("fanhui1_cj.bmp",90, 169,132 , 241,230 )then
                        daye = daye +1
                    end
                    findPic("iconfanhuichengbao.bmp",90,  26,1065,  98,1124)
                end
            elseif findPic_boolean("ziyuanlifu.bmp",90,  90,98  , 232,250 ) then
                click(x,y)
                chaoshitime = os.time()
            elseif findPic_boolean("tiaoguoduihuanv.bmp",90,  80,304 , 129,361 ) then
                findPic("shouhuo.bmp",90, 260,760 , 316,811 )
                findPic("tiaoguoduihuanv.bmp",90,  80,304 , 129,361 )
            elseif findPic_boolean("tiaoguonver.bmp",90, 173,434 , 213,492 ) then
                click(x,y)
                chaoshitime = os.time()
            elseif findPic_boolean("tiaoguoshibing.bmp",90,  70,420 , 128,485 )  then
                click(x,y)
                chaoshitime = os.time()
            elseif findPic_boolean("tiaoguolaotou.bmp",90, 423,415 , 486,497 )  then
                click(x,y)
                chaoshitime = os.time()
            elseif findPic_boolean("tiaoguolaotou1.bmp",90, 420,416 , 493,494 ) then
                click(x,y)
                chaoshitime = os.time()
            elseif findPic_boolean("jiasuhong.bmp",90, 461,572 , 519,611 ) or
            findPic_boolean("tiaozhuanhong.bmp",90, 461,572 , 519,609 ) then
                findPic("huitui3.bmp",90,   3,4   ,  73,72  )
                findPic("huitui3.bmp",90,   3,4   ,  73,72  )
                findPic("huitui3.bmp",90,   3,4   ,  73,72  )
                mSleep(500)
            elseif findPic_boolean("shengjianniu.bmp",90, 415,896 , 471,951 ) then
                if findPic_boolean("huodegengduo.bmp",90, 428,613 , 550,710 ) then
                    click(x,y)
                else
                    findPic("shengjianniu.bmp",90, 415,896 , 471,951 )
                end
            elseif findPic_boolean("gengduoxinxi.bmp",90, 140,907 , 249,952 ) then
                --界面回退
                findPic("huitui2.bmp",90,   6,5   ,  73,69  )
                --关闭世界地图玩法介绍
            elseif findPic_boolean("wanfajieshao.bmp",90, 571,147 , 626,199 ) then
                click(x,y)
            elseif findPic_boolean("renwujiemian.bmp",90, 280,8   , 352,59  ) then
                findPic("huitui2.bmp",90,   6,5   ,  73,69  )
                findPic("huitui2.bmp",90,   6,5   ,  73,69  )
                findPic("huitui2.bmp",90,   6,5   ,  73,69  )
                --跳过剧情
            elseif findPic_boolean("tiaoguojuqing.bmp",90, 541,69  , 601,115 ) then
                click(x,y)

            elseif findPicLostColor_boolean("shengjiBY4ji.bmp",90, 119,920 , 234,957 ) then
                notifyMessage("引导完成",300)
                logD("引导完成")
                mSleep(1000)
                local file = assert(io.open("/var/touchelf/scripts/yindao.txt", 'w'))
                --写入时光参数
                file:write("1")
                file:close()
                mSleep(5500)
                return
            elseif findPic_boolean("shengjibachang2ji.bmp",90, 282,648 , 358,729 ) then
                click(x,y)
            elseif findPic_boolean("xunlian+2.bmp",90, 259,353 , 379,475 ) then
                click(x,y)
            elseif findPic_boolean("lingqujiangli.bmp",90, 268,615 , 370,665 ) then
                click(x,y)
            elseif findPic_boolean("baoxiang.bmp",90, 272,414 , 342,472 ) then
                click(x,y)

            elseif findPic_boolean("liangjineng.bmp",90, 461,1061, 508,1103) then
                click(x,y)
            elseif findPic_boolean("jiasujiemian_yd.bmp",90, 235,249 , 397,309 ) then
                findPic("jiasushiyong.bmp",90, 285,767 , 356,826 )
                findPic("quedingshiyong.bmp",90, 282,660 , 349,722 )
            elseif findPic_boolean("jinengdian.bmp",90, 240,13  , 337,53  ) then
                findPic("huitui3.bmp",90,   3,4   ,  73,72  )
                findPic("huitui3.bmp",90,   3,4   ,  73,72  )
                findPic("huitui3.bmp",90,   3,4   ,  73,72  )
            elseif findPic_boolean("touxiang.bmp",90,   9,45  ,  35,79  ) and
            findPic_boolean("anditu.bmp",90,  39,1067,  88,1110) then
                click(  42,30  )
            elseif findPic_boolean("huakuai.bmp",90,  89,570 , 157,640 ) then
                click( 347,606 )
                findPic("shiyongziyuan.bmp",90, 281,673 , 353,726 )
            elseif findPic_boolean("jianshang7.bmp",90, 566,133 , 614,188 ) then
                click( 590,35  )

            elseif findPic_boolean("duihua.bmp",90, 186,507 , 256,548 ) then
                click(x,y)
                chaoshitime = os.time()
            elseif findPic_boolean("duihuanv.bmp",90,  84,403 , 135,466 ) then
                click(x,y)
                chaoshitime = os.time()
            elseif findPic_boolean("qiandaojiemian.bmp",90, 248,336 , 388,389 ) then
                if findPic_boolean("shouquwuzi1.bmp",90, 265,800 , 386,864 ) then
                    click(x,y)
                else
                    click( 616,182 )
                end

            elseif findPic_boolean("majiuxunlian.bmp",90, 265,393 , 373,494 ) then
                click(x,y)


            elseif findPic_boolean("bachangzhaopai.bmp",90, 289,405 , 355,450 ) or
            findPicLostColor_boolean("bachangzhaopai1.bmp",90, 289,405 , 355,450 ) then
                notifyMessage("靶场",300)
                mSleep(800)
                if findPic_boolean("jinbijiasu.bmp",90, 313,681 , 425,785 )or
                findPicLostColor_boolean("bachang3ji.bmp",90, 156,915 , 240,962 ,0xFF00FF) then
                    --while true do
                    notifyMessage("引导完成",300)
                    logD("引导完成")
                    mSleep(1000)
                    renwulingjiang = renwulingjiang +1
                    yindao = yindao + 1

                    local file = assert(io.open("/var/touchelf/scripts/yindao.txt", 'w'))
                    --写入参数
                    file:write("1")
                    file:close()
                    mSleep(5500)
                    return
                    --end
                end

            elseif findPic_boolean("chengbaozhaopai.bmp",90, 289,247 , 349,286 ) and
            findPic_boolean("jiasuchengbao.bmp",85, 365,518 , 480,612 ) then
                notifyMessage("加速城堡",300)
                mSleep(1000)
                --加速城堡
                findPic("jiasuchengbao.bmp",85, 365,518 , 480,612 )
                mSleep(1000)
                --findPic("1shijiasu.bmp",90, 271,440 , 374,547 )
                findPic("jiasushiyong.bmp",90, 285,767 , 356,826 )
                findPic("jiasushiyong.bmp",90, 285,767 , 356,826 )
                findPic("quedingshiyong.bmp",90, 282,660 , 349,722 )
            elseif findPic_boolean("jianxia.bmp",90, 299,385 , 345,453 ) then
                findPic("dikuai.bmp",90, 267,522 , 364,614 )
            elseif findPic_boolean("jianxia1.bmp",90, 301,784 , 342,843 ) then
                findPic("jianzao.bmp",90, 291,879 , 345,930 )
            elseif findPic_boolean("jianxia2.bmp",90, 427,804 , 469,858 ) then
                findPic("jianzao1.bmp",90, 417,896 , 472,954 )
            elseif findPic_boolean("jianxia3.bmp",90, 301,347 , 343,404 ) then
                findPic("dikuai1.bmp",90, 258,534 , 364,601 )
            elseif findPic_boolean("jianzuo.bmp",90, 373,543 , 439,585 ) then
                findPic("majiu.bmp",90, 220,514 , 285,551 )
            elseif findPic_boolean("jianshang.bmp",90, 422,803 , 464,865 ) then
                findPic("xunlian+.bmp",90, 393,638 , 503,748 )
            elseif findPic_boolean("jianxia4.bmp",90, 431,922 , 472,978 ) then
                findPic("xunlian.bmp",90, 424,1045, 475,1095)
            elseif findPic_boolean("jianxia5.bmp",90, 191,942 , 235,991 ) then
                findPic("renwu.bmp",90, 166,1056, 259,1134)
            elseif findPic_boolean("jianshang1.bmp",90, 509,507 , 556,556 ) then
                findPic("lingjiang.bmp",90, 506,372 , 564,428 )
            elseif findPic_boolean("shangjian.bmp",90,  16,130 ,  59,178 ) then
                findPic("huitui.bmp",90,   5,3   ,  76,74  )
            elseif findPicLostColor_boolean("jianzaobachang.bmp",90, 149,916 , 216,958 ) then
                click(x,y)
                findPic("dikuai3.bmp",90, 308,815 , 366,859 )
            elseif findPic_boolean("shoushijiaochang.bmp",90, 339,429 , 423,497 ) then
                findPic("jiaochangdikuai.bmp",90, 286,546 , 343,591 )
            elseif findPic_boolean("jianzao2.bmp",90, 290,875 , 346,931 ) then
                click(x,y)
                chaoshitime = os.time()
            elseif findPic_boolean("xinshouremai.bmp",90, 251,169 , 387,219 ) then
                click( 560,198 )
            elseif findPic_boolean("xinshouremai1.bmp",90, 252,289 , 366,329 ) then
                click( 567,266 )
            elseif findPic_boolean("zuixinhuodong.bmp",90, 255,463 , 357,503 ) then
                click( 576,294 )
            elseif findPic_boolean("jianzao3.bmp",90, 415,898 , 471,951 ) then
                click(x,y)
                chaoshitime = os.time()
            elseif findPic_boolean("jianxia6.bmp",90,  45,953 ,  89,1013) then
                findPic("ditu.bmp",90,  11,1060, 121,1130)

            elseif findPic_boolean("jianshang2.bmp",90, 290,653 , 334,698 ) then
                findPic("zhanlingnongtian.bmp",90, 268,536 , 340,586 )
            elseif findPic_boolean("jianshang3.bmp",90, 437,700 , 480,749 )then
                findPic("zhanling.bmp",90, 430,545 , 485,606 )
            elseif findPic_boolean("jianxia7.bmp",90, 446,902 , 488,938 )then
                findPic("chuzheng.bmp",90, 438,1035, 499,1079)
            elseif findPic_boolean("jianxia8.bmp",90,  47,938 ,  85,970 ) then
                --findPic("huichengbao.bmp",90,  18,1059, 101,1131)
                click(  65,1096)
            elseif findPic_boolean("ziyuanshiyong.bmp",90, 460,215 , 597,345 ) then
                click(x,y)
                --资源界面
            elseif findPic_boolean("guanbiziyuan.bmp",90, 279,10  , 354,59  ) then
                findPic("ziyuanhuitui.bmp",90,   6,4   ,  70,71  )

            elseif findPic_boolean("huadongzhuanpan.bmp",95, 299,720 , 391,753 ) then
                notifyMessage("滑动",300)
                mSleep(1000)
                myMove_UD( 424,239 , 468,421 ,20)
                chaoshitime = os.time()
            elseif findPic_boolean("huadongzhuanpan1.bmp",95, 296,738 , 392,778 ) then
                notifyMessage("滑动1",300)
                mSleep(1000)
                myMove_UD( 424,239 , 468,421 ,20)
                chaoshitime = os.time()
            elseif findPic_boolean("jianshang4.bmp",90, 287,553  , 344,623 ) then
                findPic("clashIcon.bmp",90, 274,384 , 368,481 )
            elseif findPic_boolean("jianxia9.bmp",90, 306,600 , 348,655 ) then
                findPic("shouquwuzi.bmp",90, 265,724 , 373,794 )
            elseif findPic_boolean("chadiao.bmp",90, 557,840 , 606,888 )then
                click(x,y)
            elseif findPic_boolean("anlingjiang.bmp",90, 498,370 , 570,445 ) then
                click( 293,578 )
            elseif findOneColor_boolean(0xC3B801,90,   4,535 ,  22,558 ) then
                click(x,y)
            elseif findPic_boolean("dengjitisheng.bmp",90, 245,423 , 392,477 ) then
                click(x,y)
            elseif findPic_boolean("jianxia10.bmp",90, 313,918 , 359,982 ) then
                findPic("beibao.bmp",90, 292,1055, 368,1129)
            elseif findPic_boolean("libao.bmp",90,  31,208 , 170,347 ) then
                click(x,y)
                findPic("shiyong.bmp",90, 488,464 , 555,523 )
            elseif findPic_boolean("wuping.bmp",90, 283,11  , 349,58  ) then
                findPic("wupinghuitui.bmp",90,   1,1   ,  74,71  )
            elseif findPic_boolean("xunlian1.bmp",90, 417,1040, 476,1098) then
                click(x,y)
            elseif findPic_boolean("jianyou.bmp",90,  63,547 , 113,589 ) then
                --点击学院地块
                click( 319,546 )
            elseif findPic_boolean("jianshang5.bmp",90, 454,835 , 508,894 ) then
                --点击学院研究
                click( 483,730 )
            elseif findPic_boolean("jianzuo1.bmp",90, 245,220 , 312,269 ) then
                findPic("xueyuanziyuan.bmp",90, 150,215 , 210,278 )
            elseif findPic_boolean("jianshang6.bmp",90, 399,584 , 446,634 ) then
                findPic("yanjiu.bmp",90, 388,457 , 450,509 )
            elseif findPic_boolean("houtaihuitui.bmp",90,   5,5   ,  69,70  ) then
                click(x,y)
            elseif findPic_boolean("mianfei5.bmp",90, 42,137,57,152) or
            findPic_boolean("mianfei.bmp",90,  40,138 ,  85,189 ) or
            findPic_boolean("mianfei1.bmp",90, 48,143 ,  83,178 ) or
            findPic_boolean("mianfeixia.bmp",90,50,260,63,269) or
            findPic_boolean("mianfei4.bmp",90,  42,137,57,152)then
                click(x,y)

            elseif findPicLostColor_boolean("xueyuantishi.bmp",90,  91,917 , 197,959 ) then
                click(x,y)
                notifyMessage("学院",300)
                mSleep(3000)
                click( 320,564 )
                --提示建造
            elseif findPic_boolean("tishi.bmp",80,   5,906 ,  72,974 )or
            findPic_boolean("tishi1.bmp",80,   5,906 ,  72,974 )then
                click(x,y)
                mSleep(1000)
                if findPic_boolean("tudi.bmp",90, 301,571 , 348,607 ) then
                    click(x,y)
                end
                findPic("shengji.bmp",90, 267,473 , 377,577 )
                findPic("shengji.bmp",90, 317,613 , 417,721 )
                findPic("shengji.bmp",90, 333,479 , 407,557 )
                --升级城堡
                findPic("shengji.bmp",90, 321,476  , 421,569 )
                findPic("tudi1.bmp",90, 280,537 , 363,593 )
                findPic("shengji.bmp",90, 277,641 , 364,736 )
                findPic("jiasu.bmp",85, 364,509 , 484,612 )
                findPic("tudi2.bmp",90, 293,550 , 348,588 )
                findPic("xiaomai.bmp",90, 259,438 , 562,566 )
                findPic("mucai.bmp",90, 266,445 , 517,705 )
                findPic("mucai1.bmp",90, 266,445 , 517,705 )
                findPic("tudi3.bmp",90, 284,549 , 329,587 )
                findPic("xunlian+1.bmp",90, 267,397 , 377,489 )
                --加速兵营
                findPic("jiasu1.bmp",85, 367,678 , 476,778 )
                --加速马厩
                findPic("jiasumajiu.bmp",85, 370,677 , 473,773 )
                --加速仓库
                findPic("jiasucangku.bmp",85, 319,529 , 416,618 )
                --加速城墙
                findPic("jiasuchengqiang.bmp",85, 318,717 , 414,805 )
                --战争堡垒地块
                findPic("dikuai4.bmp",90, 289,551 , 349,594 )
                --加速城堡
                findPic("jiasuchengbao1.bmp",90, 365,521 , 481,628 )

            end
        end

        --[[
        --任务界面领取奖励
        if renwulingjiang >= 1 then
            if findPic_boolean("renwubaoxiang.bmp",90, 509,128 , 605,208 ) then
                click(x,y)
            elseif findPic_boolean("renwubaoxianglingjiang.bmp",90, 262,848 , 359,906 ) then
                click(x,y)
            elseif findPic_boolean("renwuqianwang.bmp",90, 492,383 , 569,438) then
                click(x,y)
                notifyMessage("引导完毕")
                logD("引导完毕")
                mSleep(1500)
                return
            elseif findPic_boolean("renwulingjiang.bmp",90, 492,383 , 569,438 ) then
                click(x,y)
            
            elseif findPic_boolean("iconrenwu.bmp",90, 169,1056, 242,1128) then
                click(x,y)
                
                
            end
        end--]]
end
end
--1移到右边                              2移到下边                     
--clickMove(300,500,300-base,500,1)   clickMove(300,500,300,500-base,1)
--3移到左边                             0移到上边
--clickMove(300,500,300+base,500,1)    clickMove(300,500,300,500+base,1)
--移动   300,500
function move_rec(x0,y0,bianc,dzbc,quan)
    --1移到右边     2移到下边       3移到左边       0移到上边   
    local fangxiang = 1
    local chaoshi = os.time()
    for j = 1,quan do
        while true do
            local time = os.time()
            if time - chaoshi > 300 then
                return
            end
            --每次移动100像素  移动次数
            local cishu = bianc/100
            --移到右边
            if fangxiang%4 == 1 then
                for i = 1,cishu do
                    clickMove(x0,y0,x0-70,y0,2)
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
                    clickMove(x0,y0,x0,y0-70,1)
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
                    clickMove(x0,y0,x0+70,y0,2)
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
                    clickMove(x0,y0,x0,y0+70,1)
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

--关闭活动弹窗
function exception()
    --获取游戏焦点
    focus()
    --取消更新
    findPic("quxiaogengxin.bmp",90, 418,670 , 492,717 )
    findPic("nvtouxiang_xy.bmp",90, 122,365 , 582,854 )
    findPic("duihuanvwang.bmp",90, 175,443 , 217,486 )
    findPic("duihuanvwang.bmp",90, 175,443 , 217,486 )
    --暂不激活VIP
    findPic("zanbu.bmp",90, 395,875 , 483,934 )
    --新兵物资
    findPic("xinbingwuzi.bmp",90, 259,748 , 387,800 )
    
    --旅行商人
    if findPic_boolean("jianxia14.bmp",90, 300,455 , 348,496 ) then
        --点击商车
        findPic("shangche.bmp",90, 300,559 , 360,603 )
    end
    --物资签到弹窗
    if findPic_boolean("shouquwuzi_qiandao.bmp",90, 263,798 , 386,852 ) then
        click(x,y)
        --关闭签到
        findPic("guanbiqiandao.bmp",90, 581,263 , 636,311 )
    end
    --关闭战备
    if findPic_boolean("zhanbei.bmp",90, 455,886 , 522,944 ) then
        click( 577,244 )
    end
    --物资签到界面
    if findPic_boolean("shouquwuzi1_qiandao.bmp",90, 263,747 , 383,795 ) then
        click(x,y)
        --界面后退
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
    end
    --加入联盟
    findPic("jiarulianmeng.bmp",90, 283,955 , 387,1010)

    --关闭领主升级礼包
    if findPic_boolean("shengjilibao.bmp",90, 160,322 , 222,382 ) then
        click( 568,267 )
    end
    --取消激活VIP
    if findPic_boolean("jihuoVIP.bmp",90, 125,667 , 236,725 ) then
        click( 136,960 )
    end
    --点击商车
    if findPic_boolean("jianxia13.bmp",90, 304,452 , 348,494 ) then
        click( 327,617 )
    end
    --评分不再提示
    if findPic_boolean("pingfei.bmp",90,  51,658 , 189,711 ) then
        click(x,y)
    end

    --时间礼包
    if findPic_boolean("shijianlibao_ex.bmp",90, 126,161 , 184,209 ) then
        click( 567,266 ) 
    end
    --点击城主
    if findPic_boolean("jianshang8.bmp",90,  19,162 ,  64,211 ) then
        click(  41,39  )
    end
    --点击设置
    if findPic_boolean("jianxia11.bmp",90, 569,916 , 619,962 ) then
        click( 592,1082)
    end
    --点击账号
    if findPic_boolean("jianshang9.bmp",90,  68,377 , 115,426 ) then
        click(  93,266 )
    end
    --点击绑定账号
    if findPic_boolean("jianxia12.bmp",90, 303,358 , 352,403 ) then
        click( 328,498 )
        mSleep(1000)
        findPic("tiaoguonver.bmp",90, 173,434 , 213,492 )
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
    end

    --登陆不成功,再试一次
    findPic("zaishiyici.bmp",90, 114,670 , 238,724 )
    --跳过对话
    findPic("tiaoguonvw.bmp",90, 159,433 , 217,488 )

    --恭喜
    if findPicLostColor_boolean("gongxi.bmp",90, 251,346 , 370,408 ,0xFF00FF) then
        click(  43,941 )
    end
    --跳过npc对话
    if findPic_boolean("tiaoguoduihuanv.bmp",90,  80,304 , 129,361 ) then
        click(x,y)
        findPic("shouhuo.bmp",90, 260,760 , 316,811 )
        findPic("tiaoguoduihuanv.bmp",90,  80,304 , 129,361 )
    elseif findPic_boolean("tiaoguonver.bmp",90, 173,434 , 213,492 ) then
        click(x,y)
    elseif findPic_boolean("tiaoguoshibing.bmp",90,  70,420 , 128,485 )  then
        click(x,y)
    elseif findPic_boolean("tiaoguolaotou.bmp",90, 423,415 , 486,497 )  then
        click(x,y)
    elseif findPic_boolean("tiaoguolaotou1.bmp",90, 420,416 , 493,494 ) then
        click(x,y)
    end
    --关闭联盟提示
    if findPic_boolean("guanbilmtishi.bmp",90, 554,836 , 614,895 ) then
        click(x,y)
    end
    --关闭联盟提示
    if findPic_boolean("guanbilmtishi1.bmp",90, 554,832 , 615,894 ) then
        click(x,y)
    end
    --确定关闭说明
    if findPic_boolean("quedingshuoming.bmp",90, 280,664 , 353,723 ) then
        click(x,y)
    end
    --关闭帮主
    if findPic_boolean("guanbibangzhu.bmp",90,  17,23  ,  85,63  ) then
        click(x,y)
    end
    --退出部队详情
    if findPic_boolean("buduixiangqing.bmp",90, 253,11  , 383,62  ) then
        --界面后退
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
    end
    --退出超值商城
    if findPic_boolean("mianfeishangcheng.bmp",90,  88,295 , 163,345 ) then
        --界面后退
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
        findPic("jiemianhoutui.bmp",90,   8,6   ,  70,68  )
    end
    --关闭加入联盟和创建联盟提示
    findPic("guanbilianmeng_qc.bmp",90, 526,291 , 584,346 )
    --联盟引导
    if findPic_boolean("yindaonv_qc.bmp",90,  80,408 , 139,466 ) then
        click(x,y)
    elseif findPic_boolean("jibenxinxi_qc.bmp",90, 252,394 , 363,434 ) then
        click( 285,204 )
    elseif findPic_boolean("yindaogongneng_qc.bmp",90, 236,255 , 323,296 ) then
        click( 280,577 )
    elseif findPic_boolean("lianmengguanli_qc.bmp",90, 336,795 , 411,836 ) then
        click( 313,1093)
    end

    --启动游戏
    if not appRunning(PACKAGE_NAME) then
        appRun(PACKAGE_NAME)
    end
    --新手热卖
    if findPicLostColor_boolean("xinshouremai_ex.bmp",80, 239,274 , 378,337 ,0xFF00FF) then
        click( 567,266 )
    end
    --热卖
    if findPic_boolean("remai.bmp",90, 277,165 , 361,222 ) then
        click( 562,196 )
    end
    --等级提升
    if findPic_boolean("dengjitisheng.bmp",90, 245,423 , 392,477 ) then
        click(x,y)
    end
    --关闭最新活动
    if findPic_boolean("zuixinhuodong_ex.bmp",90, 255,458 , 360,505 ) then
        click( 576,294 )
    end
    --关闭超值首冲
    if findPic_boolean("chaozhishouchong_ex.bmp",90, 172,229 , 214,272 ) then
        click( 556,246 )
    end
    --时间领取奖励
    findPic("shijianbaoxiang_ex.bmp",90, 285,427 , 335,473 )
    --领取奖励
    findPic("lingqujiangli_ex.bmp",90, 268,618 , 378,666 )

end
--找图忽略色返回boolean
function findPicLostColor_boolean(path,per,x1,y1,x2,y2)
    x,y = findImageInRegionFuzzy(PIC_PATH..path,per,x1,y1,x2,y2,0xFF00FF)
    if x~=-1 and y~=-1 then
        if bool then
            notifyMessage("1",100)
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
            notifyMessage("1",100)
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
            notifyMessage("1",100)
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
            notifyMessage("1",100)
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
        if clickbool then
            notifyMessage(x.."-"..y,500)
            mSleep(1000)
        end
        touchDown(0, x + math.random(-3, 3), y + math.random(-3, 3))
        mSleep(math.random(15,40))
        touchUp(0)
        mSleep(math.random(700,900))
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
function restart()
    appKill(PACKAGE_NAME)
    mSleep(3000)
    appRun(PACKAGE_NAME)
    mSleep(5000)
end
--滑动
function moveTo(x1,y1,x2,y2)
    logD("滑动屏幕")
    touchDown(0, x1, y1); 
    mSleep(100);            
    touchMove(0, x2, y2); 
    mSleep(100);        
    touchUp(0);
    mSleep(500)
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