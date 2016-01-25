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

// MARK: - Methods

func logIfDebug(title: String, obj: AnyObject?) {
  // todo: if debug
  print(__FUNCTION__)
  guard let obj = obj else { return }
  
  if let dict = obj as? [String:String] {
    guard !dict.isEmpty else { return }
    print("\(title): \(dict)")
  } else {
    print("\(title): \(obj)")
  }
}

func logIfDebug(obj: AnyObject?) {
  // todo: if debug
  print(__FUNCTION__)
  guard let obj = obj  else { return }
  print("\(obj)")
}

// todo: dump(received_obj) if debug ??
