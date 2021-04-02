/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Merchant {

    public class MerchantPlanGroup: Codable {

        /// Unique identifier
        public var id: String?
        /// The name of the plan group
        public var name: String?
        /// If true then merchant in group cannot change their plan.
        public var enforceAssignment: Bool?
        /// Flag to control if this plan group can be linked to other plans and if the plans in this group are able to be linked to other groups
        public var linkable: Bool?
        /// Free trial period, if offered, to be applied to plans in this group.
        public var trialDays: Int64?
        /// Transient reference to associated reseller when in context of a reseller hiearchy.
        public var reseller: CLVModels.Base.Reference?
        /// Date/time this group was deleted.
        public var deletedTime: Date?
        /// Date/time this group was created.
        public var createdTime: Date?
        /// Date/time this group was last modified.
        public var modifiedTime: Date?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case id
            case name
            case enforceAssignment
            case linkable
            case trialDays
            case reseller
            case deletedTime
            case createdTime
            case modifiedTime
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
                self.name = try rootContainer.decodeIfPresent(String.self, forKey: .name)
            } catch {
                decodeError.append(error)
            }
            do {
                self.enforceAssignment = try rootContainer.decodeIfPresent(Bool.self, forKey: .enforceAssignment)
            } catch {
                decodeError.append(error)
            }
            do {
                self.linkable = try rootContainer.decodeIfPresent(Bool.self, forKey: .linkable)
            } catch {
                decodeError.append(error)
            }
            do {
                self.trialDays = try rootContainer.decodeIfPresent(Int64.self, forKey: .trialDays)
            } catch {
                decodeError.append(error)
            }
            do {
                self.reseller = try rootContainer.decodeIfPresent(CLVModels.Base.Reference.self, forKey: .reseller)
            } catch {
                decodeError.append(error)
            }
            do {
                self.deletedTime = try rootContainer.decodeIfPresent(Date.self, forKey: .deletedTime)
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
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (id != nil) { try container.encode(id, forKey: .id) }
            if (name != nil) { try container.encode(name, forKey: .name) }
            if (enforceAssignment != nil) { try container.encode(enforceAssignment, forKey: .enforceAssignment) }
            if (linkable != nil) { try container.encode(linkable, forKey: .linkable) }
            if (trialDays != nil) { try container.encode(trialDays, forKey: .trialDays) }
            if (reseller != nil) { try container.encode(reseller, forKey: .reseller) }
            if (deletedTime != nil) { try container.encode(deletedTime, forKey: .deletedTime) }
            if (createdTime != nil) { try container.encode(createdTime, forKey: .createdTime) }
            if (modifiedTime != nil) { try container.encode(modifiedTime, forKey: .modifiedTime) }
        }
    }

}