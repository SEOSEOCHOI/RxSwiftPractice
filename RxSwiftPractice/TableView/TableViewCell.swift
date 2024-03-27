//
//  TableViewCell.swift
//  RxSwiftPractice
//
//  Created by 최서경 on 3/27/24.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    let label = UILabel()
    let button = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "star"), for: .normal)
        return view
    } ()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(button)
        
        label.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(4)
            make.height.equalTo(35)
            make.leading.equalToSuperview().inset(8)
        }
        button.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(4)
            make.size.equalTo(35)
            make.leading.equalTo(label.snp.trailing).offset(4)
            make.trailing.equalToSuperview().inset(8)
        }
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
