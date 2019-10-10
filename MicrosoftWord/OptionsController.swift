//
//  OptionsController.swift
//  MicrosoftWord
//
//  Created by RTC-HN154 on 10/9/19.
//  Copyright © 2019 RTC-HN154. All rights reserved.
//

import UIKit
protocol OptionDelegate {
    func setColor(_ colorName: UIColor)
}

class OptionsController: UIViewController {

    @IBOutlet weak var currentSize: UITextField!
    @IBOutlet weak var currentFontName: UITextField!
    @IBOutlet weak var currentAlign: UILabel!
    @IBOutlet weak var currentColor: UIView!
    
    var delegate: OptionDelegate?
    var colorTextLabel: String?
    var option: OptionFont?
    var completion: ((_ para1: String, _ para2: String ) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentFontName.text = option?.fontName
        currentSize.text = String(option?.size ?? 14)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let option = OptionFont.shared
        option.size = Int(currentSize.text!)
        option.fontName = currentFontName.text
        
    }

    @IBAction func selectedColor(_ sender: UIButton) {
        if let color = sender.backgroundColor {
            currentColor.backgroundColor = color
            delegate?.setColor(color)
        }
    }
    @IBAction func selectedSystemFont(_ sender: UIButton) {
        currentAlign.text = sender.titleLabel?.text
        let dic = ["Align": sender.tag - 100]
        NotificationCenter.default.post(name: Notification.Name("Align"), object: nil, userInfo: dic)
        
        var align = ""
                switch sender.tag {
                case 100:
                    align = "Left"
                case 101:
                    align = "Center"
                case 102:
                    align = "Right"
                default:
                    break
                }
                currentAlign.text = align

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
