require "pry"

def game_hash
  game_hash =
    {
      home: {
        team_name: "Brooklyn Nets",
        colors: ["Black", "White"],
        players: {
          "Alan Anderson" => {
            number: 0,
            shoe: 16,
            points: 22,
            rebounds: 12,
            assists: 12,
            steals: 3,
            blocks: 1,
            slam_dunks: 1,
          },
          "Reggie Evans" => {
            number: 30,
            shoe: 14,
            points: 12,
            rebounds: 12,
            assists: 12,
            steals: 12,
            blocks: 12,
            slam_dunks: 7,
          },
          "Brook Lopez" => {
            number: 11,
            shoe: 17,
            points: 17,
            rebounds: 19,
            assists: 10,
            steals: 3,
            blocks: 1,
            slam_dunks: 15,
          },
          "Mason Plumlee" => {
            number: 1,
            shoe: 19,
            points: 26,
            rebounds: 12,
            assists: 6,
            steals: 3,
            blocks: 8,
            slam_dunks: 5,
          },
          "Jason Terry" => {
            number: 31,
            shoe: 15,
            points: 19,
            rebounds: 2,
            assists: 2,
            steals: 4,
            blocks: 11,
            slam_dunks: 1,
          },
        },
      },
      away: {
        team_name: "Charlotte Hornets",
        colors: ["Turquoise", "Purple"],
        players: {
          "Jeff Adrien" => {
            number: 4,
            shoe: 18,
            points: 10,
            rebounds: 1,
            assists: 1,
            steals: 2,
            blocks: 7,
            slam_dunks: 2,
          },
          "Bismak Biyombo" => {
            number: 0,
            shoe: 16,
            points: 12,
            rebounds: 4,
            assists: 7,
            steals: 7,
            blocks: 15,
            slam_dunks: 10,
          },
          "DeSagna Diop" => {
            number: 2,
            shoe: 14,
            points: 24,
            rebounds: 12,
            assists: 12,
            steals: 4,
            blocks: 5,
            slam_dunks: 5,
          },
          "Ben Gordon" => {
            number: 8,
            shoe: 15,
            points: 33,
            rebounds: 3,
            assists: 2,
            steals: 1,
            blocks: 1,
            slam_dunks: 0,
          },
          "Brendan Haywood" => {
            number: 33,
            shoe: 15,
            points: 6,
            rebounds: 12,
            assists: 12,
            steals: 22,
            blocks: 5,
            slam_dunks: 12,
          },
        },
      },
    }
end

def num_points_scored(player_name)
  merged_hash = game_hash[:home][:players].merge(game_hash[:away][:players])
  player = merged_hash.fetch(player_name)
  player[:points]
end

def shoe_size(player_name)
  merged_hash = game_hash[:home][:players].merge(game_hash[:away][:players])
  player = merged_hash.fetch(player_name)
  player[:shoe]
end

def team_colors(team_name)
  teams = game_hash.values
  the_team = teams.find { |team| team.fetch(:team_name) == team_name }
  the_team[:colors]
end

def team_names
  names = []
  teams = game_hash.values
  names << teams[0][:team_name]
  names << teams[1][:team_name]
  return names
end

def player_numbers(team_name)
  teams = game_hash.values
  team_numbers = []
  the_team = teams.find { |team| team.fetch(:team_name) == team_name }
  the_team[:players].each { |player| team_numbers << player[1][:number] }
  return team_numbers
end

def player_stats(player_name)
  merged = game_hash[:home][:players].merge(game_hash[:away][:players])
  return merged.fetch(player_name)
end

def big_shoe_rebounds
  merged = game_hash[:home][:players].merge(game_hash[:away][:players])
  biggest_shoe_player = merged.max_by { |name, stats| stats[:shoe] }
  return biggest_shoe_player[1][:rebounds]
end

def most_points_scored
  merged = game_hash[:home][:players].merge(game_hash[:away][:players])
  player = merged.max_by { |name, stats| stats[:points] }
  # binding.pry
  return player[0]
end

def winning_team
  home_score_total = []
  game_hash[:home][:players].each { |player| home_score_total << player[1][:points] }
  away_score_total = []
  game_hash[:away][:players].each { |player| away_score_total << player[1][:points] }
  if home_score_total.sum > away_score_total.sum
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  merged = game_hash[:home][:players].merge(game_hash[:away][:players])
  player = merged.max_by { |name, stats| name.length }
  # binding.pry
  return player[0]
end

def long_name_steals_a_ton?
  merged = game_hash[:home][:players].merge(game_hash[:away][:players])
  long_name_player = merged.max_by { |name, stats| name.length }
  long_name_player_steals = long_name_player[1][:steals]
#   binding.pry
  most_steals = merged.max_by { |name, stats| stats[:steals] }
  most_steals_player = most_steals[1][:steals]

  if long_name_player_steals >= most_steals_player
    return true 
  else
    return false
  end
end
