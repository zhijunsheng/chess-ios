import Foundation
struct GameRules: CustomStringConvertible {
    
    /*
    0 1 2 3 4 5 6 7
  0 . . . . . . . .
  1 . . . . . . . .
  2 . . . . . . . .
  3 . . . . . . . .
  4 . . . . . . . .
  5 . . . . . . . .
  6 . . . . . . . .
  7 . . . . . . . .
     
 
    */

    
    var description: String {
        var desc = ""
        desc += "  0 1 2 3 4 5 6 7"
        for h in 0..<8 {
            desc += "\n"
            desc += "\(h)"
            for i in 0..<8 {
                desc += " ."
            }
        }
        
       
        return desc
    }
}
