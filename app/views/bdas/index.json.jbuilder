json.array!(@bdas) do |bda|
  json.extract! bda, :name, :description
  json.url bda_url(bda, format: :json)
end