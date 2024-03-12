class Movie
  attr_accessor :title, :year

  def initialize(title, year)
    self.title = title
    self.year = year
  end

  def title=(value)
    unless value.is_a?(String)
      raise TypeError, 'Title must be a string'
    end
    @title = value.capitalize
  end

  def year=(value)
    unless value.is_a(Integer)
      raise TypeError, 'Year must be an integer'
    end
    @year = value
  end

  #def to_s
  #  "@{title} @{year}"
  #end


end
