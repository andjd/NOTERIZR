class Album < ActiveRecord::Base
  validates :band_id, :album_name, presence: true
  

  belongs_to :Band

  has_many :songs

end
