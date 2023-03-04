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
| `.normal` | Paints the source image samples over the background image samples. | ![Blend mode normal](Examples/normal.png) |

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
| `.multiply` | Multiplies the source image samples with the background image samples. This results in colors that are at least as dark as either of the two contributing sample colors. | ![Blend mode multiply](Examples/multiply.png) |
| `.screen` | Multiplies the inverse of the source image samples with the inverse of the background image samples, resulting in colors that are at least as light as either of the two contributing sample colors. | ![Blend mode screen](Examples/screen.png) |
| `.overlay` | Combines Multiply and Screen blend modes, resulting in a combination of darker and lighter areas. | ![Blend mode overlay](Examples/overlay.png) |
| `.hardLight` | Combines Multiply and Screen blend modes, but with more intense effects. | ![Blend mode hardLight](Examples/hardLight.png) |
| `.softLight` | Darkens or lightens the destination image based on the colors of the source image. | ![Blend mode softLight](Examples/softLight.png) |

### Components selection by condition 
| Blend mode | Description | Result |
| --- | --- | --- |
| `.darken` | Selects the darker of the source and destination pixels for each pixel in the output image. <br><br>*R = MIN(S, D)* | ![Blend mode darken](Examples/darken.png) |
| `.lighten` | Selects the lighter of the source and destination pixels for each pixel in the output image. <br><br>*R = MAX(S, D)* | ![Blend mode lighten](Examples/lighten.png) |

### Components adding and subtracting
| Blend mode | Description | Result |
| --- | --- | --- |
| `.plusDarker` | Adds the source and destination pixel values and subtracts 0.5, resulting in a darker image.<br><br>*R = MAX(0, 1 - ((1 - D) + (1 - S)))* | ![Blend mode plusDarker](Examples/plusDarker.png) |
| `.plusLighter` | Adds the source and destination pixel values, resulting in a brighter image.<br><br>*R = MIN(1, S + D)* | ![Blend mode plusLighter](Examples/plusLighter.png) |
| `.difference` | Subtracts either the source image sample color from the background image sample color, or the reverse, depending on which sample has the greater brightness value. Source image sample values that are black produce no change; white inverts the background color values. | ![Blend mode difference](Examples/difference.png) |
| `.exclusion` | Produces an effect similar to that produced by `.difference`, but with lower contrast. Source image sample values that are black don’t produce a change; white inverts the background color values. | ![Blend mode exclusion](Examples/exclusion.png) |

### Other
| Blend mode | Description | Result |
| --- | --- | --- |
| `.color` | Uses the luminance values of the background with the hue and saturation values of the source image. This mode preserves the gray levels in the image.<br><br>*You can use this mode to color monochrome images or to tint color images.* | ![Blend mode color](Examples/color.png) |
| `.luminosity` | Uses the hue and saturation of the background with the luminance of the source image. This mode creates an effect that is inverse to the effect created by `.color`. | ![Blend mode luminosity](Examples/luminosity.png) |
| `.saturation` | Uses the luminance and hue values of the background with the saturation of the source image. Areas of the background that have no saturation (that is, pure gray areas) don’t produce a change. | ![Blend mode saturation](Examples/saturation.png) |
| `.hue` | Uses the luminance and saturation values of the background with the hue of the source image. | ![Blend mode hue](Examples/hue.png) |
| `.colorDodge` | Brightens the destination image based on the brightness of the source image. | ![Blend mode colorDodge](Examples/colorDodge.png) |
| `.colorBurn` | Darkens the destination image based on the darkness of the source image. | ![Blend mode colorBurn](Examples/colorBurn.png) |
