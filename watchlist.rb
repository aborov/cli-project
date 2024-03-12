class Watchlist

  def initialize
    @movies = []
  end

  def start
    puts "Hey movie fan, welcome to the Watchlist CLI!"

    loop do
      puts "\n"
      if @movies.empty?
        puts "Your watchlist is empty. Want to start by adding the first title?"
        puts "Y = Yes"
        puts "N = No"
        proceed = gets.chomp
        if proceed == "Y"
          record
        end
      else
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
          puts "Thanks for using the Watchlist CLI. Bye!"
          break
        else
        puts "Oh... You entered invalid option. Try again."
        end
      end
    end
  end

  def record
    print "Enter the movie title you'd like to add: "
    title = gets.chomp
    if movies[title].nil?
      puts "Do you know what year is that movie? Enter in YYYY format OR type No"
      year = gets.chomp
        if year == "No"
          puts "Ok, we'll keep this title without year"
          movie = Movie.new(title, year)
          @movies.push(movie)
        elsif year.class != Integer
          puts "Sorry, the year needs to be in YYYY format. Try again."
        else 
          movie = Movie.new(title, year)
          @movies.push(movie)
          puts "#{title} added to your watchlist!"
        end
    else puts "This movie is already in your watchlist"
    end
  end

  def pick
    if @movies.empty?
      puts "Your watchlist is empty. Try adding some titles first."
    else
      @movies.each do |movie|
        puts movie.to_s
        puts "Enjoy the film you choose!"
      end
    end
  end
  
  def remove
    print "Enter the movie title you'd like to remove: "
    title = gets.chomp
    if movies[title].nil?
      puts "There is no such a title on your watchlist!"
    else 
      movie = @movies.find { |title| 
        title.to_s }
      @movies.delete(movie)
      puts "Ok, #{title.to_s} removed from your watchlist."
    end
  end
end
