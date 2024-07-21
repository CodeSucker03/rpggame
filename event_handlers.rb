# event_handlers.rb

def handle_key_down(event, player_square)
  case event.key
  when 'a'
    player_square.set_speed(-2, 0)
  when 'd'
    player_square.set_speed(2, 0)
  when 'w'
    player_square.set_speed(0, -2)
  when 's'
    player_square.set_speed(0, 2)
  end
end

def handle_key_up(event, player_square)
  case event.key
  when 'a', 'd', 'w', 's'
    player_square.stop
  end
end

def setup_event_handlers(player_square, map, tile_size, items )
  on :key_held do |event|
    player_square.runAnimation()
    handle_key_down(event, player_square)
  end

  on :key_up do |event|
    handle_key_up(event, player_square)
  end
  update do
    player_square.move(map, tile_size, items)
  end
end
