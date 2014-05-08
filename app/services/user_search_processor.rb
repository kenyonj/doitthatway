class UserSearchProcessor
  attr_reader :query

  def initialize(query)
    @query = query
  end

  def users
    User.where("name ILIKE ?", "%#{query}%")
  end
end
