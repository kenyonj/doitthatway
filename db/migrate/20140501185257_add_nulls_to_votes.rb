class AddNullsToVotes < ActiveRecord::Migration
  def change
    change_column :votes, :user_id, :integer, null: false
    change_column :votes, :video_id, :integer, null: false
    change_column :votes, :type, :string, null: false
  end
end
