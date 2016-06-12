json.array!(@items) do |item|
  json.extract! item, :id, :nome
  json.url item_url(item, format: :json)
end
