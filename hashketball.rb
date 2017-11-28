require 'pry'

def game_hash
{
  home:{
    team_name:"Brooklyn Nets",
    colors:["Black", "White"],
    players:{
      "Alan Anderson" => {
        number:0,
        shoe:16,
        points:22,
        rebounds:12,
        assists:12,
        steals:3,
        blocks:1,
        slam_dunks:1
      },
      "Reggie Evans" => {
        number:30,
        shoe:14,
        points:12,
        rebounds:12,
        assists:12,
        steals:12,
        blocks:12,
        slam_dunks:7
      },
      "Brook Lopez" => {
        number:11,
        shoe:17,
        points:17,
        rebounds:19,
        assists:10,
        steals:3,
        blocks:1,
        slam_dunks:15
      },
      "Mason Plumlee" => {
        number:1,
        shoe:19,
        points:26,
        rebounds:12,
        assists:6,
        steals:3,
        blocks:8,
        slam_dunks:5
      },
      "Jason Terry" => {
        number:31,
        shoe:15,
        points:19,
        rebounds:2,
        assists:2,
        steals:4,
        blocks:11,
        slam_dunks:1
      }
    },
  },

  away:{
    team_name:"Charlotte Hornets",
    colors:["Turquoise","Purple"],
    players:{
      "Jeff Adrien" => {
        number:4,
        shoe:18,
        points:10,
        rebounds:1,
        assists:1,
        steals:2,
        blocks:7,
        slam_dunks:2
      },
      "Bismak Biyombo" => {
        number:0,
        shoe:16,
        points:12,
        rebounds:4,
        assists:7,
        steals:7,
        blocks:15,
        slam_dunks:10
      },
      "DeSagna Diop" => {
        number:2,
        shoe:14,
        points:24,
        rebounds:12,
        assists:12,
        steals:4,
        blocks:5,
        slam_dunks:5
      },
      "Ben Gordon" => {
        number:8,
        shoe:15,
        points:33,
        rebounds:3,
        assists:2,
        steals:1,
        blocks:1,
        slam_dunks:0
      },
      "Brendan Haywood" => {
        number:33,
        shoe:15,
        points:6,
        rebounds:12,
        assists:12,
        steals:22,
        blocks:5,
        slam_dunks:12
      }
    }
  }
}
end

def num_points_scored(player)
  points=0
  game_hash.each do |loc,key|
    key.each do |key2,value|
      if key2 == :players
        value.each do |name,stats|
          if name == player
            points = stats[:points]
          end
        end
      end
    end
  end
  points
end

def shoe_size(player_name)
  output=0
end_variable= false
  game_hash.each do |loc,hash|
    hash.each do |key,value|
      if key == :players
        value.each do |name, stats_hash|
          if name = player_name && end_variable == false
            output = stats_hash[:shoe]
            end_variable = true
          end
        end
      end
    end
  end
  output
end

def team_colors (team)
  output=[]

  game_hash.each do |loc, key|
    key.each do |key2,value|
      if value == team
        output << game_hash[loc][:colors][0]
        output << game_hash[loc][:colors][1]
      end
    end
  end
  output
end

def team_names
  output= []
  game_hash.each do |loc,details|
    details.each do |stats, stats_value|
      if stats == :team_name
        output << stats_value
      end
    end
  end
  output
end

def player_numbers(team)
  output=[]

  game_hash.each do |loc,hash|
    if hash.has_value?(team)
      hash.each do |key2, value|
        if key2 == :players
          value.each do |name, stats_hash|
            stats_hash.each do |stat, stat_value|
              if stat == :number
                output << stat_value
              end
            end
          end
        end
      end
    end
  end
  output
end

def player_stats(name_argument)
  output= {}

  game_hash.each do |loc,hash|
    hash.each do |key2, value|
      if key2 == :players
        value.each do |name, stats_hash|
          stats_hash.each do |stat, stat_value|
            if name == name_argument
              output = stats_hash
            end
          end
        end
      end
    end
  end
  output
end


def big_shoe_rebounds
rebounds_output = 0
shoe_size_compare = 0

  game_hash.each do |loc,hash|
    hash.each do |key,value|
      if key == :players
        value.each do |name,stats_hash|
          stats_hash.each do |key2, value2|
            if key2 == :shoe
              if value2 > shoe_size_compare
                shoe_size_compare = value2
                rebounds_output = stats_hash[:rebounds]
              end
            end
          end
        end
      end
    end
  end
rebounds_output
end
