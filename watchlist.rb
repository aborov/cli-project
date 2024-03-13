require_relative "movie"

class Watchlist

  def initialize
    @movies = []
  end

  def run
    loop do
      puts "\nHey movie fan, welcome to the Watchlist!"
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
        if year.to_s.length != 4 || year > Time.now.year
          puts "Sorry, the year is invalid. It needs to be in YYYY format."
        else 
          @movies << Movie.new(title, year)
          puts "Great, #{title} (#{year}) added to your watchlist!"
        end
  end

  def pick
    if @movies.empty?
      puts "Your watchlist is empty. Try adding some titles first."
    else
      puts "Here are some films you could watch:"
      @movies.each do |movie|
       print movie.to_str
      end
      puts "\nEnjoy the film you choose!"
    end
  end
  
  def remove
    print "Enter the movie title you'd like to remove: "
    title = gets.chomp
    puts "What year is that movie? Enter in YYYY format"
    year = gets.chomp.to_i
        if year.to_s.length != 4 || year > Time.now.year
          puts "Sorry, the year is invalid. It needs to be in YYYY format.."
        else
          found_movie = @movies.find { |movie| movie.title == title && movie.year == year }
          if found_movie
            @movies.delete(found_movie)
            puts "Ok, #{found_movie.to_str} removed from your watchlist."
          else
            puts "Sorry, couldn't find #{title} in your watchlist."
          end
        end
  end

end
