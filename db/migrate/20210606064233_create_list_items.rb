class CreateListItems < ActiveRecord::Migration[6.1]
  def change
    create_table :list_items do |t|
      t.string :title
      t.string :description
      t.string :category
      t.date :deadline
      t.integer :user_id
      t.timestamps
    end
  end
end
