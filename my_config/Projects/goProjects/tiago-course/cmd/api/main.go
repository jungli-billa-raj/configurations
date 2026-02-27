package main

import (
	"log"
	"tiago/internal/env"
	"tiago/internal/store"
)

func main() {
	db := store.NewStorage(nil)

	cfg := config{
		addr:  env.GetString("ADDR", ":8080"),
		store: db,
	}

	app := application{
		config: cfg,
	}
	mux := app.mount()
	log.Fatal(app.run(mux))
}
