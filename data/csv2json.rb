require 'csv'
require 'json'

filename = "US_ZIP_codes"
lines = CSV.open("#{filename}.csv").readlines
keys = lines.delete(lines.first)

File.open("#{filename}_ny.json", 'w') do |f|
  data = lines.map do |values|
  	if values[6] == "NY" && values[2] == "NEW YORK"
    	Hash[keys.zip(values)]
    end
  end
  data.compact!
  f.puts JSON.pretty_generate(data)
end