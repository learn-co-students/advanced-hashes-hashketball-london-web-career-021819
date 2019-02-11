require 'pry'

def game_hash
  {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => {
      :player1 => {
        :name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :stats => {
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        }
      },
      :player2 => {
        :name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :stats => {
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        }
      },
      :player3 => {
        :name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :stats => {
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        }
      },
      :player4 => {
        :name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :stats => {
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        }
      },
      :player5 => {
        :name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :stats => {
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    }
  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => {
      :player1 => {
        :name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :stats => {
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        }
      },
      :player2 => {
        :name => "Bismak Biyombo",
        :number => 0,
        :shoe => 16,
        :stats => {
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        }
      },
      :player3 => {
        :name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :stats => {
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        }
      },
      :player4 => {
        :name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :stats => {
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        }
      },
      :player5 => {
        :name => "Brendan Haywood",
        :number => 33,
        :shoe => 15,
        :stats => {
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
}
end

def num_points_scored(player_name)
  game_hash.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      if player_hash[:name] == player_name
        return player_hash[:stats][:points]
      end
    end
  end
end
    
def shoe_size(player_name)
  game_hash.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      if player_hash[:name] == player_name
        return player_hash[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |team, team_hash|
    if team_hash[:team_name] == team_name
      return team_hash[:colors]
    end
  end
end

def team_names
  team_name_array = []
  game_hash.each do |team, team_hash|
    team_name_array << team_hash[:team_name]
  end
  team_name_array
end

def player_numbers(team_name)
  game_hash.each do |team, team_hash|
    if team_hash[:team_name] == team_name
      return (team_hash[:players].collect do |player, player_hash|
        player_hash[:number]
      end)
    end
  end
end

def player_stats(player_name)
  game_hash.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      if player_hash[:name] == player_name
        player_hash[:stats][:number] =  player_hash[:number]
        player_hash[:stats][:shoe] = player_hash[:shoe]
        return player_hash[:stats]
      end
    end
  end
end

def big_shoe_rebounds
  biggest_shoe_size = 0
  associated_rebound = 0
  game_hash.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      if player_hash[:shoe] > biggest_shoe_size
        biggest_shoe_size = player_hash[:shoe]
        associated_rebound = player_hash[:stats][:rebounds]
      end
    end
  end
  return associated_rebound
end

def most_points_scored
  most_points = 0
  most_player = 0
  game_hash.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      if player_hash[:stats][:points] > most_points
        most_points = player_hash[:stats][:points]
        most_player = player_hash[:name]
      end
    end
  end
  return most_player
end


def winning_team
  home_points = 0
  away_points = 0
  game_hash.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      if team_hash[:team_name] == "Brooklyn Nets"
        home_points = home_points + player_hash[:stats][:points]
      elsif team_hash[:team_name] == "Charlotte Hornets"
        away_points = away_points + player_hash[:stats][:points]
      end
    end
  end
  if home_points > away_points
    return "Brooklyn Nets"
  elsif away_points > home_points
    return "Charlotte Hornets"
  elsif home_points == away_points
    return "Draw"
  end
end

def player_with_longest_name
  longest_name_length = 0
  longest_player = 0
  game_hash.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
        if longest_name_length < player_hash[:name].size
          longest_name_length = player_hash[:name].size
          longest_player = player_hash[:name]
        end
      end
    end
  return longest_player
end


def most_steals_scored
  most_steals = 0
  most_player = 0
  game_hash.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      if player_hash[:stats][:steals] > most_steals
        most_steals = player_hash[:stats][:steals]
        most_player = player_hash[:name]
      end
    end
  end
  return most_player
end

def long_name_steals_a_ton? 
  longest_name = player_with_longest_name
  most_steals = most_steals_scored
  if longest_name == most_steals
    return true
  else
    return false
  end
end






