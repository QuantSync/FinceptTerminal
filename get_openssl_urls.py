import urllib.request
import json

url = "https://slproweb.com/download/win32_openssl_hashes.json"
req = urllib.request.urlopen(url)
data = json.loads(req.read().decode('utf-8'))

for k, v in data.get('files', {}).items():
    if v.get('bits') == 64 and not v.get('light') and v.get('installer') == 'msi' and v.get('arch') == 'INTEL':
        print(f"{k} -> {v.get('url')} (basever: {v.get('basever')})")
