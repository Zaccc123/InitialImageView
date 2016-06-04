# InitialImageView
[![Build Status](https://www.bitrise.io/app/95edfdbff10fffa5.svg?token=oU7Up6bkcm2FEzk6kb_DVA&branch=master)](https://www.bitrise.io/app/95edfdbff10fffa5)  ![Pods](https://img.shields.io/cocoapods/v/InitialImageView.svg?style=flat)  ![Pods](https://img.shields.io/cocoapods/l/InitialImageView.svg?style=flat)

InitialImageView is a subclass of UIImageView that empower user to set initial or name as a placeholder image like what you see in a iOs Contact

![Screenshots](http://i.imgur.com/jVVa8Bm.png)

## Installation

#### CocoaPods
Use [CocoaPods](https://cocoapods.org) with Podfile:

    pod 'InitialImageView'

#### Manual
Just drag and drop InitialImageView.swift to your project.

## Example

#### Storyboard with IBOutlet in ViewController

    @IBOutlet weak var initialImageView: InitialImageView!

    override func viewDidLoad() {
      super.viewDidLoad()
      initialWithFontImageView.setImageWithInitial("YW", backgroundColor: UIColor.greenColor())
    }

#### Doing it in code

    override func viewDidLoad() {
      super.viewDidLoad()
      let initialImageView = InitialImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
      initialWithFontImageView.setImageWithInitial("YW", backgroundColor: UIColor.greenColor())
    }

#### Placeholder while downloading with AlamofireImage or any other url completion

    profileImageView.setImageWithFirstName(user.firstName, lastName: user.lastName)
    profileImageView.af_setImageWithURL(user.profileUrl)

## Usage

1) Create or change your UIImageView to InitialImageView

2) Call any of the following function to set image for InitialImageView

    func setImageWithFirstName(firstName: String, lastName: String, backgroundColor: UIColor = UIColor.darkGrayColor(), randomColor: Bool = false)
    func setImageWithInitial(initial: String, backgroundColor: UIColor = UIColor.darkGrayColor(), randomColor: Bool = false)
    func setImageWithInitial(initial: String, backgroundColor: UIColor = UIColor.darkGrayColor(), randomColor: Bool = false)

`backgroundColor` default is `UIColor.darkGrayColor()` however it can be set by any UIColor that user has passed in when calling the function.

`randomColor` default is false. By setting `randomColor` to true, it will ignore the `backgroundColor` parameters and generate a random UIColor that is not 'near' white.

3) Properties:

The following properties could be set if needed to override the default value

    var fontResizeValue: CGFloat
    var font: UIFont
    var isCircle: Bool

`fontResizeValue` is used to calculate the font size with self.bounds

`font` will be used to draw the initial UIImage that will be set to InitialImageView. Setting fontsize on 'font' here will not take any effect

`isCircle` is a boolean that will determine if InitialImageView should be a circle

### About

This project draw inspiration from [UIImageView+Letters](https://github.com/bachonk/UIImageView-Letters) in Objective-c. I have used the Pods multiple time in Objective-c project. I decided to write it in Swift with a few changes and also turning it into a subclass instead.

### Licence

InitialImageView is released under the MIT license.
See [LICENSE](./LICENSE) for details.
