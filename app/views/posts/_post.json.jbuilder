json.extract! post, :id, :heading, :body, :price, :neighborhood, :external_url, :created_at, :updated_at
json.url post_url(post, format: :json)
