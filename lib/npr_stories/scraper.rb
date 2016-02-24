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

class NprStories::Scraper

  def initialize(name) #should use a variable
    @name = name
  end

  def pull_latest_story
    api_query = BASE_URL + @name
    @doc = Nokogiri::XML(open(api_query))
    latest_story = {
      story_title: @doc.css('title')[1].text,
      program_title: @doc.css('program')[1].text,
      story_date: @doc.css('storyDate')[1].text,
      teaser: @doc.css('teaser')[1].text,
      story_url: @doc.css('link')[1].text,
      topic: @doc.css('slug')[1].text
      }
  end

  def pull_stories
  end

end