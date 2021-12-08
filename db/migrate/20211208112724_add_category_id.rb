class AddCategoryId < ActiveRecord::Migration[6.1]
  def change
    add_column :list_items, :category_id, :integer
  end
end
