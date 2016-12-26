#!/usr/bin/python
# -*- coding: UTF-8 -*-

# curl -X POST http://localhost:8080/api/v1/addrecord/1 -d 'Solomon Kane' -H "Content-Type: application/json"

import httplib, urllib
params = urllib.urlencode({"responseData": {"name" : "Solomon Kane"} })
headers = {"Content-type": "application/json", "Accept": "text/plain"}
conn = httplib.HTTPConnection("localhost:8080")
conn.request("POST", "/api/v1/addrecord/1", params, headers)
response = conn.getresponse()
print response.status, response.reason
data = response.read()
conn.close()
