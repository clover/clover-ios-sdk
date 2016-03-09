//
//  Utils.swift
//  CloverSDK
//
//  Created by Yusuf on 1/6/16.
//  Copyright © 2016 Clover Network, Inc. All rights reserved.
//

import Foundation

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

extension Array where Element: Equatable { // todo: test
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
