# goCadence
Go module focused on recurring time periods

## Defined Cadence Values

  | Key            | Description .        |
  |----------------|----------------------|
  | ANNUALLY       | once per year        |
  | BIANNUALLY     | every two years      |
  | BIMONTHLY      | every two months     |
  | BIWEEKLY       | every two weeks      |
  | DAILY          | every day            |
  | MONTHLY        | once per month       |
  | ONCE           | one time only        |
  | QUADWEEKLY     | every four weeks     |
  | QUARTERLY      | four times per year  |
  | SEMIANNUALLY   | twice per year       |
  | SEMIMONTHLY    | twice per month      |
  | TREANNUALLY    | every three years    |
  | TREQUADWEEKLY  | every twelve weeks   |
  | TRIANNUALLY    | three times per year |
  | WEEKLY         | once per week        |

## API

   * **goCadenceVersion()** -> *string*
      * **Parameters:** *none*
      * **Return:** *string* in the format of Major.Minor.Patch
      * A function that will return the version string to determine what features are available
   * **New(key *string*)** -> CadenceObj
      * **Parameters:** *key(string)*
      * **Return:** *CadenceObj*
      * Function to initialize a CadenceObj that follows the CadenceInf interface, defined via a key to identify the Cadence wanted

## CadenceObj

   * **Properties:**
      * **String:** A printable version of the cadence name
         * **Example** BIWEEKLY.String() -> "bi-weekly"
      * **Description:** a description of the cadence
        * **Example:** BIWEEKLY.Description() -> "every two weeks"
   * **Methods:**
      * **TimesIn(cad CadenceObj)** -> *float64*
         * **Parameters:** Cadence Object
         * **Return:** *float64*
         * A method to return the nunber of times the cadence will exist with the given cadence
            * Example -> A cadence of Semi-Annually will occur 2.0 times in a cadence of Annually

## Misc. Notes

   * Cadence of SEMIMONTHLY currently defaults to the 15th and the last day of the month

## Future Features

   * Setting to disallow Saturdays
   * Setting to disallow Sundays
   * Setting to disallow Holidays
   * Allow dates to be advanced to next day when disallowed
   * Allow dates to be pushed backward to previous day when disallowed
