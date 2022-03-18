//
//  ViewController.swift
//  RandomWiseSaying
//
//  Created by 순진이 on 2022/03/15.
//

import UIKit

class ViewController: UIViewController{
    
    let mainLbl = UILabel() // "명언 생성기"
    let myView = UIView() // 연두색 배경화면
    let quoteLbl = UILabel() // 명언
    let personLbl = UILabel() // 작가
    let randomBtn = UIButton() // "오늘의 명언"버튼 (랜덤 버튼)
    
    var quoteBrain = QuoteBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()

    }

    //"오늘의 명언"버튼 (랜덤 버튼) 누르면 발생할 이벤트
    @objc func randomBtnTapped(_ sender: UIButton) {
        if let quote = quoteBrain.quoteArray.randomElement() {
            quoteLbl.text = quote.quote
            personLbl.text = quote.person
        }
    }
}

//MARK: -SetUI
extension ViewController {
    final private func configureUI(){
        setConstraints()
        setAttributes()
        addTarget()
    }
    
    
    final private func setAttributes() {
        // "명언 생성기" Attributes
        [mainLbl].forEach {
            $0.text = "명언 생성기"
            $0.textAlignment = .center
            $0.font = UIFont(name: "SongMyung-Regular", size: 30)
        }
        
        // 명언의 배경이 될 view
        [myView].forEach {
            $0.backgroundColor = MyColor.greenColor
            $0.layer.cornerRadius = 50
        }
        
        // 명언과 작가가 나올 레이블의 Attributes
        [quoteLbl, personLbl].forEach {
            $0.text = ""
            $0.textAlignment = .center
            $0.font = UIFont(name: "EastSeaDokdo-Regular", size: 30)
            $0.numberOfLines = 8
            $0.sizeToFit()
            $0.textColor = .white
        }

        //"오늘의 명언" 버튼 (랜덤 버튼)
        [randomBtn].forEach {
            $0.setTitle("오늘의 명언", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.layer.cornerRadius = 5
            $0.layer.borderWidth = 0.5
            $0.titleLabel?.font = UIFont(name: "SongMyung-Regular", size: 30)
        }
        
    }
    
    final private func addTarget() {
        randomBtn.addTarget(self, action: #selector(randomBtnTapped(_:)), for: .touchUpInside)
    }
    
    final private func setConstraints() {
        [mainLbl, myView, quoteLbl, personLbl, randomBtn].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            mainLbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            mainLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            myView.topAnchor.constraint(equalTo: mainLbl.bottomAnchor, constant: 60),
            myView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            myView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            myView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200),
            
            quoteLbl.topAnchor.constraint(equalTo: myView.topAnchor, constant: 70),
            quoteLbl.centerXAnchor.constraint(equalTo: myView.centerXAnchor),
            quoteLbl.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 20),
            quoteLbl.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -20),
            //quoteLbl.bottomAnchor.constraint(equalTo: myView.bottomAnchor, constant: -40),
            
            personLbl.bottomAnchor.constraint(equalTo: myView.bottomAnchor, constant: -70),
            personLbl.centerXAnchor.constraint(equalTo: myView.centerXAnchor),
            
            randomBtn.topAnchor.constraint(equalTo: myView.bottomAnchor, constant: 60),
            randomBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            randomBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: <#T##CGFloat#>)
            
        ])
    }
}
