json.array!(@shares) do |share|
  json.extract! share, :id, :code, :company, :exchange
  json.url share_url(share, format: :json)
end
