//
//  Login.swift
//  AeroAid
//
//  Created by Tyree Franklin JR on 2/16/25.
//
import SwiftUI

struct AppColors {
    static let mainColor = Color.orange
    static let backgroundColor = Color.black
    static let secondaryText = Color.gray
}

struct LoginView: View {
    var body: some View {
        HStack(spacing: 0) {
            // Left side - Login Form
            VStack(spacing: 20) {
                // Logo or App Name
                Text("AeroAid")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(AppColors.mainColor)
                    .padding(.bottom, 40)
                
                // Email Field
                TextField("Email", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 300)
                
                // Password Field
                SecureField("Password", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 300)
                
                // Login Button
                Button(action: {}) {
                    Text("Sign In")
                        .foregroundColor(.white)
                        .frame(width: 300, height: 40)
                        .background(AppColors.mainColor)
                        .cornerRadius(8)
                }
                
                // Divider
                HStack {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(AppColors.secondaryText)
                    Text("or")
                        .foregroundColor(AppColors.secondaryText)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(AppColors.secondaryText)
                }
                .frame(width: 300)
                
                // Social Sign-in Buttons
                Button(action: {}) {
                    HStack {
                        Image(systemName: "apple.logo")
                        Text("Sign in with Apple")
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 40)
                    .background(Color.black)
                    .cornerRadius(8)
                }
                
                Button(action: {}) {
                    HStack {
                        Image("google_logo")
                        Text("Sign in with Google")
                    }
                    .foregroundColor(.black)
                    .frame(width: 300, height: 40)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                }
            }
            .frame(maxWidth: .infinity)
            .background(AppColors.backgroundColor)
        }
    }
}


import SwiftUI

struct Login: View {
    var body: some View {
        // Horizontal Stack for (left side, login information; right side image background)
        HStack{
            //Geometry reader function for unique image sizing
            GeometryReader { geometry in
                //Background Image
                Image("LoginBackground")
                    .resizable()
                    .scaledToFit()
                    .frame(height: geometry.size.height)
                    .modifier(AspectRatioModifier(geometry: geometry))
                    .ignoresSafeArea(.all)
                
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
    Login()
}
