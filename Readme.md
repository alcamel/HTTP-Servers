# HTTP Server in Different Language 

> Outline 
    
    - [x] Fastapi Http Server
    - [x] Python and C HTTP Server 
    - [x] Flask Server 
    - [x] Go HTTP Server 
    - [ ] Rust HTTP Server 
    - [ ] Zig HTTP Server 
    - [ ] PHP Server 
    - [ ] Ruby Server 

--- 

## Fastapi HTTP Server 

> Use to run 

```
uvicorn main:app --workers $(nproc) --loop uvloop --http httptools --no-access-log --port 10000
```
> ab Output: 

```
$ ab -n 100000 -c 1000 http://127.0.0.1:10000/

---

This is ApacheBench, Version 2.3 <$Revision: 1913912 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking 127.0.0.1 (be patient)
Completed 10000 requests
Completed 20000 requests
Completed 30000 requests
Completed 40000 requests
Completed 50000 requests
Completed 60000 requests
Completed 70000 requests
Completed 80000 requests
Completed 90000 requests
Completed 100000 requests
Finished 100000 requests


Server Software:        uvicorn
Server Hostname:        127.0.0.1
Server Port:            10000

Document Path:          /
Document Length:        22 bytes

Concurrency Level:      1000
Time taken for tests:   6.527 seconds
Complete requests:      100000
Failed requests:        0
Total transferred:      14700000 bytes
HTML transferred:       2200000 bytes
Requests per second:    15321.21 [#/sec] (mean)
Time per request:       65.269 [ms] (mean)
Time per request:       0.065 [ms] (mean, across all concurrent requests)
Transfer rate:          2199.43 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0   24   4.1     24      44
Processing:     7   41   9.1     41     111
Waiting:        3   32   9.1     33      97
Total:         24   65   8.8     64     148

Percentage of the requests served within a certain time (ms)
  50%     64
  66%     67
  75%     69
  80%     70
  90%     75
  95%     80
  98%     87
  99%     91
 100%    148 (longest request)
```

> Curl OUtput 

``` 
$ curl http://127.0.0.1:10000/
{"msg":"Hello World!"}
```

## Flask Server 

> Use To run 
```
gunicorn -w $(nproc) -k gthread --threads 8 --bind 0.0.0.0:8000 main:app
```

> ab Output 

```
ab -n 100000 -c 1000 http://127.0.0.1:8000/

--- 
This is ApacheBench, Version 2.3 <$Revision: 1913912 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking 127.0.0.1 (be patient)
Completed 10000 requests
Completed 20000 requests
Completed 30000 requests
Completed 40000 requests
Completed 50000 requests
Completed 60000 requests
Completed 70000 requests
Completed 80000 requests
Completed 90000 requests
Completed 100000 requests
Finished 100000 requests


Server Software:        gunicorn
Server Hostname:        127.0.0.1
Server Port:            8000

Document Path:          /
Document Length:        22 bytes

Concurrency Level:      1000
Time taken for tests:   20.971 seconds
Complete requests:      100000
Failed requests:        0
Total transferred:      16700000 bytes
HTML transferred:       2200000 bytes
Requests per second:    4768.47 [#/sec] (mean)
Time per request:       209.711 [ms] (mean)
Time per request:       0.210 [ms] (mean, across all concurrent requests)
Transfer rate:          777.67 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    3   7.1      0      42
Processing:     1  206 280.7    106    2379
Waiting:        1  205 280.9    105    2378
Total:          1  209 279.8    110    2379

Percentage of the requests served within a certain time (ms)
  50%    110
  66%    134
  75%    174
  80%    249
  90%    547
  95%    758
  98%    994
  99%   1544
 100%   2379 (longest request)
```

> Curl Output 

```
$ curl http://127.0.0.1:8000/
{"msg":"Hello World"}
```

## CPython 

> Use to Run 

```
pypy3 server.py
```

> ab Output 

```
$ ab -n 100000 -c 1000 http://127.0.0.1:8080/

--- 

This is ApacheBench, Version 2.3 <$Revision: 1913912 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking 127.0.0.1 (be patient)
Completed 10000 requests
Completed 20000 requests
Completed 30000 requests
Completed 40000 requests
Completed 50000 requests
Completed 60000 requests
Completed 70000 requests
Completed 80000 requests
Completed 90000 requests
Completed 100000 requests
Finished 100000 requests


Server Software:
Server Hostname:        127.0.0.1
Server Port:            8080

Document Path:          /
Document Length:        25 bytes

Concurrency Level:      1000
Time taken for tests:   4.701 seconds
Complete requests:      100000
Failed requests:        0
Total transferred:      6700000 bytes
HTML transferred:       2500000 bytes
Requests per second:    21273.84 [#/sec] (mean)
Time per request:       47.006 [ms] (mean)
Time per request:       0.047 [ms] (mean, across all concurrent requests)
Transfer rate:          1391.94 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0   21   2.9     21      29
Processing:     9   26   4.2     25      39
Waiting:        0   18   4.2     17      32
Total:         20   47   3.7     47      62

Percentage of the requests served within a certain time (ms)
  50%     47
  66%     48
  75%     49
  80%     49
  90%     51
  95%     52
  98%     53
  99%     54
 100%     62 (longest request)
```

> Curl Output 

```
$ curl http://127.0.0.1:8080
Hello from C HTTP Server!
```

## Go Server 

> Use To Run 

```
$ go build main.go
$ ./main
```

> ab Output 

```

```

> Curl Output 

```
$ curl http://127.0.0.1:8080/
Hello, this is a simple Go Server!
```

## Rust Server 

> Use to Run 

```
```

> ab Output 

```
```

> Curl Output 

```
```


## Zig Server 

> Use To Run 

```
```

> ab Output 

```
```

> Curl Output 

```
```

## V Server 

> Use To Run 

```
```

> ab Output 

```
```

> Curl Output 

