/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Inventory {

    public class MenuSection: Codable {

        /// Item_layout id
        public var id: String?
        /// Reference to a category
        public var category: CLVModels.Base.Reference?
        /// Reference to the merchant that created the item layout
        public var merchantRef: CLVModels.Base.Reference?
        /// Items included in the category
        public var items: String?
        /// List of menu item records
        public var itemList: [CLVModels.Inventory.MenuItem]?
        /// Customer facing item layout name
        public var name: String?
        /// Item layout description
        public var description_: String?
        /// Item layout image file path
        public var imageFilename: String?
        /// Section enabled for menu
        public var enabled: Bool?
        /// Reason for being filtered out
        public var reasonCode: String?
        /// If the menu section has been filtered by the filter microservice.
        public var filtered: Bool?
        /// Timestamp when the menu section was created
        public var createdTime: Date?
        /// Timestamp when the menu section was last modified
        public var modifiedTime: Date?
        /// Timestamp when the menu section was last deleted
        public var deletedTime: Date?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case id
            case category
            case merchantRef
            case items
            case itemList
            case name
            case description
            case imageFilename
            case enabled
            case reasonCode
            case filtered
            case createdTime
            case modifiedTime
            case deletedTime
        }

        public init() {}

        required public init(from decoder: Decoder) throws {
            let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self.id = try rootContainer.decodeIfPresent(String.self, forKey: .id)
            } catch {
                decodeError.append(error)
            }
            do {
                self.category = try rootContainer.decodeIfPresent(CLVModels.Base.Reference.self, forKey: .category)
            } catch {
                decodeError.append(error)
            }
            do {
                self.merchantRef = try rootContainer.decodeIfPresent(CLVModels.Base.Reference.self, forKey: .merchantRef)
            } catch {
                decodeError.append(error)
            }
            do {
                self.items = try rootContainer.decodeIfPresent(String.self, forKey: .items)
            } catch {
                decodeError.append(error)
            }
            if (rootContainer.contains(.itemList)) {
                do {
                    let itemListContainer = try rootContainer.nestedContainer(keyedBy: CLVModels.ElementsKey.self, forKey: .itemList)
                    self.itemList = try itemListContainer.decodeIfPresent([CLVModels.Inventory.MenuItem].self, forKey: .elements)
                } catch {
                    decodeError.append(error)
                }
            }
            do {
                self.name = try rootContainer.decodeIfPresent(String.self, forKey: .name)
            } catch {
                decodeError.append(error)
            }
            do {
                self.description_ = try rootContainer.decodeIfPresent(String.self, forKey: .description)
            } catch {
                decodeError.append(error)
            }
            do {
                self.imageFilename = try rootContainer.decodeIfPresent(String.self, forKey: .imageFilename)
            } catch {
                decodeError.append(error)
            }
            do {
                self.enabled = try rootContainer.decodeIfPresent(Bool.self, forKey: .enabled)
            } catch {
                decodeError.append(error)
            }
            do {
                self.reasonCode = try rootContainer.decodeIfPresent(String.self, forKey: .reasonCode)
            } catch {
                decodeError.append(error)
            }
            do {
                self.filtered = try rootContainer.decodeIfPresent(Bool.self, forKey: .filtered)
            } catch {
                decodeError.append(error)
            }
            do {
                self.createdTime = try rootContainer.decodeIfPresent(Date.self, forKey: .createdTime)
            } catch {
                decodeError.append(error)
            }
            do {
                self.modifiedTime = try rootContainer.decodeIfPresent(Date.self, forKey: .modifiedTime)
            } catch {
                decodeError.append(error)
            }
            do {
                self.deletedTime = try rootContainer.decodeIfPresent(Date.self, forKey: .deletedTime)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (id != nil) { try container.encode(id, forKey: .id) }
            if (category != nil) { try container.encode(category, forKey: .category) }
            if (merchantRef != nil) { try container.encode(merchantRef, forKey: .merchantRef) }
            if (items != nil) { try container.encode(items, forKey: .items) }
            if (itemList != nil) { try container.encode(itemList, forKey: .itemList) }
            if (name != nil) { try container.encode(name, forKey: .name) }
            if (description_ != nil) { try container.encode(description_, forKey: .description) }
            if (imageFilename != nil) { try container.encode(imageFilename, forKey: .imageFilename) }
            if (enabled != nil) { try container.encode(enabled, forKey: .enabled) }
            if (reasonCode != nil) { try container.encode(reasonCode, forKey: .reasonCode) }
            if (filtered != nil) { try container.encode(filtered, forKey: .filtered) }
            if (createdTime != nil) { try container.encode(createdTime, forKey: .createdTime) }
            if (modifiedTime != nil) { try container.encode(modifiedTime, forKey: .modifiedTime) }
            if (deletedTime != nil) { try container.encode(deletedTime, forKey: .deletedTime) }
        }
    }

}