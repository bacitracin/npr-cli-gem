#class creates new stories
class NprStories::Story

  attr_accessor :story_title, :program_title, :story_date, :teaser, :story_url, :topic
  @@stories = []

  def initialize(story_hash)
    story_hash.each {|key, value| self.send(("#{key}="), value)}
    @@stories << self
  end

  def self.create_from_array(array_of_story_hashes) #array_of_story_hashes from Scraper pull_stories method
    array_of_story_hashes.each {|story| Story.new(story)}
  end


  def add_attributes(attributes_hash)
    attributes_hash.each {|key, value| self.send(("#{key}="), value)}
    self
  end

  def self.stories
    @@stories
  end

end
