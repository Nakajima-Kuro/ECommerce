import SwiftUI

struct TabBar: View {
    @State var current = "Home"
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom )){
            TabView(selection: $current){
                Home()
                    .tag("Home")
                Text("Message")
                    .tag("Message")
                Text("Account")
                    .tag("Account")
            }
            
            HStack(spacing : 0){
                //Tab button
                TabButton(title: "Home", image: "house" , selected: $current)
                
                Spacer(minLength: 0)
                
                TabButton(title: "Message", image: "message" , selected: $current)
                
                Spacer(minLength: 0)
                
                TabButton(title: "Acount", image: "person.crop.circle" , selected: $current)
            }
            .padding(.vertical, 12)
            .padding(.horizontal)
            .background(Color("navy"))
            .clipShape(Capsule())
            .padding(.horizontal, 25)
        }
    }
}
