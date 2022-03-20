//
//  ViewController.swift
//  Calculate
//
//  Created by 순진이 on 2022/03/18.
//

import UIKit

class ViewController: UIViewController {
    
    var preStringArray: [String] = []
    var preStringNumber: String = "0"
    var preStringToInt: Int = 0
    
    
    let resultLbl = UILabel()
    let allClearBtn = MyButton("AC", .lightGray, .black)
    let plusMinusBtn = MyButton("+/-", .lightGray, .black)
    let percentageBtn = MyButton("%", .lightGray, .black)
    
    let oneBtn = MyButton("1")
    let twoBtn = MyButton("2")
    let threeBtn = MyButton("3")
    let fourBtn = MyButton("4")
    let fiveBtn = MyButton("5")
    let sixBtn = MyButton("6")
    let sevenBtn = MyButton("7")
    let eightBtn = MyButton("8")
    let nineBtn = MyButton("9")
    let zeroBtn = MyButton("0")
    let decimalPointBtn = MyButton(".")
    
    let divideBtn = MyButton("÷", .orange)
    let multiplyBtn = MyButton("x", .orange)
    let subtractBtn = MyButton("-", .orange)
    let addBtn = MyButton("+", .orange)
    let resultBtn = MyButton("=", .orange)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configureUI()
        
    }
}

//MARK: -Button Event
extension ViewController {
    @objc private func allClearBtnTapped(_ sender: UIButton) {
        
    }
    @objc private func plusMinusBtnTapped(_ sender: UIButton) {
        
    }
    @objc private func percentageBtnTapped(_ sender: UIButton) {
        
    }
    //숫자 버튼을 누르면 숫자가 previousArray로 들어가고 그걸 다시 stringNumber값으로 보냄
    @objc private func numberPadTapped(_ sender: UIButton) {
        if let currentInt = sender.currentTitle {
            preStringArray.append(currentInt)
        }
        preStringNumber = preStringArray.joined()
        print(preStringNumber)
        resultLbl.text = preStringNumber
    }

    @objc private func decimalPointBtnTapped(_ sender: UIButton) {
        
    }
    @objc private func divideBtnTapped(_ sender: UIButton) {

    }
    @objc private func multiplyBtnTapped(_ sender: UIButton) {
        
    }
    @objc private func subtractBtnTapped(_ sender: UIButton) {
        
    }
    @objc private func addBtnTapped(_ sender: UIButton) {
        preStringToInt = Int(preStringNumber) ?? 0
        let preStrToInt = Int(preStringNumber) ?? 0
        preStringArray = []
        print(preStrToInt)
    }
    @objc private func resultBtnTapped(_ sender: UIButton) {
        
    }
    
}


//MARK: -UI
extension ViewController {
    final private func configureUI() {
        setAttributes()
        addTarget()
        setConstraints()
    }
    
    final private func setAttributes() {
        resultLbl.textColor = .white
        resultLbl.font = UIFont.boldSystemFont(ofSize: 50)
        resultLbl.textAlignment = .right
        resultLbl.baselineAdjustment = .alignBaselines
    }
    
