require 'items'

describe Item do  
  
  it "every item has a unique name, sell_in and quality." do
    item = Item.new("Peter's Orange Juice", 20, 20) 
    expect(item.name).to eq("Peter's Orange Juice")
    expect(item.sell_in).to eq(20)
    expect(item.quality).to eq(20)
  end

  it "prints out the name, sellin value and quality" do 
    item1 = Item.new("Peter's Orange Juice", 15, 15) 
    expect(item1.to_s).to eq "Peter's Orange Juice, 15, 15"
  end
end