require 'open-uri'
require 'pry'
require 'nokogiri'

require_relative "./npr_stories/version"
require_relative "./npr_stories/cli"

class Story

# NPR story search that limits results to 5 stories. Using this NPR account's key: tracetrace@gmail.com
# Results come back as XML, other options including JSON available. More info here http://www.npr.org/api/inputReference.php
BASE_URL = 'http://api.npr.org/query?apiKey=MDIyODk1NDk0MDE0NTYxNzg5NTdkYjVhZA000&numResults=5&id='

# PROGRAM ID Numbers, surprisingly only these 10 shows are offered via the API
ALL_THINGS_CONSIDERED = '2'
ASK_ME_ANOTHER = '58'
FRESH_AIR = '13'
HERE_AND_NOW = '60'
LATINO_USA = '22'
MORNING_EDITION = '3'
TED_RADIO_HOUR = '57'
WAIT_WAIT = '35'
WEEKEND_EDITION_SATURDAY = '7'
WEEKEND_EDITION_SUNDAY = '10'

def pull_stories(program)
  api_query = BASE_URL + program
  @doc = Nokogiri::XML(open(api_query))
  @set_of_stories = @doc.xpath('//story')

  @set_of_stories.each do |story|
    @program_title = @doc.css('story program')[0].text
    @story_title =@doc.css('story title')[0].text
    @story_date = @doc.css('story storyDate')[0].text
    @teaser = @doc.css('story teaser')[0].text
    @story_url = @doc.css('story link')[0].text
    @topic = @doc.css('story slug')[0].text
  end
end


