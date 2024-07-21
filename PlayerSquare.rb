# square.rb
require 'ruby2d'
require_relative 'CollisionChecker'

class PlayerSquare < Sprite
  attr_accessor :x_speed, :y_speed

  def initialize(x, y, width, height, color)
    super(
      'Assests/character.png',
      x: x,
      y: y,
      width: width, height: height,
      clip_width: 60,
      color: color,
      animations: {fly: 1..3}
    )
    @x_speed = 0
    @y_speed = 0
  end

  def move(map, tile_size, items)
    new_x = self.x + @x_speed
    new_y = self.y + @y_speed

    @wallcollision = false  # Reset wall collision state before checking
    (map.size).times do |row|
      (map.size).times do |col|
       if map[row][col] == 4
        wall_x = col * (tile_size)
        wall_y = row * (tile_size)
        @wallcollision = Collision_between_2_objects(new_x, new_y, self.width, self.height, wall_x, wall_y, tile_size, tile_size)
        break if @wallcollision  # Exit loop early if collision detected
       end
      end
      break if @wallcollision  # Exit loop early if collision detected
    end

     # Check for collisions with obstacles

    if Check_Within_Map_Boundary(self, map, tile_size) && !(@wallcollision)
      self.x = new_x
      self.y = new_y
    end
    if items.collisionPlayer(self)
      items.removeItem()
    end
  end

  def set_speed(x_speed, y_speed)
    @x_speed = x_speed
    @y_speed = y_speed
  end

  def runAnimation()
    self.play(animation: :fly)
  end

  def stop
    @x_speed = 0
    @y_speed = 0
    super
  end
end
