# NPR story search that limits results to 5 stories. Using this NPR account's key: tracetrace@gmail.com
# Results come back as XML/NPRML, other options including JSON available. More info @ http://www.npr.org/api/inputReference.php

BASE_URL = 'http://api.npr.org/query?apiKey=MDIyODk1NDk0MDE0NTYxNzg5NTdkYjVhZA000&numResults=5&id=2'

# NPR Program ID Numbers, surprisingly only these 10 shows are offered via the API
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

  def initialize(name)
    @name = name
  end

  def pull_stories
    array_of_stories = []
    api_query = BASE_URL + @name
    @doc = Nokogiri::XML(open(api_query))
    @stories = @doc.xpath('*//story') # @stories is an array of 5 Nokogiri story objects
    stories.each do |story|
      story_title = story.at_css('title').text, #uses at_css instead of .first
      program_title = story.css('program')[0].text,
      story_date = story.css('storyDate')[0].text,
      teaser = story.css('teaser')[0].text,
      story_url = story.css('link')[0].text,
      topic = story.css('slug')[0].text
      array_of_stories << {story_title: story_title, program_title: program_title, story_date: story_date, teaser: teaser, story_url: story_url, topic: topic}
    end
    array_of_stories
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

end