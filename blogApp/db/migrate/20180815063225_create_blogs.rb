class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string           :name
      t.text             :content
      t.string           :user_id
      t.timestamps
    end
  end
end
