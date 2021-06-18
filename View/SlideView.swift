//
//  SlideView.swift
//  UI-239(iOS)
//
//  Created by にゃんにゃん丸 on 2021/06/18.
//

import SwiftUI

struct SlideView: View {
    var body: some View {
        VStack{
            
            Text("STORAGE")
                .font(.largeTitle.italic())
                .foregroundColor(.black)
                .kerning(1.3)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            
            
            VStack{
                
                ZStack{
                    
                    Circle()
                        .stroke(Color.gray,lineWidth: 20)
                    
                    
                    Circle()
                        .trim(from: 0, to: 0.8)
                        .stroke(Color.red,lineWidth: 20)
                        .rotationEffect(.init(degrees: -90))
                    
                    
                    VStack{
                        
                        Text("70%")
                            .font(.title3.bold())
                            .foregroundColor(.black)
                        
                        Text("USED")
                            .font(.footnote.weight(.light))
                            .foregroundColor(.black)
                            
                    }
                    
                    
                    
                }
                .frame(width: 150, height: 170)
            }
            .padding(.vertical,20)
            .padding(.horizontal)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: .red, radius: 5, x: 5, y: 5)
            .shadow(color: .red, radius: 5, x: -5, y: -5)
            .padding([.horizontal,.top])
            
            
            HStack(spacing:10){
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text("Total Space")
                        .font(.caption.weight(.semibold))
                        .foregroundColor(.black)
                        Text("256GB")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                     
                    
                }
                
                Divider()
                    .frame(width: 10, height: 70)
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text("Used Space")
                        .font(.caption.weight(.semibold))
                        .foregroundColor(.black)
                        Text("80GB")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                     
                    
                }
                
                
                
                
            }
            .padding(.horizontal)
            .padding(.top)
            
            
            
            
                
            
            
            
            
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .frame(width: 250)
        .background(Color("gray").ignoresSafeArea())
    }
}

struct SlideView_Previews: PreviewProvider {
    static var previews: some View {
        SlideView()
    }
}
