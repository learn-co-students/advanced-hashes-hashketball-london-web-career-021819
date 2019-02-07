def game_hash
  
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
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
          :rebounds => 12,
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
        "Jason Terry" => {
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
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(name)
  
  
  game_hash.each do |location, player_info|
    player_info.each do |attribute, value|
    
    if value.include?(name)
    
    return game_hash[location][attribute][name][:points]
      end
    end
  end
end

def shoe_size(name)

    game_hash.each do |location, player_info|
    player_info.each do |attribute, value|
    
    if value.include?(name)
    
    return game_hash[location][attribute][name][:shoe]
      end
    end
  end
end
      
def team_names

teamNameArray = []
 
  game_hash.each do |location, team_data|
     
      team_data.each do |attribute, values|
          if attribute == :team_name
                teamNameArray.push(values)

     end
   end
 end
  return teamNameArray
end
  

def team_colors(team)
  
  if team == "Charlotte Hornets"
   
    game_hash[:away][:colors]
 
  elsif team == "Brooklyn Nets"
   
    game_hash[:home][:colors]
  
  end

end
  
  
def player_stats(name)
   
   game_hash.each do |location, team_data|
   
      team_data[:players].each do |player_name, value|
   
         if player_name == name
   
            return value
        
         end
     
      end
   
   end

end
  
  
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


def player_numbers(team_name)

  number_array = []
  game_hash.each do |team_position, team_data|
    if team_data[:team_name] == team_name 
        team_data[:players].each do |player_name, player_scores|
     number_array << player_scores[:number]

      end
    end
  end

  number_array
end
