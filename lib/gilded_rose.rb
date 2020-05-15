require_relative 'items'
class GildedRose

  MAXIMUM_LIMIT = 50
  MINIMUM_LIMIT = 0
  SECOND_LAST_TICKET_BATCH = 10
  LAST_TICKET_BATCH = 5

  def initialize(items)
    @items = items
    @Minimum_Limit = MINIMUM_LIMIT
    @Maximum_Limit = MAXIMUM_LIMIT
    @Second_Last_Ticket_Batch = SECOND_LAST_TICKET_BATCH
    @Last_Ticket_Batch = LAST_TICKET_BATCH
  end

  def update_quality()
    @items.each do |item|
      
  

#       if normal_item(item) && passed_sell_in_date(item) 
#         increase_quality(item, -2) unless item.quality <= 0
#       end

#       if normal_item(item) && within_sell_in_date(item)
#         increase_quality(item, -1) unless item.quality <= 0
#       end

#       if item.name == "Aged Brie"
#         item.quality += 1
#         # decrease_quality(item, 1)
#       end
#       # if aged_brie(item) && quality_within_normal_range(item)
#       #   increase_quality(item, 1) unless item.quality <= 0
#       # end

#       # By calling this here, this means the sell_in value will
#       # go down by one for every single item.
#     item.sell_in -= 1
#       # change_sell_in(item, -1)


#     end
#   end

#   def normal_item(item)
#     item.name != special_items(item)
#   end

#   def aged_brie(item)
#     item.name == "Aged Brie"
#   end

#   def sulfuras(item)
#     item.name == "Sulfuras, Hand of Ragnaros"
#   end

#   def backstage_passes(item)
#     item.name == "Backstage passes to a TAFKAL80ETC concert"
#   end

#   def conjured(item)
#     item.name == "Conjured Mana Cake"
#   end

#   def special_items(item)
#     aged_brie(item) || sulfuras(item) || backstage_passes(item) || conjured(item)
#   end

#   # def quality_within_normal_range(item)
#   #   item.quality > @Minimum_Limit && item.quality <= @Maximum_Limit
#   # end

#   def passed_sell_in_date(item)
#     item.sell_in <= @Minimum_Limit
#   end

#   # def within_sell_in_date(item)
#   #   item.sell_in > @Minimum_Limit
#   # end

#   # def change_sell_in(item, value)
#   #   item.sell_in += value
#   # end

#   def increase_quality(item, value)
#     # if quality_within_normal_range(item) || aged_brie(item) || backstage_passes(item)
#       item.quality += value
#     # end
#   # end

#   # def decrease_quality(item, value)
#   #   item.quality -= value
#   # end

# end
# end

# ORIGINAL CODE, TO BE REFACTORED

# if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
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
#     end
#   end
# end
# end
# end
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
