require_relative 'items'
class GildedRose

  MAX_QUALITY = 50
  ZERO_QUALITY = 0
  SECOND_LAST_TICKET_BATCH = 10
  LAST_TICKET_BATCH = 5
  LEGENDARY_QUALITY = 80 

  def initialize(items)
    @items = items
  end
  
  def update_quality()
    @items.each do |item|
      
      if normal_item(item) 
        item.sell_in > 0 ? item.quality -= 1 : item.quality -= 2 unless item.quality == ZERO_QUALITY
      end
      
      if aged_brie(item)
        item.sell_in > 0 ? item.quality += 1 : item.quality += 2 unless item.quality >= MAX_QUALITY
      end

      if sulfuras(item)
        item.quality = LEGENDARY_QUALITY
        item.sell_in += 1
      end

      if backstage_passes(item)
        item.sell_in >= SECOND_LAST_TICKET_BATCH ? item.quality += 2 : item.sell_in >= LAST_TICKET_BATCH ? 
        item.quality += 3 : item.quality = ZERO_QUALITY unless item.quality >= MAX_QUALITY
      end

      if conjured(item)
        item.sell_in > 0 ? item.quality -= 2 : item.quality -= 4 unless item.quality == ZERO_QUALITY
      end

      item.sell_in -= 1
    
    end
  end
end
       
def normal_item(item)
  !(aged_brie(item) || sulfuras(item) || backstage_passes(item) || conjured(item))
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

# ORIGINAL CODE, TO BE REFACTORED

#   if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
#   if item.quality > 0
#     if item.name != "Sulfuras, Hand of Ragnaros"
#       item.quality = item.quality - 1
#     end
#   end
# else
#   if item.quality < 50
#     item.quality = item.quality + 1
#     if item.name == "Backstage passes to a TAFKAL80ETC concert"
#       if item.sell_in < 11
#         if item.quality < 50
#           item.quality = item.quality + 1
#         end
#       end
#       if item.sell_in < 6
#         if item.quality < 50
#           item.quality = item.quality + 1
#         end
#       end
#     end
#   end
# end
# if item.name != "Sulfuras, Hand of Ragnaros"
#   item.sell_in = item.sell_in - 1
# end
# if item.sell_in < 0
#   if item.name != "Aged Brie"
#     if item.name != "Backstage passes to a TAFKAL80ETC concert"
#       if item.quality > 0
#         if item.name != "Sulfuras, Hand of Ragnaros"
#           item.quality = item.quality - 1
#         end
#       end
#     else
#       item.quality = item.quality - item.quality
#     end
#   else
#     if item.quality < 50
#       item.quality = item.quality + 1
#           end
#         end
#       end
#     end
#   end
# end

# class Item
# attr_accessor :name, :sell_in, :quality

# def initialize(name, sell_in, quality)
# @name = name
# @sell_in = sell_in
# @quality = quality
# end

# def to_s()
# "#{@name}, #{@sell_in}, #{@quality}"
# end
# end
