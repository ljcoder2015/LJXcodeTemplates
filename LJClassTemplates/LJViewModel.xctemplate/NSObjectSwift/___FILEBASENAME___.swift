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
    lazy var moreIsVariable: Driver<Bool> = self.moreVariable.asDriver()
    // MARK: input
    
    // MARK: property
    fileprivate var listVariable = Variable<LJResponse<<#Model#>>>(LJResponse.Failed(LJError.EmptyError))
    fileprivate var moreVariable = Variable<Bool>(false)
    
    func getList(id: Int) {
        <#Provider#>.request(<#API#>)
            .asObservable()
            .mapList(<#Model#>.self)
            .subscribe(onNext: { (result) in
                self.listVariable.value = result
            })
            .disposed(by: disposeBag)
    }
    
}
