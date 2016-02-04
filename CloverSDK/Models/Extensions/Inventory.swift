 
import ObjectMapper

extension CLVModels {
public class Inventory {

 
public class Attribute: NSObject, NSCoding, Mappable {
    /// Unique identifier
    public var id: String?
    /// Name of this attribute
    public var name: String?
    /// The item group this attribute belongs to
    public var itemGroup: CLVModels.Inventory.ItemGroup?
    /// Options associated with this attribute
    public var options: [CLVModels.Inventory.Option]?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(name, forKey: "name")
  aCoder.encodeObject(itemGroup, forKey: "itemGroup")
  aCoder.encodeObject(options, forKey: "options")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        itemGroup = aDecoder.decodeObjectForKey("itemGroup") as? CLVModels.Inventory.ItemGroup
        options = aDecoder.decodeObjectForKey("options") as? [CLVModels.Inventory.Option]
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        name <- map["name"]
        itemGroup <- map["itemGroup"]
        options <- (map["options"], CLVArrayTransform<CLVModels.Inventory.Option>())
  }
}


 
public class Category: NSObject, NSCoding, Mappable {
    /// Unique identifier
    public var id: String?
    /// 
    public var name: String?
    public var sortOrder: Int?
    /// Items associated with this category
    public var items: [CLVModels.Inventory.Item]?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(name, forKey: "name")
  aCoder.encodeObject(sortOrder, forKey: "sortOrder")
  aCoder.encodeObject(items, forKey: "items")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        sortOrder = aDecoder.decodeObjectForKey("sortOrder") as? Int
        items = aDecoder.decodeObjectForKey("items") as? [CLVModels.Inventory.Item]
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        name <- map["name"]
        sortOrder <- map["sortOrder"]
        items <- (map["items"], CLVArrayTransform<CLVModels.Inventory.Item>())
  }
}


 
public class CategoryItem: NSObject, NSCoding, Mappable {
    public var item: CLVModels.Inventory.Item?
    public var category: CLVModels.Inventory.Category?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(item, forKey: "item")
  aCoder.encodeObject(category, forKey: "category")
}

