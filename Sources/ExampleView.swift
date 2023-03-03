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
            VStack {
                sun
                HStack {
                    tree.foregroundColor(.black)
                    Spacer()
                    tree.foregroundColor(.white)
                }
            }.blendMode(blendMode)
        )
        .compositingGroup()
    }
    
    @ViewBuilder
    private var mountain: some View {
        resizableImage(systemName: "mountain.2.fill")
            .foregroundColor(.accentColor)
    }

    @ViewBuilder
    private var sun: some View {
        resizableImage(systemName: "sun.max.fill")
            .foregroundColor(.orange)
    }
    
    @ViewBuilder
    private var tree: some View {
        resizableImage(systemName: "tree.fill")
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
        let _ = EmptyCollection<String>()
        allViews()
            .frame(height: 400)
            .fixedSize()
    }
}
#endif
