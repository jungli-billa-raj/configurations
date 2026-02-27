package main

import (
	"fmt"
	"net/http"
	"tiago/internal/store"
	"time"

	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
)

type application struct {
	config config
}

type config struct {
	addr  string
	store store.Storage
}

func (app *application) mount() http.Handler {
	// mux := http.NewServeMux()
	//
	// mux.HandleFunc("/v1/health", app.healthHandler)
	r := chi.NewRouter()
	r.Use(middleware.Logger)
	r.Get("/v1/health", app.healthHandler)
	return r
}

func (app *application) run(mux http.Handler) error {

	srv := &http.Server{
		Addr:         app.config.addr,
		Handler:      mux,
		ReadTimeout:  time.Second * 10,
		WriteTimeout: time.Second * 30,
		IdleTimeout:  time.Minute,
	}
	fmt.Printf("Server has started on PORT%v", app.config.addr)
	return srv.ListenAndServe()
}
