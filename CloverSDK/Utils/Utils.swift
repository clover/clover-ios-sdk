//
//  Utils.swift
//  CloverSDK
//
//  Created by Yusuf on 1/6/16.
//  Copyright © 2016 Clover Network, Inc. All rights reserved.
//

import Foundation

// MARK: - Utility Methods

func do_after(seconds: Double = 1, block: @escaping () -> Void) {
  let delayTime = DispatchTime.now() + Double(Int64(seconds * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
  DispatchQueue.main.asyncAfter(deadline: delayTime, execute: block)
}

infix operator =~
func =~ (input: String, pattern: String) -> Bool {
  return input.range(of: pattern, options: NSString.CompareOptions.regularExpression) != nil
}

infix operator ** { associativity left precedence 160 }
func ** (radix: Double, power: Double) -> Double { return pow(radix, power) }
func ** (radix: Int,    power: Int   ) -> Double { return pow(Double(radix), Double(power)) }
func ** (radix: Float,  power: Float ) -> Double { return pow(Double(radix), Double(power)) }

// MARK: - Extensions

extension Dictionary {
  mutating func updateContentsOf(_ other:Dictionary) {
    for (key,value) in other {
      self.updateValue(value, forKey:key)
    }
  }
  mutating func removeContentsOf(_ other:Dictionary) {
    for (key,_) in other {
      self.removeValue(forKey: key)
    }
  }
  mutating func removeContentsOf(_ keys:[Key]) {
    for key in keys {
      self.removeValue(forKey: key)
    }
  }
}

extension Array where Element: Equatable {
  mutating func removeObject(_ object: Element) {
    if let index = self.index(of: object) {
      self.remove(at: index)
    }
  }
  mutating func removeContentsOf(_ array: [Element]) {
    for object in array {
      self.removeObject(object)
    }
  }
}
