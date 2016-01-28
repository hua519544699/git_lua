--挂机
color_guaji = { 0x082431, -32, -9, 0xA5EBF7, -27, -9, 0xA5E7EF, -22, -9, 0x8CCBCE, -24, -2, 0x94D3DE, -27, -2, 0x8CC7CE, -31, -2, 0x9CDBDE, -25, 5, 0xA5EBF7, -28, 5, 0xA5DBE7, -34, 8, 0xADEBF7, -23, 13, 0x9CDFE7, -34, 15, 0xADE7EF, -32, 9, 0xADE3E7 }
function main()
    while true do
        --点击挂机
        findMuColortf(color_guaji,90, 308,1040, 390,1131)
    end
end
--多点找色  并点击
function findMuColortf(table,per,x1,y1,x2,y2)
    x,y = findMultiColorInRegionFuzzy(table,per,x1,y1,x2,y2)
    clicktf(x,y)
end
--点击事件短时间
function clicktf(x,y)
    if x~=-1 and y~=-1 then
        touchDown(0, x + math.random(-3, 3), y + math.random(-3, 3))
        mSleep(math.random(15,40))
        touchUp(0)
        mSleep(math.random(500,800))
    end
end