# Page Path - Part N

## Description

{{Page Path}} used by default, but you can use a custom path source as {{Click URL}}, {{New History Fragment}}, {{Form URL}}, etc.
The Google Tag Manager variable template will return

	* the page path part by index
	* always the last part
	* the page path length (integer)
	
The variable can now optionaly strip the extension (.html, .jpg, .mp4, .php, etc.)

## How to install
1. Open a Google Tag Manager container and go to the **Templates** menu.
2. In the **Variables Templates** section, click on **Search Gallery** button.
3. In the opened side panel, click on the **Search Icon** then type *"**sublimetrix**"*
4. Select the variable you want then click **Add to workspace** and publish your workspace.

*Do not forget to visit the **Templates** section sometimes to update gallery templates if a rounded blue arrow is visible.*

## Example

When path is /shop/toys/cars/red-car.html

|Page Path - Part N|Return value|
| ---- | ---- |
|Page Path - Part 1|shop|
|Page Path - Part 2|toys|
|Page Path - Last Part|red-car.html |
|Page Path - Last Part|red-car (with strip extension option) |
|Page Path - Length|4|


When path is /

|Page Path - Part N|Return value|
| ---- | ---- |
|Page Path - Part 1||
|Page Path - Last Part||
|Page Path - Length|0|


