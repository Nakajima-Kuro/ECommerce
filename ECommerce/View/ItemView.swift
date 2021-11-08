import SwiftUI

struct ItemView: View {
    
    var item : Item
    
    var body: some View {
        HStack{
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width/3.2)
            
            VStack(alignment: .leading, spacing: 10){
                
                Spacer()
                
                Text(item.name)
                    .fontWeight(.heavy)
                
                Text(item.description)
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                
                Text(String(item.price))
                    .fontWeight(.bold)
                
                Spacer(minLength: 0)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.08), radius: 5, x: 5, y: 5 )
        .shadow(color: Color.black.opacity(0.08), radius: 5, x: -5, y: -5 )
    }
}
