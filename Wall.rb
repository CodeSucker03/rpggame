require 'ruby2d'

class Wall
  def initialize(x,y, width, height)
      Image.new(
        'Assests/Wall.png',
        x: x,
        y: y,
        width: width,
        height: height,
      )
  end
end
