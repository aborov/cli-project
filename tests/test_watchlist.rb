require 'minitest/autorun'
require './watchlist'

class WatchlistTest < Minitest::Test

  def setup
    @watchlist = Watchlist.new
  end

  def test_add_movie
    title = "The Shawshank Redemption"
    year = 1994
    @watchlist.record(title, year)

    assert_equal 1, @watchlist.instance_variable_get(:@movies).size
    assert_equal title, @watchlist.instance_variable_get(:@movies)[0].title
    assert_equal year, @watchlist.instance_variable_get(:@movies)[0].year
  end

  def test_remove_movie
    title = "Inception"
    year = 2010
    movie = Movie.new(title, year)
    @watchlist.instance_variable_get(:@movies) << movie
    @watchlist.remove(title, year)

    assert_empty @watchlist.instance_variable_get(:@movies)
  end

end
