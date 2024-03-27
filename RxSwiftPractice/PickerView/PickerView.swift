//
//  Picker.swift
//  RxSwiftPractice
//
//  Created by 최서경 on 3/28/24.
//

import UIKit

class PickerView: BaseView {
    let pickerView1 = UIPickerView()
    let pickerView2 = UIPickerView()
    let pickerView3 = UIPickerView()

    override func configureHierarchy() {
        [pickerView1, pickerView2, pickerView3].forEach {
            addSubview($0)
        }
    }
    override func configureLayout() {
        pickerView1.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(30)
            make.height.equalTo(200)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        pickerView2.snp.makeConstraints { make in
            make.top.equalTo(pickerView1.snp.bottom).offset(30)
            make.height.equalTo(200)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        pickerView3.snp.makeConstraints { make in
            make.top.equalTo(pickerView2.snp.bottom).offset(30)
            make.height.equalTo(200)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
    }
    override func configureView() {
        super.configureView()
    }

}