required public init(coder aDecoder: NSCoder) {
      item = aDecoder.decodeObjectForKey("item") as? CLVModels.Inventory.Item
        category = aDecoder.decodeObjectForKey("category") as? CLVModels.Inventory.Category
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      item <- map["item"]
        category <- map["category"]
  }
}


 
public class Discount: NSObject, NSCoding, Mappable {
    /// Unique identifier
    public var id: String?
    /// Name of the discount
    public var name: String?
    /// Discount amount in fraction of currency unit (e.g. cents) based on currency fraction digits supported
    public var amount: Int?
    /// Discount amount in percent
    public var percentage: Int?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(name, forKey: "name")
  aCoder.encodeObject(amount, forKey: "amount")
  aCoder.encodeObject(percentage, forKey: "percentage")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        amount = aDecoder.decodeObjectForKey("amount") as? Int
        percentage = aDecoder.decodeObjectForKey("percentage") as? Int
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        name <- map["name"]
        amount <- map["amount"]
        percentage <- map["percentage"]
  }
}


 
public class Item: NSObject, NSCoding, Mappable {
    /// Unique identifier
    public var id: String?
    /// True if this item is hidden from register
    public var hidden: Bool?
    /// Reference to an item group
    public var itemGroup: CLVModels.Inventory.ItemGroup?
    /// Name of the item
    public var name: String?
    /// Alternate name of the item
    public var alternateName: String?
    /// Product code, e.g. UPC or EAN
    public var code: String?
    /// SKU of the item
    public var sku: String?
    /// Price of the item, typically in cents; use priceType and merchant currency to determine actual item price
    public var price: Int?
    public var priceType: CLVModels.Inventory.PriceType?
    /// Flag to indicate whether or not to use default tax rates
    public var defaultTaxRates: Bool?
    /// Unit name, e.g. oz, lb
    public var unitName: String?
    /// Cost of the item to merchant, as opposed to customer price
    public var cost: Int?
    /// True if this item should be counted as revenue, for example gift cards and donations would not
    public var isRevenue: Bool?
    /// DEPRECATED: use itemStock instead
    public var stockCount: Int?
    public var taxRates: [CLVModels.Inventory.TaxRate]?
    public var modifierGroups: [CLVModels.Inventory.ModifierGroup]?
    /// Categories associated with this item
    public var categories: [CLVModels.Inventory.Category]?
    /// Tags associated with this item
    public var tags: [CLVModels.Inventory.Tag]?
    /// Item stock attribute that can be expanded to show stock quantity
    public var itemStock: CLVModels.Inventory.ItemStock?
    public var modifiedTime: NSDate?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(hidden, forKey: "hidden")
  aCoder.encodeObject(itemGroup, forKey: "itemGroup")
  aCoder.encodeObject(name, forKey: "name")
  aCoder.encodeObject(alternateName, forKey: "alternateName")
  aCoder.encodeObject(code, forKey: "code")
  aCoder.encodeObject(sku, forKey: "sku")
  aCoder.encodeObject(price, forKey: "price")
  aCoder.encodeObject(priceType?.rawValue, forKey: "priceType")
  aCoder.encodeObject(defaultTaxRates, forKey: "defaultTaxRates")
  aCoder.encodeObject(unitName, forKey: "unitName")
  aCoder.encodeObject(cost, forKey: "cost")
  aCoder.encodeObject(isRevenue, forKey: "isRevenue")
  aCoder.encodeObject(stockCount, forKey: "stockCount")
  aCoder.encodeObject(taxRates, forKey: "taxRates")
  aCoder.encodeObject(modifierGroups, forKey: "modifierGroups")
  aCoder.encodeObject(categories, forKey: "categories")
  aCoder.encodeObject(tags, forKey: "tags")
  aCoder.encodeObject(itemStock, forKey: "itemStock")
  aCoder.encodeObject(modifiedTime, forKey: "modifiedTime")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        hidden = aDecoder.decodeObjectForKey("hidden") as? Bool
        itemGroup = aDecoder.decodeObjectForKey("itemGroup") as? CLVModels.Inventory.ItemGroup
        name = aDecoder.decodeObjectForKey("name") as? String
        alternateName = aDecoder.decodeObjectForKey("alternateName") as? String
        code = aDecoder.decodeObjectForKey("code") as? String
        sku = aDecoder.decodeObjectForKey("sku") as? String
        price = aDecoder.decodeObjectForKey("price") as? Int
        priceType = (aDecoder.decodeObjectForKey("priceType") as? String) != nil ?
      CLVModels.Inventory.PriceType(rawValue: (aDecoder.decodeObjectForKey("priceType") as! String)) : nil
        defaultTaxRates = aDecoder.decodeObjectForKey("defaultTaxRates") as? Bool
        unitName = aDecoder.decodeObjectForKey("unitName") as? String
        cost = aDecoder.decodeObjectForKey("cost") as? Int
        isRevenue = aDecoder.decodeObjectForKey("isRevenue") as? Bool
        stockCount = aDecoder.decodeObjectForKey("stockCount") as? Int
        taxRates = aDecoder.decodeObjectForKey("taxRates") as? [CLVModels.Inventory.TaxRate]
        modifierGroups = aDecoder.decodeObjectForKey("modifierGroups") as? [CLVModels.Inventory.ModifierGroup]
        categories = aDecoder.decodeObjectForKey("categories") as? [CLVModels.Inventory.Category]
        tags = aDecoder.decodeObjectForKey("tags") as? [CLVModels.Inventory.Tag]
        itemStock = aDecoder.decodeObjectForKey("itemStock") as? CLVModels.Inventory.ItemStock
        modifiedTime = aDecoder.decodeObjectForKey("modifiedTime") as? NSDate
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        hidden <- map["hidden"]
        itemGroup <- map["itemGroup"]
        name <- map["name"]
        alternateName <- map["alternateName"]
        code <- map["code"]
        sku <- map["sku"]
        price <- map["price"]
        priceType <- map["priceType"]
        defaultTaxRates <- map["defaultTaxRates"]
        unitName <- map["unitName"]
        cost <- map["cost"]
        isRevenue <- map["isRevenue"]
        stockCount <- map["stockCount"]
        taxRates <- (map["taxRates"], CLVArrayTransform<CLVModels.Inventory.TaxRate>())
        modifierGroups <- (map["modifierGroups"], CLVArrayTransform<CLVModels.Inventory.ModifierGroup>())
        categories <- (map["categories"], CLVArrayTransform<CLVModels.Inventory.Category>())
        tags <- (map["tags"], CLVArrayTransform<CLVModels.Inventory.Tag>())
        itemStock <- map["itemStock"]
        modifiedTime <- (map["modifiedTime"], CLVDateTransform())
  }
}


 
public class ItemGroup: NSObject, NSCoding, Mappable {
    /// Unique identifier
    public var id: String?
    /// Name of the option
    public var name: String?
    /// Items that are members of this group
    public var items: [CLVModels.Inventory.Item]?
    /// Attributes that belong to this group
    public var attributes: [CLVModels.Inventory.Attribute]?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(name, forKey: "name")
  aCoder.encodeObject(items, forKey: "items")
  aCoder.encodeObject(attributes, forKey: "attributes")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        items = aDecoder.decodeObjectForKey("items") as? [CLVModels.Inventory.Item]
        attributes = aDecoder.decodeObjectForKey("attributes") as? [CLVModels.Inventory.Attribute]
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        name <- map["name"]
        items <- (map["items"], CLVArrayTransform<CLVModels.Inventory.Item>())
        attributes <- (map["attributes"], CLVArrayTransform<CLVModels.Inventory.Attribute>())
  }
}


 
public class ItemModifierGroup: NSObject, NSCoding, Mappable {
    public var item: CLVModels.Inventory.Item?
    public var modifierGroup: CLVModels.Inventory.ModifierGroup?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(item, forKey: "item")
  aCoder.encodeObject(modifierGroup, forKey: "modifierGroup")
}

