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
        label = UILabel(frame: CGRect(x: 6, y: 6, width: 100, height: 20))
        
        super.init(coder: aDecoder)
        
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
    
    @IBInspectable var placeholder: NSString = "a placeholder" {
        didSet {
            label.text = placeholder
            let string: NSString = label.text!
//            var size: CGSize = string.boundingRectWithSize(CGSize(width: self.bounds.size.width, height: 0), options: NSStringDrawingOptions.UsesLineFragmentOrigin | NSStringDrawingOptions.UsesFontLeading, attributes: [], context: nil).size
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
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}
