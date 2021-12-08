class RemoveCategoryFromListItem < ActiveRecord::Migration[6.1]
  def change
    remove_column :list_items, :category
  end
end
