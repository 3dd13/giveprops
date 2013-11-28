class CreateUserProfessions < ActiveRecord::Migration
  def change
    create_table :user_professions do |t|
      t.references :user, index: true
      t.references :profession, index: true

      t.timestamps
    end
  end
end
