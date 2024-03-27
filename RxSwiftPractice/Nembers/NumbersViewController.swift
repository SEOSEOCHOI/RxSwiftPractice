//
//  ViewController.swift
//  RxSwiftPractice
//
//  Created by 최서경 on 3/27/24.
//

import UIKit
import RxSwift
import RxCocoa

class NumbersViewController: UIViewController {
    let mainView = NumbersView()
    override func loadView() {
        self.view = mainView
    }
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         < Oeprator >
         combineLatest:
         map: 
         Oprator: 이벤트를 전달하는 것에 있어 간편한 핸들링 제공
         */
        
        Observable
            .combineLatest(mainView.number1.rx.text.orEmpty,
                           mainView.number2.rx.text.orEmpty,
                           mainView.number3.rx.text.orEmpty) { textValue1, textValue2, textValue3 -> Int in
                return (Int(textValue1) ?? 0) + (Int(textValue2) ?? 0) + (Int(textValue3) ?? 0)
            }
            .map { $0.description }
            .bind(to: mainView.resultLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
/*
 // Merges the specified observable sequences into one observable sequence by using the selector function whenever any of the observable sequences produces an element.
 
 - seealso: [combineLatest operator on reactivex.io](http://reactivex.io/documentation/operators/combinelatest.html)

 - parameter resultSelector: Function to invoke whenever any of the sources produces an element.
 - returns: An observable sequence containing the result of combining elements of the sources using the specified result selector function.
 
 public static func combineLatest<O1: ObservableType, O2: ObservableType, O3: ObservableType>
     (_ source1: O1, _ source2: O2, _ source3: O3, resultSelector: @escaping (O1.Element, O2.Element, O3.Element) throws -> Element)
         -> Observable<Element> {
     return CombineLatest3(
         source1: source1.asObservable(), source2: source2.asObservable(), source3: source3.asObservable(),
         resultSelector: resultSelector
     )
 }
}
  
 mainView.number1 -> UITextField
 mainView.number1.rx -> Reactive<UITextField>
 mainView.number1.rx.text -> ControlProperty<String?>
 mainView.number1.rx.text.orEmpty -> ControlProperty<String>
 */

