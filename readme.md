# Csv to TS Enum

Simple script to convert a given CSV file to a TypeScript Enum.


## How to use:

`ruby CsvToTsEnumScript.rb example.csv 3`

### Argument Values

* Csv File (File name used for result)
* Number of lines to skip

## Result:

```typescript 
export enum example {
New = "N",
UsedOld = "U",
}
```