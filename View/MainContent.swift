//
//  MainContent.swift
//  UI-239(iOS)
//
//  Created by にゃんにゃん丸 on 2021/06/17.
//

import SwiftUI

struct MainContent: View {
    @State var txt = ""
    @Binding var show : Bool
    var body: some View {
        VStack{
            
            HStack{
                
                if !isMacOS(){
                    
                    Button(action: {
                        
                        withAnimation{
                            
                            show.toggle()
                        }
                        
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .font(.title.bold())
                            .foregroundColor(.black)
                        
                        
                    }
                    
                }
                
                Text("DASH BOARD")
                    .font(.title.weight(.heavy))
                    .foregroundColor(.black)
                
                
                Spacer()
                
                if isMacOS(){
                    
                    
                    CustomSearchBar(txt: $txt)
                        .frame(width: 300)
                    
                }
                
                
                
              
                
                
                
            }
            .padding(isMacOS() ? 10 : 0)
            
            
            if !isMacOS(){
                
                CustomSearchBar(txt: $txt)
                    .padding()
                    
                
            }
            
            ZStack{
                
                if isMacOS(){
                    
                    ScrollView(.vertical, showsIndicators: false, content: {
                        
                       BodyContent()
                        
                        
                        
                    })
                    
                    
                }
                
                else{
                    
                    BodyContent()
                }
                
                
                
            }
            
            
            
          
            
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(10)
            .background(Color("gray"))
            .cornerRadius(isMacOS() ? 10 : 0)
            
            
            
            
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct MainContent_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
}

struct BodyContent : View {
    var body: some View{
        
        VStack{
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing:30){
                    
                    
                    StoRageView(title: "Drop Box", image: "dropbox", precentage: 0.6)
                    
                    StoRageView(title: "Google Drive", image: "google-drive", precentage: 0.25)
                    
                    StoRageView(title: "iCloud Drive", image: "icloud", precentage: 0.5)
                    
                }
                .padding(.top,10)
            })
            
            
            Text("Quick Access")
                .font(.title.bold())
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading,5)
            
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                
                HStack{
                    
                    
                    AccessButton(image: "photo", title: "Pictures", color: .yellow)
                    
                    AccessButton(image: "music.note.house.fill", title: "Music", color: .red)
                    
                    AccessButton(image: "play.rectangle.fill", title: "Videos", color: .green)
                    
                    AccessButton(image: "square.grid.2x2.fill", title: "Apps", color: .blue)
                    
                    AccessButton(image: "doc.fill", title: "Documents", color: .purple)
                    
                    AccessButton(image: "arrow.down.app.fill", title: "Download", color: .pink)
                    
                   
                    
                    
                }
                .padding(.top)
                
                
            })
            
            Text("Recent Files")
                .font(.title.bold())
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading,5)
            
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack{
                    
                    VStack{
                        
                        
                        HStack(spacing:15){
                            
                            
                            Text("NAME")
                            
                                .font(.caption.weight(.light))
                                .foregroundColor(.gray)
                            
                            
                        Spacer()
                            
                            
                            Text("SIZE")
                                .font(.footnote.italic())
                                .foregroundColor(.black)
                            
                            
                        }
                        
                        Divider()
                            .background(Color.green)
                        
                        
                        
                        VStack(spacing:15){
                            
                            FilesView(image: "photo", title: "Photo", day: "2010/1/1", mb: "15MB")
                            
                            FilesView(image: "play.rectangle.fill", title: "PLAY", day: "1930/5/5", mb: "15MB")
                            
                            FilesView(image: "gear", title: "SETTING", day: "2014/5/6", mb: "15MB")
                            
                            FilesView(image: "timelapse", title: "LAP", day: "1988/5/6", mb: "15MB")
                            
                            FilesView(image: "hands.clap", title: "GRAT", day: "1230/6/5", mb: "15MB")
                        }
                        
                        
                    }
                    .padding()
                    .frame(width: 250)
                    .background(Color.white)
                    .cornerRadius(isMacOS() ? 10 : 0)
                    .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
                    .shadow(color: .black.opacity(0.3), radius: 5, x: -5, y: 5)
                    
                    
                    
                }
                .padding(.top)
            })
            
            
            
            
        }
        .padding(isMacOS() ? 15 : 0)
    }
}

struct CustomSearchBar : View {
    @Binding var txt : String
    
    var body: some View{
        
        HStack{
            
            TextField("SERACH", text: $txt)
            
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName:"magnifyingglass.circle.fill")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color("blue"))
                    .cornerRadius(10)
            })
            
        }
        .padding(.leading,10)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
        .shadow(color: .black.opacity(0.3), radius: 5, x: -5, y: -5)
       
    }
}


struct StoRageView: View {
    var title :String
    var image : String
    var precentage : CGFloat
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            
            HStack{
                
                
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                
                
                Divider()
                    .background(Color.gray)
                
                
                ZStack{
                    
                    
                    Circle()
                        .stroke(Color.gray,lineWidth: 8)
                    
                    Circle()
                        .trim(from: 0, to: precentage)
                        .stroke(Color("blue"),style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                        .rotationEffect(.init(degrees: -90))
                    
                    
                    Text("\(Int(precentage * 100))%")
                    
                    
                }
                .frame(width: 50, height: 50)
            }
            
            
            Text(title)
                .font(.title.weight(.heavy))
                .foregroundColor(.black)
            
            Text("143GB / 150GB")
                .font(.title2.italic())
                .foregroundColor(.blue)
            
        })
    }
}

struct AccessButton: View {
    var image : String
    var title : String
    var color : Color
    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            
            VStack(spacing:12){
                
                
                Image(systemName: image)
                    .font(.title)
                    .foregroundColor(color)
                    .frame(width: 50, height: 50)
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(color: .black, radius: 10, x: 0, y: 0)
                
                Text(title)
                    .font(.caption2.bold())
                    .kerning(1.5)
                    .foregroundColor(.black)
                
            }
            .frame(width: isMacOS() ? 80 : 100)
            
        })
    }
}

struct FilesView: View {
    var image : String
    var title : String
    var day : String
    var mb : String
    var body: some View {
        HStack(spacing:15){
            
            Image(systemName: image)
                .font(.title)
                .foregroundColor(image == "photo" ? .yellow : .green)
                .padding(6)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black.opacity(0.3))
                    
                )
            
            VStack(alignment: .leading, spacing: 5, content: {
                Text("A")
                    
                    .foregroundColor(.black)
                
                
                Text(day)
                    .font(.footnote.bold())
                    .foregroundColor(.accentColor)
            })
            
            Spacer(minLength: 0)
            
            
            Text(mb)
                .font(.caption)
            
            
        }
    }
}
