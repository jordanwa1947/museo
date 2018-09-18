class Curator
  attr_reader :artists, :photographs
  def initialize
    @artists = []
    @photographs = []
  end

  def add_photograph(photo_hash)
    new_photo = Photograph.new(photo_hash)
    @photographs << new_photo
  end

  def add_artist(artist_hash)
    new_artist = Artist.new(artist_hash)
    @artists << new_artist
  end
end
