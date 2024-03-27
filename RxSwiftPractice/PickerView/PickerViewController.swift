//
//  PickerViewController.swift
//  RxSwiftPractice
//
//  Created by 최서경 on 3/28/24.
//

import UIKit
import RxSwift
import RxCocoa

class PickerViewController: UIViewController {
    let mainView = PickerView()
    override func loadView() {
        self.view = mainView
    }
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /**
         Subscribes to observable sequence using custom binder function and final parameter passed to binder function
         after `self` is passed.
         
         public func bind<R1, R2>(to binder: Self -> R1 -> R2, curriedArgument: R1) -> R2 {
         return binder(self)(curriedArgument)
         }
         
         - parameter binder: Function used to bind elements from `self`.
         - parameter curriedArgument: Final argument passed to `binder` to finish binding process.
         - returns: Object representing subscription.
         */
        /*
         public func bind<R1, R2>(to binder: (Self) -> (R1) -> R2, curriedArgument: R1) -> R2 {
         binder(self)(curriedArgument)
         }
         
         */
        
        Observable.just([1, 2, 3])
            .bind(to: mainView.pickerView1.rx.itemTitles){ item, b  in
                print("item \(item) | b \(b)")
                return "\(item)"
            }.disposed(by: disposeBag)
        
        mainView.pickerView1.rx.modelSelected(Int.self)
            .subscribe(onNext: { models in
                print("pickerView1 selected: \(models)")
            })
            .disposed(by: disposeBag)
        
        
        Observable.just([1, 2, 3])
            .bind(to: mainView.pickerView2.rx.itemAttributedTitles){ a, b in
                return NSAttributedString(string: "a\(a)| b\(b)",
                                          attributes: [.backgroundColor : UIColor.green,
                                                       .foregroundColor : UIColor.orange,
                                                       .underlineStyle : NSUnderlineStyle.double.rawValue])
            }
            .disposed(by: disposeBag)
        
        mainView.pickerView2.rx.modelSelected(Int.self)
            .subscribe(onNext: { models in
                print("pickerView2 selected: \(models)")
            })
            .disposed(by: disposeBag)
        
        // Observable<[UIColor]>: Int,arg: UIColor,arg: UIView
        Observable.just([UIColor.brown, UIColor.gray, UIColor.green])
            .bind(to: mainView.pickerView3.rx.items) { a, item, b in 
                
                print("a \(a) | item \(item) | b \(b)")
                let view = UIView()
                view.backgroundColor = item
                return view
            }
            .disposed(by: disposeBag)
        
        mainView.pickerView3.rx.modelSelected(UIColor.self)
            .subscribe(onNext: { models in
                print("pickerView3 selected: \(models)")
            })
            .disposed(by: disposeBag)
    }
    
    
}
