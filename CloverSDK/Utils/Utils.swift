//
//  Utils.swift
//  CloverSDK
//
//  Created by Yusuf on 1/6/16.
//  Copyright © 2016 Clover Network, Inc. All rights reserved.
//

import Foundation

// MARK: - Utility Methods

func do_after(seconds seconds: Double = 1, block: () -> Void) {
  let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(seconds * Double(NSEC_PER_SEC)))
  dispatch_after(delayTime, dispatch_get_main_queue(), block)
}

infix operator =~ {}
func =~ (input: String, pattern: String) -> Bool {
  return input.rangeOfString(pattern, options: NSStringCompareOptions.RegularExpressionSearch) != nil
}

infix operator ** { associativity left precedence 160 }
func ** (radix: Double, power: Double) -> Double { return pow(radix, power) }
func ** (radix: Int,    power: Int   ) -> Double { return pow(Double(radix), Double(power)) }
func ** (radix: Float,  power: Float ) -> Double { return pow(Double(radix), Double(power)) }

// MARK: - Extensions

extension Dictionary {
  mutating func updateContentsOf(other:Dictionary) {
    for (key,value) in other {
      self.updateValue(value, forKey:key)
    }
  }
  mutating func removeContentsOf(other:Dictionary) {
    for (key,_) in other {
      self.removeValueForKey(key)
    }
  }
  mutating func removeContentsOf(keys:[Key]) {
    for key in keys {
      self.removeValueForKey(key)
    }
  }
}

extension Array where Element: Equatable {
  mutating func removeObject(object: Element) {
    if let index = self.indexOf(object) {
      self.removeAtIndex(index)
    }
  }
  mutating func removeContentsOf(array: [Element]) {
    for object in array {
      self.removeObject(object)
    }
  }
}
