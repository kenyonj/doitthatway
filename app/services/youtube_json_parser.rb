class YoutubeJsonParser
  include HTTParty

  attr_reader :url

  def initialize(url)
    @url = url
    @response = self.class.get("http://gdata.youtube.com/feeds/api/videos/#{youtube_id}?v=2&alt=jsonc")
  end

  def title
    response["data"]["title"]
  end

  def description
    response["data"]["description"]
  end

  private

  attr_reader :response

  def youtube_id
    url.split('=')[1]
  end
end
