

import UIKit

@IBDesignable  class CustomTextField: UITextField {
   
    @IBInspectable var leftPadding: CGFloat = 10
    @IBInspectable var color:UIColor = UIColor.lightGray{
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        
        var inputTextRect = super.leftViewRect(forBounds: bounds)
        inputTextRect.origin.x += leftPadding
        
        return inputTextRect
    }
    
    @IBInspectable var rightImageView: UIView? {
        
        didSet{
            updateView()
        }
    }
    
    
    @IBInspectable var leftImageView: UIView? {
        didSet{
            updateView()
        }
    }
    
    func updateView(){
        if let ltView = leftImageView{
            leftViewMode = UITextFieldViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.addSubview(ltView)
            imageView.tintColor = color
            leftView = imageView
        }
        else{
            leftViewMode = UITextFieldViewMode.never
            leftView = nil
        }
        
        if let rtView = rightImageView{
            
            rightViewMode = UITextFieldViewMode.whileEditing
            let imageView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.addSubview(rtView)
            imageView.tintColor = color
            rightView = imageView
        }
        else{
            rightViewMode = UITextFieldViewMode.never
            rightView = nil
        }
        
    }
}
