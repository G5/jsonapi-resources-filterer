ActiveRecord::Schema.define do
  self.verbose = false

  create_table :books, force: true do |t|
    t.string :title
    t.string :author
    t.integer :pages
    t.datetime :published_at
    t.timestamps null: true
  end

end
