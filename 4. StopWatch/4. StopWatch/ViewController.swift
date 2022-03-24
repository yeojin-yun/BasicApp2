//
//  ViewController.swift
//  4. StopWatch
//
//  Created by 순진이 on 2022/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    let mainLbl = UILabel() // 시간을 표시할 레이블
    let lapResetButton = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 80)) // 랩&재설정 버튼
    let startStopButton = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 80)) // 시작&중단 버튼
    let tableView = UITableView() // 랩 시간을 기록할 테이블 뷰
    
    var testArray = ["1", "2", "3", "4", "5", "6", "7", "8"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configureUI()
        setTableView()
    }
    
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

//MARK: - Button Event
extension ViewController {
    @objc func leftBtnTapped(_ sender: UIButton) {
        
    }
    @objc func rightBtnTapped(_ sender: UIButton) {
        
    }
}

//MARK: -UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UITableViewCell
        //cell.contentView.backgroundColor = .black
        cell.textLabel?.textColor = .white
        cell.textLabel?.text = testArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .black
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
        [mainLbl].forEach {
            $0.text = "00:00:00"
            $0.textColor = .white
            $0.font = UIFont.systemFont(ofSize: 80)
            $0.textAlignment = .center
        }
        
        [lapResetButton].forEach {
            $0.setTitle("랩", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = UIColor(red: 0.66, green: 0.66, blue: 0.66, alpha: 0.70)
            $0.layer.cornerRadius = $0.bounds.size.width * 0.5
            $0.layer.borderWidth = 2
            $0.layer.borderColor = CGColor.init(red: 0.66, green: 0.66, blue: 0.66, alpha: 1.00)
        }
        
        [startStopButton].forEach {
            $0.setTitle("시작", for: .normal)
            $0.setTitleColor(.green, for: .normal)
            $0.backgroundColor = UIColor(red: 0.00, green: 1.00, blue: 0.00, alpha: 0.40)
            $0.layer.cornerRadius = $0.bounds.size.width / 2
//            $0.clipsToBounds = true
//            $0.layer.masksToBounds = true
            $0.layer.borderWidth = 2
            $0.layer.borderColor = CGColor.init(red: 0.00, green: 1.00, blue: 0.00, alpha: 1.00)
        }
        
        tableView.backgroundColor = .black
        tableView.sectionIndexBackgroundColor = .black
    }
    
    
    final private func addTarget() {
        lapResetButton.addTarget(self, action: #selector(leftBtnTapped(_:)), for: .touchUpInside)
        startStopButton.addTarget(self, action: #selector(rightBtnTapped(_:)), for: .touchUpInside)
    }
    
    
    final private func setConstraints() {
        [mainLbl, lapResetButton, startStopButton, tableView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            mainLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            mainLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            lapResetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lapResetButton.topAnchor.constraint(equalTo: mainLbl.bottomAnchor, constant: 100),
            lapResetButton.widthAnchor.constraint(equalToConstant: 80),
            lapResetButton.heightAnchor.constraint(equalToConstant: 80),
            
            
            startStopButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            startStopButton.topAnchor.constraint(equalTo: lapResetButton.topAnchor),
            startStopButton.widthAnchor.constraint(equalToConstant: 80),
            startStopButton.heightAnchor.constraint(equalToConstant: 80),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.topAnchor.constraint(equalTo: startStopButton.bottomAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
            
        ])
        
    }
}
