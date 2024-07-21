require 'ruby2d'

def Collision_between_2_objects(x1, y1, object1_width, object1_height, x2, y2, object2_width, object2_height)
  collision = false
  if x1 + object1_width >= x2 &&
    x1 <= x2 + object2_width &&
    y1 + object1_height >= y2 &&
    y1 <= y2 + object2_height
    collision = true
  end
  return collision
end

def Check_Within_Map_Boundary(character, map, tile_size)
  within_x_bounds = character.x >= 1 && character.x + character.width <= map.size * (tile_size)
  within_y_bounds = character.y >= 1 && character.y + character.height <= map.size * (tile_size)
  return within_x_bounds && within_y_bounds
end
