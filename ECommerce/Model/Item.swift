import SwiftUI

struct Item : Identifiable{
    
    var id = UUID().uuidString
    var image : String
    var name : String
    var description : String
    var price : Float
    var offset : CGFloat = 0
}
