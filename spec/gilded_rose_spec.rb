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
    expect { GildedRose.new(items).update_quality() }.to change { items[0].sell_in }.by(-1)
  end

  it "changes the quality by 1" do 
    items = [Item.new("Peter's Orange Juice", 10, 20)] 
    expect { GildedRose.new(items).update_quality() }.to change { items[0].quality }.by(-1)
  end

  it "checks that if the sell by date has passed, quality degrades twice as fast" do
    items = [Item.new("Peter's Orange Juice", 0, 20)] 
    GildedRose.new(items).update_quality()
    expect(items[0].quality).to eq(18)
  end

  it "Proves 'Sulfuras', never have to be sold or decrease in Quality" do 
    items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 10)] 
    GildedRose.new(items).update_quality()
    expect(items[0].quality).to eq(10)
    expect(items[0].sell_in).to eq(10)
  end

  # it "Proves that 'Aged Brie' increases in Quality the older it gets" do
    

  # it "demonstrates that the quality of an item is never negative" do 
  #   items = [Item.new("Peter's Orange Juice", -1, -2)] 
  #   GildedRose.new(items).update_quality()
  #   expect(items[0].quality).not_to eq(-2)
  # end
end


# # All items have a SellIn value which denotes the number 
# of days we have to sell the item. 

# All items have a Quality value
# which denotes how valuable the item is. 


# The Quality of an item is never negative
# The Quality of an item is never more than 50
# “Backstage passes”, like aged brie, increases in Quality as it’s 
# SellIn value approaches; Quality increases by 2 when there are 10 days
#  or less 
# And by 3 when there are 5 days or less 
# But Quality drops to 0 after the concert



# require File.join(File.dirname(__FILE__), 'gilded_rose')