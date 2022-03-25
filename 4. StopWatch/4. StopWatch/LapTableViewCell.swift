//
//  LapTableViewCell.swift
//  4. StopWatch
//
//  Created by 순진이 on 2022/03/25.
//

import UIKit

class LapTableViewCell: UITableViewCell {
    
    static let identifier = "MyLapCell"
    
    var mainTitleLabel = UILabel()
    var timeLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    func setUI() {
        [mainTitleLabel, timeLabel].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.textColor = .white
        }
        
        mainTitleLabel.textAlignment = .left
        timeLabel.textAlignment = .right
        
        
        NSLayoutConstraint.activate([
            mainTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainTitleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            timeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            timeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
