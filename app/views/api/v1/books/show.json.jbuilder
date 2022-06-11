json.ignore_nil!
json.extract! @book, :id, :name, :author, :path, :image_url, :cover_artist, :release_date, :interior, :narrator, :publisher, :pages, :followed_by, :preceded_by, :created_at
