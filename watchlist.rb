require_relative "movie"

class Watchlist

  def initialize
    @movies = []
  end

=begin
  def push(movie)
    movie.map do |title, year|
      @movies[title.to_sym] = year
    end
  end
=end

  def run
    loop do
      puts "\n"
      puts "Hey movie fan, welcome to the Watchlist!"

  #    if @movies.empty?
  #      puts "Your watchlist is empty. Want to start by adding the first title?"
  #      puts "Y = Yes"
  #      puts "N = No"
  #      proceed = gets.chomp
  #      if proceed == "Y"
   #       record
    #    else
    #      break
     #   end
  #    break
  # end
     # else
    
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
      # end
    end
  end
 
  private

  def record
    print "Enter the movie title you'd like to add: "
    title = gets.chomp
    #if @movies.find { |movie| title.to_s } == nil
      puts "What year is that movie? Enter in YYYY format"
      year = gets.chomp.to_i
       # if year == "No"
       #   puts "Ok, we'll keep this title without year"
       #   movie = Movie.new(title, year)
       #   @movies.push(movie)
        if year.class != Integer
          puts "Sorry, the year needs to be in YYYY format. Try again."
        else 
          @movies << Movie.new(title, year)
          puts "#{title} added to your watchlist!"
        end
    #else puts "This movie is already in your watchlist"
    #end
  end

  def pick
    if @movies.empty?
      puts "Your watchlist is empty. Try adding some titles first."
    else
      puts "Here are some films you could watch:"
      @movies.each do |movie|
       print "\n" + movie.to_str
       # print @movies
      end
      puts "\nEnjoy the film you choose!"
    end
  end
  
  def remove
    print "Enter the movie title you'd like to remove: "
    title = gets.chomp
    #if @movies.find { |movie| title.to_sym } == nil
    #  puts "There is no such a title on your watchlist!"
    #else 
      # movie = @movies.find { |title| 
      #   title.to_s }
      @movies.delete(title)
      puts "Ok, #{title.to_s} removed from your watchlist."
    #end
  end
end
