//
//  SecondViewController.swift
//  NeonSign
//
//  Created by 순진이 on 2022/03/16.
//

import UIKit

protocol dataDelegate {
    func messageEdit(message: String)
    func getBGColor(color: UIColor)
    func getTextColor(color: UIColor)
}

class SecondViewController: UIViewController {

    @IBOutlet weak var myTextField: UITextField!
    
    @IBOutlet weak var firstBGColor: UIButton!
    @IBOutlet weak var secondBGColor: UIButton!
    @IBOutlet weak var thirdBGColor: UIButton!
    @IBOutlet weak var forthBGColor: UIButton!
    @IBOutlet weak var fifthBGColor: UIButton!
    
    
    @IBOutlet weak var firstTextColor: UIButton!
    @IBOutlet weak var secondTextColor: UIButton!
    @IBOutlet weak var thirdTextColor: UIButton!
    @IBOutlet weak var forthTextColor: UIButton!
    @IBOutlet weak var fifthTextColor: UIButton!
    
    var delegate: dataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setColor()
    }
    
    
    @IBAction func saveBtnTapped(_ sender: UIButton) {
        let text = myTextField.text ?? ""
        self.delegate?.messageEdit(message: text)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func bGColorBtnTaaped(_ sender: UIButton) {
        self.delegate?.getBGColor(color: sender.backgroundColor ?? .black)
    }
    
    @IBAction func textColorBtnTapped(_ sender: UIButton) {
        self.delegate?.getTextColor(color: sender.backgroundColor ?? .white)
    }
    
}

//MARK: -SetColor
extension SecondViewController {
    final private func setColor() {
        setBGColor()
        setTextColor()
    }
    func setBGColor() {
        [firstBGColor, secondBGColor, thirdBGColor, forthBGColor,fifthBGColor].forEach {
            $0.layer.cornerRadius = $0.bounds.size.width * 0.5
        }
        firstBGColor.backgroundColor = MyColor.firstBGColor
        secondBGColor.backgroundColor = MyColor.secondBGColor
        thirdBGColor.backgroundColor = MyColor.thirdBGColor
        forthBGColor.backgroundColor = MyColor.forthBGColor
        fifthBGColor.backgroundColor = MyColor.fifthBGColor
    }
    
    func setTextColor() {
        [firstTextColor, secondTextColor, thirdTextColor, forthTextColor, fifthTextColor].forEach {
            $0.layer.cornerRadius = $0.bounds.size.width * 0.5
        }
        firstTextColor.backgroundColor = MyColor.firstTextColor
        secondTextColor.backgroundColor = MyColor.secondTextColor
        thirdTextColor.backgroundColor = MyColor.thirdTextColor
        forthTextColor.backgroundColor = MyColor.forthTextColor
        fifthTextColor.backgroundColor = MyColor.fifthTextColor
    }
}
