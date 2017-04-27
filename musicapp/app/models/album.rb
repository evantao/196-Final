require 'open-uri'

class Album < ActiveRecord::Base

  has_many :album_tests, dependent: :destroy
  has_many :tests, through: :albums_tests

  validates :name, presence: true
  validates :artist, presence: true, uniqueness: { scope: :name, message: "Name and artist should be unique" }

  validate :cap_name

  validate :cap_artist

  validate :in_spotify

  def cap_name
    unless name.nil? || name.empty? || name[0].capitalize == name[0]
      errors.add(:name, 'is not capitalized')
    end
  end

  def cap_artist
    unless artist.nil? || artist.empty? || artist[0].capitalize == artist[0]
      errors.add(:artist, 'is not capitalized')
    end
  end


  def in_spotify
    if name.nil? || name.empty?
      errors.add(:album, 'does not exist in Spotify')
    else
      my_hash = JSON.parse(open("https://api.spotify.com/v1/search?q=#{album_search}&type=album").read)
      if my_hash['albums']['items'].empty?
        errors.add(:album, 'does not exist in Spotify')
      end
    end
  end
  
  def album_format 
    name + " by " + artist 
  end

  def rand_four
    ans = [ self ]    

    while ans.size < 4 
      offset = rand(Album.count)
      rand_album = Album.offset(rand(Album.count)).first
      ans << rand_album unless ans.include?(rand_album)
    end

    ans.shuffle
  end

  def album_eq(album)
    equal?(album) ? "true" : "false"
  end

  def spotify_uri
    my_hash = JSON.parse(open("https://api.spotify.com/v1/search?q=#{album_search}&type=album").read)
    p my_hash['albums']['items'][0]['images'][0]['url']
  end


  def album_search
    artist.tr(' ', '+') + '+' + name.tr(' ', '+')
  end

end
