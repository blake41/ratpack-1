class CreateCompliments < ActiveRecord::Migration
  def change
    create_table :compliments do |t|
      t.string :title
    end
  end
end
