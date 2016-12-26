Python thread webserver  
=======================  
  
Links: 
  
https://mafayyaz.wordpress.com/2013/02/08/writing-simple-http-server-in-python-with-rest-and-json/  
https://docs.python.org/2.4/lib/httplib-examples.html    
  

Server:   
  
```
./server.py 8080 127.0.0.1
```  
   
Stop server: [Crtl]+[Z]  
  
   
Client: 
  
```
curl -X POST http://localhost:8080/api/v1/addrecord/1 -d '{"prebnom":"Samuel"}' -H "Content-Type: application/json"
curl -X POST http://localhost:8080/api/v1/addrecord/2 -d '{"coucou":"sdsdfsdfl"}' -H "Content-Type: application/json"
```
  
```
curl -X GET http://localhost:8080/api/v1/getrecord/2 -H "Content-Type: application/json"
{'{"coucou":"sdsdfsdfl"}': ['']} 
```  


