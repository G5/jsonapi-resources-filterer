ActiveRecord::Schema.define do
  self.verbose = false

  create_table :books, force: true do |t|
    t.string :title
    t.string :author
    t.integer :pages
    t.datetime :published_at
    t.timestamps null: true
  end

  create_table :contacts, force: true do |t|
    t.string :first_name
    t.string :last_name
    t.timestamps null: true
  end

  create_table :people, force: true do |t|
    t.string :first_name
    t.string :last_name
    t.timestamps null: true
  end

end
