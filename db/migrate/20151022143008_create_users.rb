class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_email, presence: true, index: true, unique: true
      t.string :hashword, presence: true
      t.string :session, presence: true

      t.timestamps
    end
  end
end
