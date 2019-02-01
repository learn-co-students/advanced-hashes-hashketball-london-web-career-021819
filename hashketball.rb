require "pry"

def game_hash
  game_hash = {
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
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez"  => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
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
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(queried_player)
  game_hash.each do |team, values|
    if values[:players].keys.include?(queried_player)
      return values[:players][queried_player][:points]
    end
  end
end

def shoe_size(queried_player)
  game_hash.each do |team, values|
    if values[:players].keys.include?(queried_player)
      return values[:players][queried_player][:shoe]
    end
  end
end

def team_colors(queried_team)
  game_hash.each do |team, values|
    if values[:team_name] == queried_team
      return values[:colors]
    end
  end
end

def team_names
  game_hash.collect do |team, values|
    values[:team_name]
  end
end

def player_numbers(queried_team)
  game_hash.each do |team, values|
    if values[:team_name] == queried_team
      return values[:players].collect do |player, stats|
        stats[:number]
      end
    end
  end
end

def player_stats(queried_player)
  game_hash.each do |team, values|
    if values[:players].keys.include?(queried_player)
      return values[:players][queried_player]
    end
  end
end

def big_shoe_rebounds
  big_shoe_owner = nil
  big_shoe_size = nil
  big_shoe_team = nil
  game_hash.each do |team, values|
    values[:players].each do |name, stats|
      if big_shoe_size == nil || stats[:shoe] > big_shoe_size
        big_shoe_owner = name
        big_shoe_size = stats[:shoe]
        big_shoe_team = team
      end
    end
  end
  game_hash[big_shoe_team][:players][big_shoe_owner][:rebounds]
end
