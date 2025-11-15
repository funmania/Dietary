import Testing
import Foundation
@testable import Dietary

@Test func example() async throws {
    let foodScheme = FoodItem.schema
    let encoder = JSONEncoder()
    let schemaData = try! encoder.encode(foodScheme.definition())
    let string = String(data: schemaData, encoding: .utf8)!
    print(string)
    //print(foodScheme)
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
}
