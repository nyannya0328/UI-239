//
//  Home.swift
//  UI-239(iOS)
//
//  Created by にゃんにゃん丸 on 2021/06/17.
//

extension View{
    
    func getRect()->CGRect{
        
        #if os(macOS)
        return NSScreen.main!.visibleFrame
        
        #else
        return UIScreen.main.bounds
        
    
        #endif
    }
    
    func isMacOS()->Bool{
        
        #if os(iOS)
        
        return false
        
        #else
        return true
        
        #endif
        
        
        
    }
    
    
}

import SwiftUI

struct Home: View {
    @State var selected = "Home"
    @State var show = false
    var body: some View {
        AdtaptableStack(shoMenu: $show) {
            
            MainContent(show: $show)
            
        } slideView: {
            
            SlideMenu(selected: $selected)
            
        } menuView: {
            SlideView()
        }

       
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


struct AdtaptableStack<Content : View,SlideView : View,MenuView : View> : View {
    
    
    var content : Content
    var slideView : SlideView
    var menuView : MenuView
    
    @Binding var showMenu : Bool
    
    init(shoMenu : Binding<Bool>,@ViewBuilder content : @escaping()->Content,@ViewBuilder slideView : @escaping()->SlideView,@ViewBuilder menuView : @escaping()->MenuView) {
        self._showMenu = shoMenu
        self.content = content()
        self.slideView = slideView()
        self.menuView = menuView()
    }
    
    
    var body: some View{
        
        
        ZStack{
            
            #if os(iOS)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack{
                    
                    content
                    
                 menuView
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                 
                }
                
                
            }
            .background(Color("gray").ignoresSafeArea())
            .overlay(
            slideView
                .clipped()
                .frame(width: getRect().width / 1.6)
               
                .background(Color("gray").ignoresSafeArea())
                .offset(x: showMenu ? 0 : -getRect().width)
                .frame(maxWidth: .infinity,alignment: .leading)
                .background(
                
                    Color.black
                    
                        .opacity(showMenu ? 0.35 : 0)
                        .onTapGesture {
                            showMenu.toggle()
                        }
                
                )
            
            )
            
            #else
            
            HStack{
                
                
                slideView
                    .frame(width: 210)
                    .background(Color("gray").ignoresSafeArea())
                
                content
                
             
                
                menuView
                
                
            }
            
            .frame(width: getRect().width / 1.5, height: getRect().height - 100, alignment: .leading)
            .buttonStyle(PlainButtonStyle())
            .textFieldStyle(PlainTextFieldStyle())
            .background(Color.white.ignoresSafeArea())
            
            #endif
            
            
            
        }
        
        .colorScheme(.light)
      
        
    }
}
