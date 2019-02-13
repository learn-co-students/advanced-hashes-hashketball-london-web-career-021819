
def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {"Alan Anderson" => {number: 0,
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
                          assists:  12,
                          steals: 12,
                          blocks: 12,
                          slam_dunks: 7
                  },
                  "Brook Lopez" => {number: 11,
                          shoe: 17,
                          points: 17,
                          rebounds: 19,
                          assists:  10,
                          steals: 3,
                          blocks: 1,
                          slam_dunks: 15
                  },
                  "Mason Plumlee" => {number: 1,
                          shoe: 19,
                          points: 26,
                          rebounds:12,
                          assists:  6,
                          steals: 3,
                          blocks: 8,
                          slam_dunks: 5
                  },
                  "Jason Terry" => {number: 31,
                          shoe: 15,
                          points: 19,
                          rebounds: 2,
                          assists: 2,
                          steals: 4,
                          blocks: 11,
                          slam_dunks: 1
                  }}},
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {"Jeff Adrien" => {number: 4,
                          shoe: 18,
                          points: 10,
                          rebounds: 1,
                          assists: 1,
                          steals: 2,
                          blocks: 7,
                          slam_dunks: 2
                  },
                  "Bismak Biyombo" => {number: 0,
                          shoe: 16,
                          points: 12,
                          rebounds: 4,
                          assists: 7,
                          steals: 7,
                          blocks: 15,
                          slam_dunks: 10
                  }, 
                  "DeSagna Diop" => {number: 2,
                          shoe: 14,
                          points: 24,
                          rebounds: 12,
                          assists: 12,
                          steals: 4,
                          blocks: 5,
                          slam_dunks: 5
                  },
                  "Ben Gordon" => {number: 8,
                          shoe: 15,
                          points: 33,
                          rebounds: 3,
                          assists: 2,
                          steals: 1,
                          blocks: 1,
                          slam_dunks: 0
                  },
                  "Brendan Haywood" => {number: 33,
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
  points = nil
  game_hash.each do |team, data| # why point to the method?
    data[:players].each do |player_name, stats| # need the value here - this is so the points can be returned??
      if player_name == name  
        points = game_hash[team][:players][name][:points]
        end
      end
   end
   points 
end


def shoe_size(name)
  s_size = nil
  game_hash.each do |team, data|
    data[:players].each do |player_name, stats|
      if player_name == name  
        s_size = game_hash[team][:players][name][:shoe]
        end
      end
   end
   s_size
end

def team_colors(user_team)
  array = []
  game_hash.each do |team, data|
    if user_team == data[:team_name]
      array << data[:colors]
      end 
    end 
 array.flatten
end 

def team_names
  array = []
  game_hash.each do |team, data|
    array << data[:team_name]
end
array.flatten 
end 

def player_numbers(user_team)
  array = []
  game_hash.each do |team, data|
    if user_team == data[:team_name]
        data[:players].each do |k, v|
      array << v[:number]
      end 
    end 
  end 
  array.flatten
end 

def player_stats(name)
  game_hash.each do |team, data|
    data[:players].each do |player_name, stats|
      if player_name == name  
        return game_hash[team][:players][name]
end
end 
end 
end 


=begin
def big_shoe_rebounds
  
  # note: iterate down to the level of :shoe and find maximum shoe size by using max - once found, return the number of rebounds for that player.
  
  # note: received a number of errors relating to types, symbol to integer / undefined method `each' for Fixnum
  
  game_hash.each do |team, data|
    data[:players].each do |player_name, stats|
     # stats.each do |k, v| 
     stats.max_by { |k, v|  game_hash[team][:players][:shoe] } 
       #stats[:shoe].values.max.each do |k, v| 
         return stats[:rebounds]
end 
end
end
=end 

def big_shoe_rebounds
   shoe_size = 0
   rebound = 0
   game_hash.each do |location, team_data|
      team_data[:players].each do |player_name, value|
         if value[:shoe] > shoe_size
            shoe_size = value[:shoe]
            rebound = value[:rebounds]
         end
      end
   end
   rebound
end

def most_points_scored
  most_points = 0 
  player_name = nil
  game_hash.each do |team, data|
    data[:players].each do |name, value|
      if value[:points] > most_points
        most_points = value[:points]
        player_name = name
      end
    end 
  end
player_name
end


def winning_team
  home_total = 0
  away_total = 0
  winner = nil
    game_hash[:home][:players].each do |team, data|
      home_total+= data[:points]
    end 
    game_hash[:away][:players].each do |team, data|
      home_total+= data[:points]
    end 
    if home_total > away_total
      winner = game_hash[:home][:team_name]
      elsif
      away_total > home_total
      winner = game_hash[:away][:team_name]
    end
    winner
end