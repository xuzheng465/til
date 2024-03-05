# Manipulate string

```php
$s = "hello, world!";
echo strlen($s); // # => 13
echo substr($s, 0, 5); // # => hello
echo substr($s, 7); // # => world!
echo substr($s, -4, 3); // # => rld
echo str_replace("world", "php", $s); // # => hello, php!

echo strtoupper($s); // # => HELLO, WORLD!
echo strtolower($s); // # => hello, world!
echo ucfirst($s); // # => Hello, world!
echo ucwords($s); // # => Hello, World!
echo strpos($s, "world"); // # => 7
echo strpos($s, "php"); // # => false

```
