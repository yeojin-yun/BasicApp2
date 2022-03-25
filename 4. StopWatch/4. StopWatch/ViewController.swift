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
    
    var lapRecordArray: [String] = []
    var lapTimeArray: [String] = []
    
    var timer = Timer()
    var counter = 1
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configureUI()
        setTableView()
    }
    
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(LapTableViewCell.self, forCellReuseIdentifier: LapTableViewCell.identifier)
    }
}

//MARK: - Button Event
extension ViewController {
    @objc func leftBtnTapped(_ sender: UIButton) {
        if sender.currentTitle == "랩" {
            let arrayCount = String(lapRecordArray.count)
            lapRecordArray.append("랩 \(arrayCount)")
            lapTimeArray.append(mainLbl.text ?? "")
            tableView.reloadData()
        }
    }
    @objc func rightBtnTapped(_ sender: UIButton) {
        //버튼을 눌렀을 때 버튼의 title이 "시작"이라면
        if sender.currentTitle == "시작" {
            //버튼의 타이틀을 "중지"로 바꾸고
            updateStartStopBtn()
            //타이머가 시작됨
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
            
        // 버튼을 눌렀을 때 버튼의 title이 "중지"라면
        } else if sender.currentTitle == "중지" {
            //타이머를 멈추고
            timer.invalidate()
            
        }
    }
    
    @objc func updateTime() {
        if counter > 0 {
            let hours = counter / 3600
            let minutes = (counter % 3600) / 60
            let seconds = (counter % 3600) % 60
            
            counter += 1
            print(counter)
            print(hours)
            print(minutes)
            print(seconds)
            mainLbl.text = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        }
    }
    
    func updateStartStopBtn() {
        startStopButton.setTitle("중지", for: .normal)
        startStopButton.setTitleColor(.red, for: .normal)
        startStopButton.backgroundColor = UIColor(red: 1.00, green: 0.00, blue: 0.00, alpha: 0.40)
        startStopButton.layer.cornerRadius = startStopButton.bounds.size.width * 0.5
        startStopButton.layer.borderWidth = 2
        startStopButton.layer.borderColor = CGColor.init(red: 1.00, green: 0.00, blue: 0.00, alpha: 1.00)
    }
}

//MARK: -UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lapRecordArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LapTableViewCell.identifier, for: indexPath) as! LapTableViewCell
        cell.mainTitleLabel.text = lapRecordArray[indexPath.row]
        cell.timeLabel.text = lapTimeArray[indexPath.row]
        return cell
    }
    
    //테이블뷰 셀의 display에 관한 메서드
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
