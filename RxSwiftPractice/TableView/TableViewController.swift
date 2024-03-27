//
//  TableViewController.swift
//  RxSwiftPractice
//
//  Created by 최서경 on 3/27/24.
//

import UIKit
import RxSwift
import RxCocoa

class TableViewController: UIViewController,UITableViewDelegate {
    let mainView = TableView()
    override func loadView() {
        self.view = mainView
    }
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        /*
         < Operator >
         just
         */
        
        let items = Observable.just(
            (0..<20).map { "\($0)" }
        )
        
        items
            .bind(to: mainView.tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)) { (row, element, cell) in
                cell.textLabel?.text = "\(element) @ row \(row)"
                cell.accessoryType = .detailButton
            }
            .disposed(by: disposeBag)
        
        mainView.tableView.rx
            .modelSelected(String.self)
            .subscribe(onNext:  { value in
                self.showAlert(message: "Tapped \(value)")
            })
            .disposed(by: disposeBag)

        mainView.tableView.rx
            .itemAccessoryButtonTapped
            .subscribe(onNext: { indexPath in
                self.showAlert(message: "Tapped Detail @ \(indexPath.section),\(indexPath.row)")
            })
            .disposed(by: disposeBag)

    }
    func showAlert(message: String) {
        let alert = UIAlertController(
            title: "Good!",
            message: message,
            preferredStyle: .alert
        )
        let defaultAction = UIAlertAction(title: "확인",
                                          style: .default,
                                          handler: nil)
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
    }

}