required public init(coder aDecoder: NSCoder) {
      item = aDecoder.decodeObjectForKey("item") as? CLVModels.Inventory.Item
        modifierGroup = aDecoder.decodeObjectForKey("modifierGroup") as? CLVModels.Inventory.ModifierGroup
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      item <- map["item"]
        modifierGroup <- map["modifierGroup"]
  }
}


 
/// The class is used to update the item stock
public class ItemStock: NSObject, NSCoding, Mappable {
    /// Reference to an item
    public var item: CLVModels.Inventory.Item?
    /// DEPRECATED: use quantity instead
    public var stockCount: Int?
    /// Current count of this item in stock
    public var quantity: Double?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(item, forKey: "item")
  aCoder.encodeObject(stockCount, forKey: "stockCount")
  aCoder.encodeObject(quantity, forKey: "quantity")
}

required public init(coder aDecoder: NSCoder) {
      item = aDecoder.decodeObjectForKey("item") as? CLVModels.Inventory.Item
        stockCount = aDecoder.decodeObjectForKey("stockCount") as? Int
        quantity = aDecoder.decodeObjectForKey("quantity") as? Double
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      item <- map["item"]
        stockCount <- map["stockCount"]
        quantity <- map["quantity"]
  }
}


 
public class Modifier: NSObject, NSCoding, Mappable {
    /// Unique identifier
    public var id: String?
    /// Name of the modifier
    public var name: String?
    /// Alternate name of the modifier
    public var alternateName: String?
    public var price: Int?
    public var modifierGroup: CLVModels.Inventory.ModifierGroup?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(name, forKey: "name")
  aCoder.encodeObject(alternateName, forKey: "alternateName")
  aCoder.encodeObject(price, forKey: "price")
  aCoder.encodeObject(modifierGroup, forKey: "modifierGroup")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        alternateName = aDecoder.decodeObjectForKey("alternateName") as? String
        price = aDecoder.decodeObjectForKey("price") as? Int
        modifierGroup = aDecoder.decodeObjectForKey("modifierGroup") as? CLVModels.Inventory.ModifierGroup
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        name <- map["name"]
        alternateName <- map["alternateName"]
        price <- map["price"]
        modifierGroup <- map["modifierGroup"]
  }
}


 
public class ModifierGroup: NSObject, NSCoding, Mappable {
    public var id: String?
    /// Name of the modifier group
    public var name: String?
    public var alternateName: String?
    public var minRequired: Int?
    public var maxAllowed: Int?
    public var showByDefault: Bool?
    public var modifiers: [CLVModels.Inventory.Modifier]?
    /// The ordered, comma-separated list of modifier ids in this group.
    public var modifierIds: String?
    public var items: [CLVModels.Inventory.Item]?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(name, forKey: "name")
  aCoder.encodeObject(alternateName, forKey: "alternateName")
  aCoder.encodeObject(minRequired, forKey: "minRequired")
  aCoder.encodeObject(maxAllowed, forKey: "maxAllowed")
  aCoder.encodeObject(showByDefault, forKey: "showByDefault")
  aCoder.encodeObject(modifiers, forKey: "modifiers")
  aCoder.encodeObject(modifierIds, forKey: "modifierIds")
  aCoder.encodeObject(items, forKey: "items")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        alternateName = aDecoder.decodeObjectForKey("alternateName") as? String
        minRequired = aDecoder.decodeObjectForKey("minRequired") as? Int
        maxAllowed = aDecoder.decodeObjectForKey("maxAllowed") as? Int
        showByDefault = aDecoder.decodeObjectForKey("showByDefault") as? Bool
        modifiers = aDecoder.decodeObjectForKey("modifiers") as? [CLVModels.Inventory.Modifier]
        modifierIds = aDecoder.decodeObjectForKey("modifierIds") as? String
        items = aDecoder.decodeObjectForKey("items") as? [CLVModels.Inventory.Item]
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        name <- map["name"]
        alternateName <- map["alternateName"]
        minRequired <- map["minRequired"]
        maxAllowed <- map["maxAllowed"]
        showByDefault <- map["showByDefault"]
        modifiers <- (map["modifiers"], CLVArrayTransform<CLVModels.Inventory.Modifier>())
        modifierIds <- map["modifierIds"]
        items <- (map["items"], CLVArrayTransform<CLVModels.Inventory.Item>())
  }
}


 
public class Option: NSObject, NSCoding, Mappable {
    /// Unique identifier
    public var id: String?
    /// Name of the option
    public var name: String?
    public var attribute: CLVModels.Inventory.Attribute?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(name, forKey: "name")
  aCoder.encodeObject(attribute, forKey: "attribute")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        attribute = aDecoder.decodeObjectForKey("attribute") as? CLVModels.Inventory.Attribute
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        name <- map["name"]
        attribute <- map["attribute"]
  }
}


 
/// This class represents the association between an item and an option
public class OptionItem: NSObject, NSCoding, Mappable {
    /// Reference to an option
    public var option: CLVModels.Inventory.Option?
    /// Reference to an item
    public var item: CLVModels.Inventory.Item?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(option, forKey: "option")
  aCoder.encodeObject(item, forKey: "item")
}

