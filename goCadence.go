package goCadence

import (
	"errors"
	"strings"
)

const (
	appVersion string = "0.0.2"
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

type CadenceInf interface {
	TimesIn() float64
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
