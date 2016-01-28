PIC_PATH = "/var/touchelf/scripts/cqb_images/"

UI = {
        {'InputBox{}',          'contents',         '喊话内容：'},
    
};
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
        hanhua()
    end
    
end

function hanhua()
    notifyMessage("开始喊话",2000)
    mSleep(3000)
    --点击打开喊话窗口
    click(  85,581 )
    --点击切换到键盘
    findPic("jianpan.bmp",90,  31,567 , 210,705 )
    --点击输入框
    click(  61,756 )
    --输入内容
    inputText(contents)
    findPic("done.bmp",90, 239,822 , 524,1002)
    --点击发送
    findPic("fasong.bmp",90,  25,862 , 249,981 )
        
    click( 590,956 )
    mSleep(3000)
end
