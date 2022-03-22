//
//  ViewController.swift
//  Calculate
//
//  Created by 순진이 on 2022/03/18.
//

import UIKit

class ViewController: UIViewController {
    
    private var isFinishedTypingNumber = true
    //private : 다른 클래스에서 접근 불가능 (해당 스코프에서만 접근 가능)
    
    private var calculator = CalculateLogic()
    
    private var displayValue: Double {
        get {
            guard let safeDouble = Double(resultLbl.text!) else { fatalError("Cannot convert String to Double")}
            return safeDouble
        }
        set {
            resultLbl.text = String(newValue)
        }
    }
    
    
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
    // 1, 2, 3, 4, 5, 6, 7, 8, 9, 0, . 버튼에 관한 이벤트
    @objc private func numberPadTapped(_ sender: UIButton) {
        
        //현재 버튼의 text가 resultLbl에 나타나도록
        if let numValue = sender.currentTitle { //sender.currentTitle가 옵셔널 값이라 바인딩 필요
            if isFinishedTypingNumber { //isFinishedTypingNumber의 기본값이 true
                resultLbl.text = numValue //결과 레이블에 누른 값을 표시하고
                isFinishedTypingNumber = false //isFinishedTypingNumber의 값을 다시 false로 설정 => 이제부터는 else 구문이 실행됨
                print("if 구문 출력, \(isFinishedTypingNumber)")
            } else { //위에서 false로 설정했기 때문에 이제 아래 구문만 계속 실행됨
                print("else 구문 출력, \(isFinishedTypingNumber)")
                if numValue == "." { //.가 1번 이상 눌리지 못하도록 설정
                    
                    if floor(displayValue) != displayValue { // 누른 값(displayValue)의 소수점을 버린 값 != 누른 값이면
                        print("floor함수 = \(floor(displayValue))")
                        print("\(displayValue)")
                        return // floor 함수가 종료되고, 레이블에 추가하는 함수가 작동
                    }
                    
                }
                // 누른 버튼의 타이틀이 Label에 누적되도록
                resultLbl.text = resultLbl.text! + numValue
                print("추가추가")
            }
        }
        
        
        
    }
    //"AC", "+/-", "%", "+", "-", "x", "÷"
    @objc private func calculateBtnTapped(_ sender: UIButton) {
        isFinishedTypingNumber = true

        calculator.setNumber(displayValue)
        if let calcalutaMethod = sender.currentTitle {
            print(calcalutaMethod)
            if let result = calculator.calculate(symbol: calcalutaMethod) { displayValue = result //set구문 실행 -> resultLbl.text = String(newValue)
            }
             
        }
    }
    
    
    @objc private func allClearBtnTapped(_ sender: UIButton) {
        
    }
    @objc private func plusMinusBtnTapped(_ sender: UIButton) {
        
    }
    @objc private func percentageBtnTapped(_ sender: UIButton) {
        
    }
    @objc private func decimalPointBtnTapped(_ sender: UIButton) {
        
    }
    @objc private func divideBtnTapped(_ sender: UIButton) {

    }
    @objc private func multiplyBtnTapped(_ sender: UIButton) {
        
    }
    @objc private func subtractBtnTapped(_ sender: UIButton) {
        
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
        [allClearBtn, plusMinusBtn, percentageBtn].forEach {
            $0.addTarget(self, action: #selector(calculateBtnTapped(_:)), for: .touchUpInside)
        }

        [oneBtn, twoBtn, threeBtn, fourBtn, fiveBtn, sixBtn, sevenBtn, eightBtn, nineBtn, zeroBtn, decimalPointBtn].forEach {
            $0.addTarget(self, action: #selector(numberPadTapped(_:)), for: .touchUpInside)
        }

        divideBtn.addTarget(self, action: #selector(calculateBtnTapped(_:)), for: .touchUpInside)
        multiplyBtn.addTarget(self, action: #selector(calculateBtnTapped(_:)), for: .touchUpInside)
        subtractBtn.addTarget(self, action: #selector(calculateBtnTapped(_:)), for: .touchUpInside)
        addBtn.addTarget(self, action: #selector(calculateBtnTapped(_:)), for: .touchUpInside)
        resultBtn.addTarget(self, action: #selector(calculateBtnTapped(_:)), for: .touchUpInside)
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
