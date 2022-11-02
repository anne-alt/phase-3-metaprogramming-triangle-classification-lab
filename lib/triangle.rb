class Triangle
  # write code here

  attr_reader :equilateral, :isosceles, :scalene
  attr_accessor :side1, :side2, :side3

  def initialize side1, side2, side3
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind 
    if [@side1, @side2, @side3].any? {|side| side <= 0}
    raise TriangleError
    end

    sides = [@side1, @side2, @side3].sort

    unless sides[0] + sides[1] > sides[2]
    raise TriangleError
    end

    if (@side1 == @side2 && @side2 == @side3)
      :equilateral
    elsif (@side1==@side2) || (@side2==@side3) || (@side1==@side3)
      :isosceles
    else 
      # (@side1 != @side2) &&  (@side2 != @side3) && (@side1 != @side3)
      :scalene
    end
  
  end


  class TriangleError < StandardError
  end

end
