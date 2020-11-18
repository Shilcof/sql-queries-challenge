# Code your solution here! 


def blue_aliens
   # return the names and colors of all the aliens that are 'blue'
   "SELECT aliens.name, aliens.color FROM aliens WHERE aliens.color = 'blue';"
end

def old_aliens
   # return the names and ages of all aliens over the age of 100
   "SELECT aliens.name, aliens.age FROM aliens WHERE aliens.age > 100;"
end

def dangerous_aliens
   # return the names of the dangerous aliens
   "SELECT aliens.name FROM aliens WHERE aliens.dangerous = 1;"
end


def fastest_spaceship
 # return all of the info about the fastest spaceship
   "SELECT * FROM spaceships ORDER BY spaceships.speed DESC LIMIT 1;"
end

def aliens_aboard_fastest_spaceship
  #return a list of the aliens aboard the fastest spaceship
  "SELECT aliens.name FROM aliens JOIN spaceships ON aliens.spaceship_id = spaceships.id GROUP BY spaceships.id HAVING spaceships.id = (SELECT spaceships.id FROM spaceships ORDER BY spaceships.speed DESC LIMIT 1);"
end


def aliens_and_spaceships
  # Return a list of all aliens and the spaceship they belong to
   "SELECT aliens.*, spaceships.name FROM aliens JOIN spaceships ON spaceships.id = aliens.spaceship_id;"
end


def aliens_and_planets
 # Get a list of all aliens and the planets they belong to 
 "SELECT aliens.*, planets.name FROM aliens JOIN spaceships ON spaceships.id = aliens.spaceship_id JOIN planets ON planets.id = spaceships.planet_id;"
end


def aliens_aboard_beebop
   # Get a list of all aliens aboard a the spaceship named 'Beebop'
   "SELECT aliens.*, spaceships.name FROM aliens JOIN spaceships ON spaceships.id = aliens.spaceship_id WHERE spaceships.name = 'Beebop';"  
end


def aliens_from_gliese
   # Get a list of all aliens from the planet named 'Gliese'
   "SELECT aliens.*, planets.name FROM aliens JOIN spaceships ON spaceships.id = aliens.spaceship_id JOIN planets ON planets.id = spaceships.planet_id WHERE planets.name = 'Gliese';"
end

def spaceship_count_for_each_planet
  # Return each planet's name and how many spaceships are from each planet
  "SELECT planets.name, COUNT(planets.id) FROM planets JOIN spaceships ON planets.id = spaceships.planet_id GROUP BY spaceships.planet_id;"
end

def alien_count_for_spaceships
    # Return each spaceships's name and how many aliens are aboard each spaceship   
   "SELECT aliens.name, COUNT(spaceships.id) FROM aliens JOIN spaceships ON spaceships.id = aliens.spaceship_id GROUP BY aliens.spaceship_id;" 
end

def alien_count_for_planets
    # Return each planet's name and how many aliens are from each planet
    "SELECT planets.name, COUNT(planets.id) FROM aliens JOIN spaceships ON spaceships.id = aliens.spaceship_id JOIN planets ON planets.id = spaceships.planet_id GROUP BY planets.id;"  
end

def order_planets_by_aliens
   # Order the planets from most number of aliens to least number of aliens
   "SELECT planets.name, COUNT(planets.id) FROM aliens JOIN spaceships ON spaceships.id = aliens.spaceship_id JOIN planets ON planets.id = spaceships.planet_id GROUP BY planets.id ORDER BY COUNT(planets.id) DESC;"
end

def spaceshisps_with_blue_aliens
   # return the names of spaceships that have blue aliens aboard
   "SELECT DISTINCT spaceships.name FROM spaceships JOIN aliens ON aliens.spaceship_id = spaceships.id WHERE aliens.color = 'blue';"
end

def spaceship_and_alien_count
  # return a count of all spaceships from a planet and the total number of aliens from that planet
   sql = <<-SQL
   SELECT COUNT(a.alien_per_ship), SUM(a.alien_per_ship) FROM(
      SELECT COUNT(spaceships.planet_id) AS alien_per_ship, planets.name AS p
      FROM planets 
      JOIN spaceships ON planets.id = spaceships.planet_id 
      JOIN aliens ON spaceships.id = aliens.spaceship_id 
      GROUP BY spaceships.id
   ) AS a GROUP BY p;
   SQL
end

def order_planets_by_alien_count
   # order the planets based on how many aliens are from that planet
   "SELECT planets.name, COUNT(aliens.id) FROM planets JOIN spaceships ON planets.id = spaceships.planet_id JOIN aliens ON spaceships.id = aliens.spaceship_id GROUP BY planets.id ORDER BY COUNT(aliens.id);"
end

def order_planets_by_old_alien_count
   ## MOST DIFFICULT 
   # order the planets based on how many aliens over the age of 100 are from that planet
   "SELECT planets.name, COUNT(aliens.id) FROM planets JOIN spaceships ON planets.id = spaceships.planet_id JOIN aliens ON spaceships.id = aliens.spaceship_id WHERE aliens.age > 100 GROUP BY planets.id ORDER BY COUNT(aliens.id) DESC;"
end


