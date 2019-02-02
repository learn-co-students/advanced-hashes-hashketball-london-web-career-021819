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

def num_points_scored(name)
  game_hash.each do |location, player|
    player[:players].each do |player_name, value|
      if name == player_name
        return value[:points]
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |location, player|
    player[:players].each do |player_name, value|
      if name == player_name
        return value[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |team, values|
    if values[:team_name] == team_name
      return values[:colors]
    end
  end
end

def team_names
  game_hash.map do |home_away, team|
  team[:team_name]
  end
end

def player_numbers(team)
  result = []
  game_hash.each do |location, team_info|
    team_info.each do |k, v|
      if v == team 
        team_info.each do |x, y| 
          if x == :players
            y.each do |player_name, stats|
              stats.each do |stat, val|
                if stat == :number
                  result << val
                end
              end
            end
          end
        end
      end
    end
  end
  return result
end

def player_stats(name)
  game_hash.each do |home_away, data|
    data[:players].each do | playername, stats|
      if playername == name
        return stats
      end
    end
  end
end

def big_shoe_rebounds
   max_player = nil
  game.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      max_player ||= player_hash
      max_player = player_hash if player_hash[:shoe_size] > max_player[:shoe_size]
    end
  end

