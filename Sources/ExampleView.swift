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
        mountain
            .overlay(
                sun.blendMode(blendMode),
                alignment: .top
            )
            .overlay(
                HStack {
                    tree.foregroundColor(.black)
                    Spacer()
                    tree.foregroundColor(.white)
                }.blendMode(blendMode),
                alignment: .bottom
            )
            .compositingGroup()
    }
    
    @ViewBuilder
    private var mountain: some View {
        resizableImage(systemName: "mountain.2.fill")
            .frame(height: 400)
            .foregroundColor(.accentColor)
    }

    @ViewBuilder
    private var sun: some View {
        resizableImage(systemName: "sun.max.fill")
            .frame(height: 250)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .foregroundColor(.orange)
    }
    
    @ViewBuilder
    private var tree: some View {
        resizableImage(systemName: "tree.fill")
            .frame(height: 150)
    }
    
    @ViewBuilder
    private func resizableImage(systemName: String) -> some View {
        Image(systemName: systemName)
            .resizable()
            .scaledToFit()
    }

}
 
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        allViews()
    }
}
#endif
