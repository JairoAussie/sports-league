class Team
    #Getters for points and name are needed in the app
    #read access is allowed with attr_reader 
    attr_reader :points, :name, :mood, :stamina
    def initialize(name, city, stadium, players, coach, staff)
        @name = name
        @city = city
        @stadium = stadium
        @players = players
        @coach = coach
        @staff = staff
        #default values don't need to be included as parameters in initialize
        @games = 0
        @points = 0
        @stamina = 10
        @mood = 10
    end
    def win
        puts "YAY!! #{@city} #{@name} won the match!"
        @games += 1
        @points += 5
        @mood += 2
        @stamina -= 2
    end

    def lose
        puts "Noooo!! #{@city} #{@name} lost the match @#*&%!"
        @games += 1
        @mood -= 2
        @stamina -= 2
    end

    def train
        puts "#{@city} #{@name} trains for the next match..."
        @stamina += 2
    end

    def show_team_full_info
        #show team's general info that can be gotten from to_s method
        puts to_s
        puts ""
        puts "Roster:"
        #iterate through the players array to print player's info
        #player's to_s method is invoked with puts player
        @players.each do |player|
            puts player
        end
        puts ""
        puts @coach
    end
    #different output of the team for the ladder
    def team_ladder_view
        puts "#{@city} #{@name}\t #{@games}\t  #{@points}"
    end
    def to_s
        general_info = "#{@name} are a team based on #{@city} and they play their games in #{@stadium}.\n"
        league_info = "Currently, they've played #{@games} games and they have #{@points} points\n"
        current_mood = "Current mood: #{@mood}\n"
        current_stamina = "Current stamina: #{@stamina}\n"
        return general_info + league_info + current_mood + current_stamina
    end
end

