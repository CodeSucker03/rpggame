require 'ruby2d'

class GrassTerrain
  def initialize(x, y, width, height)
    Image.new('Assests/Tilemap_Flat.png',
     x: x,
     y: y,
     width: width,
     height: height,
     color: 'brown')
  end
end
