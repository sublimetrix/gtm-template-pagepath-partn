# Page Path - Part N

## Description

{{Page Path}} used by default, but you can use a custom path source as {{Click URL}}, {{New History Fragment}}, {{Form URL}}, etc.
The Google Tag Manager variable template will return

	* the page path part by index
	* always the last part
	* the page path length (interger)



## Example

When path is /shop/toys/cars/red-car.html

|Page Path - Part N|Return value|
| ---- | ---- |
|Page Path - Part 1|shop|
|Page Path - Part 2|toys|
|Page Path - Last Part|red-car.html |
|Page Path - Length|4|

When path is /

|Page Path - Part N|Return value|
| ---- | ---- |
|Page Path - Part 1|undefined|
|Page Path - Last Part|undefined|
|Page Path - Length|0|


