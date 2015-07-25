require 'net/https'
require 'json'
query = ARGV[0]

params = URI.escape(query)
uri = URI("https://translate.google.ru/translate_a/single?client=t&sl=en&tl=ru&hl=en&dt=bd&dt=t&q=#{params}")
response = Net::HTTP.get(uri)
con = true
con = response.gsub!(",,",",") while con
h = JSON[response]

str = ""
arr = []
if h.size > 2 then
  h[1].each {|word| arr += word[1]}
  if arr.size < 10 then
    str = arr.join("\n")
  else str = arr[0..9].join("\n")
  end
else str = "#{h[0][0][0]}"
end

puts str
