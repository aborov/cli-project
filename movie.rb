class Movie
  attr_accessor :title, :year

  def initialize(title, year)
    @title = title
    @year = year
  end

=begin
  def title=(value)
    unless value.is_a?(String)
      raise TypeError, 'Title must be a string'
    end
    @title = value.capitalize
  end

  def year=(value)
    unless value.is_a?(Integer)
      raise TypeError, 'Year must be an integer'
    end
    @year = value
  end

  def push(movie)
    movie.map do |title, year|
      @movies[title.to_sym] = year
    end
  end
=end  

  def to_str
    "#{title}" + ", " + "#{year}"
  end

end
