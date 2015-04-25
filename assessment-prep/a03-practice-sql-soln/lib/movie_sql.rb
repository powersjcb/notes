require 'singleton'
require 'sqlite3'

class MovieDatabase < SQLite3::Database
  include Singleton

  def initialize
    super(File.dirname(__FILE__) + "/../movie.db")

    self.results_as_hash = true
    self.type_translation = true
  end

  def self.execute(*args)
    self.instance.execute(*args)
  end
end

# List the films in which 'Chuck Norris' has appeared; order by movie
# title.
def bearded_films
  MovieDatabase.execute(<<-SQL)
  SELECT
    movie.title
  FROM
    actor
  JOIN
    casting ON actor.id = casting.actorid
  JOIN
    movie ON casting.movieid = movie.id
  WHERE
    actor.name = 'Chuck Norris'
  ORDER BY
    movie.title
SQL
end

# Obtain the cast list for the movie "Zombies of the Stratosphere";
# order by the actor's name.
def zombie_cast
  MovieDatabase.execute(<<-SQL)
  SELECT
    actor.name
  FROM
    actor
  JOIN
    casting ON actor.id = casting.actorid
  JOIN
    movie ON casting.movieid = movie.id
  WHERE
    movie.title = 'Zombies of the Stratosphere'
  ORDER BY
    actor.name
SQL
end

# Which were the busiest years for 'Danny DeVito'? Show the year and
# the number of movies he made each year for any year in which he made
# >2 movies. Order by year. Note the 'V' is capitalized.
def biggest_years_for_little_danny
  MovieDatabase.execute(<<-SQL)
  SELECT
    movie.yr, COUNT(*) AS count
  FROM
    actor
  JOIN
    casting ON actor.id = casting.actorid
  JOIN
    movie ON casting.movieid = movie.id
  WHERE
    actor.name = "Danny DeVito"
  GROUP BY
    movie.yr
  HAVING
    COUNT(*) > 2
SQL
end

# List the films where 'Nicolas Cage' has appeared, but not in the
# star role. Order by movie title.
def more_cage_please
  MovieDatabase.execute(<<-SQL)
  SELECT
    movie.title
  FROM
    actor
  JOIN
    casting ON actor.id = casting.actorid
  JOIN
    movie ON casting.movieid = movie.id
  WHERE
    (actor.name = 'Nicolas Cage' AND casting.ord != 1)
  ORDER BY
    movie.title
SQL
end

# List the films together with the leading star for all 1908
# films. Order by movie title.
def who_is_florence_lawrence
  MovieDatabase.execute(<<-SQL)
  SELECT
    movie.title, actor.name
  FROM
    actor
  JOIN
    casting ON actor.id = casting.actorid
  JOIN
    movie ON casting.movieid = movie.id
  WHERE
    (movie.yr = 1908 AND casting.ord = 1)
  ORDER BY
    movie.title
SQL
end

# Some actors listed in our database are not associated with any actual
# movie role(s). How many such actors are there? Alias this number as
# 'num_bad_actors'.
def count_bad_actors
  MovieDatabase.execute(<<-SQL)
  SELECT
    COUNT(*) AS 'num_bad_actors'
  FROM
    actor
  LEFT OUTER JOIN
    casting ON actor.id = casting.actorid
  WHERE
    casting.actorid IS NULL
SQL
end

# Obtain a list in alphabetical order of actors who've had exactly 20
# starring roles. Order by actor name.
def twenty_roles
  MovieDatabase.execute(<<-SQL)
  SELECT
    actor.name
  FROM
    actor
  JOIN
    casting ON actor.id = casting.actorid
  JOIN
    movie ON casting.movieid = movie.id
  WHERE
    casting.ord = 1
  GROUP BY
    actor.id
  HAVING
    COUNT(DISTINCT movie.id) = 20
  ORDER BY
    actor.name
SQL
end

# List the film title and the leading actor for all of the films
# 'Chris Farley' played in.
def chris_is_missed
  MovieDatabase.execute(<<-SQL)
  SELECT
    movie.title, lead_actor.name
  FROM
    actor AS chris_actor
  JOIN
    casting AS chris_casting ON chris_actor.id = chris_casting.actorid
  JOIN
    movie ON chris_casting.movieid = movie.id
  JOIN
    casting AS lead_casting ON movie.id = lead_casting.movieid
  JOIN
    actor AS lead_actor ON lead_casting.actorid = lead_actor.id
  WHERE
    (chris_actor.name = "Chris Farley" AND lead_casting.ord = 1)
  ORDER BY
    movie.title
SQL
end
