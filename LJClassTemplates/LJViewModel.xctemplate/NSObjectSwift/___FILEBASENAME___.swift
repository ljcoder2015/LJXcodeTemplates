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
    lazy var listDriver: Driver<LJResponse<[LJProductListModel]>> = self.listVariable.asDriver()
    lazy var moreIsVariable: Driver<Bool> = self.moreVariable.asDriver()
    // MARK: input
    
    // MARK: property
    fileprivate var listVariable = Variable<LJResponse<[LJProductListModel]>>(LJResponse.Failed(LJError.EmptyError))
    fileprivate var moreVariable = Variable<Bool>(false)
    
    func getList(id: Int) {
        LJShopProvider.request(LJShopAPI.getList(id: id))
            .asObservable()
            .mapList(LJProductListModel.self)
            .subscribe(onNext: { (result) in
                self.listVariable.value = result
                if result.data?.count ?? 0 > 0 {
                    self.moreVariable.value = true
                }
                else {
                    self.moreVariable.value = false
                }
            })
            .disposed(by: disposeBag)
    }
    
}
