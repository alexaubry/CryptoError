# `import CryptoError`

![Swift 3.0](https://img.shields.io/badge/Swift-3.0-ee4f37.svg)
![Licence : MIT](https://img.shields.io/badge/Licence-MIT-000000.svg)
[![Build Status](https://travis-ci.org/alexaubry/CryptoError.svg?branch=master)](https://travis-ci.org/alexaubry/CryptoError)

A Swift tool to get the latest error in the OpenSSL error stack.

## Installation

This library is only available via the Swift Package Manager. To include it in your package, add this line to your `Package.swift` :

~~~swift
.Package(url: "https://github.com/alexaubry/CryptoError", majorVersion: 1)
~~~

## Usage

Call `CryptoError.latest()` to get the latest error.

### Properties

- `code` : The code of the error.
- `localizedDescription` : The description of the error.

### Example

~~~swift
if EVP_MD_CTX_create() == nil {
    let error = CryptoError.latest()
    print(error.code)
    print(error.localizedDescription)
}
~~~
