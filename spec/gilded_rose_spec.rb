require 'gilded_rose'
require 'items'

describe GildedRose do

  # Item.new("food name", "sell_in value", "quality")
  describe "#update_quality" do
    
    it "does not change the name" do
      items = [Item.new("Peter's Orange Juice", 10, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "Peter's Orange Juice"
    end
  end

  it "changes the Sell-in value by 1" do 
    items = [Item.new("Peter's Orange Juice", 10, 20)] 
    p "----"
    p items[0]
    p "----"
    expect { GildedRose.new(items).update_quality() }.to change { items[0].sell_in }.by(-1)
    p "----"
    p items[0]
    p "----"
  end

 

end

# # All items have a SellIn value which denotes the number 
# of days we have to sell the item. All items have a Quality value
# which denotes how valuable the item is. 

# Once the sell by date has passed, Quality degrades twice as fast
# The Quality of an item is never negative
# “Aged Brie” actually increases in Quality the older it gets
# The Quality of an item is never more than 50
# “Sulfuras”, being a legendary item, never has to be sold 
# or decreases in Quality
# “Backstage passes”, like aged brie, increases in Quality as it’s 
# SellIn value approaches; Quality increases by 2 when there are 10 days
#  or less 
# And by 3 when there are 5 days or less 
# But Quality drops to 0 after the concert



# require File.join(File.dirname(__FILE__), 'gilded_rose')