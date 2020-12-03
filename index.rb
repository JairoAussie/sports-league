#requiring gems and classes
require "colorize"
require "tty-prompt" 
require_relative("./team.rb")
require_relative("./player.rb")
require_relative("./coach.rb")
require_relative("./staff.rb")
require_relative("./league.rb")
#populating the league: (Player x5, Coach , Staff x2) -> Team
#(name, description, Team x 4) -> league
players_bb = [
            Player.new("Anthony", "Drmic", "Forward", "3"),
            Player.new("Harry", "Froling", "Center", "11"),
            Player.new("Nathan", "Sobey", "Guard", "20"),
            Player.new("Tamuri", "Wignes", "Guard", "0"),
            Player.new("Tanner", "Krebs", "Forward", "17")
            ]
coach_bb = Coach.new("Andrej","Lemanis")
staff_bb = [Staff.new("CJ", "Brutton", "Assistant coach"),
            Staff.new("Greg", "Vanderjagt", "Assistant coach")
            ]
brisbane_bullets = Team.new("Bullets","Brissie", "Nissan Arena", players_bb, coach_bb, staff_bb)
#Brisbane Bullets completed
players_ct = [
            Player.new("Majok", "Deng", "Forward", "13"),
            Player.new("Nathan", "Jawai", "Center", "15"),
            Player.new("Jarrod", "Kenny", "Guard", "6"),
            Player.new("Mojabe", "King", "Guard", "1"),
            Player.new("Jordan", "Ngatai", "Forward", "11")
            ]
coach_ct = Coach.new("Mike","Kelly")
staff_ct = [Staff.new("Jane", "Doe", "Assistant coach"),
            Staff.new("John", "Doe", "Physiotherapist")
            ]
cairns_taipans = Team.new("Taipans","Cairns", "Convention Centre", players_ct, coach_ct, staff_ct)
#Cairns Taipans completed
players_pw = [
            Player.new("Todd", "Blanchfield", "Forward", "12"),
            Player.new("Majok", "Majok", "Center", "22"),
            Player.new("Mitchell", "Norton", "Guard", "8"),
            Player.new("Brice", "Cotton", "Guard", "11"),
            Player.new("Jesse", "Wagstaff", "Forward", "17")
            ]
coach_pw = Coach.new("Trevor", "Gleeson")
staff_pw = [Staff.new("Jane", "Doe", "Assistant coach"),
            Staff.new("John", "Doe", "Physiotherapist")
            ]
perth_wildcats = Team.new("Wildcats","Perth", "Nissan Arena", players_pw, coach_pw, staff_pw)
#Perth Wildcats completed
players_sk = [
            Player.new("Brad", "Newley", "Forward", "8"),
            Player.new("Daniel", "Kickert", "Center", "14"),
            Player.new("Casper", "Ware", "Guard", "22"),
            Player.new("Dejan", "Vasiljevic", "Guard", "3"),
            Player.new("Craig", "Moller", "Forward", "9")
            ]
coach_sk = Coach.new("Will", "Weaver")
staff_sk = [Staff.new("Jane", "Doe", "Assistant coach"),
            Staff.new("John", "Doe", "Physiotherapist")
            ]
sydney_kings = Team.new("Kings","Sydney", "Qudos Bank Arena", players_sk, coach_sk, staff_sk)
#Sidney Kings completed
#Create an array with the teams we've created and add it to the League object
#the league object is a global variable as is the main object of our app and most of the methods are going to use it
#Always justify why you use a global variable
$nbl_league = League.new("NBL", "Australian Basketball League",[brisbane_bullets,cairns_taipans, sydney_kings, perth_wildcats])
#Same with prompt, is the object we're using for tty-prompt methods
#It's going to be used in a couple of methods, no need to create more than one instance or pass it as an argument
$prompt = TTY::Prompt.new
#Print a menu with those four options, it returns the string we selected
def select_option
    return $prompt.select("What's your option?",
        ["Ladder", "Team's info", "Play a game!", "Exit"])
    
end
#Invokes the print_ladder method we defined in the League class
def ladder
    $nbl_league.print_ladder
end
#Print a menu with with the names of all the teams, it returns the string we selected
def select_team
   return $prompt.select("Select team", $nbl_league.print_team_names)
end
#we receibe a team name and the find_team method returns a Team object
#Then, we call that object's show_team_full_info method for printing
def show_team_info(team)
    t = $nbl_league.find_team(team)
    t.show_team_full_info
end
#two
def play_game
    puts "Welcome to a new match"
    puts "Local team"
    #invoke the select_team method to assign a team_name to local
    local = select_team
    puts "away team"
    #Same with the away team
    away = select_team
    #Ask for the local team's score, force the score to be an integer
    local_score = $prompt.ask("#{local}' score: ", convert: :integer)
    away_score = $prompt.ask("#{away}' score: ", convert: :integer)
    #Compare the scores to know which team wins
    if local_score > away_score
        #find the teams and invoke their win/lose methods
        #If this line it's hard to understand can be done in 2 lines
        #local_team = $nbl_league.find_team(local) #find the local team
        #local_team.win #invoke win method
        $nbl_league.find_team(local).win 
        $nbl_league.find_team(away).lose 
    else
        $nbl_league.find_team(local).lose 
        $nbl_league.find_team(away).win
    end
end
puts "Welcome to the best league in the world"
answer = ""
#Loop for the menu, always shows until Exit option is selected
while answer != "Exit"
    answer = select_option
    system "clear"
    case answer
    when "Ladder"
        ladder
    when "Team's info"
        team = select_team
        show_team_info(team)
    when "Play a game!"
        play_game
    else
        puts "See you next time"
        next
    end 
    print "Press Enter Key to continue..."
    gets 
    system "clear"
end
