class VideoSearcher
  def initialize(query)
    @query = query
  end

  def results
    Video.joins(:tags).where(condition).uniq
  end

  private

  attr_reader :query

  def condition
    named.or(described.or(tagged))
  end

  def search_query
    "%#{query}%"
  end

  def videos_table
    Video.arel_table
  end

  def tags_table
    Tag.arel_table
  end

  def named
    videos_table[:name].matches(search_query)
  end

  def described
    videos_table[:description].matches(search_query)
  end

  def tagged
    tags_table[:body].matches(search_query)
  end
end
