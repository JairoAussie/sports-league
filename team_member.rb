class TeamMember
    @@total_members = 0
    def initialize (first_name, last_name, role)
        @first_name = first_name
        @last_name = last_name
        @role = role
        @@total_members += 1
    end
    def train
        puts "#{@role} #{@last_name} trains with the team"
    end
    def play
        puts "#{@role} #{@last_name} plays the game with the team"
    end
    def self.count_members
        return @@total_members
    end
    def to_s
        return "#{@role}: #{@first_name} #{@last_name}"
    end
end