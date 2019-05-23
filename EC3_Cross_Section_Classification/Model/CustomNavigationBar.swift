//
//  CustomNavigationBar.swift
//  EC3_Cross_Section_Classification
//
//  Created by Shadi Hammoudeh on 4/13/19.
//  Copyright © 2019 Bespoke Engineering. All rights reserved.
//

// A UINavigationBar object is a bar, typically displayed at the top of the window, containing buttons for navigating within a hierarchy of screens. The primary components are a left (back) button, a centre title, and an optional right button. You can use a navigation bar as a standalone object or in conjunction with a navigation controller object. The UINavigationController object creates, displays, and manages its associated navigation bar, and uses attributes of the view controllers you add to control the content displayed in the navigation bar. When using a Navigation Bar as a standalone object, you are responsible for providing its content. Unlike other types of views, you do not add subviews to a navigation bar directly. Instead, you use a navigation item (an instance of the UINavigationItem class) to specify what buttons or custom views you want displayed. A navigation item has properties for specifying views on the left, right and centre of the navigation bar and for specifying a custom prompt string.

import UIKit

// The below Framework is needed in order to add more colour options, contrasting and other UI things:

import ChameleonFramework

class CustomNavigationBar: UINavigationBar {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
    }
    
    // The below convenience initialiser, initialises a custom standalone Navigation Bar which only contains a custom UILabel that holds the Navigation Bar title:
    
    convenience init(labelTitleText titleText: String,labelTitleTextColour textColour: UIColor,labelTitleFontSize fontSize: CGFloat, labelTitleFontType fontType: String, viewNavigationBarWillBeAddedTo hostView: UIView, navigationBarDelegate: UINavigationBarDelegate, isNavigationBarTranslucent translucency: Bool, navigationBarBarStyle navBarStyle: UIBarStyle, navigationBarBarTintColourHexCode barTintColour: String)  {
        
        self.init()
        
        addCustomTitleToNavigationBarAsLabel(labelTitleText: titleText, labelTitleTextColour: textColour, labelTitleFontSize: fontSize, labelTitleFontType: fontType)
        
        setupNavigationBarEssentials(viewNavigationBarWillBeAddedTo: hostView, navigationBarDelegate: navigationBarDelegate, isNavigationBarTranslucent: translucency, navigationBarBarStyle: navBarStyle, navigationBarBarTintColourHexCode: barTintColour)
        
    }
    
    // The below convenience initialiser, initialises a custom standalone Navigation Bar with a custom UILabel for the title and a left button item:
    
    convenience init(navigationBarLeftButtonImage buttonImage: String, navigationBarItemsTintColour itemsTintColour: UIColor, navigationBarButtonTarget buttonTarget: Any?, navigationBarButtonSelector selector: Selector, labelTitleText titleText: String, labelTitleTextColour textColour: UIColor, labelTitleFontSize fontSize: CGFloat, labelTitleFontType fontType: String, viewNavigationBarWillBeAddedTo hostView: UIView, navigationBarDelegate: UINavigationBarDelegate, isNavigationBarTranslucent translucency: Bool, navigationBarBackgroundColour backgroundColour: UIColor, navigationBarBarStyle navBarStyle: UIBarStyle, navigationBarBarTintColourHexCode barTintColour: String) {
        
        self.init()
        
        addLeftButtonToNavigationBar(navigationBarLeftButtonImage: buttonImage, navigationBarItemsTintColour: itemsTintColour, navigationBarLeftButtonTarget: buttonTarget, navigationBarLeftButtonSelector: selector)
        
        addCustomTitleToNavigationBarAsLabel(labelTitleText: titleText, labelTitleTextColour: textColour, labelTitleFontSize: fontSize, labelTitleFontType: fontType)
        
        setupNavigationBarEssentials(viewNavigationBarWillBeAddedTo: hostView, navigationBarDelegate: navigationBarDelegate, isNavigationBarTranslucent: translucency, navigationBarBarStyle: navBarStyle, navigationBarBarTintColourHexCode: barTintColour)
        
    }
    
    // The below initialiser, initialises a custom Navigation Bar with a default Title prompt, a title image underneath the prompt and a left button item:
    
    convenience init(defaultTitleText titleText: String, titleImage: String, navigationBarLeftButtonImage buttonImage: String, navigationBarItemsTintColour itemsTintColour: UIColor, navigationBarLeftButtonTarget buttonTarget: Any?, navigationBarSelector selector: Selector, viewNavigationBarWillBeAddedTo hostView: UIView, navigationBarDelegate: UINavigationBarDelegate, isNavigationBarTranslucent translucency: Bool, navigationBarBackgroundColour backgroundColour: UIColor, navigationBarBarStyle navBarStyle: UIBarStyle, navigationBarBarTintColourHexCode barTintColour: String) {
        
        self.init()
        
        addDefaultNavigationBarTitlePrompt(defaultTitleText: titleText)
        
        addTitleImageToNavigationBar(titleImage: titleImage)
        
        addLeftButtonToNavigationBar(navigationBarLeftButtonImage: buttonImage, navigationBarItemsTintColour: itemsTintColour, navigationBarLeftButtonTarget: buttonTarget, navigationBarLeftButtonSelector: selector)
        
        setupNavigationBarEssentials(viewNavigationBarWillBeAddedTo: hostView, navigationBarDelegate: navigationBarDelegate, isNavigationBarTranslucent: translucency, navigationBarBarStyle: navBarStyle, navigationBarBarTintColourHexCode: barTintColour)
        
    }
    
    let customNavigationBarItem = UINavigationItem()
    
    func addCustomTitleToNavigationBarAsLabel(labelTitleText titleText: String, labelTitleTextColour textColour: UIColor, labelTitleFontSize fontSize: CGFloat, labelTitleFontType fontType: String) {
        
        // The default height for a Navigation Bar is 44 points:
        
        let customNavigationBarTitleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: 44))
        
        customNavigationBarTitleLabel.text = titleText
        
        customNavigationBarTitleLabel.textColor = textColour
        
        customNavigationBarTitleLabel.textAlignment = .center
        
        customNavigationBarTitleLabel.font = UIFont(name: fontType, size: fontSize)
        
        customNavigationBarTitleLabel.numberOfLines = 0
        
        customNavigationBarItem.titleView = customNavigationBarTitleLabel
        
    }
    
    func addDefaultNavigationBarTitlePrompt(defaultTitleText: String) {
        
        // Prompt is a single line of text dispalyed at the top of Navigation Bar. The colour of the text inside the prompt is changed by selecting the barStyle property:
        
        customNavigationBarItem.prompt = defaultTitleText
        
    }
    
    func addLeftButtonToNavigationBar(navigationBarLeftButtonImage buttonImage: String, navigationBarItemsTintColour tintColour: UIColor, navigationBarLeftButtonTarget target: Any?, navigationBarLeftButtonSelector selector: Selector) {
        
        // You can specify a custom tint colour for a navigation bar background by using the barTintColor property. Setting this property overrides the default colour inferred from the bar style. As with all UIView subclasses, you can control the colour of the interactive elements within navigation bars, including button images and titles, using the tintColor property.
        
        tintColor = tintColour
        
        let navigationBarBackButtonImage = UIImage(named: buttonImage)
        
        navigationBarBackButtonImage?.withRenderingMode(.alwaysOriginal)
        
        let navigationBarLeftButton = UIBarButtonItem(image: navigationBarBackButtonImage, style: .plain, target: target, action: selector)
        
        customNavigationBarItem.leftBarButtonItem = navigationBarLeftButton
        
    }
    
    func addTitleImageToNavigationBar(titleImage image: String) {
        
        let titleImage = UIImage(named: image)
        
        let headerImageView = UIImageView(image: titleImage)
        
        headerImageView.contentMode = .scaleAspectFit
        
        customNavigationBarItem.titleView = headerImageView
        
    }
    
    func setupNavigationBarEssentials(viewNavigationBarWillBeAddedTo hostView: UIView, navigationBarDelegate: UINavigationBarDelegate, isNavigationBarTranslucent transluceny: Bool, navigationBarBarStyle navBarStyle: UIBarStyle, navigationBarBarTintColourHexCode barTint: String) {
        
        // The below line of code adds the navigationBarItems created above in different Methods to the navigationBarItems Array, in order for them to be displayed inside the NavigationBar. UINavigationBar contains an array of UINavigationBarItem for displaying content. According to Apple documents, UINavigationBarItem means; the items to be displayed by a navigation bar when the associated view controller is visible:
        
        items = [customNavigationBarItem]
        
        // The tint color to apply to the navigation bar background. This color is made translucent by default unless you set the isTranslucent property to false. This one overrides the backgroundColor property:
        
        barTintColor = UIColor(hexString: barTint, withAlpha: 0.1)
        
        // Navigation bars have two standard appearance styles: white with dark text or black with light text. Any changes you make to other navigation bar appearance properties override those inferred from the bar style. This property also affects the colour of the text inside the navigationBarItemPrompt:
        
        barStyle = navBarStyle
        
        // Navigation bars are translucent by default; that is, their background colour is semitransparent:
        
        isTranslucent = transluceny
        
        // The below line of code decides whether the title property of the navigationBarItem should have large font:
        
        prefersLargeTitles = false
        
        delegate = navigationBarDelegate
        
        // The below line of code adds the NavigationBar as a subView to the view it will be added to (i.e., hostView):
        
        hostView.addSubview(self)
        
        // The below lines of code set the needed constraints for the Navigation Bar when displayed inside the hostView:
        
        translatesAutoresizingMaskIntoConstraints = false
        
        leftAnchor.constraint(equalTo: hostView.leftAnchor).isActive = true
        
        rightAnchor.constraint(equalTo: hostView.rightAnchor).isActive = true
        
        if #available(iOS 11, *) {
            
            topAnchor.constraint(equalTo: hostView.safeAreaLayoutGuide.topAnchor).isActive = true
            
        } else {
            
            topAnchor.constraint(equalTo: hostView.topAnchor).isActive = true
            
        }
        
    }
    
}



