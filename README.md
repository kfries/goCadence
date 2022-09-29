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
   * **Methods:**
      * **TimesIn(cad CadenceObj)** -> *float64*
         * **Parameters:** Cadence Object
         * **Return:** *float64*
         * A method to return the nunber of times the cadence will exist with the given cadence
            * Example -> A cadence of Semi-Annually will occur 2.0 times in a cadence of Annually
