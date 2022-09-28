package goCadence

import (
	"errors"
	"fmt"
	"testing"

	"github.com/cucumber/godog"
)

type testData struct {
	str1 string
}

func TestCucumber(t *testing.T) {
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

// When Callbacks
func (td *testData) iCallTheVersionMethod() (err error) {
	td.str1 = goCadenceVersion()

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

func InitializeScenario(sc *godog.ScenarioContext) {
	td := testData{}

	// Given Mappings

	// When Mappings
	sc.Step(`^I call the version method$`, td.iCallTheVersionMethod)

	// Then Mappings
	sc.Step(`^it will return "([^"]*)"$`, td.itWillReturn)
}
