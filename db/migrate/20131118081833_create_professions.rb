class CreateProfessions < ActiveRecord::Migration
  def change
    create_table :professions do |t|
      t.string :title
      t.string :category

      t.timestamps
    end
  end
end
