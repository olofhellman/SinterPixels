# SinterPixels
A Swift package for scripting the [SinterPixels app](https://tomographic.com/Sinterpixels.html)

See the [SinterPixelsExtensions github repo](https://github.com/olofhellman/SinterPixelsExtensions) for code examples of using this swift package to write a swift app that targets SInterPixels

Essentially, this package supports swift code like this, which makes a new SinterPixels document

```
	if let spApp = SPApp() {
		let _ = spApp.activate()
		
		let props = NSAppleEventDescriptor.record()
		props.setParam(NSAppleEventDescriptor(int32:1000), forKeyword: .pHeight)
		props.setParam(NSAppleEventDescriptor(int32:1000), forKeyword: .pWidth)
		
		let madeObject = spApp.make(new: SPDocument.fcc, container: NSAppleEventDescriptor.null(), props: props)
	}
```

which is the analogous swift version of the AppleScript

```
    tell application "SinterPixels"
        make new dpcument with properties { height: 1000, width: 1000 }
    end tell
```