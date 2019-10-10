//
//  ViewController.swift
//  MicrosoftWord
//
//  Created by RTC-HN154 on 10/9/19.
//  Copyright © 2019 RTC-HN154. All rights reserved.
//

import UIKit

class ViewController: UIViewController, OptionDelegate {
    

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.textColor = UIColor.black
        NotificationCenter.default.addObserver(self, selector: #selector(alignment(notification:)), name: Notification.Name("Align"), object: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func alignment(notification: NSNotification) {
        if let info = notification.userInfo {
            if let value = info["Align"] {
                textView.textAlignment = NSTextAlignment(rawValue: value as! Int)!
                
            } else { print("tag sai cmnr kìa")}
        }
    }
    func setColor(_ colorName: UIColor) {
        textView.textColor = colorName
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let option = OptionFont.shared
        if let size = option.size {
            if let name = option.fontName {
                textView.font = UIFont(name: name, size: CGFloat(size))
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! OptionsController
        vc.option = OptionFont(size: Int((textView.font?.pointSize)!), fontName: (textView.font?.fontName)!, color: textView.textColor!, alignment: textView.textAlignment.rawValue)
        vc.delegate = self
    }
}

