json.array!(@resources) do |resource|
  json.extract! resource, :id, :title, :description, :link, :phone, :kind
  json.url resource_url(resource, format: :json)
end
