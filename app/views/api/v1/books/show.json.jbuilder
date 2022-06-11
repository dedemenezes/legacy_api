json.ignore_nil!
json.id @book.id
json.title @book.title
json.image_url @book.image_url
json.cover_artists @book.cover_artists
# json.interior @book.interior
# json.narrator @book.narrator
json.pages @book.pages
json.publisher @book.publisher
json.release_date @book.release_date
json.followed_by @book.followed_by
json.preceded_by @book.preceded_by
json.created_at @book.created_at
json.author @book.author
