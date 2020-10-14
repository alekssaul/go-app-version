package main

import (
	"fmt"
	"log"
	"net/http"
)

var version = "0.1"

func main() {
	http.HandleFunc("/", handler)
	log.Fatal(http.ListenAndServe(":8080", nil))
}

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "App Version: %s", version)
}
