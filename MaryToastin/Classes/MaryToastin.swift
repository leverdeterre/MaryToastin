
import UIKit

extension UIView {
    
    func add(subView :UIView, edgeInsets :UIEdgeInsets) {
        subView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subView)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(topSpace)-[subView]-(bottomSpace)-|",
                                                     options: .alignAllTop,
                                                     metrics: ["topSpace":edgeInsets.top,
                                                               "bottomSpace":edgeInsets.bottom],
                                                     views: ["subView":subView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(leftSpace)-[subView]-(rightSpace)-|",
                                                      options: .alignAllTop,
                                                      metrics: ["leftSpace":edgeInsets.left,
                                                                "rightSpace":edgeInsets.right],
                                                      views: ["subView":subView]))
        setNeedsLayout()
    }
    
    func add(shadowOpacity: CGFloat, shadowRadius :CGFloat, shadowOffset :CGSize, optimizedShadowPath: Bool) {
    
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = Float(shadowOpacity)
        layer.shadowRadius = shadowRadius
        layer.shadowOffset = shadowOffset
        
        if (optimizedShadowPath) {
            var bounds = layer.bounds
            bounds.origin.x = 0.0
            bounds.origin.y = bounds.size.height - 1.0
            bounds.size.height = shadowOffset.height
            let shadowRect = bounds
            let pathCreate = CGPath(rect: shadowRect, transform: nil)
            layer.shadowPath = pathCreate
        }
    }
    
    func addShadow() {
        let size = CGSize(width: 0.0, height: 2.0)
        add(shadowOpacity: 0.3, shadowRadius: 1.5, shadowOffset: size, optimizedShadowPath: true)
    }
    
    func addReverseShadow() {
        let size = CGSize(width: 0.0, height: -2.0)
        add(shadowOpacity: 0.3, shadowRadius: 1.5, shadowOffset: size, optimizedShadowPath: false)
    }
}

extension UIViewController {
    public func showNotification(customView :UIView){
        let viewController = UIViewController()
        viewController.view.backgroundColor = UIColor.blue
        viewController.view.add(subView: customView, edgeInsets:UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0))
        viewController.setPreferedPopinContentSize(CGSize(width: view.frame.width,
                                                          height: customView.frame.height))
        viewController.setPopinTransitionDirection(.top)
        viewController.setPopinAlignment(.up)
        viewController.setPopinOptions(.dimmingViewStyleNone)
        
        presentPopinController(viewController, animated:true) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                if let presentingVc = viewController.presentingPopin() {
                    presentingVc.dismissCurrentPopinController(animated: true)
                }
            }
        }
    }
    
    public func showNotification(message :String){
        let viewController = UIViewController()
        viewController.view.backgroundColor = UIColor(colorLiteralRed:37.0/255.0,
                                                      green: 198.0/255.0,
                                                      blue: 218.0/255.0,
                                                      alpha: 1.0)

        let label = UILabel()
        label.text = message
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.numberOfLines = 0
        viewController.view.add(subView: label, edgeInsets:UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0))
        viewController.setPreferedPopinContentSize(CGSize(width: view.frame.width, height: 50.0))
        viewController.setPopinTransitionDirection(.top)
        viewController.setPopinAlignment(.up)
        viewController.setPopinOptions(.dimmingViewStyleNone)
        presentPopinController(viewController, animated:true) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                if let presentingVc = viewController.presentingPopin() {
                    presentingVc.dismissCurrentPopinController(animated: true)
                }
            }
        }
    }
    
    public func showSuccessNotification(message :String){
        let podBundle = Bundle(for: MarySuccessToastinViewController.classForCoder())
        let nibBundle = Bundle(path: "\(podBundle.bundlePath)/MaryToastin.bundle")
        let viewController = MarySuccessToastinViewController(nibName: "MarySuccessToastinViewController",
                                                              bundle: nibBundle)
        viewController.view.backgroundColor = UIColor.white
        viewController.view.addReverseShadow()
        viewController.toastMessageLabel.text = message
        viewController.toastMessageLabel.textColor = UIColor.black
        viewController.toastMessageLabel.numberOfLines = 0
        viewController.setPreferedPopinContentSize(CGSize(width: view.frame.width, height: 110.0))
        viewController.setPopinTransitionDirection(.bottom)
        viewController.setPopinAlignment(.down)
        viewController.setPopinOptions(.dimmingViewStyleNone)
        presentPopinController(viewController, animated:true) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                if let presentingVc = viewController.presentingPopin() {
                    presentingVc.dismissCurrentPopinController(animated: true)
                }
            }
        }
    }
}
