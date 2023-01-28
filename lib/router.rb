class Router
  def initialize(controller)
    @controller = controller
    @running    = true
  end

  def run
    puts "Welcome to your DEV Pocket Reader"
    puts "---------------------------------"


    while @running
      display_actions
      print ">"
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.save
    when 3
      @controller.list
      @controller.read
    when 4
      @controller.list
      @controller.mark
    when 5 then stop
    else
      puts "Please press 1, 2, 3, 4 or 5"
    end
  end

  def stop
    @running = false
  end

  def display_actions
    puts "What do you want to do next?"
    puts "----------------------------"
    puts "1. List posts"
    puts "2. Save post for later"
    puts "3. Read post"
    puts "4. Mark post as read"
    puts "5. Exit\n"
  end
end
