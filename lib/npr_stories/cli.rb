class NprStories::CLI

  def call
    greeting
    list_programs
    choose_program
  end

  def greeting
    puts "Welcome to NPR!"
  end


  def list_programs
    puts <<-DOC
    Information on the following programs is available.
      1. All Things Considered
      2. Ask Me Another
      3. Fresh Air
      4. Here and Now
      5. Latino USA
      6. Morning Edition
      7. TED Radio Hour
      8. Wait Wait ... Don't Tell Me!
      9. Weekend Edition Saturday
      10. Weekend Edition Sunday
    DOC
  end

  def choose_program
    program_choice = nil
    while program_choice != 'exit'
      puts "Please select a radio show from the list, or type 'exit' in order to leave this program. Type 'menu' to see your options again"
      program_choice = gets.strip
      case program_choice
        when "1"
        puts "More information about All Things Considered..." #will return an array of recent stories, which are going to each  be  hashes
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
        when 'exit'
          exit_npr_stories
        else
          puts "Oops, that's not a valid command. Please try again."
        end
    end
  end

  def exit_npr_stories
    puts "Now exiting the program. See you later!"
  end


end