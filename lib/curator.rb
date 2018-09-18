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

  def find_artist_by_id(id)
    artist_array = @artists.select do |artist|
      artist.id == id
    end
    artist_array[0]
  end

  def find_photograph_by_id(id)
    photograph_array = @photographs.select do |photograph|
      photograph.id == id
    end
    photograph_array[0]
  end

  def find_photographs_by_artist(artist)
    @photographs.find_all do |photograph|
      photograph.artist_id == artist.id
    end
  end
end
