class RenameSessionColumn < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.rename :session, :session_id
    end
  end
end
