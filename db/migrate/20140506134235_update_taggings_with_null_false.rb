class UpdateTaggingsWithNullFalse < ActiveRecord::Migration
  def change
    change_column_null :taggings, :tag_id, false
    change_column_null :taggings, :video_id, false
  end
end
