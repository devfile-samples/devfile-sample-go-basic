package main

import (
	"flag"
	"fmt"
	"net/http"
)

var port = flag.Int("p", 8080, "server port")

func main() {
	flag.Parse()
	http.HandleFunc("/", HelloServer)
	http.ListenAndServe(fmt.Sprintf("0.0.0.0:%d", *port), nil)
}

func HelloServer(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello, %s! 🌻", r.URL.Path[1:])
}
