package goCadence

import (
	"errors"
	"strings"
	"time"
)

const (
	appVersion string = "0.0.3"
)

type CadenceEngine struct {
	Version string
}

func (ce *CadenceEngine) New(key string) (co CadenceObj, err error) {
	idx := strings.ToUpper(key)

	if obj, found := cadences[idx]; found {
		co = obj
	} else {
		err = errors.New("ERROR: Cadences: Invalid Cadence Key")
	}

	return
}

type CadenceObj struct {
	Key         string
	Value       int64
	String      string
	Description string
}

func (co *CadenceObj) TimesIn(secondCo CadenceObj) (ans float64, err error) {
	if co.Value == 0 {
		ans = 1.0
	} else {
		ans = float64(co.Value) / float64(secondCo.Value)
	}

	return
}

func (co *CadenceObj) Next(baseDate time.Time) (newDate time.Time, err error) {
	switch co.Key {
	case "ANNUALLY":
		newDate = baseDate.AddDate(1, 0, 0)
	case "BIANNUALLY":
		newDate = baseDate.AddDate(2, 0, 0)
	case "BIMONTHLY":
		newDate = baseDate.AddDate(0, 2, 0)
	case "BIWEEKLY":
		newDate = baseDate.AddDate(0, 0, 14)
	case "DAILY":
		newDate = baseDate.AddDate(0, 0, 1)
	case "MONTHLY":
		newDate = baseDate.AddDate(0, 1, 0)
	case "ONCE":
		newDate = baseDate
	case "QUADWEEKLY":
		newDate = baseDate.AddDate(0, 0, 28)
	case "QUARTERLY":
		newDate = baseDate.AddDate(0, 3, 0)
	case "SEMIANNUALLY":
		newDate = baseDate.AddDate(0, 6, 0)
	case "SEMIMONTHLY":
		m := baseDate.Month()
		d := baseDate.Day()
		y := baseDate.Year()

		if d >= 15 {
			newDate = time.Date(y, m+1, 0, 0, 0, 0, 0, time.UTC)
		} else {
			newDate = time.Date(y, m, 15, 0, 0, 0, 0, time.UTC)
		}

		if newDate == baseDate {
			newDate = time.Date(y, m+1, 15, 0, 0, 0, 0, time.UTC)
		}
	case "TREANNUALLY":
		newDate = baseDate.AddDate(3, 0, 0)
	case "TREQUADWEEKLY":
		newDate = baseDate.AddDate(0, 0, 84)
	case "TRIANNUALLY":
		newDate = baseDate.AddDate(0, 4, 0)
	case "WEEKLY":
		newDate = baseDate.AddDate(0, 0, 7)
	}

	return
}

func (co *CadenceObj) NextN(baseDate time.Time, idx int) (newDate time.Time, err error) {
	newDate = baseDate
	for i := 0; i < idx; i++ {
		newDate, err = co.Next(newDate)
	}

	return
}

var (
	Cadence = CadenceEngine{appVersion}

	cadences = map[string]CadenceObj{
		"ANNUALLY":      {Key: "ANNUALLY", Value: 84, String: "annually", Description: "once per year"},
		"BIANNUALLY":    {Key: "BIANNUALLY", Value: 42, String: "bi-annually", Description: "every two years"},
		"BIMONTHLY":     {Key: "BIMONTHLY", Value: 504, String: "bi-monthly", Description: "every two months"},
		"BIWEEKLY":      {Key: "BIWEEKLY", Value: 2190, String: "bi-weekly", Description: "every two weeks"},
		"DAILY":         {Key: "DAILY", Value: 30660, String: "daily", Description: "every day"},
		"MONTHLY":       {Key: "MONTHLY", Value: 1008, String: "monthly", Description: "once per month"},
		"ONCE":          {Key: "ONCE", Value: 0, String: "once", Description: "one time only"},
		"QUADWEEKLY":    {Key: "QUADWEEKLY", Value: 1095, String: "quad-weekly", Description: "every four weeks"},
		"QUARTERLY":     {Key: "QUARTERLY", Value: 336, String: "quarterly", Description: "four times per year"},
		"SEMIANNUALLY":  {Key: "SEMIANNUALLY", Value: 168, String: "semi-annually", Description: "twice per year"},
		"SEMIMONTHLY":   {Key: "SEMIMONTHLY", Value: 2016, String: "semi-monthly", Description: "twice per month"},
		"TREANNUALLY":   {Key: "TREANNUALLY", Value: 28, String: "tre-annually", Description: "every three years"},
		"TREQUADWEEKLY": {Key: "TREQUADWEEKLY", Value: 365, String: "tre-quad-weekly", Description: "every twelve weeks"},
		"TRIANNUALLY":   {Key: "TRIANNUALLY", Value: 252, String: "tri-annually", Description: "three times per year"},
		"WEEKLY":        {Key: "WEEKLY", Value: 4380, String: "weekly", Description: "once per week"},
	}
)
