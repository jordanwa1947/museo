require 'minitest/autorun'
require 'minitest/pride'
require './lib/curator'
require './lib/photograph'
require './lib/artist'

class CuratorTest < Minitest::Test

  def test_it_exists
    curator = Curator.new

    assert_instance_of Curator, curator
  end

  def test_it_has_attributes
    curator = Curator.new

    assert_equal [], curator.artists
    assert_equal [], curator.photographs
  end

  def test_that_it_can_add_photographs
    curator = Curator.new

    photo_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }
    curator.add_photograph(photo_1)

    photo_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }
    curator.add_photograph(photo_2)
    name = "Rue Mouffetard, Paris (Boy with Bottles)"

    assert_instance_of Photograph, curator.photographs.last
    assert_instance_of Photograph, curator.photographs.first
    assert_equal name, curator.photographs.first.name
  end

  def test_that_it_can_add_artists
    curator = Curator.new

    artist_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    }
    curator.add_artist(artist_1)

    artist_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
    curator.add_artist(artist_2)
    name = "Henri Cartier-Bresson"

    assert_instance_of Artist, curator.artists.last
    assert_instance_of Artist, curator.artists.first
    assert_equal name, curator.artists.first.name
  end

  def test_that_it_can_find_artists_by_id
    curator = Curator.new

    artist_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    }
    curator.add_artist(artist_1)

    artist_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
    curator.add_artist(artist_2)
    name = "Henri Cartier-Bresson"
    actual = curator.find_artist_by_id('1')

    assert_instance_of Artist, actual

    assert_equal name, actual.name
  end

  def test_that_it_can_find_photographs_by_id
    curator = Curator.new

    photo_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }
    curator.add_photograph(photo_1)

    photo_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }
    curator.add_photograph(photo_2)
    name = "Moonrise, Hernandez"
    actual = curator.find_photograph_by_id('2')

    assert_instance_of Photograph, actual
    assert_equal name, actual.name
  end

end
