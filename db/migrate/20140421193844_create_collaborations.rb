class CreateCollaborations < ActiveRecord::Migration
  def change
    create_table :collaborations do |t|
      t.belongs_to :user
      t.belongs_to :wiki

      t.timestamps
    end
    add_index :collaborations, :user_id
    add_index :collaborations, :wiki_id
  end
end
