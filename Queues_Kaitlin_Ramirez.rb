#Planet Class
class Planet
attr_reader :name, :greek, :number, :type, :moons, :distance_from_the_sun

  def initialize(planet_hash)
    @name = planet_hash[:name]
    @greek = planet_hash[:greek]
    @number = planet_hash[:number]
    @type = planet_hash[:type]
    @moons = planet_hash[:moons]
    @distance_from_the_sun = planet_hash[:distance_from_the_sun]
  end

end


#Planet information, as separate variables,
#a little easier to add more later
mercury_hash = {
  name: "Mercury",
  greek: "Hermes",
  number: 1,
  type: "terrestrial",
  moons: 0,
  distance_from_the_sun: 0.387 #astronomical units
}

venus_hash = {
  name: "Venus",
  greek: "Aphrodite",
  number: 2,
  type: "terrestrial",
  moons: 0,
  distance_from_the_sun: 0.723
}

earth_hash = {
  name: "Earth",
  greek: "Gaia",
  number: 3,
  type: "terrestrial",
  moons: 1,
  distance_from_the_sun: 1.00
}


#Adding planet hash information into the Planet class
#Planet.new(sun_hash)
Planet.new(mercury_hash)
Planet.new(venus_hash)
Planet.new(earth_hash)


#Solar System Class
class SolarSystem
  attr_reader :planets

  def initialize
    @planets = []
  end

  def add_planet(planet)
    @planets.push(planet)
  end


  #OPTIONAL - distance_from_the_sun
  #this method could go in the 'math' method on line 93
  #but I like practicing methods :)
  def subtract(planet2, planet1 = 0)
    planet2 - planet1
  end

  def math
    distances = @planets.map { |x| x[:distance_from_the_sun] }
    distances.unshift(0) #add zero at the beginning of the array, gives mercury something to subtract from
    subtract_this_many = (distances.length) - 1
    @distance_from_each_other = []
    subtract_this_many.times do |order|
        @distance_from_each_other.push(subtract(distances[order + 1], distances[order]).round(3))
    end
  end


  #not part of assignment - I like seeing output in the terminal
  def description
    @planets.each do |hash|
        print "#{hash[:number]}. #{hash[:name]} in Greek is #{hash[:greek]}. #{hash[:name]} "
        #I don't like that this is harcoded, but this is what works right now
        #I would like to refactor this to be more smart and not require their own if-elses
        #this would be annoying as more planets are added
        if hash[:name] == "Mercury" then
          print "is #{@distance_from_each_other[0]} astronomical units from the Sun and #{@distance_from_each_other[1]} astronomical units from Venus."
          puts
        elsif hash[:name] == "Venus" then
          print "is #{@distance_from_each_other[1]} astronomical units from Mercury and #{@distance_from_each_other[2]} astronomical units from Earth."
          puts
        elsif hash[:name] == "Earth" then
          print "is #{@distance_from_each_other[2]}  astronomical units from Venus."
          puts
        end
      end
  end

end

#Creating the Milky Way Solar System
milky_way = SolarSystem.new
#Adding each Planet information into Solar System array
milky_way.add_planet(mercury_hash)
milky_way.add_planet(venus_hash)
milky_way.add_planet(earth_hash)
#Does math then makes output to terminal
milky_way.math
milky_way.description
