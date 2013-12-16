# izzy

A robust micro library for type checking. Defers to constructs' internal `[[Class]]` property rather than duck typing for excellent type detection and to avoid triggering false positives.

[![Build Status](https://travis-ci.org/eighttrackmind/izzy.png)](https://travis-ci.org/eighttrackmind/izzy.png)
[![browser support](https://ci.testling.com/eighttrackmind/izzy.png)](https://ci.testling.com/eighttrackmind/izzy)

## usage

```js
izzy.string ('foo') // true
izzy.string (new String('foo')) // true

izzy ('string', 'foo') // true
izzy ('string', 42) // false
```

## supported checks

array, boolean, undefined, element, function, nan, null, number, object, string

## size

|						|				|
|-----------------------|---------------|
| Raw					| 1.49 kb		|
| Uglified				| 843 b			|
| Uglified + gzipped	| 361 b			|

## environment support

Any browser (as `window.izzy` if you're not using a module loader), AMD, CommonJS, NodeJS

## building it yourself

```bash
npm install
grunt
```