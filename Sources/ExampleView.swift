//
//  ExampleView.swift
//  BlendModeExamples
//
//  Created by Dmitry Gulyagin on 03/03/2023.
//

import SwiftUI

struct ExampleView: View {
    
    var blendMode: BlendMode = .normal
    
    var body: some View {
        sfImage("mountain.2.fill", .accentColor)
            .overlay(overlay.blendMode(blendMode))
            .compositingGroup()
    }
    
    @ViewBuilder
    private var overlay: some View {
        VStack {
            sfImage("sun.max.fill", .orange)
            HStack {
                sfImage("tree.fill", .black)
                Spacer()
                sfImage("tree.fill", .white)
            }
        }
    }
    
    private func sfImage(_ systemName: String, _ color: Color) -> some View {
        Image(systemName: systemName)
            .resizable()
            .scaledToFit()
            .foregroundColor(color)
    }

}
 
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let _ = EmptyCollection<String>()
        allViews()
            .frame(height: 400)
            .fixedSize()
    }
}
#endif
