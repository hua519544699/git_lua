--怪物坐标440.650

--图片路径
PIC_PATH = "/var/touchelf/scripts/shijie2_images/"
--跳过引导
color_yindao = { 0xD3D3D3, -12, -6, 0x949494, -4, -4, 0xBCBCBC, -3, 12, 0xC3C2C2, -2, 25, 0xC9C9C9, -4, 12, 0xBEBEBE, -1, 31, 0xCDCDCC, -9, 37, 0xA4A4A4 }
--一键装备
color_yijianzhuangbei = { 0xF9F9F9, -4, 1, 0xF1F1F1, -8, 1, 0xFFFFFF, -15, 1, 0xFDFDFD, -15, 5, 0xFAFAFA, -11, 25, 0xF9F9F9, -15, 25, 0xFCFCFC, -4, 33, 0xFDFDFD, -3, 51, 0xFDFDFD, -11, 51, 0xFEFEFE }
--英雄任务
color_yingxiongrenwu = { 0xFFFFFF, 0, 12, 0xFFFFFF, -6, 6, 0xFFFFFF, -14, -3, 0xFFFFFF, -14, 6, 0xFFFFFF, -14, 15, 0xFFFFFF, -22, -4, 0xFDFDFD, -7, 26, 0xFEFEFE, -19, 31, 0xF6F6F6, -19, 38, 0xF0F0F0 }
--委托任务
color_weituorenwu = { 0xFFFFFF, 0, 13, 0xFDFDFD, -7, 4, 0xF8F8F8, -4, -2, 0xFFFFFF, -9, -2, 0xEEEEEE, 10, 5, 0xFFFFFF, 15, 5, 0xFFFFFF, 5, 47, 0xFEFEFE, 8, 57, 0xEBEBEB, 1, 57, 0xF3F3F3, -7, 57, 0xDFDFDF }
--委托任务开始
color_weituokaishi = { 0xFFFFFF, -9, 0, 0xFFFFFF, -9, -8, 0xFFFFFF, -14, 15, 0xFFFFFF, -5, 31, 0xFDFDFD, -19, 21, 0xE8E8E8, -19, 31, 0xFDFDFD, -14, 15, 0xFFFFFF }
--委托任务胜利界面
color_victory = { 0xAF8945, 13, 39, 0xCBA160, -3, 78, 0xAE8844, 42, 121, 0xEFCE99, 6, 139, 0xBC9856, 35, 194, 0xEEC488, 2, 224, 0xB5904F, -20, 216, 0x9E7531, 3, 76, 0x2C0000, -10, 59, 0xFFFFFF, 56, 47, 0xFFF3DD }
--出战
color_chuzhan = { 0xFEFEFE, -9, 0, 0xFEFEFE, -9, 8, 0xFFFFFF, -9, -7, 0xFDFDFD, 0, 7, 0xFFFFFF, 3, 17, 0xE9E9E9, -2, 17, 0xFEFEFE, -8, 14, 0xF4F4F4, -8, 20, 0xFDFDFD, -7, 26, 0xFAFAFA, 1, 25, 0xFFFFFF }

--角色选择确定
findPic("ok_juesexuanze.bmp",90,  90,928 , 144,1044)
--跳过引导
findMuColor(color_yindao,90,   2,2   ,  43,128 )
--游戏公告
findPic("ok.bmp",90,  63,537 , 118,594 )
--点击任务
findPic("renwu.bmp",90, 251,1045, 333,1131)
--点击委托任务界面
findMuColor(color_weituorenwu,90, 474,12, 533,147 )
--D级委托任务
findPicLostColor_boolean("Djirenwu.bmp",90,  98,7   , 480,283 ,0xFF00FF)
--开始委托任务
findMuColor_boolean(color_weituokaishi,90,  84,997 , 126,1066)
--点击自动
findPic("zidong.bmp",90, 576,979 , 637,1049)
--委托任务胜利界面
findMuColor_boolean(color_victory,90, 358,404 , 452,731 )
--战利品ok界面
findPic("ok_zhanliping.bmp",90,  78,490 , 136,635 )
--级别提升界面        x,y直接点  该界面无反应   x+120  
findPic_boolean("shengjitishi.bmp",90, 378,389 , 467,542 )
--级别提升ok界面
findPicLostColor("ok_button.bmp",90,  21,525 ,  73,638 ,0xFF00FF)
--C级委托任务
findPicLostColor("Cjirenwu.bmp",90,  98,7   , 480,283 ,0xFF00FF)
--探索
findPic("tansuo.bmp",90,  95,1056, 153,1124)
--探索中部平原
findPic("zhongbupingyuan.bmp",90, 359,498 , 402,680 )
--单次探索
findPic("dancitansuo.bmp",90, 163,399 , 215,609 )
--探索之后的界面继续按钮
findPic("jixu.bmp",90,  21,991 , 146,1120)
--硬币不足是否用银币按钮   是按钮
findPic("shi.bmp",90, 240,488 , 293,547 )
--硬币不足是否用银币按钮   否按钮
findPic("fou.bmp",90, 242,593 , 289,641 )
--关闭地图探索界面
findPicLostColor("guanbitansuo.bmp",90, 592,1086, 638,1134,0xFF00FF)


