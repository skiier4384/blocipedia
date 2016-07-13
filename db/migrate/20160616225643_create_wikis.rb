class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      
      t.boolean     :private, default: false, null: false
      t.text        :body
      t.references  :user, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
