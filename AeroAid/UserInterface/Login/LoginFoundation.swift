//
//  Login.swift
//  AeroAid
//
//  Created by Tyree Franklin JR on 2/16/25.
//
import SwiftUI


import SwiftUI

struct LoginFoundation: View {
    var body: some View {

        //Geometry reader function for unique image sizing
        GeometryReader { geometry in
            HStack {
                //Login Background
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: geometry.size.width / 2)
                    .ignoresSafeArea(.all)
                //Background Image
                Image("loginbackground")
                    .resizable()
                    .modifier(AspectRatioModifier(geometry: geometry))
                    .ignoresSafeArea(.all)
                    .frame(width: geometry.size.width / 2)

                Spacer()
                    
            }
        }
    }
}


//Geometry Ratio Modification function
struct AspectRatioModifier: ViewModifier{
    var geometry: GeometryProxy
    
    func body(content: Content) -> some View {
        content
            .frame(width: geometry.size.height * (16/9))
    }
}

#Preview {
    LoginFoundation()
}
