//
//  SlideMenu.swift
//  UI-239(iOS)
//
//  Created by にゃんにゃん丸 on 2021/06/17.
//

import SwiftUI

struct SlideMenu: View {
    @Binding var selected : String
    @Namespace var animation
    
    var body: some View {
        VStack{
            
            HStack{
                
                
                Text("Files")
                    .font(.title2.bold())
                    .foregroundColor(.black)
                    .kerning(1.5)
                
                
                Text("GO")
                    .font(.title2.italic())
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color("blue"))
                    .clipShape(Circle())
                
                
                
                
                
                
            }
            .padding(.top,5)
            
            Divider()
                .background(Color.gray.opacity(0.3))
            
            HStack(spacing:15){
                
                Image("pic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                
                
                
                Text("HI!")
                    .font(.title.bold())
                    .foregroundColor(.blue)
                    
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing:15){
           
                
                TabButton(title: "Home", image: "house.fill", selected: $selected, animation: animation)
                
                TabButton(title: "Shared File", image: "folder.fill.badge.person.crop", selected: $selected, animation: animation)
                
                TabButton(title: "Star", image: "star", selected: $selected, animation: animation)
                
                TabButton(title: "Settings", image: "waveform.path.ecg.rectangle.fill", selected: $selected, animation: animation)
                
                TabButton(title: "Log OUT", image: "house.fill", selected: .constant(""), animation: animation)
                
               
            
            }
            .padding(.leading,10)
            .offset(x: 10)
            .padding(.top,10)
            
            
            
            
        }
        .frame(width: 220)
        .frame(maxHeight: .infinity, alignment: .top)
        .background(Color("gray").ignoresSafeArea())
    }
}

struct SlideMenu_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
}

struct TabButton : View {
    var title : String
    var image : String
    @Binding var selected : String
    var animation : Namespace.ID
    
    var body: some View{
        
        Button(action: {
            
            
            withAnimation{
                
                selected = title
            }
        }, label: {
            HStack(spacing:15){
                
                Image(systemName: image)
                    .font(.title)
                    .foregroundColor(selected == title ? .blue : .gray)
                
                Text(title)
                    .font(.title2.italic())
                    .foregroundColor(.gray)
                
                
                
            }
            .padding(.vertical,20)
            .padding(.horizontal,20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
            
                ZStack{
                    
                    if selected == title{
                        
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.white)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                        
                    }
                    
                    else{
                        
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.clear)
                        
                        
                    }
                    
                    
                    
                }
            )
            .contentShape(Rectangle())
            
        })
        
        
    }
}
