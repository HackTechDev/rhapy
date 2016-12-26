#!/usr/bin/python
# -*- coding: UTF-8 -*-

# curl -X GET http://localhost:8080/api/v1/getrecord/1 -H "Content-Type: application/json"

import httplib, urllib

conn = httplib.HTTPConnection("localhost:8080")
conn.request("GET", "/api/v1/getrecord/1")
r1 = conn.getresponse()
#print r1.status, r1.reason
data1 = r1.read()
print data1
