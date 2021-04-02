/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */


import Foundation

extension CLVModels.Remotemessage {

    public class TextPrintMessage: Codable {

        /// The superClass
        public var _meta_superclass: CLVModels.Remotemessage.Message?
        /// initialization for the type
        public var _meta_init_method: CLVModels.Remotemessage.Method?
        public var textLines: [String]?
        /// External print job ID assigned to this request
        public var externalPrintJobId: String?
        /// Printer to which the print job should be routed.
        public var printer: CLVModels.Printer.Printer?

        public var decodeError:[Swift.Error] = [Swift.Error]()

        enum CodingKeys: CodingKey {
            case _meta_superclass
            case _meta_init_method
            case textLines
            case externalPrintJobId
            case printer
        }

        public init() {}

        required public init(from decoder: Decoder) throws {
            let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self._meta_superclass = try rootContainer.decodeIfPresent(CLVModels.Remotemessage.Message.self, forKey: ._meta_superclass)
            } catch {
                decodeError.append(error)
            }
            do {
                self._meta_init_method = try rootContainer.decodeIfPresent(CLVModels.Remotemessage.Method.self, forKey: ._meta_init_method)
            } catch {
                decodeError.append(error)
            }
            if (rootContainer.contains(.textLines)) {
                do {
                    let textLinesContainer = try rootContainer.nestedContainer(keyedBy: CLVModels.ElementsKey.self, forKey: .textLines)
                    self.textLines = try textLinesContainer.decodeIfPresent([String].self, forKey: .elements)
                } catch {
                    decodeError.append(error)
                }
            }
            do {
                self.externalPrintJobId = try rootContainer.decodeIfPresent(String.self, forKey: .externalPrintJobId)
            } catch {
                decodeError.append(error)
            }
            do {
                self.printer = try rootContainer.decodeIfPresent(CLVModels.Printer.Printer.self, forKey: .printer)
            } catch {
                decodeError.append(error)
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            if (_meta_superclass != nil) { try container.encode(_meta_superclass, forKey: ._meta_superclass) }
            if (_meta_init_method != nil) { try container.encode(_meta_init_method, forKey: ._meta_init_method) }
            if (textLines != nil) { try container.encode(textLines, forKey: .textLines) }
            if (externalPrintJobId != nil) { try container.encode(externalPrintJobId, forKey: .externalPrintJobId) }
            if (printer != nil) { try container.encode(printer, forKey: .printer) }
        }
    }

}