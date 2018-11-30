//
//  SecondViewController.swift
//  demoDisaster
//
//  Created by Aditi on 10/4/18.
//  Copyright © 2018 AditiSeasia Infotech. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var imgSecond: UIImageView!
    var t1 =7567 [CGPoint]()
    var Str:UIImage!
    let strokeColor:UIColor = UIColor.blue
    
    //Update this for path line width
    let lineWidth:CGFloat = 2.0
    
    //Path to draw while touch events occur
    var path = UIBezierPath()
    
    //ShapeLayer of cropped view
    var shapeLayer = CAShapeLayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.imgSecond.image = Str
         path.move(to: t1[0])
        for m in 1...t1.count-1{
            path.addLine(to: t1[m])
            print(t1[m])
            addNewPathToImage()
        }
        // Do any additional setup after loading the view.
    }
    
    func addNewPathToImage(){
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = lineWidth
        imgSecond.layer.addSublayer(shapeLayer)
    }

    @IBAction func alert(_ sender: Any) {
        
      
        chngecolor.append(contentsOf: [t1])
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
