class Song < ActiveRecord::Base
  validates :song_name, presence: true

  belongs_to :album

  has_one :band,
    through: :album,
    source: :band

  end
