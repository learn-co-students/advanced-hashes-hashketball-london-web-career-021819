require 'pry'

def game_hash
  game_hash = {
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

=begin
def good_practices
  game_hash.each do |location, team_data|

    location > :home
    team_data >  hash

      team_data.each do |attribute, data|

        attribute > :team_name
        data > "Brooklyn Nets"

        data.each do |data_item|
            binding.pry
      end
    end
  end
end
=end

#good_practices

#Build a method, num_points_scored that takes in an argument of a player's name and returns the number of points scored for that player.
def num_points_scored(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |attribute, data|
      if attribute == player_name
      return data[:points]
    end
  end
 end
end

num_points_scored("Brendan Haywood")

def shoe_size(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |attribute, data|
      if attribute == player_name
        return data[:shoe]
      end
    end
  end
end


def team_colors(team_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == team_name
       return team_data[:colors]
       end
    end
  end
end


def team_names
  teams = []
  teams << game_hash[:home][:team_name]
  teams << game_hash[:away][:team_name]
   return teams
end


def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |attribute, data|
          if attribute == player_name
              return data
       end
     end
   end
  end

  def player_numbers(name)
    arr = []
    game_hash.each do |location, team_data|
      if team_data[:team_name] == name
      team_data[:players].each do |player_name, data_info|
        arr << data_info[:number]
     end
   end
 end
 arr
end

#First, find the player with the largest shoe size
#Then, return that player's number of rebounds

  def big_shoe_rebounds
    arr = []
    game_hash.each do |location, team_data|
      team_data[:players].each do |player, data|
        arr << data[:shoe]

      end
     end
     biggest_shoe = arr.sort[-1]
     game_hash.each do |location, team_data|
       team_data[:players].each do |player, data|
        if data[:shoe] == biggest_shoe
          return data[:rebounds]
        end
       end
      end
  end
