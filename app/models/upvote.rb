class Upvote < Vote
  belongs_to :video, counter_cache: true
end
