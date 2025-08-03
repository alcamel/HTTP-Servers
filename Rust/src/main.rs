use actix_web::{get, App, HttpResponse, HttpServer, Responder};

// Simple handler
#[get("/")]
async fn hello() -> impl Responder {
    HttpResponse::Ok().body("Hello from Rust server!")
}

#[tokio::main]
async fn main() -> std::io::Result<()> {
    // Start server on port 8080
    HttpServer::new(|| {
        App::new()
            .service(hello)  // Register our handler
    })
    .bind("127.0.0.1:8080")?
    .workers(4)  // Number of worker threads (usually = CPU cores)
    .run()
    .await
}
