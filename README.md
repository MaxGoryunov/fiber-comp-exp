[![EO principles respected here](https://www.elegantobjects.org/badge.svg)](https://www.elegantobjects.org)
[![DevOps By Rultor.com](http://www.rultor.com/b/MaxGoryunov/fiber-comp-exp)](http://www.rultor.com/p/MaxGoryunov/fiber-comp-exp)

**Computation expressions** are a way of simplifying monadic code which is inaccessible in PHP directly. This repository provides an attempt for emulating this approach using [Fibers](https://www.php.net/manual/en/language.fibers.php).

## How to use

Require it with [Composer](https://getcomposer.org/download/):

```bash
composer require maxgoryunov/fiber-comp-exp
```

Then include this in your `index.php` or any other main file:

```PHP
require __DIR__ . "./vendor/autoload.php";
```

If you have any questions, ask them at [Discussions](https://github.com/MaxGoryunov/fiber-comp-exp/discussions).
