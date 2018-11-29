//
//  ViewController.swift
//  demoDisaster
//
//  Created by Aditi on 10/4/18.
//  Copyright © 2018 AditiSeasia Infotech. All rights reserved.
//

import UIKit
var chngecolor = [[CGPoint]]()
class ViewController: UIViewController {

    @IBOutlet weak var ImgView: UIImageView!
    let strokeColor:UIColor = UIColor.blue
    
    @IBOutlet weak var imgstatus: UIImageView!
    
    var t = [CGPoint]()
    
    //Update this for path line width
    let lineWidth:CGFloat = 2.0
    
    //Path to draw while touch events occur
    var path = UIBezierPath()
    var path1 = UIBezierPath()
    
    //ShapeLayer of cropped view
    var shapeLayer = CAShapeLayer()
    var s  = CAShapeLayer()
    //Final Cropped Image
    var croppedImage = UIImage()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        t.removeAll()
      
        if(chngecolor.isEmpty){
            
        }else{
//            let points  = chngecolor[0][0]
//            path1.move(to: points)
//            for m in 1...chngecolor[0].count-1{
//                path1.addLine(to: chngecolor[0][m])
//                print(chngecolor[0][m])
//                addNewPathToImagee(path1: path1, color: UIColor.green)
//            }
            // addNewPathToImage()
            
        }
        //cell.indi_cell.stopAnimating()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first as UITouch?{
            let touchPoint = touch.location(in: self.ImgView)
            t.removeAll()
            print("touch begin to : \(touchPoint)")
            path.move(to: touchPoint)
            t.append(touchPoint)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first as UITouch?{
            let touchPoint = touch.location(in: self.ImgView)
            print("touch moved to : \(touchPoint)")
            path.addLine(to: touchPoint)
            t.append(touchPoint)
            addNewPathToImage()
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first as UITouch?{
            let touchPoint = touch.location(in: self.ImgView)
            print("touch ended at : \(touchPoint)")
            path.addLine(to: touchPoint)
            t.append(touchPoint)
            cropImage()
            addNewPathToImage()
            path.close()
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first as UITouch?{
            let touchPoint = touch.location(in: self.ImgView)
            print("touch canceled at : \(touchPoint)")
            path.close()
        }
    }
    
    
    
    /**
     This methods is adding CAShapeLayer line to tempImageView
     */
    func addNewPathToImage(){
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = lineWidth
        ImgView.layer.addSublayer(shapeLayer)
    }
    
    func addNewPathToImagee(path1:UIBezierPath,color:UIColor){
      shapeLayer.removeFromSuperlayer()
        
       s.removeFromSuperlayer()
        s.path = path1.cgPath
        s.strokeColor = strokeColor.cgColor
        s.fillColor = color.cgColor
        s.lineWidth = lineWidth
        ImgView.layer.addSublayer(s)
//        path = UIBezierPath()
//        shapeLayer = CAShapeLayer()

       
    }
    
    /**
     This methods is making cropped object of tempImageView's image
     */
    func cropImage(){
        UIGraphicsBeginImageContextWithOptions(ImgView.bounds.size, false, 1)
        
        ImgView.layer.render(in: UIGraphicsGetCurrentContext()!)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        self.croppedImage = newImage!
       
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func IBActionCropImage(_ sender: UIButton) {
        shapeLayer.fillColor = UIColor.clear.cgColor
        //ImgView.layer.mask = shapeLayer
       
        self.performSegue(withIdentifier: "toMap", sender: self)
        
    }
    @IBAction func second(_ sender: Any) {

         self.performSegue(withIdentifier: "toMapp", sender: self)
        
    }
    
    
    
    @IBAction func Cancel2(_ sender: Any) {
        s.removeFromSuperlayer()
        path1 = UIBezierPath()
       s = CAShapeLayer()
        if(chngecolor.isEmpty){
            
        }else{
            let points  = chngecolor[1][0]
            path1.move(to: points)
            for m in 1...chngecolor[1].count-1{
                path1.addLine(to: chngecolor[1][m])
                print(chngecolor[1][m])
                addNewPathToImagee(path1:path1, color: UIColor.green)
            }
        }
        
        
    }
    
    
    @IBAction func IBActionCancelCrop(_ sender: UIButton) {
        //shapeLayer.removeFromSuperlayer()
        s.removeFromSuperlayer()
        path1 = UIBezierPath()
        s = CAShapeLayer()
        if(chngecolor.isEmpty){
            
        }else{
            let points  = chngecolor[0][0]
            path1.move(to: points)
            for m in 1...chngecolor[0].count-1{
                path1.addLine(to: chngecolor[0][m])
                print(chngecolor[0][m])
                addNewPathToImagee(path1:path1, color: UIColor.red)
            }

        }
       
//        if(shapeLayer.sublayers != nil){
//            for sublayer in shapeLayer.sublayers! {
//
//                if let button = sublayer as? CALayer? {
//                    // Do Something
//                    button?.removeFromSuperlayer()
//                }
//
//            }
//        }
        
        
        //path = UIBezierPath()
        //shapeLayer = CAShapeLayer()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "toMap"
        {
            if segue.destination is SecondViewController
            {
                let vc = segue.destination as? SecondViewController
                vc?.Str = croppedImage
                vc?.t1 = t
               
            }
        }
        
        if segue.identifier == "toMapp"
        {
            if segue.destination is ThirdViewController
            {
                shapeLayer.removeFromSuperlayer()
                let vc = segue.destination as? ThirdViewController
                vc?.imgvww = croppedImage
                vc?.t1 = t
                
                
            }
        }
    }
    
}

