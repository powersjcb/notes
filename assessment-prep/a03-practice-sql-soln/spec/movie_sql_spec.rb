# -*- coding: utf-8 -*-
require 'rspec'
require 'movie_sql'

describe do "#sql_quiz"
  it "Finds all Chuck Norris movies" do
    expect(bearded_films).to eq([
      {"title"=>"A Force of One"},
      {"title"=>"Braddock: Missing in Action III"},
      {"title"=>"Code of Silence"},
      {"title"=>"DodgeBall: A True Underdog Story"},
      {"title"=>"Firewalker"},
      {"title"=>"Lone Wolf McQuade"},
      {"title"=>"Sidekicks"},
      {"title"=>"The Green Berets"},
      {"title"=>"Top Dog"},
      {"title"=>"Way of the Dragon"}
    ])
  end

  it "Fetches the cast for Zombies of the Stratosphere" do
    expect(zombie_cast).to eq([
      {"name"=>"Aline Towne"},
      {"name"=>"Craig Kelly"},
      {"name"=>"John Crawford"},
      {"name"=>"Judd Holdren"},
      {"name"=>"Lane Bradford"},
      {"name"=>"Leonard Nimoy"},
      {"name"=>"Ray Boyle"},
      {"name"=>"Stanley Waxman"},
      {"name"=>"Wilson Wood"}
    ])
  end

  it "Calculates Danny DeVito's biggest years" do
    expect(biggest_years_for_little_danny).to eq([
      {"yr"=>1993, "count"=>3},
      {"yr"=>2000, "count"=>3},
      {"yr"=>2003, "count"=>3}
    ])
  end

  it "Finds Nick Cage's non starring films" do
    expect(more_cage_please).to eq([
      {"title"=>"Brubaker"},
      {"title"=>"Fast Times at Ridgemont High"},
      {"title"=>"Guarding Tess"},
      {"title"=>"Honeymoon in Vegas"},
      {"title"=>"Moonstruck"},
      {"title"=>"Peggy Sue Got Married"},
      {"title"=>"The Ant Bully"},
      {"title"=>"The Cotton Club"},
      {"title"=>"The Rock"},
      {"title"=>"rumble Fish"}
   ])
  end

  it "Finds all leading actors for 1908" do
    expect(who_is_florence_lawrence).to eq([
      {"title"=>"After Many Years", "name"=>"Florence Lawrence"},
      {"title"=>"His Wife's Child", "name"=>"Florence Lawrence"},
      {"title"=>"L'Assassinat du Duc de Guise", "name"=>"Henri III"},
      {"title"=>"Macbeth", "name"=>"William Ranous"},
      {"title"=>"Rescued from an Eagle's Nest", "name"=>"D. W. Griffith"},
      {"title"=>"The Adventures of Dollie", "name"=>"Arthur V. Johnson"},
      {"title"=>"The Fairylogue and Radio-Plays", "name"=>"L. Frank Baum"},
      {"title"=>"The Taming of the Shrew", "name"=>"Florence Lawrence"}
    ])
  end

  it "Counts bad actors" do
    expect(count_bad_actors).to eq([
      {"num_bad_actors" => 6513},
    ])
  end

  it "Twenty Roles" do
    expect(twenty_roles).to eq([
      {"name" => "Glenn Ford"},
      {"name" => "Jackie Chan"},
      {"name" => "James Stewart"},
      {"name" => "Richard Gere" },
      {"name" => "Tom Hanks"}
    ])
  end

  it "Chris Farley's movies" do
    expect(chris_is_missed).to eq([
      {"title"=>"Airheads", "name"=>"Brendan Fraser"},
      {"title"=>"Almost Heroes", "name"=>"Chris Farley"},
      {"title"=>"Beverly Hills Ninja", "name"=>"Chris Farley"},
      {"title"=>"Billy Madison", "name"=>"Adam Sandler"},
      {"title"=>"Black Sheep", "name"=>"Chris Farley"},
      {"title"=>"Coneheads|", "name"=>"Dan Aykroyd"},
      {"title"=>"Dirty Work", "name"=>"Norm Macdonald"},
      {"title"=>"Tommy Boy", "name"=>"Chris Farley"}
    ])
  end
end
