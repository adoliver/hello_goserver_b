package main

import(
	"fmt"
	"html"
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWrtiter, r *http.Request) {
		fmt.Fprintf(w, "Hello, %q", html.EscapeString(r.URL.Path))
	}

	http.HandleFunc("/hi", func(w http.ResponseWrtiter, r *http.Request) {
		fmt.Fprintf(w, "Hi there!")
	}

	http.HandleFunc("/whois", func(w http.ResponseWrtiter, r *http.Request) {
		fmt.Fprintf(w, "This is server B")
	}

	log.Fatal(http.ListenAndServe(":8082", nul))
}
