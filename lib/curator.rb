
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

  def artists_with_multiple_photographs
    count_hash = group_artist_by_count
    artists_with_photographs = count_hash.select do |count, artists|
      count > 1
    end
    artists_with_photographs.values.flatten
  end

  def group_artist_by_count
    @artists.group_by do |artist|
      find_photographs_by_artist(artist).count
    end
  end

  def photographs_taken_by_artists_from(country)
    artist_country_hash = group_artist_by_country
    return [] if artist_country_hash[country] == nil
    photo_array = artist_country_hash[country].map do |artist|
      find_photographs_by_artist(artist)
    end
    photo_array.flatten
  end

  def group_artist_by_country
    country = @artists.group_by do |artist|
      artist.country
    end
  end

  def load_photographs(array_of_photo_info)
    array_of_photo_info.each do |hash|
      add_photograph(hash)
    end
  end

  def load_artists(array_of_artist_info)
    array_of_artist_info.each do |hash|
      add_artist(hash)
    end
  end

end
