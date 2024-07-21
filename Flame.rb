require 'ruby2d'

class Flame
  def initialize(x, y, width,height)
    @flame = Sprite.new(
      'Assests/flame.png',
      x: x,
      y: y,
      width: width,
      height: height,
      clip_width: 385/8,
      loop: true,
      time: 200,
    )
  end
  def Flame_play
    @flame.play
  end
end
