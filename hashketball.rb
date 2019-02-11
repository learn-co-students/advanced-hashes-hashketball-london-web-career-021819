require "pry"
# Write your code here!
def game_hash
 { :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => {
      "Alan Anderson" =>{
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      },
      "Reggie Evans" => {
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds =>12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
        
      },
      "Brook Lopez" => {
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
       },
         
         "Mason Plumlee" => {
            :number => 1,
            :shoe => 19,
            :points => 26,
            :rebounds => 12,
            :assists => 6,
            :steals => 3,
            :blocks => 8,
            :slam_dunks => 5
         },
         "Jason Terry" =>{
            :number => 31,
            :shoe => 15,
            :points => 19,
            :rebounds => 2,
            :assists => 2,
            :steals => 4,
            :blocks => 11,
            :slam_dunks => 1
         }
       }
     
    
    },
    
  :away =>{
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players =>{
      "Jeff Adrien" =>{
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      },
      "Bismak Biyombo"=>{
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7,
        :blocks => 15,
        :slam_dunks => 10
      },
      "DeSagna Diop" =>{
         :number => 2,
         :shoe => 14,
         :points => 24,
         :rebounds => 12,
         :assists => 12,
         :steals => 4,
         :blocks => 5,
         :slam_dunks => 5
      },
      "Ben Gordon" =>{
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks =>1 ,
        :slam_dunks => 0
      },
      "Brendan Haywood" =>{
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 22 ,
        :blocks => 5,
        :slam_dunks => 12
        
        }
      }
    }
  }
  
end

def num_points_scored(name)
  game_hash.each do |team_info, data| 
    
  data[:players].each do|player_name, data|
  if player_name == name
    return data[:points]
  end
  
  end
 end
end

def shoe_size(name)
  game_hash.each do | team_info, data|
    data[:players].each do| player_name, data|
    if player_name == name
      return data[:shoe]
     end
    end
  end
end

def team_colors(team)
  game_hash.each do |team_info, data|
    if data[:team_name] == team
      return data[:colors]
    end
  end
end

 def team_names
   game_hash.map do |team_info, data|
       data[:team_name]
      
   end
 end
 
 def player_numbers(team_name)
   game_hash.each do | team_info, data|
     if  data[:team_name] == team_name
        return data[:players].map do| player_name, data|
        data[:number]
      end
    end
  end
 end
 
 def player_stats(name)
  game_hash.each do | team_info, data|
    data[:players].each do|player_name, data|
      if player_name == name
        return data
    end
   end
  end
end

def big_shoe_rebounds
   shoe_size = 0
   rebound = 0
  game_hash.each do | team_info, data|
    data[:players].each do|player_name, data|
      if data[:shoe] > shoe_size
        shoe_size =data[:shoe]
        rebound = data[:rebounds]
      end
    end
  end
  rebound
end

def most_points_scored
  most_point = 0
   player = 0
  game_hash.each do | team_info, data|
    data[:players].each do|player_name, data|
     if data[:points] > most_point
            most_point = data[:points]
            player = player_name
          end
    
   end
  end
end

def winning_team
  home_team = 0
  away_team = 0
  game_hash[:home][:players].each do |name, value|
    home_team += value[:points]
  end
  game_hash[:away][:players].each do |name, value|
    away_team += value[:points]
  end
  if home_team > away_team
      game_hash[:home][:team_name]
  elsif home_team < away_team
      game_hash[:away][:team_name]
  else
     "It's a tie!"
  end
end

def player_with_longest_name
  longest = 0
  player_name = 0
  game_hash.each do |team_info, data|
    data[:players].each do |player_name, data|
      if name.length > longest
        player_name = name
      end
    end
    
    def long_name_steals_a_ton?
  name_with_steal = 0
  steal_number = 0
  game_hash.each do |team_info, data|
    data[:players].each do |player_name, data|
      if data[:steals] > steal_number
        steal_number = data[:steals]
        name_with_steal = name
      end
    end
  end
  name_with_steal == player_with_longest_name
end
  end
  player_name
end
  