required public init(coder aDecoder: NSCoder) {
      option = aDecoder.decodeObjectForKey("option") as? CLVModels.Inventory.Option
        item = aDecoder.decodeObjectForKey("item") as? CLVModels.Inventory.Item
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      option <- map["option"]
        item <- map["item"]
  }
}


 
public enum PriceType: String {
  case FIXED
  case VARIABLE
  case PER_UNIT
}


 
public class Tag: NSObject, NSCoding, Mappable {
    /// Unique identifier
    public var id: String?
    /// Tag name
    public var name: String?
    /// Items associated with this tag
    public var items: [CLVModels.Inventory.Item]?
    /// Printers associated with this tag
    public var printers: [CLVModels.Printer.Printer]?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(name, forKey: "name")
  aCoder.encodeObject(items, forKey: "items")
  aCoder.encodeObject(printers, forKey: "printers")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        items = aDecoder.decodeObjectForKey("items") as? [CLVModels.Inventory.Item]
        printers = aDecoder.decodeObjectForKey("printers") as? [CLVModels.Printer.Printer]
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        name <- map["name"]
        items <- (map["items"], CLVArrayTransform<CLVModels.Inventory.Item>())
        printers <- (map["printers"], CLVArrayTransform<CLVModels.Printer.Printer>())
  }
}


 
public class TagItem: NSObject, NSCoding, Mappable {
    public var tag: CLVModels.Inventory.Tag?
    public var item: CLVModels.Inventory.Item?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(tag, forKey: "tag")
  aCoder.encodeObject(item, forKey: "item")
}

