# Menu class (User Defined Class)

class Menu
    attr_reader:length_quit
   
    def initialize(*menu_args)
        @menu_args = menu_args
        @length_quit = length_quit
    end
   
    def menu_get_choice
        @menu_args.each_with_index do |item, index|
        puts "#{index + 1}. #{item}"
       
    end
    print "Please place your order"
    user_choice = gets.to_i
    return user_choice

end

menu = Menu.new("PIZZA", "BURGER", "SANDWICH", "JUICE", "QUIT")

while ((choice = menu.menu_get_choice) != menu.length_quit)
    case choice
        when 1
            puts "Please Wait!! Your order for PIZZA has been placed!"
        when 2
            puts "Please Wait!! Your order for BURGER has been placed!"
        when 3
            puts "Please Wait!! Your order for SANDWICH has been placed!"
        when 4
            puts "Please Wait!! Your order for JUICE has been placed!"
        end
    end
end