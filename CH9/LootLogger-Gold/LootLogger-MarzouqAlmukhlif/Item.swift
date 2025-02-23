//
//  Item.swift
//  LootLogger
//
//  Created by Marzouq Almukhlif on 09/04/1443 AH.
//

import UIKit
import Foundation

class Item : Equatable {
    var name: String
    var valueInDollars: Int?
    var serialNumber: String?
    var dateCreated: Date
    var isFavorite: Bool
  
  init(name: String, serialNumber: String?, valueInDollars: Int,isFavorite:Bool) {
      self.name = name
      self.valueInDollars = valueInDollars
      self.serialNumber = serialNumber
      self.dateCreated = Date()
      self.isFavorite = isFavorite
  }
  
  convenience init(random: Bool = false) {
      if random {
          let adjectives = ["Fluffy", "Rusty", "Shiny"]
          let nouns = ["Bear", "Spork", "Mac"]
          let randomAdjective = adjectives.randomElement()!
          let randomNoun = nouns.randomElement()!
          let randomName = "\(randomAdjective) \(randomNoun)"
          let randomValue = Int.random(in: 0..<100)
          let randomSerialNumber =
              UUID().uuidString.components(separatedBy: "-").first!
        self.init(name: randomName,
                  serialNumber: randomSerialNumber,
                  valueInDollars: randomValue, isFavorite: Bool.random())
     } else {
      self.init(name: "", serialNumber: nil, valueInDollars: 0, isFavorite: false)
      }
  }
  
  static func ==(lhs: Item, rhs: Item) -> Bool {
          return lhs.name == rhs.name
            && lhs.serialNumber == rhs.serialNumber
            && lhs.valueInDollars == rhs.valueInDollars
            && lhs.dateCreated == rhs.dateCreated
          }
  
}
