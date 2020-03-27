# /!/usr/bin/env ruby

class Cell

  attr_accessor :content

  def initialize(content)
    @content = content
  end

  def draw()
    print " #{@content} "
  end

  # define the equality operator, so that two cells are only equal if they
  # are not empty and have the same sign
  def ==(other)
    if self.class == other.class
      if @content == " "
        return false
      end
      return @content == other.content
    else
      return false
    end
  end
end
