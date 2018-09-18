require 'minitest/autorun'
require 'minitest/pride'
require './lib/curator'
require './lib/photograph'
require './lib/artist'
require 'pry'

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

  def test_that_it_can_find_photographs_by_artist
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

    photo_3 = {
      id: "3",
      name: "Identical Twins, Roselle, New Jersey",
      artist_id: "3",
      year: "1967"
    }
    curator.add_photograph(photo_3)

    photo_4 = {
      id: "4",
      name: "Child with Toy Hand Grenade in Central Park",
      artist_id: "3",
      year: "1962"
    }
    curator.add_photograph(photo_4)

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

    artist_3 = {
      id: "3",
      name: "Diane Arbus",
      born: "1923",
      died: "1971",
      country: "United States"
    }
    curator.add_artist(artist_3)

    diane_arbus = curator.find_artist_by_id("3")

    actual = curator.find_photographs_by_artist(diane_arbus)

    assert_instance_of Photograph, actual.first
    assert_equal 2, actual.length
    assert_equal "3", actual.last.artist_id
    assert_equal  "Identical Twins, Roselle, New Jersey", actual.first.name
  end

end
