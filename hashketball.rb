def game_hash
  master_hash = {
                  :home => { :team_name => "Brooklyn Nets",
                             :colors => ["Black", "White"],
                             :players => [
                               { :player_name => "Alan Anderson",
                                 :number => 0,
                                 :shoe => 16,
                                 :points => 22,
                                 :rebounds => 12,
                                 :assists => 12,
                                 :steals => 3,
                                 :blocks => 1,
                                 :slam_dunks => 1
                               },
                               { :player_name => "Reggie Evans",
                                 :number => 30,
                                 :shoe => 14,
                                 :points => 12,
                                 :rebounds => 12,
                                 :assists => 12,
                                 :steals => 12,
                                 :blocks => 12,
                                 :slam_dunks => 7
                               },
                               { :player_name => "Brook Lopez",
                                 :number => 11,
                                 :shoe => 17,
                                 :points => 17,
                                 :rebounds => 19,
                                 :assists => 10,
                                 :steals => 3,
                                 :blocks => 1,
                                 :slam_dunks => 15
                               },
                               { :player_name => "Mason Plumlee",
                                 :number => 1,
                                 :shoe => 19,
                                 :points => 26,
                                 :rebounds => 11,
                                 :assists => 6,
                                 :steals => 3,
                                 :blocks => 8,
                                 :slam_dunks => 5
                               },
                               { :player_name => "Jason Terry",
                                 :number => 31,
                                 :shoe => 15,
                                 :points => 19,
                                 :rebounds => 2,
                                 :assists => 2,
                                 :steals => 4,
                                 :blocks => 11,
                                 :slam_dunks => 1
                               }
                               ] },
                  :away => { :team_name => "Charlotte Hornets",
                             :colors => ["Turquoise", "Purple"],
                             :players => [
                               { :player_name => "Jeff Adrien",
                                 :number => 4,
                                 :shoe => 18,
                                 :points => 10,
                                 :rebounds => 1,
                                 :assists => 1,
                                 :steals => 2,
                                 :blocks => 7,
                                 :slam_dunks => 2
                               },
                               { :player_name => "Bismack Biyombo",
                                 :number => 0,
                                 :shoe => 16,
                                 :points => 12,
                                 :rebounds => 4,
                                 :assists => 7,
                                 :steals => 22,
                                 :blocks => 15,
                                 :slam_dunks => 10
                               },
                               { :player_name => "DeSagna Diop",
                                 :number => 2,
                                 :shoe => 14,
                                 :points => 24,
                                 :rebounds => 12,
                                 :assists => 12,
                                 :steals => 4,
                                 :blocks => 5,
                                 :slam_dunks => 5
                               },
                               { :player_name => "Ben Gordon",
                                 :number => 8,
                                 :shoe => 15,
                                 :points => 33,
                                 :rebounds => 3,
                                 :assists => 2,
                                 :steals => 1,
                                 :blocks => 1,
                                 :slam_dunks => 0
                               },
                               { :player_name => "Kemba Walker",
                                 :number => 33,
                                 :shoe => 15,
                                 :points => 6,
                                 :rebounds => 12,
                                 :assists => 12,
                                 :steals => 7,
                                 :blocks => 5,
                                 :slam_dunks => 12
                               }
                               ] }
                           }

end

def find_insight_from_game_hash( player_name )
  lib = game_hash
  lib.each_value { |team_general|
    team_general.each_pair { |team_attributes, team_stats|
      if team_attributes == :players
        team_stats.each { |player|
          if player[:player_name] == player_name
          return yield( player )
        end
        }
      end
    }
  }
end

def find_biggest_shoe_size
  
end

def num_points_scored( player_name )
  find_insight_from_game_hash( player_name ) do |player|
    player[:points]
  end
end

def shoe_size( player_name )
  find_insight_from_game_hash( player_name ) do |player|
    player[:shoe]
  end
end

def player_stats( player_name )
  find_insight_from_game_hash( player_name ) { |player| player.shift; player }
end

def team_colors( team_name )
  game_hash.each_value { |team_general|
    team_general.each { |team_info_key, team_info|
      return team_general[:colors] if team_info == team_name
    }
  }
end

def team_names
  team_name_array = Array.new
  game_hash.each_value { |team_general|
    team_general.each { |team_info_key, team_info|
    team_name_array.push( team_info ) if team_info_key == :team_name
    }
  }
  team_name_array
end

def player_numbers( team_name )
  numbers = Array.new
  game_hash.each_value { |team_general|
    if team_general[:team_name] == team_name
      team_general[:players].each { |player| numbers.push( player[:number] ) }
    end
  }
  numbers
end

def big_shoe_rebounds
  biggest_shoe = nil
  game_hash.each_value { |team_general|
    team_general.each_pair { |team_attributes, team_stats|
      if team_attributes == :players
        team_stats.each { |player|
          biggest_shoe = { :player_name => player[:player_name], :shoe => player[:shoe], :rebounds => player[:rebounds]} if biggest_shoe == nil
          biggest_shoe = { :player_name => player[:player_name], :shoe => player[:shoe], :rebounds => player[:rebounds]} if player[:shoe] > biggest_shoe[:shoe]
        }
      end
    }
  }
  biggest_shoe[:rebounds]
end



