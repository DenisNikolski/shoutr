class ChangeContentIdToBeIntegerInShouts < ActiveRecord::Migration[5.2]
  def change
    change_column :shouts, :content_id, 'integer USING CAST(content_id AS integer)'
  end
end
