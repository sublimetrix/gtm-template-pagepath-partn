# Page Path - Part N

## Description
A Google Tag Manager variable template that return:
	*the page path part by index,
	*always the last part,
	*the page path length (interger)

## Example
If the path is "/shop/toys/cars/red-car.html"
| Page Path - Part N    | Return value |
| --------------------- | ------------ |
| Page Path - Part 1    | shop         |
| Page Path - Part 2    | toys         |
| Page Path - Last Part | red-car.html |
| Page Path - Length    | 4            |

If the path is "/"
| Page Path - Part N    | Return value |
|-----------------------|--------------|
| Page Path - Part 1    | undefined    |
| Page Path - Last Part | undefined    |
| Page Path - Length    | 0            |
