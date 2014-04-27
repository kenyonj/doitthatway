class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.belongs_to :user, index: true, null: false
      t.boolean :published, default: false
      t.string :youtube_url, null:false

      t.timestamps
    end
  end
end
