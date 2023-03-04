#  SwiftUI-BlendModeExamples
This GitHub repository contains a comprehensive cheat sheet for blend modes, a crucial aspect of computer graphics. The cheat sheet provides a quick reference guide for each blend mode, detailing their function and characteristics and practical examples of their use.

## Motivation
The documentation on blend modes is incomplete and fragmented across different sources. For instance, Apple’s documentation on ![Bitmap Images and Image Masks](https://developer.apple.com/library/archive/documentation/GraphicsImaging/Conceptual/drawingwithquartz2d/dq_images/dq_images.html) includes a section on using blend modes with images, but this information pertains to Quartz 2D rather than SwiftUI. Therefore, a comprehensive and up-to-date resource on blend modes specifically for SwiftUI is currently unavailable. And I want to fix it in this paper.

## Test code
```swift
var body: some View {
    var body: some View {
        sfImage("mountain.2.fill", .accentColor)
            .overlay(
                VStack {
                    sfImage("sun.max.fill", .orange)
                    HStack {
                        sfImage("tree.fill", .black)
                        Spacer()
                        sfImage("tree.fill", .white)
                    }
                }.blendMode(blendMode)
            )
            .compositingGroup()
    }
    
    private func sfImage(_ systemName: String, _ color: Color) -> some View {
        Image(systemName: systemName)
            .resizable()
            .scaledToFit()
            .foregroundColor(color)
    }
}
```
## Example Usage
### Alpha relative
| Name | Description | Image |
| --- | --- | --- |
| .sourceAtop | | ![Blend mode sourceAtop](Examples/sourceAtop.png) |
