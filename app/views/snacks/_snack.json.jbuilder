json.extract! snack, :id, :name, :description, :img_url, :created_at, :updated_at
json.url snack_url(snack, format: :json)
