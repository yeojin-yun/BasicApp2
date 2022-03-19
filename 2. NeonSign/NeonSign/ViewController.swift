//
//  ViewController.swift
//  NeonSign
//
//  Created by 순진이 on 2022/03/16.
//

import UIKit

class ViewController: UIViewController{


    @IBOutlet weak var mainLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToNextVC" {
            let desinationVC = segue.destination as! SecondViewController
            desinationVC.delegate = self
        }
    }

}

extension ViewController: dataDelegate {
    func messageEdit(message: String) {
        mainLabel.text = message
    }
    func getBGColor(color: UIColor) {
        view.backgroundColor = color
    }
    
    func getTextColor(color: UIColor) {
        mainLabel.textColor = color
    }
}
