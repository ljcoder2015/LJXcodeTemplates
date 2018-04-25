//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//  GitHub: https://github.com/ljcoder2015
//

import UIKit
#if !RX_NO_MODULE
    import RxSwift
    import RxCocoa
#endif
import Moya

class ___FILEBASENAMEASIDENTIFIER___: LJBaseViewModel {
    // MARK: output
    lazy var listDriver: Driver<LJResponse<<#Model#>>> = self.listVariable.asDriver()
    lazy var moreDriver: Driver<Bool> = self.moreVariable.asDriver()

    // MARK: Variable
    fileprivate var listVariable = Variable<LJResponse<<#Model#>>>(LJResponse.Failed(LJError.EmptyError))
    fileprivate var moreVariable = Variable<Bool>(false)
    
}

// MARK: Action
extension ___FILEBASENAMEASIDENTIFIER___ {
    func fetchList() {
        <#Provider#>.rx.request(<#API#>)
            .asObservable()
            .mapList(<#Model#>.self)
            .subscribe(onNext: { (result) in
                self.listVariable.value = result
            })
            .disposed(by: disposeBag)
    }
}
