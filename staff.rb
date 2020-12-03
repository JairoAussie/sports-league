require_relative("./team_member.rb")
#inheritance from TeamMember, no extra attributes needed
class Staff < TeamMember
   def initialize(first_name, last_name, role)
        super(first_name, last_name, role)
   end 
   #override both methods, suits better for staff members
    def train
        super
        puts "#{@role} #{@last_name} supports the team during the training"
    end
    def play
        puts "#{@role} #{@last_name} supports the team during the match"
    end 
end


