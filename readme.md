# InitialImageView

InitialImageView is a subclass of UIImageView that empower user to set initial or name as a placeholder image like what you see in a iOs Contact

Screenshot:

## Installation

#### CocoaPods
Use [CocoaPods](https://cocoapods.org) with Podfile:

    pod 'InitialImageView'

#### Manual
Just drag and drop InitialImageView.swift to your project.

## Usage

1) Create or change your UIImageView to InitialImageView

2) Call any of the following function to set image for InitialImageView

    func setImageWithFirstName(firstName: String, lastName: String, backgroundColor: UIColor = UIColor.darkGrayColor(), randomColor: Bool = false)
    func setImageWithInitial(initial: String, backgroundColor: UIColor = UIColor.darkGrayColor(), randomColor: Bool = false)
    func setImageWithInitial(initial: String, backgroundColor: UIColor = UIColor.darkGrayColor(), randomColor: Bool = false)
