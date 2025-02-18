//
//  Login.swift
//  AeroAid
//
//  Created by Tyree Franklin JR on 2/16/25.
//
import SwiftUI

struct LoginFoundation: View {
    var body: some View {
        // GeometryReader allows us to get the size of the screen dynamically
        GeometryReader { geometry in
            ZStack {
                
                // Background Image
                Image("loginbackground") // Using the image named "loginbackground"
                    .resizable() // Allow the image to resize based on the screen size
                    .dynamicAspectRatio(16 / 9) // Custom modifier to maintain the image's aspect ratio
                    .ignoresSafeArea(.all) // Ignores safe area to make the image cover the entire screen
                
                // HStack for the layout:
                // Left part is the rounded rectangle, right part will be the image showing
                HStack {
                    // Creating a rounded rectangle with a white background
                    RoundedRectangle(cornerRadius: 25) // Rounded corners with a radius of 25
                        .foregroundColor(.white) // White background for the rectangle
                        .ignoresSafeArea(.all) // Ignores safe area to cover the whole screen
                        .frame(width: geometry.size.width / 2, height: geometry.size.height) // Sets the width to half of the screen, and the height to fill the screen
                        
                    Spacer() // Spacer to push the right part of the screen (background image) to the edge
                }
            }
        }
    }
}

// View modifier that helps adjust the aspect ratio of the image dynamically
struct AspectRatioModifier: ViewModifier {
    let aspectRatio: CGFloat // Aspect ratio (e.g., 16/9 for widescreen images)

    func body(content: Content) -> some View {
        // GeometryReader helps calculate the new width based on the height
        GeometryReader { geometry in
            // Calculate the new width using the given aspect ratio
            let newWidth = geometry.size.height * aspectRatio

            // Apply the calculated width and the original height from the geometry
            content
                .frame(width: newWidth, height: geometry.size.height) // Set the new width and height to maintain aspect ratio
                .clipped() // Clips any content that overflows
        }
    }
}

// Custom modifier that applies the AspectRatioModifier to any view
extension View {
    // This function applies the aspect ratio modifier to any view
    func dynamicAspectRatio(_ aspectRatio: CGFloat) -> some View {
        self.modifier(AspectRatioModifier(aspectRatio: aspectRatio))
    }
}

// Preview section to display the LoginFoundation in the preview pane
#Preview {
    LoginFoundation()
}
