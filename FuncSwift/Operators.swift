//
//  Operators.swift
//  FuncSwift
//
//  Created by Naphat Sanguansin on 1/28/15.
//  Copyright (c) 2015 Naphat Sanguansin. All rights reserved.
//

import Foundation

/// Pipe. x |> f = f(x)
infix operator |>   { precedence 50 associativity left }

public func |> <T, G>(x: T, f: T -> G) -> G {
    return f(x)
}

/// Function composition. f <> g = g(f(x))

infix operator <> { precedence 50 associativity left }

public func <> <T1, T2, T3> (f: T1 -> T2, g: T2 -> T3) -> (T1 -> T3) {
    return { (x) in
        g(f(x))
    }
}