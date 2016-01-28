--图片路径
PIC_PATH = "/var/touchelf/scripts/cqb_images/"
--地图药品商人
color_ditushangren = { 0xEFF3EF, -13, -31, 0xF7F3EF, -3, -31, 0xEFEFEF, 1, -26, 0xCECFCE, -12, -21, 0xEFEFF7, -13, -14, 0xE7EFEF, -8, -13, 0xE7E7E7, -1, -10, 0xEFEFEF, -9, -5, 0xF7F3EF, -8, 3, 0x8C969C }
--天蛇府弟子
color_tianshefu = { 0x42AECE, 3, -41, 0x3182A5, 2, -29, 0x185563, 2, -4, 0x42AECE, -6, 8, 0x29758C, 8, 35, 0x21657B, 1, 41, 0x215D73, -6, 36, 0x318EAD }
--挂机
color_guaji = { 0x082431, -32, -9, 0xA5EBF7, -27, -9, 0xA5E7EF, -22, -9, 0x8CCBCE, -24, -2, 0x94D3DE, -27, -2, 0x8CC7CE, -31, -2, 0x9CDBDE, -25, 5, 0xA5EBF7, -28, 5, 0xA5DBE7, -34, 8, 0xADEBF7, -23, 13, 0x9CDFE7, -34, 15, 0xADE7EF, -32, 9, 0xADE3E7 }
--离线挂机      463,795
color_lixianguaji = { 0xDEFFFF, -9, -265, 0xFFFBFF, 6, -192, 0xCED3DE, -11, -224, 0x7396AD, 7, -224, 0xEFF3F7, -8, -234, 0xEFEFEF }
--角色进入游戏
color_juesejinru = { 0x52F3FF, -19, -72, 0x84F3FF, 10, -75, 0x94F3FF, 22, -73, 0xB5FFFF, 19, -49, 0xC6FFFF, -6, -49, 0x4AEBFF, 14, -24, 0xADFFFF, 0, -33, 0x42DFFF, 1, -16, 0x4AF7FF, -4, 1, 0x4AF3FF, 22, 28, 0xB5FFFF, 21, 48, 0x94F7FF, 0, 46, 0x42E7FF, -5, 66, 0x42EFFF, 25, 62, 0xBDFFFF, 10, 15, 0x39C3FF }
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
--领取福利
function fuli()
    notifyMessage("天降神兵",2000)
    mSleep(3000)
    --点击奇遇
    findPic("qiyu.bmp",90, 452,878 , 554,985 )
    --点击天降神兵
    findPic("tianjiangshenbing.bmp",90, 106,229 , 321,430 )
end


--主函数
function main()
   
    
    while true do
        --运行游戏
        if appRunning("com.zeus.cangqiongbian") then
        else
            appRun("com.zeus.cangqiongbian")
            mSleep(30000)
        end
        
        
        
        --挂机
        findMuColor(color_guaji,90, 308,1040, 390,1131)
        
        --领取福利
        fuli()
        
        --断线登陆界面进入游戏
        findPic("jinruyouxi.bmp",90,  16,382 , 171,738 )
        --登陆错误
        findPic("quedingcuowu.bmp",90, 204,498 , 276,625 )
        --角色进入
        findMuColor(color_juesejinru,90,   2,888 , 113,1130)
        --活动公告
        findPic("huodong.bmp",90,  51,489 , 120,638 )
        --精彩内容
        findPic("jingcaineirong.bmp",90, 539,887 , 625,981 )
        --关闭离线挂机界面
        findPic("guanbiguaji.bmp",90, 427,755 , 492,834 )
        --sim卡提示
        findPic("SIMhao.bmp",90, 208,385 , 313,821 )
        
    end
    
end