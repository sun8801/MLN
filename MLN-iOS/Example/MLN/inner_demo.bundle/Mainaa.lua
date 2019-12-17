

local function appendData(dataList)
    for i=1, 10, 1 do
        local text = string.format("%s == 2017年6月，陌陌发布“MOMO音乐计划”，旨在挖掘潜力主播，并为音乐播主提供一系列发展通道的活动。大壮抓住了这一机会，从数万名主播中脱颖而出，成为了此项音乐计划的受益人。高进由此成为了大壮的音乐制作人 [3]  。高进为大壮量身定制了歌曲《我们不一样》 [4]  ，歌曲由侯春阳混音 [5]  。歌曲描写的是大壮的兄弟情谊，这也是大壮自己的缩影 [6]  。从主播跨界做歌手，从默默无闻到拥有很多粉丝，使得大壮更懂得珍惜，粉丝也是兄弟，这些经历是他演绎歌曲的情感内核，因为感同身受才能让歌曲更触动人心。😀 ✺◟(∗❛ัᴗ❛ั∗)◞✺ ✺◟(∗❛ัᴗ❛ั∗)◞✺ 😀😖😐😣😡🚖🚌🚋🎊💖💗💛💙🏨🏦🏫 Async Display Test ✺◟(∗❛ัᴗ❛ั∗)◞✺ ✺◟(∗❛ัᴗ❛ั∗)◞✺ 😀😖😐😣😡🚖🚌🚋🎊💖💗💛💙🏨🏦🏫", (#dataList + 1))
  
        if (#dataList + 1) % 2 == 0 then
            text = text .. "\n巴菲特曰：“世兄久居中国，必知当世华夏商界英雄。请试指言之。”宇晨曰：“华为任氏，5g称王，可为英雄？”巴菲特笑曰：“华为遭我美帝封锁，已是冢中枯骨，吾何足道哉！”宇晨曰：“有一人名校毕业，气宇非凡：李彦宏可为英雄？”巴菲特曰：“彦宏徒有其表，非英雄也。”宇晨曰：“有一人血气方刚，青年领袖——王思聪乃英雄也？”巴菲特曰：“思聪藉父之名，非英雄也。”宇晨曰：“联想元庆，可为英雄乎？”巴菲特曰：“元庆守户之犬耳，何足为英雄！”宇晨曰：“如王兴、戴威、程维等辈皆何如？”巴菲特鼓掌大笑曰：“此等碌碌小人，何足挂齿！”宇晨曰：“舍此之外，实不知。”巴菲特曰：“夫英雄者，胸怀大志，腹有良谋，有包藏宇宙之机，吞吐天地之志者也。”宇晨曰：“谁能当之？”巴菲特以手指宇晨，后自指，曰：“今天下英雄，惟宇晨与老朽耳！”"
        end
        local item = {title=text}
        table.insert(dataList, item)
    end
end


datasouce = {}
appendData(datasouce)

local size = window:size()

-- tableView
local tableView = TableView(true, true)
tableView:frame(Rect(0, 34, size:width(), size:height()))
tableView:bgColor(Color(255, 255, 255, 1))
tableView:showScrollIndicator(true)
window:addView(tableView)

-- adapter
adapter = AutoresizingTableViewAdapter()
adapter:sectionCount(function ()
    return 1
end)
adapter:rowCount(function (section)
    return #datasouce
end)
adapter:reuseId(function (section, row)
    return "cellID"
end)
adapter:initCellByReuseId("cellID", function (cell)
    cell.bgView = View():width(MeasurementType.MATCH_PARENT):height(MeasurementType.MATCH_PARENT)
    cell.bgView:marginTop(2):marginBottom(2)
    cell.bgView:bgColor(Color(255, 255, 0, 1))
    cell.contentView:addView(cell.bgView)
    
    cell.titleLabel = Label():width(MeasurementType.WRAP_CONTENT):height(MeasurementType.WRAP_CONTENT)
    cell.titleLabel:bgColor(Color(0, 255, 0, 1))
    cell.titleLabel:lines(0)
    cell.titleLabel:fontSize(15)
    cell.titleLabel:marginLeft(0):marginTop(10)
    cell.contentView:clipToBounds(true)
    cell.bgView:addView(cell.titleLabel)
    cell.contentView:openRipple(true)
    
    cell.titleLabel1 = Label():width(MeasurementType.WRAP_CONTENT):height(MeasurementType.WRAP_CONTENT)
    cell.titleLabel1:bgColor(Color(255, 0, 0, 1))
    cell.titleLabel1:lines(0)
    cell.titleLabel1:fontSize(15)
    cell.titleLabel1:marginLeft(0):marginTop(40)
    cell.bgView:addView(cell.titleLabel1)
end)
adapter:fillCellDataByReuseId("cellID", function (cell,section,row)
    local items = datasouce;
    local detailItem = items[row]
    cell.titleLabel:text(detailItem.title)
    --cell.titleLabel1:text(detailItem.title)
    --cell.titleLabel:text(string.format("%s == 我们都有一个家，名字叫中国", row))
    --cell.titleLabel1:text(string.format("%s == 兄弟姐妹都很多，景色也不错", row))
    --if  cell.selected  then
         --cell.titleLabel1:text(string.format("%s == hahahahhahahahahhhhhhhhhhhhhhh\n\n\n\n\n\n\n\n\nhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh兄弟姐妹都很多，景色也不错", row))
    --end
    
end)
adapter:selectedRowByReuseId("cellID", function (cell,section,row)
    cell.selected = true
   
    tableView:reloadAtRow(row, section, true)
end)

tableView:adapter(adapter)

tableView:setRefreshingCallback(function()
    datasouce = {}
    appendData(datasouce)

    tableView:stopRefreshing()
    tableView:stopLoading()
    tableView:reloadData()
end)

tableView:setLoadingCallback(function()
appendData(datasouce)
       
       tableView:reloadData()
       tableView:stopRefreshing()
       tableView:stopLoading()
       tableView:loadEnable(true)
end)

