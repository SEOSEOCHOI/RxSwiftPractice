//
//  NumbersView.swift
//  RxSwiftPractice
//
//  Created by 최서경 on 3/27/24.
//

import UIKit

class NumbersView: BaseView {
    let number1 = UITextField()
    let number2 = UITextField()
    let number3 = UITextField()
    let divider = UIView()
    let resultLabel = UILabel()
    lazy var stackview = {
        let view = UIStackView(arrangedSubviews: [number1,
                                                  number2,
                                                  number3,
                                                  divider,
                                                  resultLabel])
        view.axis = .vertical
        view.spacing = 3
        view.alignment = .center
        view.distribution = .equalSpacing
        return view
    }()
    override func configureHierarchy() {
        addSubview(stackview)
    }
    override func configureLayout() {
        stackview.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(150)
        }
        divider.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        number1.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        number2.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        number3.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        resultLabel.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
    }
    override func configureView() {
        backgroundColor = .white
        [number1,
         number2,
         number3,
        divider].forEach {
            $0.backgroundColor = .blue
        }
        resultLabel.textAlignment = .right
        stackview.backgroundColor = .lightGray
    }
}
