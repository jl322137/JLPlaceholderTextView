//
//  JLPlaceholderTextView.swift
//  JLPlaceholderTextView
//
//  Created by Aimy on 15/2/25.
//  Copyright (c) 2015年 Aimy. All rights reserved.
//

import UIKit
@IBDesignable

class JLPlaceholderTextView: UITextView {

    override func prepareForInterfaceBuilder() {
        awakeFromNib()
    }
    
    let label: UILabel

    required init(coder aDecoder: NSCoder) {
        label = UILabel()
        
        super.init(coder: aDecoder)
        
        let string: NSString = placeholder
        placeholder = string
        label.font = UIFont.systemFontOfSize(placeholderFontSize)
        label.text = placeholder
        label.textColor = placeholderFontColor
        label.hidden = true
        addSubview(label)
        
        NSNotificationCenter.defaultCenter().addObserverForName(UITextViewTextDidChangeNotification, object: self, queue: NSOperationQueue.mainQueue()) { (notification) -> Void in
            let string: NSString = self.text
            if (string.length > 0) {
                self.label.hidden = true;
            }
            else {
                self.label.hidden = false;
            }
        }
    }
    
    @IBInspectable var placeholder: NSString = "a placeholdera placeholdera placeholdera placeholdera placeholdera placeholdera placeholder" {
        didSet {
            label.text = placeholder
            let string: NSString = label.text!
            let s: CGSize = CGSize(width: self.bounds.size.width, height: 0)
            var size: CGSize = string.boundingRectWithSize(s, options:OCUtils.stringDrawingOptions(), attributes:self.font.fontDescriptor().fontAttributes(), context: nil).size
            self.label.frame = CGRect(origin: CGPoint(x: 6, y: 6), size: size)
        }
    }
    
    @IBInspectable var placeholderFontSize: CGFloat = 14.0 {
        didSet {
            label.font = UIFont.systemFontOfSize(placeholderFontSize)
        }
    }
    
    @IBInspectable var placeholderFontColor: UIColor = UIColor.lightGrayColor() {
        didSet {
            label.textColor = placeholderFontColor
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let string: NSString = placeholder
        placeholder = string
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}
