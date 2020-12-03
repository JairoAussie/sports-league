require_relative("./team_member.rb")
#inheritance from TeamMember, add position and number
class Player < TeamMember
    def initialize(first_name, last_name, position, number)
        #super calls parent class initialize method
        super(first_name, last_name, "player")
        @position = position
        @number = number
    end
    #override TeamMember's to_s method, this format suits better for players 
    def to_s
        return "#{@first_name} #{@last_name} ##{@number} #{@position}"
    end
end

