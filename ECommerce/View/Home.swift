import SwiftUI

struct Home: View {
    
    @State var size  = "Medium"
    @State var currentTab = "All"
    
    @State var items = [
        Item(image: "table", name: "Table AA1", description: "This is a table, duh? Buy it or not, suit yourself", price: 30000),
        Item(image: "lamp", name: "Lamp AA1", description: "This is a lamp. Light bulb not included!", price: 10000),
        Item(image: "chair", name: "Chair AA1", description: "This is a chair, simple!", price: 25000)
    ]
    
    @GestureState var isDragging = false
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {}){
                    Image(systemName: "line.horizontal.3.decrease")
                        .font(.title)
                        .foregroundColor(.black)
                    
                    
                }
                
                Spacer()
                
                Button(action: {}){
                    Image(systemName: "cart")
                        .font(.title)
                        .foregroundColor(.black)
                        .overlay(
                            //Cart count
                            Text("1")
                                .font(.caption)
                                .foregroundColor(.white)
                                .fontWeight(.heavy)
                                .frame(width: 20, height: 20)
                                .background(Color("navy"))
                                .clipShape(Circle())
                                .offset(x: 15, y: -22)
                        )
                }
            }
            .padding(.horizontal)
            .padding(.top)
            .padding(.bottom, 10)
            
            ScrollView(){
                VStack{
                    //Banner
                    HStack{
                        VStack(alignment: .leading, spacing : 8){
                            Text("Furniture in Unique Style")
                                .fontWeight(.heavy)
                                .font(.title)
                                .foregroundColor(.black)
                            
                            Text("We have wide range of Furniture")
                                .font(.caption)
                                .foregroundColor(.gray)
                                .fontWeight(.bold)
                        }
                        
                        Spacer(minLength: 15)
                        
                        Menu(content:{
                            Button(action:{size = "Small"}){
                                Text("Small")
                            }
                            
                            Button(action:{size = "Medium"}){
                                Text("Medium")
                            }
                            
                            Button(action:{size = "Large"}){
                                Text("Large")
                            }
                            
                        }){
                            Label(title: {
                                Text(size)
                                    .foregroundColor(.white)
                            }){
                                Image(systemName: "slider.vertical.3")
                                    .foregroundColor(.white)
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(Color("navy"))
                            .clipShape(Capsule())
                        }
                    }
                    .padding()
                    
                    //Tab bar
                    HStack{
                        ForEach(tabs, id:\.self){ tab in
                            Button(action:{currentTab = tab}){
                                Text(tab)
                                    .fontWeight(.bold)
                                    .foregroundColor(currentTab == tab ? .black : .gray)
                            }
                            if(tab != tabs.last){
                                Spacer(minLength: 0)
                            }
                        }
                    }.padding()
                    .padding(.horizontal, 10)
                    
                    //Items list
                    ForEach(items.indices){ index in
                        ZStack{
                            
                            Color("navy")
                                .cornerRadius(20)
                            
                            Color("dark_navy")
                                .cornerRadius(20)
                                .padding(.trailing, 65)
                            
                            HStack{
                                Spacer()
                                
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Image(systemName: "heart.fill")
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .frame(width: 65)
                                })
                                
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Image(systemName: "cart.fill")
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .frame(width: 65)
                                })
                            }
                            
                            ItemView(item: items[index])
                                .offset(x: items[index].offset)
                                .gesture(DragGesture()
                                            .onChanged({ (value) in
                                                onChange(value: value, index: index)
                                            })
                                            .updating($isDragging, body: {
                                                (value, state, _) in
                                                
                                                state = true
                                                onChange(value: value, index: index)
                                            })
                                            .onEnded({ (value) in
                                                onEnded(value: value, index: index)
                                            }))
                                
                        }
                        .padding(.horizontal)
                        .padding(.top)
                    }
                }
                .padding(.bottom, 100)
            }
        }
    }
    
    func onChange(value : DragGesture.Value, index: Int){
        if value.translation.width < 0 && isDragging {
            items[index].offset = value.translation.width
        }
    }
    
    func onEnded(value: DragGesture.Value, index: Int) -> Void {
        withAnimation{
            
            if -value.translation.width >= 100{
                items[index].offset = -130
            }
            else{
                items[index].offset = 0
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

var tabs = ["Tables", "Lamps", "Chairs", "All"]
