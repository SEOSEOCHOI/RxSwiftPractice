//
//  ValidationView.swift
//  RxSwiftPractice
//
//  Created by 최서경 on 3/27/24.
//

import UIKit

class ValidationView: BaseView {
    let usernameOutlet = UITextField()
    let usernameValidOutlet = UILabel()

    let passwordOutlet = UITextField()
    let passwordValidOutlet = UILabel()

    let doSomethingOutlet = UIButton()
    
     let minimalUsernameLength = 5
     let minimalPasswordLength = 5

    
    override func configureHierarchy() {
        addSubview(usernameOutlet)
        addSubview(usernameValidOutlet)
        addSubview(passwordOutlet)
        addSubview(passwordValidOutlet)
        addSubview(doSomethingOutlet)
    }
    override func configureLayout() {
        usernameOutlet.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(12)
            make.height.equalTo(35)
            make.top.equalTo(safeAreaLayoutGuide).inset(30)
        }
        usernameValidOutlet.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(12)
            make.height.equalTo(35)
            make.top.equalTo(usernameOutlet.snp.bottom).offset(4)
        }
        passwordOutlet.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(12)
            make.height.equalTo(35)
            make.top.equalTo(usernameValidOutlet.snp.bottom).offset(4)
        }
        passwordValidOutlet.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(12)
            make.height.equalTo(35)
            make.top.equalTo(passwordOutlet.snp.bottom).offset(4)
        }
        doSomethingOutlet.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(12)
            make.height.equalTo(45)
            make.top.equalTo(passwordValidOutlet.snp.bottom).offset(4)
        }
    }
    override func configureView() {
        backgroundColor = .white
        usernameOutlet.placeholder = "이름을 입력해 주세요"
        passwordOutlet.placeholder = "비밀번호를 입력해 주세요"
        doSomethingOutlet.backgroundColor = .brown
        doSomethingOutlet.setTitle("do Something", for: .normal)
        
        usernameValidOutlet.text = "이름은 최소한 \(minimalUsernameLength)자 이상이어야 합니다"
        passwordValidOutlet.text = "비밀번호는 최소한 \(minimalUsernameLength)자 이상이어야 합니다"
    }
}
