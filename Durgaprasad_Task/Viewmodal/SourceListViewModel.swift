//
//  SourceListViewModel.swift


import Foundation

class SourceListViewModel : NSObject {
    
    @objc dynamic private(set) var sourceViewModels :[ModalList] = [ModalList]()
    @objc dynamic private(set) var title  = ""
    private var token :NSKeyValueObservation?
    var bindToSourceViewModels :(() -> ()) = {  }
    private var webservice :Webservice

    init(webservice :Webservice) {
        
        self.webservice = webservice
        super.init()
        // call populate sources
        token = self.observe(\.sourceViewModels) { _,_ in
            self.bindToSourceViewModels()
        }
        populateSources()
    }
    
    func invalidateObservers() {
        self.token?.invalidate()
    }
    
    func populateSources() {
        
        self.webservice.loadSources() { [unowned self] sources,title  in
                self.sourceViewModels += sources
                self.title = title

        }
    }
    
}
