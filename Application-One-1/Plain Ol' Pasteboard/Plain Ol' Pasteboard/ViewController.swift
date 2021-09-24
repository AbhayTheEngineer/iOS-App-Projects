//
//  ViewController.swift
//  Plain Ol' Pasteboard
//
//  Created by Abhay Agarwal on 23/09/2021.
//

import UIKit

class ViewController: UIViewController {
    
    let DATA_KEY = "data_key"
    
    @IBOutlet weak var textView: UITextView!
    
    var pastedString: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let loadedString = UserDefaults.standard.stringArray(forKey: DATA_KEY){
            pastedString.append(contentsOf: loadedString)
        }
        showText()
    }
    
    func addText(){
        guard let text = UIPasteboard.general.string, !pastedString.contains(text) else{
            return
        }
        pastedString.append(text)
        
        UserDefaults.standard.set(pastedString,forKey: DATA_KEY)
        showText()
    }
    
    func showText(){
        textView.text = ""
        for str in pastedString{
            textView.text.append("\(str)\n\n")
        }
    }

    @IBAction func trashPressed(_ sender: Any) {
        
        pastedString.removeAll()
        textView.text = ""
        UserDefaults.standard.removeObject(forKey: DATA_KEY)
    }
    
}

