class NprStories::CLI

  def call
    list_programs
    choose_program
    exit_npr_stories
  end

  def list_programs
    puts <<-DOC
    Welcome to NPR. Information on the following programs is available:
      1. All Things Considered
      2. Fresh Air
      3. Morning Edition
      4. Selected Shorts
      5. The Diane Rehm Show
    DOC
  end

  def choose_program
    program_choice = nil
    while program_choice != 'exit'
      puts "Please select a program, or type 'exit' in order to leave the program. Type 'menu' to see your options again"
      program_choice = gets.strip
      case program_choice
        when "1"
        puts "More information about All Things Considered..."
        when "2"
          puts "More information about Fresh Air..."
        when "3"
          puts "More information about Morning Edition..."
        when "4"
          puts "More information about Selected Shorts..."
        when "5"
          puts "More information about The Diane Rehm Show..."
        when 'menu'
          list_programs
        else
          puts "That's not a valid command. Please try again. You can type 'menu' to see your options, or 'exit' to leave the program."
        end
    end
  end

  def exit_npr_stories
    puts "Now exiting the program. See you later!"
  end


end