package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"
)

var port = flag.Int("p", 8080, "server port")

func main() {
	flag.Parse()
	http.HandleFunc("/", HelloServer)
	if err := http.ListenAndServe(fmt.Sprintf("0.0.0.0:%d", *port), nil); err != nil {
		log.Fatal(err.Error())
	}
}

func HelloServer(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello, %s!", r.URL.Path[1:])
}
