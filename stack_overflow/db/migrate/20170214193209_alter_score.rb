class AlterScore < ActiveRecord::Migration[5.0]
  def change
    change_column_null(:questions, :score, 0)
  end
end
