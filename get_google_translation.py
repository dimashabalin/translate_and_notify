import requests
import json
import sys
import urllib

query = sys.argv[1]

url = "https://translate.google.ru/translate_a/single?client=t&sl=en&tl=ru&hl=en&dt=bd&dt=t&q=" + urllib.quote(query, '')
r = requests.get(url)
h = json.loads(r.text.replace(',,', ','))
translations = ""

if len(h) > 2:
    for i in range(0, len(h[1]), 1):
        translations = translations + '\n' + '\n'.join(h[1][i][1])
else:
    translations = h[0][0][0]

print translations
