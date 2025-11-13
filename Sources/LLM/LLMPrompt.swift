//
//  LLMPrompt.swift
//  Dietary
//
//  Created by Umang Chouhan on 14/11/25.
//
import Foundation

protocol LLMPrompt {
    associatedType LLMResponse: Codable
    func build() -> LLMResponse
}

extension LLMPrompt {
    func toJSON<T: Codable>(prettyPrinted: Bool = true) async throws -> String {
        try await Task.detached { () -> String in
            let encoder = JSONEncoder()
            if prettyPrinted {
                encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
            }
            let data = try encoder.encode(self)
            guard let s = String(data: data, encoding: .utf8) else {
                throw FoodItemJSONError.stringEncodingFailed
            }
            return s
        }.value
    }

    /// Decodes a `FoodItem` from JSON string.
    static func fromJSON(_ json: String) async throws -> FoodItem {
        try await Task.detached {
            guard let data = json.data(using: .utf8) else {
                throw FoodItemJSONError.invalidJSONString
            }
            let decoder = JSONDecoder()
            return try decoder.decode(FoodItem.self, from: data)
        }.value
    }
}


protocol FoodLLMPrompt: LLMPromt {
    let deficiencies: [DeficiencyContext] {get}
    let activePlanNames: [String] {get}
    let restrictions: Restrictions {get}
    let budget: Budget? {get}
    let userRecommendation: String? {get} // User's free-text request
}

private let jsonEncoder: JSONEncoder = {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    encoder.keyEncodingStrategy = .convertToSnakeCase
    return encoder
}()

/// Safely serializes any Codable object to a JSON string.
private func jsonString<T: Encodable>(from value: T) -> String {
    do {
        let data = try jsonEncoder.encode(value)
        return String(data: data, encoding: .utf8) ?? "{}"
    } catch {
        return "{ \"error\": \"Failed to encode JSON\" }"
    }
}
