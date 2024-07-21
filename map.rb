# map.rb
require 'ruby2d'
require_relative 'PlayerSquare'
require_relative 'event_handlers'
require_relative 'ItemSquare'
require_relative 'Flame'
require_relative 'Grass'
require_relative 'Wall'


set width: 500 , height: 500, title: "8x8 Grid with Brown Tiles and Black Borders", resizable: true
# Constants
TILE_SIZE = 50

# 1 = Grass
# 2 = Fire
# 3 = Water
# 4 = Wall

map = [
    [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
    [4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4],
    [4, 1, 3, 3, 3, 1, 1, 1, 2, 2, 2, 1, 1, 1, 3, 3, 3, 1, 1, 4],
    [4, 1, 3, 1, 3, 1, 1, 1, 2, 1, 2, 1, 1, 1, 3, 1, 3, 1, 1, 4],
    [4, 1, 3, 3, 3, 1, 1, 1, 2, 2, 2, 1, 1, 1, 3, 3, 3, 1, 1, 4],
    [4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4],
    [4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4],
    [4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4],
    [4, 1, 2, 2, 2, 1, 1, 1, 3, 3, 3, 1, 1, 1, 2, 2, 2, 1, 1, 4],
    [4, 1, 2, 1, 2, 1, 1, 1, 3, 1, 3, 1, 1, 1, 2, 1, 2, 1, 1, 4],
    [4, 1, 2, 2, 2, 1, 1, 1, 3, 3, 3, 1, 1, 1, 2, 2, 2, 1, 1, 4],
    [4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4],
    [4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4],
    [4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4],
    [4, 1, 3, 3, 3, 1, 1, 1, 2, 2, 2, 1, 1, 1, 3, 3, 3, 1, 1, 4],
    [4, 1, 3, 1, 3, 1, 1, 1, 2, 1, 2, 1, 1, 1, 3, 1, 3, 1, 1, 4],
    [4, 1, 3, 3, 3, 1, 1, 1, 2, 2, 2, 1, 1, 1, 3, 3, 3, 1, 1, 4],
    [4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4],
    [4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4],
    [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4]
]

# Create the map
(map.size).times do |row|
  (map.size).times do |col|
    # Draw the brown tile (foreground square)
    newGrass = GrassTerrain.new(col * TILE_SIZE,row* TILE_SIZE, 50, 50 )
    case map[row][col]
    when 4
     newWall = Wall.new(col * TILE_SIZE,row* TILE_SIZE, 50, 50)
    when 2
      newFlame = Flame.new(col * TILE_SIZE,row* TILE_SIZE, 50, 50)
      newFlame.Flame_play()
    end
  end
end
player_square = PlayerSquare.new(100, 60, 40, 40 ,'white')
item_square = ItemSquare.new(100, 300, 40, 40)

# # Set up event handlers and update loop
setup_event_handlers(player_square, map, TILE_SIZE, item_square)


# Show the window
show
