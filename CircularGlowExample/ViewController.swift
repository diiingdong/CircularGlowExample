
import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var targetView: UIView!
    
    @IBAction func addGlow(sender: UIButton)
    {
        let insetDistance = targetView.bounds.size.width / 4.0
        let insetRect = CGRectInset(targetView.bounds, insetDistance, insetDistance / 3.0)
        let maskPath = UIBezierPath(ovalInRect: insetRect)
        
        let layerPath = UIBezierPath(ovalInRect: targetView.bounds)
        layerPath.appendPath(maskPath)
        layerPath.usesEvenOddFillRule = true
        
        let shadowLayer = CAShapeLayer()
        
        shadowLayer.fillColor = UIColor.purpleColor().CGColor
        shadowLayer.path = layerPath.CGPath
        shadowLayer.shadowColor = UIColor.purpleColor().CGColor
        shadowLayer.shadowRadius = 15.0
        shadowLayer.shadowOpacity = 0.8
        shadowLayer.shadowOffset = CGSizeMake(0.0, 0.0)
        shadowLayer.fillRule = kCAFillRuleEvenOdd
        
        targetView.layer.addSublayer(shadowLayer)
    }
    
    @IBAction func clearGlow(sender: UIButton)
    {
        targetView.layer.sublayers?.forEach{ $0.removeFromSuperlayer() }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
}
