# UIView+Rotation
A Swift extension for UIView to animate rotating a view, like this spinning record from [True Note](http://crushapps.com/truenote) (which actually does spin at 33 1/3 RPM):

![UIView+Rotation example](http://crushapps.com/m/uiview+rotation.gif)

## Usage
Start rotating an instance of UIView:
```swift
view.startRotation(duration: 1.8, repeatCount: .infinity, clockwise: true)
```

Stop rotating the view, leaving it at the current rotation angle:
```swift
view.stopRotation()
```

Reset the view back to its starting rotation angle (if the view is currently rotating, this will also stop it):
```swift
view.resetRotation()
```

Determine whether or not the view is currently rotating:
```swift
if view.isRotating {
    // do something
}
```
