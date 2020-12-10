class League
    attr_reader :teams
    def initialize(name, description, teams)
        @name = name
        @description = description
        @teams = teams
    end
    def show_full_info
        @teams.each do |team|
            puts team
            team.show_team_members
        end
        puts ""
    end
    #print the rankings of the teams in a table format
    def print_ladder
        #this is the syntax to sort an array of objects by one of its attributes
        #We want to show the team with most points at the top, that's why the .reverse
        #The array is assigned to another array because we want the array to mutate.
        
        sorted_array = @teams.sort_by { |team| team.points }.reverse
        puts "Team name\t G \t Points"
        @teams.each do |team|
            team.team_ladder_view 
        end
        #This command will sort the array in the same way and it will mutate it
        #but I consider it is more difficult to understand how it works
        #@teams.sort! { |a, b|  b.points <=> a.points }
    end
    #this method will return an array of strings only with the name of the teams
    #This array is needed to select a team with tty-prompt in index.rb
    def print_team_names
        names = []
        @teams.each do |team|
            names << team.name 
        end
        return names
    end
    #This method receives a team's name and we return that teams object
    #iterating through the array of teams until we find a match
    def find_team(team_name)
        @teams.each do |team|
            if team.name == team_name
                return team
            end
        end
    end
end