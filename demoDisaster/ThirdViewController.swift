//
//  ThirdViewController.swift
//  demoDisaster
//
//  Created by Aditi on 10/4/18.
//  Copyright © 2018 AditiSeasia Infotech. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var imgvw: UIImageView!
    var imgvww:UIImage!
    var t1 = [CGPoint]()
    let strokeColor:UIColor = UIColor.blue
    
    //Update this for path line width
    let lineWidth:CGFloat = 2.0
    
    //Path to draw while touch events occur
    var path = UIBezierPath()
    
    //ShapeLayer of cropped view
    var shapeLayer = CAShapeLayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        imgvw.layer.addSublayer(shapeLayer)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func alert2(_ sender: Any) {
        
       
        chngecolor.append(contentsOf: [t1])
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
