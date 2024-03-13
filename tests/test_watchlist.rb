require 'minitest/autorun'
require_relative 'watchlist'

class TestWatchlist < Minitest::Test
  def test_adding
    @watchlist = Watchlist.new
    @watchlist.instance_variable_set(:@movies, []) 
      title = "The Shawshank Redemption"
      year = 1994
    @watchlist.record(title, year)
    assert_equal 1, @watchlist.instance_variable_get(:@movies).size
    assert_equal title, @watchlist.instance_variable_get(:@movies)[0].title
    assert_equal year, @watchlist.instance_variable_get(:@movies)[0].year
  end

  def test_removal
    @watchlist = Watchlist.new
      title = "The Godfather"
      year = 1972
    @watchlist.remove(title, year)
    assert_output "Sorry, couldn't find #{title} in your watchlist." do
      @watchlist.remove(title, year)
      end
  end
end
