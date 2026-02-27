package env

import (
	"fmt"
	"os"
	"strconv"
)

func GetString(key, fallback string) string {
	val, ok := os.LookupEnv(key)
	if !ok {
		fmt.Printf("Using Lookup Key %s\n", val)
		return fallback
	}
	fmt.Print("Using environment Key\n")
	return val
}
func GetInt(key string, fallback int) int {
	val, ok := os.LookupEnv(key)
	if !ok {
		return fallback
	}
	k_int, err := strconv.Atoi(val)
	if err != nil {
		return fallback
	}
	return k_int
}
