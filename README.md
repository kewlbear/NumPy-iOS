# NumPy-iOS

This swift package enables you to use NumPy in your iOS apps.

## Installation

```
.package(url: "https://github.com/kewlbear/NumPy-iOS.git", .branch("main"))
```

## Usage

```
import NumPySupport
import PythonSupport
import PythonKit

PythonSupport.initialize()
NumPySupport.sitePackageUrl.insertPythonPath()
let np = Python.import("numpy")
...
```

## License

MIT
