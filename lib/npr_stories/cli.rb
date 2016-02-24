class NprStories::CLI

  def call
    greeting
    list_programs
    choose_program
  end

  def greeting #moved greeting into its own method because it seemed silly to say welcome every time you see the menu
    puts "Welcome to NPR!"
  end

  def list_programs
    puts <<-DOC
    Information on the following NPR programs is available.
      1.  All Things Considered
      2.  Ask Me Another
      3.  Fresh Air
      4.  Here and Now
      5.  Latino USA
      6.  Morning Edition
      7.  TED Radio Hour
      8.  Wait Wait ... Don't Tell Me!
      9.  Weekend Edition Saturday
      10. Weekend Edition Sunday
    DOC
  end

  def choose_program
    program_choice = nil
    while program_choice != 'exit'
      puts "Please select a radio show from the list, or type 'exit' in order to leave this program. Type 'menu' to see your options again"
      program_choice = gets.strip
        case program_choice
        when '1'
          program = ALL_THINGS_CONSIDERED
        when '2'
          program = ASK_ME_ANOTHER
        when '3'
          program = FRESH_AIR
        when '4'
          program = HERE_AND_NOW
        when '5'
          program = LATINO_USA
        when '6'
          program = MORNING_EDITION
        when '7'
          program = TED_RADIO_HOUR
        when '8'
          program = WAIT_WAIT
        when '9'
          program = WEEKEND_EDITION_SATURDAY
        when '10'
          program = WEEKEND_EDITION_SUNDAY
        when 'menu'
          list_programs
        when 'exit'
          exit_npr_stories
        else
          puts "Oops, that's not a valid command. Please try again."
        end
      story_result = NprStories::Scraper.new(program).pull_latest_story
      display_story(story_result)
    end
  end

  def display_story(story_result)
    puts <<-DOC

      Story Title: #{story_result[:story_title]}
      Program: #{story_result[:program_title]}
      Date: #{story_result[:story_date]}
      Teaser: #{story_result[:teaser]}
      Url: #{story_result[:story_url]}
      Main Topic: #{story_result[:topic]}

    DOC
  end

  def exit_npr_stories
    puts "Now exiting the program. See you later!"
  end

end