--更换朵莉妲为队长     点击公会按钮
findPic("gonghui.bmp",90,  12,1053,  68,1125)
--点击英雄
findPic("yingxiong.bmp",90,   4,924 ,  71,1001)
--点击朵莉妲为队长      --点击朵莉妲
findPic("duolida.bmp",90,   3,370 , 146,922 )
--设置为队长
findPic("sheweiduizhang.bmp",90, 477,261 , 522,384 )
--关闭叉界面
findPicLostColor("guanbitansuo.bmp",90, 592,1086, 638,1134,0xFF00FF)

----------------------------------------------------英雄任务木材收集
--点击任务
findPic("renwu.bmp",90, 251,1045, 333,1131)
--点击英雄任务
findMuColor(color_yingxiongrenwu,90, 577,28  , 625,158 )
--点击D级任务
findPicLostColor("Djirenwu.bmp",90,  98,7   , 480,283 ,0xFF00FF)
--点击怪物
click(440,650)
--点击+符号
findPic("jiahao.bmp",90,  99,363 , 190,454 )
--点击人物   点击3次
click( 397,280 )
--出发
findPic("chufa.bmp",90,  83,874 , 191,986 )
--领取奖励
findPic("lingqujiangli.bmp",90,  95,881 , 188,977 )
--奖励界面ok
findPicLostColor("ok_button.bmp",90,  87,536 , 134,615 )


--召唤吉娜
--点击公会按钮
findPic("gonghui.bmp",90,  12,1053,  68,1125)
--点击英雄
findPic("yingxiong.bmp",90,   4,924 ,  71,1001)
--点击吉娜
click(74,722)
--点击召唤
findPic("zhaohuan.bmp",90, 478,281 , 521,366 )
--退出英雄信息界面
findPicLostColor("guanbitansuo.bmp",90, 592,1086, 638,1134,0xFF00FF)
--设置吉娜为队员1  点击吉娜
findPic("jina.bmp",90,  16,665 , 134,780 )
--点击出战
findMuColor(color_chuzhan,90, 479,291 , 519,356 )
--设置为队员1
findPic("duiyuan1.bmp",90, 235,330 , 297,803 )
--关闭界面
findPicLostColor("guanbitansuo.bmp",90, 592,1086, 638,1134,0xFF00FF)






--掉线确定
findPic("ok.bmp",90, 247,538 , 298,594 )
--游戏公告
findPic("ok.bmp",90,  63,537 , 118,594 )

