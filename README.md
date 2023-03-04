#  SwiftUI-BlendModeExamples [DRAFT]
This GitHub repository contains a comprehensive cheat sheet for blend modes, a crucial aspect of computer graphics. The cheat sheet provides a quick reference guide for each blend mode, detailing their function and characteristics and practical examples of their use.

## Motivation
The documentation on blend modes is incomplete and fragmented across different sources. For instance, Apple’s documentation on [Bitmap Images and Image Masks](https://developer.apple.com/library/archive/documentation/GraphicsImaging/Conceptual/drawingwithquartz2d/dq_images/dq_images.html) includes a section on using blend modes with images, but this information pertains to Quartz 2D rather than SwiftUI. Therefore, a comprehensive and up-to-date resource on blend modes specifically for SwiftUI is currently unavailable. And I want to fix it in this paper.

## Test code
```swift
var body: some View {
    sfImage("mountain.2.fill", .accentColor)
        .overlay(overlay.blendMode(blendMode))
        .compositingGroup()
}

var overlay: some View {
    VStack {
        sfImage("sun.max.fill", .orange)
        HStack {
            sfImage("tree.fill", .black)
            Spacer()
            sfImage("tree.fill", .white)
        }
    }
}

func sfImage(_ systemName: String, _ color: Color) -> some View {
    Image(systemName: systemName)
        .resizable()
        .scaledToFit()
        .foregroundColor(color)
}
```

## Example Usage
### Default mode
| Blend mode | Description | Result |
| --- | --- | --- |
| `.normal` | Draws the source image over the destination image with no blending or compositing effects applied. | ![Blend mode normal](Examples/normal.png) |

### Alpha clipping
| Blend mode | Description | Result |
| --- | --- | --- |
| `.destinationOut` | Makes the overlapping areas of the source and destination images transparent. | ![Blend mode destinationOut](Examples/destinationOut.png) |
| `.sourceAtop` | Draws the source image on top of the destination image, but only in the areas where they overlap. | ![Blend mode sourceAtop](Examples/sourceAtop.png) |

### Composing
| Blend mode | Description | Result |
| --- | --- | --- |
| `.destinationOver` | Draws the destination image on top of the source image. | ![Blend mode destinationOver](Examples/destinationOver.png) |

### Components multiplying
| Blend mode | Description | Result |
| --- | --- | --- |
| `.multiply` | Multiplies the colors of the source and destination images, resulting in a darker image. | ![Blend mode multiply](Examples/multiply.png) |
| `.screen` | Inversely multiplies the colors of the source and destination images, resulting in a lighter image. | ![Blend mode screen](Examples/screen.png) |
| `.overlay` | Combines Multiply and Screen blend modes, resulting in a combination of darker and lighter areas. | ![Blend mode overlay](Examples/overlay.png) |
| `.hardLight` | Combines Multiply and Screen blend modes, but with more intense effects. | ![Blend mode hardLight](Examples/hardLight.png) |
| `.softLight` | Darkens or lightens the destination image based on the colors of the source image. | ![Blend mode softLight](Examples/softLight.png) |

### Components selection by condition 
| Blend mode | Description | Result |
| --- | --- | --- |
| `.darken` | Selects the darker of the source and destination pixels for each pixel in the output image. | ![Blend mode darken](Examples/darken.png) |
| `.lighten` | Selects the lighter of the source and destination pixels for each pixel in the output image. | ![Blend mode lighten](Examples/lighten.png) |

### Components adding and subtracting
| Blend mode | Description | Result |
| --- | --- | --- |
| `.plusDarker` | Adds the source and destination pixel values and subtracts 0.5, resulting in a darker image. | ![Blend mode plusDarker](Examples/plusDarker.png) |
| `.plusLighter` | Adds the source and destination pixel values, resulting in a brighter image. | ![Blend mode plusLighter](Examples/plusLighter.png) |
| `.difference` | Subtracts the colors of the source image from the destination image, resulting in a negative image. | ![Blend mode difference](Examples/difference.png) |
| `.exclusion` | Similar to Difference blend mode, but with less intense effects. | ![Blend mode exclusion](Examples/exclusion.png) |

### Other
| Blend mode | Description | Result |
| --- | --- | --- |
| `.colorDodge` | Brightens the destination image based on the brightness of the source image. | ![Blend mode colorDodge](Examples/colorDodge.png) |
| `.colorBurn` | Darkens the destination image based on the darkness of the source image. | ![Blend mode colorBurn](Examples/colorBurn.png) |
| `.hue` | Changes the hue of the destination image based on the hue of the source image. | ![Blend mode hue](Examples/hue.png) |
| `.saturation` | Changes the saturation of the destination image based on the saturation of the source image. | ![Blend mode saturation](Examples/saturation.png) |
| `.color` | Changes the hue and saturation of the destination image based on the hue and saturation of the source image. | ![Blend mode color](Examples/color.png) |
| `.luminosity` | Changes the brightness of the destination image based on the brightness of the source image. | ![Blend mode luminosity](Examples/luminosity.png) |

