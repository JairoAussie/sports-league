require_relative("./team_member.rb")
#inheritance from TeamMember, add age
class Coach < TeamMember
    def initialize(first_name, last_name)
        
        super(first_name, last_name, "Coach")
   end 
   #override both methods, suits better for staff members
    def train
        puts "#{@role} #{@last_name} leads the team during the training"
    end
    def play
        puts "#{@role} #{@last_name} coaches the team during the match"
    end 
end
