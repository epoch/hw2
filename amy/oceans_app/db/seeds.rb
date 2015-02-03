Ocean.destroy_all
Mountain.destroy_all

Ocean.create(:name => 'Pacific Ocean', :area => 165000000, :average_depth => 4280, :deepest_point => 10911, :image => 'http://i.telegraph.co.uk/multimedia/archive/01751/island_1751006c.jpg')
Mountain.create(:name => 'Mount Everest', :height => 10000, :country => 'Nepal', :image => 'http://upload.wikimedia.org/wikipedia/commons/d/d1/Mount_Everest_as_seen_from_Drukair2_PLW_edit.jpg', :nearest_ocean => 'Pacific')