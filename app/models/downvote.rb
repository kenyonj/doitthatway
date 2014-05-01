class Downvote < Vote
  belongs_to :video, counter_cache: true
end
