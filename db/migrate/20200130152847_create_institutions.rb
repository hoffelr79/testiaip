class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.integer :id_api
      t.string :name
      t.string :acronym
      t.boolean :enabled
      t.string :facebook_url
      t.string :facebook_username
      t.string :officer_email
      t.string :officer_name

      t.timestamps null: false
    end
  end
end
