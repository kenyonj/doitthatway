class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :type
      t.belongs_to :user, index: true
      t.belongs_to :video, index: true

      t.timestamps
    end
  end
end
