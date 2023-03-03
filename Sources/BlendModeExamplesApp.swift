//
//  BlendModeExamplesApp.swift
//  BlendModeExamples
//
//  Created by Dmitry Gulyagin on 03/03/2023.
//

import SwiftUI

@main
struct BlendModeExamplesApp: App {
    var body: some Scene {
        WindowGroup {
            let columns = [
                GridItem(.adaptive(minimum: 200))
            ]
            LazyVGrid(columns: columns) {
                allViews(dublicateToDisk: true)
            }
        }
    }
}

@MainActor @ViewBuilder
func allViews(dublicateToDisk: Bool = false) -> some View {
    ForEach(BlendMode.allCases, id: \.self) { blendMode in
        let name = String(describing: blendMode)
        let previewName = "." + name
        let view = ExampleView(blendMode: blendMode)
        VStack {
            view
            Text(previewName).font(.title)
        }
        .padding()
        .onAppear {
            guard dublicateToDisk else { return }
            let cgImage = ImageRenderer(
                content: view.frame(width: 1024)
            ).cgImage!
            saveImage(
                image: CIImage(cgImage: cgImage),
                name: name
            )
        }
        .previewDisplayName(previewName)
    }
}

private func saveImage(image: CIImage, name: String) {
    let temporaryDirectory = FileManager.default.temporaryDirectory
        .appendingPathComponent("images")
    try? FileManager.default.createDirectory(at: temporaryDirectory, withIntermediateDirectories: false)
    
    let url = temporaryDirectory
        .appendingPathComponent(name)
        .appendingPathExtension("png")
    try! CIContext().writePNGRepresentation(
        of: image,
        to: url,
        format: .RGBA8,
        colorSpace: CGColorSpaceCreateDeviceRGB()
    )
    print(url.path)
}

extension BlendMode: CaseIterable {
    /// Regexp `/case (.+)\n\n/` to `.\1, `
    public static var allCases: [BlendMode] { [
        .normal, .multiply, .screen, .overlay, .darken, .lighten, .colorDodge, .colorBurn, .softLight, .hardLight, .difference, .exclusion, .hue, .saturation, .color, .luminosity, .sourceAtop, .destinationOver, .destinationOut, .plusDarker, .plusLighter,
    ] }
}
