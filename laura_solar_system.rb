class Planet
  attr_accessor :name, :mass, :color, :made_of, :diameter, :solar_rotation, :distance_from_the_sun
  
  def initialize params = {}
    @name = params[:name]
    @mass = params[:mass]
    @color = params[:color]
    @made_of = params[:made_of]
    @diameter = params[:diameter]
    @solar_rotation = params[:solar_rotation]
    @distance_from_the_sun = params[:distance_from_the_sun]
  end
  
  def pretty_info
    puts "name of the planet = #{@name}"
    puts "mass = #{@mass}"
    puts "color = #{@color}"
    puts "made of = #{@made_of}"
    puts "diameter = #{@diameter}"
    puts "solar rotation rate = #{@solar_rotation}"
    puts "distance_from_the_sun = #{@distance_from_the_sun}"
  end
  
end

#I called this class like this because, for what I understood, a class is created
#to be use multiple times, and there is only one 'solar system'. The one that we live in :)
#It makes more sense to me to set it as a planetary system, which are billions of them.
class PlanetarySystem 
  attr_accessor :planet #I am not using this attr, and it works without this line.
  
  def initialize
    @planets_list = []
  end
  
  def add_to_planets_list(planet)
    @planets_list<< planet
    @planets_list
  end
  
  def names
    planets = []
    @planets_list.each do |planet|
      planets<< planet.name
    end
    planets
  end
  
  def find_planet_by_name(name)
    result = nil
    @planets_list.each do |planet|
      if name == planet.name
        result = planet
      end
    end
    result
  end
end

mercury = Planet.new(name: "mercury", mass: "3.3011 * 10^23 kg", color: "grey", made_of: "Mostly iron", diameter: "4879 Km", solar_rotation: "175.97 days", distance_from_the_sun: "57.91 million Km")
venus = Planet.new(name: "venus", mass: "4.867 * 10^24 kg", color: "Yelloswish white", made_of: "Mostly iron and rocks.", diameter: "12,104 Km", solar_rotation: "224.7 days", distance_from_the_sun: "108.2 million Km")
earth = Planet.new(name: "earth", mass: "5.971 * 10^24 kg", color: "Blue", made_of: "Mostly water", diameter: "12,742 Km", solar_rotation: "24.47 days", distance_from_the_sun: "149.6 million Km")
mars = Planet.new(name: "mars", mass: "6.39 * 10^23 kg", color: "Red", made_of: "oxidized iron dust and rocks", diameter: "6,779 Km", solar_rotation: "24.57 days", distance_from_the_sun: "227.9 million Km")
jupiter = Planet.new(name: "jupiter", mass: "1.898 * 10^27 kg", color: "White, red, orange, brown, and yellow", made_of: "hydrogen and helium", diameter: "139,822 Km", solar_rotation: "24.57 days", distance_from_the_sun: "778.5 million Km")
saturn = Planet.new name: "saturn", mass: "5.683 * 10^26 kg", color: "Turns from blue to gold.", made_of: "hydrogen", diameter: "116,464 Km", solar_rotation: "24.57 days", distance_from_the_sun: "1.429 billion Km"
uranus = Planet.new name: "uranus", mass: "8.681 * 10^25 kg", color: "Blue", made_of: "hydrogen and helium", diameter: "50,724 Km", solar_rotation: "24.57 days", distance_from_the_sun: "2.871 billion Km"
neptune = Planet.new name: "neptune", mass: "1.024 * 10^26 kg", color: "Blue", made_of: "Hydrogen and helium", diameter: "49,244 Km", solar_rotation: "0.67 days", distance_from_the_sun: "4.498 billion Km"
#I could not find all the right solar rotations. Some of them I just kept them as random numbers :)

solar_system = PlanetarySystem.new
solar_system.add_to_planets_list(mercury)
solar_system.add_to_planets_list(venus)
solar_system.add_to_planets_list(earth)
solar_system.add_to_planets_list(mars)
solar_system.add_to_planets_list(jupiter)
solar_system.add_to_planets_list(saturn)
solar_system.add_to_planets_list(uranus)
solar_system.add_to_planets_list(neptune)

puts "About which planet do you want to learn more today?"
puts "The options are: #{solar_system.names}"

planet = gets.chomp.downcase

chosen_planet = solar_system.find_planet_by_name("#{planet}")

if chosen_planet == nil
  puts "This is not an option!"
else
  puts solar_system.find_planet_by_name("#{planet}").pretty_info
end