    final private func addTarget() {
        allClearBtn.addTarget(self, action: #selector(allClearBtnTapped(_:)), for: .touchUpInside)
        plusMinusBtn.addTarget(self, action: #selector(plusMinusBtnTapped(_:)), for: .touchUpInside)
        percentageBtn.addTarget(self, action: #selector(percentageBtnTapped(_:)), for: .touchUpInside)
        
        
        oneBtn.addTarget(self, action: #selector(numberPadTapped(_:)), for: .touchUpInside)
        twoBtn.addTarget(self, action: #selector(numberPadTapped(_:)), for: .touchUpInside)
        threeBtn.addTarget(self, action: #selector(numberPadTapped(_:)), for: .touchUpInside)
        fourBtn.addTarget(self, action: #selector(numberPadTapped(_:)), for: .touchUpInside)
        fiveBtn.addTarget(self, action: #selector(numberPadTapped(_:)), for: .touchUpInside)
        sixBtn.addTarget(self, action: #selector(numberPadTapped(_:)), for: .touchUpInside)
        sevenBtn.addTarget(self, action: #selector(numberPadTapped(_:)), for: .touchUpInside)
        eightBtn.addTarget(self, action: #selector(numberPadTapped(_:)), for: .touchUpInside)
        nineBtn.addTarget(self, action: #selector(numberPadTapped(_:)), for: .touchUpInside)
        zeroBtn.addTarget(self, action: #selector(numberPadTapped(_:)), for: .touchUpInside)
        
        
        decimalPointBtn.addTarget(self, action: #selector(decimalPointBtnTapped(_:)), for: .touchUpInside)
        divideBtn.addTarget(self, action: #selector(divideBtnTapped(_:)), for: .touchUpInside)
        multiplyBtn.addTarget(self, action: #selector(multiplyBtnTapped(_:)), for: .touchUpInside)
        subtractBtn.addTarget(self, action: #selector(subtractBtnTapped(_:)), for: .touchUpInside)
        addBtn.addTarget(self, action: #selector(addBtnTapped(_:)), for: .touchUpInside)
        resultBtn.addTarget(self, action: #selector(resultBtnTapped(_:)), for: .touchUpInside)
    }
    
    final private func setConstraints() {
        //스택뷰 만들기 (1) - AC, +/-, %, 나누기 ⭐️수평, fillequally
        let firstStackView = UIStackView(arrangedSubviews: [allClearBtn, plusMinusBtn, percentageBtn, divideBtn])
        
        //스택뷰 만들기 (2) - 7, 8, 9, X ⭐️수평, fillequally
        let secondStackView = UIStackView(arrangedSubviews: [sevenBtn, eightBtn, nineBtn, multiplyBtn])
        
        //스택뷰 만들기 (3) - 4, 5, 6, - ⭐️수평, fillequally
        let thirdStackView = UIStackView(arrangedSubviews: [fourBtn, fiveBtn, sixBtn, subtractBtn])
        
        //스택뷰 만들기 (4) - 1, 2, 3, + ⭐️수평, fillequally
        let forthStackView = UIStackView(arrangedSubviews: [oneBtn, twoBtn, threeBtn, addBtn])
        
        //스택뷰 만들기 (5) - 0, ., = ⭐️수평, fillequally
        let fifthStackView = UIStackView(arrangedSubviews: [zeroBtn, decimalPointBtn, resultBtn])
        fifthStackView.axis = .horizontal
        view.addSubview(fifthStackView)
        fifthStackView.translatesAutoresizingMaskIntoConstraints = false
        fifthStackView.spacing = 10

        [firstStackView, secondStackView, thirdStackView, forthStackView].forEach {
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.spacing = 10
        }
        
        view.addSubview(resultLbl)
        resultLbl.translatesAutoresizingMaskIntoConstraints = false
        
        //오토레이아웃 잡기
        NSLayoutConstraint.activate([
            
            firstStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            firstStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            firstStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            firstStackView.heightAnchor.constraint(equalToConstant: 80),
            //oneBtn.widthAnchor.constraint(equalToConstant: 90),
            //oneBtn.heightAnchor.constraint(equalToConstant: 90),
            
            resultLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            resultLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            resultLbl.bottomAnchor.constraint(equalTo: firstStackView.topAnchor, constant: 100),
            
            secondStackView.topAnchor.constraint(equalTo: firstStackView.bottomAnchor, constant: 10),
            secondStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            secondStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            secondStackView.heightAnchor.constraint(equalTo: firstStackView.heightAnchor),
            
            thirdStackView.topAnchor.constraint(equalTo: secondStackView.bottomAnchor, constant: 10),
            thirdStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            thirdStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            thirdStackView.heightAnchor.constraint(equalTo: firstStackView.heightAnchor),
            
            forthStackView.topAnchor.constraint(equalTo: thirdStackView.bottomAnchor, constant: 10),
            forthStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            forthStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            forthStackView.heightAnchor.constraint(equalTo: firstStackView.heightAnchor),
            
            fifthStackView.topAnchor.constraint(equalTo: forthStackView.bottomAnchor, constant: 10),
            fifthStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            fifthStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            fifthStackView.heightAnchor.constraint(equalTo: firstStackView.heightAnchor),
            decimalPointBtn.widthAnchor.constraint(equalToConstant: 80),
            decimalPointBtn.heightAnchor.constraint(equalToConstant: 80),
            resultBtn.widthAnchor.constraint(equalToConstant: 80),
            resultBtn.heightAnchor.constraint(equalToConstant: 80),
        ])
    }
}

//
//    @objc private func oneTapped(_ sender: UIButton) {
//        if let currentInt = sender.currentTitle {
//            previousArray.append(currentInt)
//        }
//        let newString = previousArray.joined()
//        print(newString)
//        resultLbl.text = previousArray.joined()
//    }
//
//    @objc private func twoTapped(_ sender: UIButton) {
//        if let currentInt = sender.currentTitle {
//            previousArray.append(currentInt)
//        }
//        let newString = previousArray.joined()
//        print(newString)
//        resultLbl.text = previousArray.joined()
//    }
//
//    @objc private func threeTapped(_ sender: UIButton) {
//        if let currentInt = sender.currentTitle {
//            previousArray.append(currentInt)
//        }
//        let newString = previousArray.joined()
//        print(newString)
//        resultLbl.text = previousArray.joined()
//    }
//
//    @objc private func fourTapped(_ sender: UIButton) {
//        if let currentInt = sender.currentTitle {
//            previousArray.append(currentInt)
//        }
//        let newString = previousArray.joined()
//        print(newString)
//        resultLbl.text = previousArray.joined()
//    }
//
//    @objc private func fiveTapped(_ sender: UIButton) {
//        if let currentInt = sender.currentTitle {
//            previousArray.append(currentInt)
//        }
//        let newString = previousArray.joined()
//        print(newString)
//        resultLbl.text = previousArray.joined()
//    }
//
//    @objc private func sixTapped(_ sender: UIButton) {
//        if let currentInt = sender.currentTitle {
//            previousArray.append(currentInt)
//        }
//        let newString = previousArray.joined()
//        print(newString)
//        resultLbl.text = previousArray.joined()
//    }
//
//    @objc private func sevenTapped(_ sender: UIButton) {
//        if let currentInt = sender.currentTitle {
//            previousArray.append(currentInt)
//        }
//        let newString = previousArray.joined()
//        print(newString)
//        resultLbl.text = previousArray.joined()
//    }
//
//    @objc private func eightTapped(_ sender: UIButton) {
//        if let currentInt = sender.currentTitle {
//            previousArray.append(currentInt)
//        }
//        let newString = previousArray.joined()
//        print(newString)
//        resultLbl.text = previousArray.joined()
//    }
//    @objc private func nineTapped(_ sender: UIButton) {
//        if let currentInt = sender.currentTitle {
//            previousArray.append(currentInt)
//        }
//        let newString = previousArray.joined()
//        print(newString)
//        resultLbl.text = previousArray.joined()
//    }
//    @objc private func zeroBtnTapped(_ sender: UIButton) {
//        if let currentInt = sender.currentTitle {
//            previousArray.append(currentInt)
//        }
//        let newString = previousArray.joined()
//        print(newString)
//        resultLbl.text = previousArray.joined()
//    }
