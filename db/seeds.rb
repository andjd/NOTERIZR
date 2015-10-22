10.times do |i|
  name = "ANDREW".chars.map.with_index {|char, j| (char.ord + (j + i)).chr }.join("")
  Band.create! band_name: name
end
