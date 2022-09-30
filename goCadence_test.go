package goCadence

import (
	"errors"
	"fmt"
	"math"
	"testing"
	"time"

	"github.com/cucumber/godog"
)

type testData struct {
	cad1, cad2     CadenceObj
	str1, str2     string
	float1, float2 float64
	testDate       time.Time
	nextDate       time.Time
}

func TestCucumberFeatures(t *testing.T) {
	suite := godog.TestSuite{
		ScenarioInitializer: InitializeScenario,
		Options: &godog.Options{
			Format:   "pretty",
			Paths:    []string{"features"},
			TestingT: t,
		},
	}

	if suite.Run() != 0 {
		t.Fatal("non-zero status returned, failed to run cucumber tests")
	}
}

// Given Callbacks
func (td *testData) aNewCadenceObject(key string) (err error) {
	td.cad1, err = Cadence.New(key)

	return
}

func (td *testData) aSecondCadenceObject(key string) (err error) {
	td.cad2, err = Cadence.New(key)

	return
}

func (td *testData) theDateIs(year, month, day int) (err error) {
	td.testDate = time.Date(year, time.Month(month), day, 0, 0, 0, 0, time.UTC)

	return
}

// When Callbacks
func (td *testData) iCallTheVersionMethod() (err error) {
	td.str1 = Cadence.Version

	return
}

func (td *testData) howManyTimesIn() (err error) {
	td.float1, err = td.cad1.TimesIn(td.cad2)

	return
}

func (td *testData) whenICallNext() (err error) {
	td.nextDate, err = td.cad1.Next(td.testDate)

	return
}

func (td *testData) whenICallNext3() (err error) {
	td.nextDate, err = td.cad1.NextN(td.testDate, 3)

	return
}

// Then Callbacks
func (td *testData) itWillReturn(versionStr string) (err error) {
	if td.str1 != versionStr {
		errText := fmt.Sprintf("ERROR: goCadence: Invalid Version: got: %s, exp:%s", td.str1, versionStr)
		err = errors.New(errText)
	}

	return
}

func (td *testData) verifyDescription(expected string) (err error) {
	if td.cad1.Description != expected {
		errText := fmt.Sprintf("ERROR: goCadence: Invalid Description: got: %s, exp:%s", td.cad1.Description, expected)
		err = errors.New(errText)
	}

	return
}

func (td *testData) verifyString(expected string) (err error) {
	if td.cad1.String != expected {
		errText := fmt.Sprintf("ERROR: goCadence: Invalid String: got: %s, exp:%s", td.cad1.String, expected)
		err = errors.New(errText)
	}

	return
}

func (td *testData) verifyValue(expected int64) (err error) {
	if td.cad1.Value != expected {
		errText := fmt.Sprintf("ERROR: goCadence: Invalid Value: got: %d, exp:%d", td.cad1.Value, expected)
		err = errors.New(errText)
	}

	return
}

func (td *testData) testFloatValue(expected float64) (err error) {
	diff := math.Abs(td.float1 - expected)
	if diff > 0.000001 {
		errText := fmt.Sprintf("ERROR: goCadence: Invalid Value: got: %f, exp:%f", td.float1, expected)
		err = errors.New(errText)
	}

	return
}

func (td *testData) verifyDate(year, month, day int) (err error) {
	expected := time.Date(year, time.Month(month), day, 0, 0, 0, 0, time.UTC)
	if td.nextDate != expected {
		dateFormat := time.RFC822
		errText := fmt.Sprintf("ERROR: goCadence: Invalid Value: got: %s, exp:%s", td.nextDate.Format(dateFormat), expected.Format(dateFormat))
		err = errors.New(errText)
	}

	return
}

func InitializeScenario(sc *godog.ScenarioContext) {
	td := testData{}

	// Given Mappings
	sc.Step(`^a new (.*) cadence object$`, td.aNewCadenceObject)
	sc.Step(`^a second cadence of (.*)$`, td.aSecondCadenceObject)
	sc.Step(`^the date is (\d+)-(\d+)-(\d+)$`, td.theDateIs)

	// When Mappings
	sc.Step(`^I call the version method$`, td.iCallTheVersionMethod)
	sc.Step(`^I ask how many times it is in this second cadence$`, td.howManyTimesIn)
	sc.Step(`^I call the next function with the test date$`, td.whenICallNext)
	sc.Step(`^I request the third occurance from the test date$`, td.whenICallNext3)

	// Then Mappings
	sc.Step(`^it will return "([^"]*)"$`, td.itWillReturn)
	sc.Step(`^its description should be "([^"]*)"$`, td.verifyDescription)
	sc.Step(`^its string value should be "([^"]*)"$`, td.verifyString)
	sc.Step(`^its value whould be (\d+)$`, td.verifyValue)
	sc.Step(`^I should get a floating point value of (\d+\.\d+)$`, td.testFloatValue)
	sc.Step(`^i should get a date of (\d+)-(\d+)-(\d+)$`, td.verifyDate)
}
