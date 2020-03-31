//
//  TableViewDataSource.swift


import Foundation
import UIKit

class TableViewDataSource<Cell :UITableViewCell,ViewModel> : NSObject, UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate{
    
    private var cellIdentifier :String!
    private var items :[ViewModel]!
    var configureCell :(Cell,ViewModel) -> ()
    var completionHandlerDidSelect: ((IndexPath)-> Void)? = nil
    var completionHandlerwillDisplayCell: ((IndexPath)-> Void)? = nil
    var totalCount = 0
    init(cellIdentifier :String, items :[ViewModel], configureCell: @escaping (Cell,ViewModel) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
    }
    func didSelectOnCells (tableDidSelect:@escaping(IndexPath) -> ()) {
        completionHandlerDidSelect=tableDidSelect
    }
    func willdisplayCell (tableDidSelect:@escaping(IndexPath) -> ()) {
        completionHandlerwillDisplayCell = tableDidSelect
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! Cell
        cell.selectionStyle = .none
        tableView.separatorColor = .clear
        let item = self.items[indexPath.row]
        self.configureCell(cell,item)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let hit = completionHandlerDidSelect{
                hit(indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
}
