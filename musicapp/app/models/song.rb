require 'open-uri'

class Song < ActiveRecord::Base

  has_many :songs_tests, dependent: :destroy
  has_many :tests, through: :songs_tests

  validates :name, presence: true
  validates :artist, presence: true, uniqueness: { scope: :name, message: "Name and artist should be unique" }

  validate :in_spotify

  def in_spotify
    if name.nil? || name.empty?
      errors.add(:song, 'does not exist in Spotify')
    else
      my_hash = JSON.parse(open("https://api.spotify.com/v1/search?q=#{song_search}&type=track").read)
      if my_hash['tracks']['items'].empty?
        errors.add(:song, 'does not exist in Spotify')
      end
    end
  end

  def spotify_uri
    my_hash = JSON.parse(open("https://api.spotify.com/v1/search?q=#{song_search}&type=track").read)
    my_hash['tracks']['items'][0]['uri']
  end


  def song_search
    artist.tr(' ', '+') + '+' + name.tr(' ', '+')
  end

end
