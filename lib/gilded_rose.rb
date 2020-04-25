require_relative 'items'
class GildedRose

  MAXIMUM_QUALITY_LIMIT = 50 
  MINIMUM_QUALITY_LIMIT = 0 
  SECOND_LAST_TICKET_BATCH = 10 
  LAST_TICKET_BATCH = 5 

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|

      if item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.quality > MINIMUM_QUALITY_LIMIT
          if item.name != "Sulfuras, Hand of Ragnaros"
            item.quality -= 1
          end
        end
      else
        if item.quality < MAXIMUM_QUALITY_LIMIT
          item.quality += 1
          
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < (SECOND_LAST_TICKET_BATCH + 1)
              if item.quality < MAXIMUM_QUALITY_LIMIT
                item.quality += 1
              end
            end
            if item.sell_in < (LAST_TICKET_BATCH + 1)
              if item.quality < MAXIMUM_QUALITY_LIMIT
                item.quality += 1
              end
            end
          end
        end
      end

      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in -= 1
      end
      if item.sell_in < MINIMUM_QUALITY_LIMIT
        if item.name != aged_brie(item)
          
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > MINIMUM_QUALITY_LIMIT
              
              if item.name != "Sulfuras, Hand of Ragnaros"
                item.quality -= 1
              end
            end
          else
            item.quality -= item.quality
          end
        else
          if item.quality < MAXIMUM_QUALITY_LIMIT
            item.quality += 1
          end
        end
      end
    end
  end
end

# FOR NORMAL ITEMS
# change_sell_in(item, -1) if normal_item(item)
# change_quality(item, -1) if normal_item(item)
# end
# end
# end


def normal_item(item)
  item.name != special_items(item)
end 

def aged_brie(item) 
  item.name == "Aged Brie"
end 

def sulfuras(item)
  item.name == "Sulfuras, Hand of Ragnaros"
end 

def backstage_passes(item)
  item.name == "Backstage passes to a TAFKAL80ETC concert"
end

def conjured(item)
  item.name == "Conjured Mana Cake"
end

def special_items(item)
  aged_brie(item) || sulfuras(item) || backstage_passes(item) || conjured(item)
end

def quality_within_normal_range(quality)
  item.quality >= MINIMUM_QUALITY_LIMIT && item.quality <= MAXIMUM_QUALITY_LIMIT
end

def passed_sell_in_date
  item.sell_in <= MINIMUM_QUALITY_LIMIT
end

def change_sell_in(item, value)
  item.sell_in += value
end 

def change_quality(item, value)
  item.quality += value
end 
