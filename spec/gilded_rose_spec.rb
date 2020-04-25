require 'gilded_rose'
require 'items'

describe GildedRose do
  
  describe "#update_quality" do
    
    context "For normal items, sell-in and quality remains consistent." do
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
        expect(items[0].sell_in).to eq(-1)
        expect(items[0].quality).to eq(18)
      end
      
      it "Shows that the quality of an item can never be negative" do 
        items = [Item.new("Peter's Orange Juice", 10, 1)] 
        5.times do GildedRose.new(items).update_quality()
        end
        expect(items[0].sell_in).to eq(5)
        expect(items[0].quality).to be >= 0
      end
      
      context "For the item 'Aged Brie'." do
        it "Shows that 'Aged Brie' increases in Quality by 1 the older it gets" do
          items = [Item.new("Aged Brie", 10, 10)] 
          GildedRose.new(items).update_quality()
          expect(items[0].sell_in).to eq(9)
          expect(items[0].quality).to eq(11)
        end
        
        it "Shows that the quality of an item is never more than 50" do 
          items = [Item.new("Aged Brie", 30, 30)]
          21.times do
            GildedRose.new(items).update_quality()
          end
          expect(items[0].sell_in).to eq(9)
          expect(items[0].quality).to be <= 50
        end
        
        context "For the item 'Sulfuras, Hand of Ragnaros'." do  
          it "Proves 'Sulfuras', never have to be sold or decrease in Quality" do 
            items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 10)] 
            GildedRose.new(items).update_quality()
            expect(items[0].sell_in).to eq(10)
            expect(items[0].quality).to eq(10)
          end
          
          context "For 'Backstage passes to a TAFKAL80ETC concert'." do  
            it "Checks Backstage item increases in quality as it approaches sell-in date" do 
              items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 10)] 
              GildedRose.new(items).update_quality()
              expect(items[0].sell_in).to eq(14)
              expect(items[0].quality).to eq(11)
            end
            
            it "Checks Backstage item increases in quality by 2 when there are 10 days or less" do 
              items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)]
              GildedRose.new(items).update_quality()
              expect(items[0].sell_in).to eq(9)
              expect(items[0].quality).to eq(12)
            end 
            
            it "Checks Backstage item increases in quality by 3 when there are 5 days or less" do 
              items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)]
              GildedRose.new(items).update_quality()
              expect(items[0].sell_in).to eq(4)
              expect(items[0].quality).to eq(13)
            end 
            
            it "Checks Backstage item quality is 0 after the concert date" do 
              items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 20)]
              GildedRose.new(items).update_quality()
              expect(items[0].sell_in).to eq(-1)
              expect(items[0].quality).to eq(0)
            end 
            
            context "For the item 'Conjured Mana Cake'." do  
              it "Quality degrades twice as fast as normal items when still in sell by date" do
                items = [Item.new("Conjured Mana Cake", 10, 10)]
                GildedRose.new(items).update_quality()
                expect(items[0].sell_in).to eq(9)
                expect(items[0].quality).to eq(8)
              end
              
            #   it "Quality degrades twice as fast as normal items when not in sell by date" do
            #     items = [Item.new("Conjured Mana Cake", 0, 10)]
            #     GildedRose.new(items).update_quality()
            #     expect(items[0].sell_in).to eq(-1)
            #     expect(items[0].quality).to eq(6)
            #   end
            end
          end
        end
      end

end
end
end
