require 'ruby2d'

# Set up the window
set width: 400, height: 400, title: "Move Square with Arrow Keys"

# Define a square shape
@square = Square.new(x: 10, y: 20, size: 25, color: 'blue')

# Define the initial speed (and direction)
@x_speed = 0
@y_speed = 0

# Define what happens when a specific key is pressed
# Each key press sets the movement speed along the x and y axis
on :key_down do |event|
  case event.key
  when 'a'
    @x_speed = -2
    @y_speed = 0
  when 'd'
    @x_speed = 2
    @y_speed = 0
  when 'w'
    @x_speed = 0
    @y_speed = -2
  when 's'
    @x_speed = 0
    @y_speed = 2
  end
end

# Define what happens when a specific key is released
# Stop movement when the key is released
on :key_up do |event|
  case event.key
  when 'a', 'd'
    @x_speed = 0
  when 'w', 's'
    @y_speed = 0
  end
end

update do
  @square.x += @x_speed
  @square.y += @y_speed
end

show
