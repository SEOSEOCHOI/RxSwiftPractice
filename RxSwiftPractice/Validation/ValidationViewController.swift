//
//  ValidationViewController.swift
//  RxSwiftPractice
//
//  Created by 최서경 on 3/27/24.
//

import UIKit
import RxSwift
import RxCocoa


class ValidationViewController: UIViewController {
    let mainView = ValidationView()
    override func loadView() {
        self.view = mainView
    }
    
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        /*
         < Operator >
         - map
         
         ❓
         share(replay: 1)
         */
        super.viewDidLoad()
        let usernameValid = mainView.usernameOutlet.rx.text.orEmpty
            .map { $0.count > self.mainView.minimalUsernameLength }
            .share(replay: 1) // 여기까진 Observable...?
        let passwordValid = mainView.passwordOutlet.rx.text.orEmpty
            .map { $0.count >= self.mainView.minimalPasswordLength }
            .share(replay: 1)

        let everythingValid = Observable.combineLatest(usernameValid, passwordValid) { $0 && $1 }
            .share(replay: 1)
        
        usernameValid
            .bind(to: mainView.passwordOutlet.rx.isEnabled)
            .disposed(by: disposeBag)

        usernameValid
            .bind(to: mainView.usernameValidOutlet.rx.isHidden)
            .disposed(by: disposeBag)

        passwordValid
            .bind(to: mainView.passwordValidOutlet.rx.isHidden)
            .disposed(by: disposeBag)

        everythingValid
            .bind(to: mainView.doSomethingOutlet.rx.isEnabled)
            .disposed(by: disposeBag)

        mainView.doSomethingOutlet.rx.tap
            .subscribe(onNext: {  [weak self] _ in
                guard let self = self else { return }
                self.showAlert()
            })
            .disposed(by: disposeBag)
    }

    func showAlert() {
        let alert = UIAlertController(
            title: "Good!",
            message: "짱!",
            preferredStyle: .alert
        )
        let defaultAction = UIAlertAction(title: "확인",
                                          style: .default,
                                          handler: nil)
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
    }


}
