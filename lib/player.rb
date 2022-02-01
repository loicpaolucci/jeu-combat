require "pry"

class Player 
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{name} a #{life_points} point de vie " 
  end

  def gets_damage(damage)
  @life_points = @life_points - damage
  show_state
  if @life_points <= 0 
    puts "#{name} est mort "
  end
  end

  def attacks(player)
    damage = compute_damage
    puts "Le joueur #{@name} attaque le joueur #{player.name}"
    puts "Il lui inflige #{damage} points de dommages"
    player.gets_damage(damage)
  end

  def compute_damage
    rand(1..6)
  end

end
   