--清理所有C-D级委托任务
function cleanWeiTuoCD()
    while true do
        --点击任务
        findPic("renwu.bmp",90, 251,1045, 333,1131)
        --点击委托任务界面
        --findMuColor(color_weituorenwu,90, 474,12, 533,147 )
        if findMuColor_boolean(color_weituorenwu,90, 474,12, 533,147 ) then
            click(x,y)
            --判断是否有D级和C级任务
            if findPicLostColor_boolean("Cjirenwu.bmp",90,  98,7   , 480,283 ,0xFF00FF) or
                findPicLostColor_boolean("Djirenwu.bmp",90,  98,7   , 480,283 ,0xFF00FF) then
                click(x,y)
            else
                return
            end
        end
        --C级委托任务
        findPicLostColor_boolean("Cjirenwu.bmp",90,  98,7   , 480,283 ,0xFF00FF)
        --D级委托任务
        findPicLostColor_boolean("Djirenwu.bmp",90,  98,7   , 480,283 ,0xFF00FF)
        --点击怪物
        click(440,650)
        --开始委托任务
        findMuColor_boolean(color_weituokaishi,90,  84,997 , 126,1066)
        --点击自动
        findPic("zidong.bmp",90, 576,979 , 637,1049)
        --委托任务胜利界面
        findMuColor_boolean(color_victory,90, 358,404 , 452,731 )
        --战利品ok界面
        findPic("ok_zhanliping.bmp",90,  78,490 , 136,635 )
        --级别提升界面        x,y直接点  该界面无反应   x+120  
        findPic_boolean("shengjitishi.bmp",90, 378,389 , 467,542 )
        --级别提升ok界面
        findPicLostColor("ok_button.bmp",90,  21,525 ,  73,638 ,0xFF00FF)
    end
end

--一键装备与强化
function qianghua()
    --点击公会按钮
    findPic("gonghui.bmp",90,  12,1053,  68,1125)
    --点击英雄
    findPic("yingxiong.bmp",90,   4,924 ,  71,1001)
    --点击一键装备
    if findMuColor_boolean(color_yijianzhuangbei,90, 171,1001, 210,1117) then
        --点击一键装备
        click(x,y)
        --点击英雄强化
        click( 236,308 )
        --点击装备
        findPic("zhuangbei.bmp",90,   5,638 , 121,760 )
        --跳过引导
        findMuColor(color_yindao,90,   2,2   ,  43,128 )
        --点击一键强化
        findPic("yijianqianghua.bmp",90,  46,761 ,  85,881 )
        --点击退出一键强化
        click( 370,1086)
        --点击退出当前角色
        findPicLostColor("guanbitansuo.bmp",90, 592,1086, 638,1134,0xFF00FF)
        --------------------------------------------------
        --点击第二个人物
        click(  72,510 )
        --点击一键装备
        click(x,y)
        --点击英雄强化
        click( 236,308 )
        --点击装备
        findPic("zhuangbei.bmp",90,   5,638 , 121,760 )
        --跳过引导
        findMuColor(color_yindao,90,   2,2   ,  43,128 )
        --点击一键强化
        findPic("yijianqianghua.bmp",90,  46,761 ,  85,881 )
        --点击退出一键强化
        click( 370,1086)
        --点击退出当前角色
        findPicLostColor("guanbitansuo.bmp",90, 592,1086, 638,1134,0xFF00FF)
        ---------------------------------------------------
        --点击第三个角色
        click(  73,623 )
        --点击一键装备
        click(x,y)
        --点击英雄强化
        click( 236,308 )
        --点击装备
        findPic("zhuangbei.bmp",90,   5,638 , 121,760 )
        --跳过引导
        findMuColor(color_yindao,90,   2,2   ,  43,128 )
        --点击一键强化
        findPic("yijianqianghua.bmp",90,  46,761 ,  85,881 )
        --点击退出一键强化
        click( 370,1086)
        --点击退出当前角色
        findPicLostColor("guanbitansuo.bmp",90, 592,1086, 638,1134,0xFF00FF)
        ---------------------------------------------------------
        
        --退出界面
        findPicLostColor("guanbitansuo.bmp",90, 592,1086, 638,1134,0xFF00FF)
    end
    
end

--多点找图忽略色返回boolean
function findPicLostColor_boolean(path,per,x1,y1,x2,y2,color)
    x,y = findImageInRegionFuzzy(PIC_PATH..path,per,x1,y1,x2,y2,color)
    if x~=-1 and y~=-1 then
        return true
    else
        return false
    end
end
--多点找图忽略色
function findPicLostColor(path,per,x1,y1,x2,y2,color)
    x,y = findImageInRegionFuzzy(PIC_PATH..path,per,x1,y1,x2,y2,color)
    if x~=-1 and y~=-1 then
        click(x,y)
    end
end
--多点找色返回boolean值
function findMuColor_boolean(table,per,x1,y1,x2,y2)
    x,y = findMultiColorInRegionFuzzy(table,per,x1,y1,x2,y2)
    if x~=-1 and y~=-1 then
        return true
    else
        return false
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
