# 10.times do |i|
#   name = "ANDREW".chars.map.with_index {|char, j| (char.ord + (j + i)).chr }.join("")
#   Band.create! band_name: name
# end

Band.create band_name: "They weren't giants"

tmbg = Band.find_by_band_name("They weren't giants")

tmbg_a = tmbg.albums.create album_name: "Waterlog"

songs = ['I returned','A bag of groceries','accidently taken','off the shelf','before the date', 'stampped on','my sack']
songs.map!(&:capitalize)

songs.shuffle.each do |sname|
  tmbg_a.songs.create song_name: sname
end