required public init(coder aDecoder: NSCoder) {
      tag = aDecoder.decodeObjectForKey("tag") as? CLVModels.Inventory.Tag
        item = aDecoder.decodeObjectForKey("item") as? CLVModels.Inventory.Item
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      tag <- map["tag"]
        item <- map["item"]
  }
}


 
public class TagPrinter: NSObject, NSCoding, Mappable {
    public var tag: CLVModels.Inventory.Tag?
    public var printer: CLVModels.Printer.Printer?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(tag, forKey: "tag")
  aCoder.encodeObject(printer, forKey: "printer")
}

required public init(coder aDecoder: NSCoder) {
      tag = aDecoder.decodeObjectForKey("tag") as? CLVModels.Inventory.Tag
        printer = aDecoder.decodeObjectForKey("printer") as? CLVModels.Printer.Printer
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      tag <- map["tag"]
        printer <- map["printer"]
  }
}


 
public class TaxRate: NSObject, NSCoding, Mappable {
    public var id: String?
    /// The line item with which the tax rate is associated
    public var lineItemRef: CLVModels.Order.LineItem?
    public var name: String?
    public var rate: Int?
    public var isDefault: Bool?
    /// Items associated with this tax rate
    public var items: [CLVModels.Inventory.Item]?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(id, forKey: "id")
  aCoder.encodeObject(lineItemRef, forKey: "lineItemRef")
  aCoder.encodeObject(name, forKey: "name")
  aCoder.encodeObject(rate, forKey: "rate")
  aCoder.encodeObject(isDefault, forKey: "isDefault")
  aCoder.encodeObject(items, forKey: "items")
}

required public init(coder aDecoder: NSCoder) {
      id = aDecoder.decodeObjectForKey("id") as? String
        lineItemRef = aDecoder.decodeObjectForKey("lineItemRef") as? CLVModels.Order.LineItem
        name = aDecoder.decodeObjectForKey("name") as? String
        rate = aDecoder.decodeObjectForKey("rate") as? Int
        isDefault = aDecoder.decodeObjectForKey("isDefault") as? Bool
        items = aDecoder.decodeObjectForKey("items") as? [CLVModels.Inventory.Item]
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      id <- map["id"]
        lineItemRef <- map["lineItemRef"]
        name <- map["name"]
        rate <- map["rate"]
        isDefault <- map["isDefault"]
        items <- (map["items"], CLVArrayTransform<CLVModels.Inventory.Item>())
  }
}


 
public class TaxRateItem: NSObject, NSCoding, Mappable {
    public var taxRate: CLVModels.Inventory.TaxRate?
    public var item: CLVModels.Inventory.Item?

public func encodeWithCoder(aCoder: NSCoder) {
  aCoder.encodeObject(taxRate, forKey: "taxRate")
  aCoder.encodeObject(item, forKey: "item")
}

required public init(coder aDecoder: NSCoder) {
      taxRate = aDecoder.decodeObjectForKey("taxRate") as? CLVModels.Inventory.TaxRate
        item = aDecoder.decodeObjectForKey("item") as? CLVModels.Inventory.Item
  }

override public init() {}

// Mappable

required public init?(_ map: Map) {}

public func mapping(map: Map) {
      taxRate <- map["taxRate"]
        item <- map["item"]
  }
}

}
}
