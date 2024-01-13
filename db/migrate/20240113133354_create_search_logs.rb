class CreateSearchLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :search_logs do |t|
      t.string :user_ip
      t.string :term

      t.timestamps
    end
  end
end
