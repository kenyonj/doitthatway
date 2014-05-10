class UserSearcher
  def initialize(query)
    @query = query
  end

  def users
    User.where("name ILIKE ?", "%#{query}%")
  end

  private

  attr_reader :query
end
