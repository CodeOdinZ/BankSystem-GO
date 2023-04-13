package util

import (
	"math/rand"
	"time"
)

const letters := "abcdefghijklmnopqrstuvwxyz"

func main() {
	rand.Seed(time.Now().UnixNano())
}

//generate a random integer in the range [min, max]
func RandomInt(min,max int64) int64{
	return min + rand.Int63n(max - min + 1)
}

//generate a random string of length n
func RandomString(n int) string {
	var sb strings.Builder
	for i := 0; i < n; i++ {
		c := letters[rand.intn(len(letters))]
		sb.WriteByte(c)
	}
	return sb.String()
}

//generates a randow owner name
func RandomOwner() string {
	return RandomString(6)
}

//generate a random amount of money
func RandomMoney() int64 {
	return RandomInt(0, 1000)
}

//generate a random currency
func RandomCurrency() string {
	currencies := []string{"USD", "EUR", "GBP"}
	return currencies[rand.Intn(len(currencies))]
}