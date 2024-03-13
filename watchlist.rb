require_relative "movie"

class Watchlist

  def initialize
    @movies = []
  end

  def run
    loop do
      puts "\n"
      puts "Hey movie fan, welcome to the Watchlist!"
      puts "What you'd like to do today?"
      puts "1. Add a new film to watch sometime"
      puts "2. Pick a film to watch now"
      puts "3. Remove a film that you watched"
      puts "4. Exit"
      puts "Choose your option: "
      choice = gets.chomp.to_i
      puts "\n"
        case choice
        when 1
          record
        when 2
          pick
        when 3
          remove
        when 4
          puts "Thanks for using the Watchlist. Bye!"
          break
        else
          puts "Oh... You entered invalid option. Try again."
        end

    end
  end

  def record
    print "Enter the movie title you'd like to add: "
    title = gets.chomp
      puts "What year is that movie? Enter in YYYY format"
      year = gets.chomp.to_i
        if year.class != Integer
          puts "Sorry, the year needs to be in YYYY format. Try again."
        else 
          @movies << Movie.new(title, year)
          puts "#{title} added to your watchlist!"
        end
  end

  def pick
    if @movies.empty?
      puts "Your watchlist is empty. Try adding some titles first."
    else
      puts "Here are some films you could watch:"
      @movies.each do |movie|
       print "\n" + movie.to_str
      end
      puts "\nEnjoy the film you choose!"
    end
  end
  
  def remove
    print "Enter the movie title you'd like to remove: "
    title = gets.chomp
    puts "What year is that movie? Enter in YYYY format"
    year = gets.chomp.to_i
        if year.class != Integer
          puts "Sorry, the year needs to be in YYYY format. Try again."
        else
          found_movie = @movies.find { |movie| movie.title == title && movie.year == year }
          if found_movie
            @movies.delete(found_movie)
            puts "Ok, #{found_movie.title} removed from your watchlist."
          else
             puts "Movie not found in your watchlist."
          end
        end
  end

end
