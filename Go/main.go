package main

import (
	"fmt"
	"net/http"
)


func main() {
	// Define routes
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request){
		fmt.Fprint(w, "Hello, this is a simple Go Server!")
	})

	fmt.Println("Server starting on port 8080...")
	if err := http.ListenAndServe(":8080", nil); err != nil {
		fmt.Printf("Server error: %v\n",err)
	}
}

