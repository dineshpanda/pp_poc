json.properties @properties do |property|
  json.id property.id
  json.address property.address
  json.lat property.lonlat.y
  json.lng property.lonlat.x
end
