//
//  Memoization.swift
//  FuncSwift
//
//  Created by Naphat Sanguansin on 1/28/15.
//  Copyright (c) 2015 Naphat Sanguansin. All rights reserved.
//

import Foundation

public func memoize <T: Hashable, U>(f: (T->U) -> T -> U) -> T->U {
    var cache = [T:U]()
    var memoized: (T->U)?
    memoized = { (x: T) -> U in
        if let cached = cache[x] {
            return cached
        } else {
            let result = f(memoized!)(x)
            // TODO if result is a function, memoize it as well
            cache[x] = result
            return result
        }
    }
    return memoized!
}