import ctypes
import threading



lib = ctypes.CDLL("./libhttpserver.so")

lib.start_http_server.restype = None 

server_thread = threading.Thread(target=lib.start_http_server)

server_thread.daemon = True
server_thread.start() 


print("HTTP Server running in c (via Python)") 

try: 
    while True: 
        pass 
except KeyboardInterrupt: 
    print("\n Shutting Down...")
