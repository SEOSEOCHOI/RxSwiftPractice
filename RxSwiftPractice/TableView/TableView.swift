//
//  TableView.swift
//  RxSwiftPractice
//
//  Created by 최서경 on 3/27/24.
//

import UIKit
import SnapKit

class TableView: BaseView {
    let tableView = UITableView()
    
    override func configureHierarchy() {
        addSubview(tableView)
    }
    override func configureLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
    }
    override func configureView() {
        tableView.backgroundColor = .lightGray
    }

}
