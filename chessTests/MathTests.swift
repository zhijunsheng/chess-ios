import XCTest
class MathTests: XCTestCase {
    func testMath() {
        for pN in 10000...24999 {
            let pn1 = pN % 10
            let pn2 = pN % 100 / 10
            let pn3 = pN % 1000 / 100
            let pk1 = pN % 10000 / 1000
            let pk2 = pN / 10000
            let pNS = pk2 + pk1 * 10 + pn3 * 100 + pn2 * 1000 + pn1 * 10000
            if pN * 4 == pNS {
                print("\(pN) * 4 = \(pNS)")
            }
        }
    }
}
