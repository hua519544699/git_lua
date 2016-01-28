function main()
   
        buy()
    

end
--点击事件
function click(x,y)
    if x~=-1 and y~=-1 then
        touchDown(0,x,y)
        mSleep(100)
        touchUp(0)
        mSleep(2000)
    end
    
    
end

--买药
function buy()
    --点击地图 583,1076
        mSleep(2000)
        click( 583,1076)
    
end
