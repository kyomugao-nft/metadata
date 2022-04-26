require 'csv'
require 'json'
require 'optparse'

# options = {}

# opt = OptionParser.new
# opt.on('-s', '--start_token_id ARG', 'start_token_id') { |v| options['start_token_id'] = v.to_i || 0 }
# opt.on('-e', '--end_token_id ARG', 'end_token_id') { |v| options['end_token_id'] = v.to_i || 0 }
# opt.on('-n', '--name ARG', 'name') { |v| options['name'] = v.to_s || '' }
# opt.on('-d', '--description ARG', 'description') { |v| options['description'] = v.to_s || '' }
# opt.on('-i', '--image_url ARG', 'image_url') { |v| options['image_url'] = v.to_s || '' }
# opt.on('-t', '--animation_url ARG', 'animation_url') { |v| options['animation_url'] = v.to_s || '' }
# opt.parse(ARGV)

# count = (options['end_token_id'] - options['start_token_id'])
# token_ids = [*options['start_token_id']..options['end_token_id']]
# count.times do |i|
#   token_id = token_ids[i + 1]

CSV.foreach('kyomugao.csv', headers: true) do |row|
  File.open(row['token_id'], 'w') { |f|
    json = {
      "tokenId": row['token_id'].to_i,
      "name": "Kyomugao ##{row['token_id']}",
      "description": row['description'].to_s,
      "image_url": "ipfs://QmUw5CNjfoSXKAm8LwibMrWWTnNvQEjq7UxjQEP9411YCo/#{row['file_name']}",
      "attributes": {
        "hair_color": row['hair_color'],
        "bangs": row['bangs'],
        "earrings": row['earrings'],
        "clothes": row['clothes'],
        "hair_accessory": row['hair_accessory']
      }
    }
    f.puts JSON.pretty_generate(json)
  }
end
