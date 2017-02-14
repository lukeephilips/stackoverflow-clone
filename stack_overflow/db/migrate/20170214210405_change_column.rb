class ChangeColumn < ActiveRecord::Migration[5.0]
  def change
    change_column :questions, :score, :integer, :default => 0
  end
end
