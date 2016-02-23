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
        when "1"
        @atc_stories = NprStories::StoryScraper.pull_stories(ALL_THINGS_CONSIDERED)
        when "2"
          @ama_stories = NprStories::StoryScraper.pull_stories(ASK_ME_ANOTHER)
        when "3"
          @fresh_air_stories = NprStories::StoryScraper.pull_stories(FRESH_AIR)
        when "4"
          @here_and_now_stories = NprStories::StoryScraper.pull_stories(HERE_AND_NOW)
        when "5"
          @latino_usa_stories = NprStories::StoryScraper.pull_stories(LATINO_USA)
        when "6"
          @morning_edition_stories = NprStories::StoryScraper.pull_stories(MORNING_EDITION)
        when "7"
          @ted_radio_hour_stories = NprStories::StoryScraper.pull_stories(TED_RADIO_HOUR)
        when "8"
          @wait_wait_stories = NprStories::StoryScraper.pull_stories(WAIT_WAIT)
        when "9"
          @weekend_edition_sat_stories = NprStories::StoryScraper.pull_stories(WEEKEND_EDITION_SATURDAY)
        when "10"
          @weekend_edition_sun_stories = NprStories::StoryScraper.pull_stories(WEEKEND_EDITION_SUNDAY)
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