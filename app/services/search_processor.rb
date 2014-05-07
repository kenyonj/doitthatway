class SearchProcessor
  attr_reader :query
  attr_accessor :results

  def initialize(query)
    @query = query
  end

  def descriptions
    Video.published.where("description ILIKE ?", "%#{query}%")
  end

  def names
    Video.published.where("name ILIKE ?", "%#{query}%")
  end

  def tags
    Tag.where("body ILIKE ?", "%#{query}%")
  end
end
