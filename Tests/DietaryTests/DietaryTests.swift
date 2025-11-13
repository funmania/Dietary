import Testing
@testable import Dietary

@Test func example() async throws {
    let foodScheme = FoodItem.jsonSchema()
    print(foodScheme)
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
}
