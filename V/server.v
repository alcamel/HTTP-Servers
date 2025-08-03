import net.http
import net

fn handle_request(mut req http.Request) http.Response {
    return http.Response{
        status_code: 200
        body: 'Hello from V server!'
        header: http.new_header(
            key: .content_type
            value: 'text/plain'
        )
    }
}

fn main() {
    mut server := http.Server{
        port: 8080
        handler: handle_request
    }
    
    println('Server starting on http://localhost:8080')
    go server.listen()  // Run server in a coroutine
    
    // Keep main thread alive
    for {}
}
