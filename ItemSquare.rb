# square.rb
require 'ruby2d'
require_relative 'CollisionChecker'

class ItemSquare
  attr_accessor :item

  def initialize(x, y, width, height)
     @item = Image.new(
      'Assests/Meat.png',
      x: x,
      y: y,
      width: width,
      height: height
     )

  end

  def collisionPlayer (character)
   return Collision_between_2_objects(@item.x, @item.y, @item.width, @item.height, character.x, character.y, character.width, character.height)
  end
  def removeItem()
    item.remove
  end
end
