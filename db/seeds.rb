# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Test User

# User.create(first_name: "Peter", last_name: "Bedrosian", email: "peter_bedrosian@yahoo.com", password: "12345678")

# List of Teams

Team.new(name: "Arizona Cardinals", abbreviation: "ARI", bye: 8).save(validate: false)    
Team.new(name: "Atlanta Falcons", abbreviation: "ATL", bye: 10).save(validate: false)
Team.new(name: "Baltimore Ravens", abbreviation: "BAL", bye: 8).save(validate: false)
Team.new(name: "Buffalo Bills", abbreviation: "BUF", bye: 11).save(validate: false)
Team.new(name: "Carolina Panthers", abbreviation: "CAR", bye: 13).save(validate: false)
Team.new(name: "Chicago Bears", abbreviation: "CHI", bye: 11).save(validate: false)
Team.new(name: "Cincinnati Bengals", abbreviation: "CIN", bye: 9).save(validate: false)
Team.new(name: "Cleveland Browns", abbreviation: "CLE", bye: 9).save(validate: false)
Team.new(name: "Dallas Cowboys", abbreviation: "DAL", bye: 10).save(validate: false)
Team.new(name: "Denver Broncos", abbreviation: "DEN", bye: 8).save(validate: false)
Team.new(name: "Detroit Lions", abbreviation: "DET", bye: 5).save(validate: false)
Team.new(name: "Green Bay Packers", abbreviation: "GB", bye: 5).save(validate: false)
Team.new(name: "Houston Texans", abbreviation: "HOU", bye: 8).save(validate: false)
Team.new(name: "Indianapolis Colts", abbreviation: "IND", bye: 7).save(validate: false)
Team.new(name: "Jacksonville Jaguars", abbreviation: "JAX", bye: 7).save(validate: false)
Team.new(name: "Kansas City Chiefs", abbreviation: "KC", bye: 10).save(validate: false)
Team.new(name: "Los Angeles Chargers", abbreviation: "LAC", bye: 10).save(validate: false)
Team.new(name: "Los Angeles Rams", abbreviation: "LA", bye: 9).save(validate: false)
Team.new(name: "Los Vegas Raiders", abbreviation: "LV", bye: 6).save(validate: false)
Team.new(name: "Miami Dolphins", abbreviation: "MIA", bye: 11).save(validate: false)
Team.new(name: "Minnesota Vikings", abbreviation: "MIN", bye: 7).save(validate: false)
Team.new(name: "New England Patriots", abbreviation: "NE", bye: 6).save(validate: false)
Team.new(name: "New Orleans Saints", abbreviation: "NO", bye: 6).save(validate: false)
Team.new(name: "New York Giants", abbreviation: "NYG", bye: 11).save(validate: false)
Team.new(name: "New York Jets", abbreviation: "NYJ", bye: 11).save(validate: false)
Team.new(name: "Philadelphia Eagles", abbreviation: "PHI", bye: 9).save(validate: false)
Team.new(name: "Pittsburgh Steelers", abbreviation: "PIT", bye: 8).save(validate: false)
Team.new(name: "San Francisco 49ers", abbreviation: "SF", bye: 11).save(validate: false)
Team.new(name: "Seattle Seahawks", abbreviation: "SEA", bye: 6).save(validate: false)
Team.new(name: "Tampa Bay Buccaneers", abbreviation: "TB", bye: 13).save(validate: false)
Team.new(name: "Tennessee Titans", abbreviation: "TEN", bye: 7).save(validate: false)
Team.new(name: "Washington Redskins", abbreviation: "WAS", bye: 8).save(validate: false)

# Schedule

url = "http://#{ENV['API_KEY']}@api.mysportsfeeds.com/v2.1/pull/nfl/2020-2021-regular/games.json" 
info = HTTParty.get(url)
def get_team_id(abv)
    team = Team.find_by abbreviation: abv
    team.id
end


info["games"].each do |g|
    # binding.pry
    home_team = get_team_id(g["schedule"]["homeTeam"]["abbreviation"])
    away_team = get_team_id(g["schedule"]["awayTeam"]["abbreviation"])
    date = g["schedule"]["startTime"].to_time.in_time_zone("America/New_York")
    week = g["schedule"]["week"]
    api_id = g["schedule"]["id"]
    status = g["schedule"]["playedStatus"]
    network = g["schedule"]["broadcasters"].first
    game = Game.new(home_team_id: home_team, away_team_id: away_team, winner_id: nil, date: date, week_id: week, api_id: api_id, status: status, network: network)
    game.save(validate: false)
end

# Week Table

Week.create(start_of_week: Time.now, end_of_week: "2020-09-10 20:19:00") # week 1
Week.create(start_of_week: "2020-09-15", end_of_week: "2020-09-17 20:19:00") # week 2
Week.create(start_of_week: "2020-09-22", end_of_week: "2020-09-24 20:19:00") # week 3
Week.create(start_of_week: "2020-09-29", end_of_week: "2020-10-01 20:19:00") # week 4
Week.create(start_of_week: "2020-10-06", end_of_week: "2020-10-08 20:19:00") # week 5
Week.create(start_of_week: "2020-10-13", end_of_week: "2020-10-15 20:19:00") # week 6
Week.create(start_of_week: "2020-10-20", end_of_week: "2020-10-22 20:19:00") # week 7
Week.create(start_of_week: "2020-10-23", end_of_week: "2020-10-29 20:19:00") # week 8
Week.create(start_of_week: "2020-11-03", end_of_week: "2020-11-05 20:19:00") # week 9
Week.create(start_of_week: "2020-11-10", end_of_week: "2020-11-12 20:19:00") # week 10
Week.create(start_of_week: "2020-11-17", end_of_week: "2020-11-19 20:19:00") # week 11
Week.create(start_of_week: "2020-11-23", end_of_week: "2020-11-26 12:29:00") # week 12
Week.create(start_of_week: "2020-12-01", end_of_week: "2020-12-03 20:19:00") # week 13
Week.create(start_of_week: "2020-12-08", end_of_week: "2020-12-10 20:19:00") # week 14
Week.create(start_of_week: "2020-12-15", end_of_week: "2020-12-17 20:19:00") # week 15
Week.create(start_of_week: "2020-12-22", end_of_week: "2020-12-25 16:29:00") # week 16
Week.create(start_of_week: "2020-12-29", end_of_week: "2021-01-03 12:59:00") # week 17
