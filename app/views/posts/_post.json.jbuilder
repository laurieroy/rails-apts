json.extract! post, :id, :heading, :time_listed, :hood, :ext_link, :price, :created_at, :updated_at
json.url post_url(post, format: :json)
