class Band < ActiveRecord::Base
  validates :band_name, presence: true, uniqueness: true

  has_many :albums

  has_many :songs,
    through: :albums,
    source: :songs

end
