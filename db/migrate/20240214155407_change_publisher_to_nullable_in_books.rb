class ChangePublisherToNullableInBooks < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:books, :publisher_id, true)
  end
end
