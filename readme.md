# Csv to TS Enum

Simple script to convert a given CSV file to a TypeScript Enum.


## How to use:

`ruby CsvToTsEnumScript.rb example.csv`

if you wish to specify how many lines to skip:

`ruby CsvToTsEnumScript.rb example.csv 3`

if you wish to force the values to all be strings:

`ruby CsvToTsEnumScript.rb example.csv 3 true`

### Argument Values

* Csv File (File name used for result)
* Number of lines to skip
* Force String

## Result:

By default, the script will make quote values unless they are numeric.

```typescript 
export enum example {
New = "N",
UsedOld = "U",
}
```

Example of default with number

```typescript 
export enum example {
first = 1,
UsedOld = "U",
}
```

Example with `Force String` set to true

```typescript 
export enum example {
first = "1",
UsedOld = "U",
}
```