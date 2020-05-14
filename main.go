package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
)

type Simple struct {
	Name string
	Description string
	Url string
}

func SimpleFactory (host string) Simple {
	return Simple{"Hello", "World", host}
}

func handler(w http.ResponseWriter, r *http.Request) {
	simple := SimpleFactory(r.Host)

	jsonOutput, _ := json.Marshal(simple)

	fmt.Fprintln(w, string(jsonOutput))
	// fmt.Fprintln(w, simple)
}

func main() {
	fmt.Println("Server started normally")
	http.HandleFunc("/", handler)
	log.Fatal(http.ListenAndServe(":8080", nil))
}
