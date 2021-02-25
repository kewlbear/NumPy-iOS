//
//  ExampleApp.swift
//  Example
//
//  Created by 안창범 on 2021/02/25.
//

import SwiftUI
import NumPySupport
import PythonSupport
import PythonKit

@main
struct ExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    init() {
        PythonSupport.initialize()
        NumPySupport.sitePackagesURL.insertPythonPath()
        let np = Python.import("numpy")
        let a = np.arange(15).reshape(3, 5)
        print(a)
        print(a.shape)
        print(a.ndim)
        print(a.dtype.name)
        print(a.itemsize)
        print(a.size)
        print(Python.type(a))
    }
}
