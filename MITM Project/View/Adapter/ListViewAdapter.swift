//
//  ListViewAdapter.swift
//  MITM Project
//
//  Created by Vibhash Kumar on 28/08/23.
//

import Foundation
import UIKit

protocol ListViewAdapterDelegate : NSObject {
    func didSelectCellCallBack( index : IndexPath)
    func deleteItemFromCart(index : IndexPath)
   
}
extension ListViewAdapterDelegate {
    func deleteItemFromCart(index : IndexPath){}
    func addMoreBtnCallBack(){}
   
}

final class ListViewAdapter : NSObject {
    
    //MARK: Public Properties
    var viewModel : ListViewModel?
    
    //MARK: Private Properties
    private var dataSource : [ListDetailsCellViewModel] = []
    private var tableView : UITableView!
    private var delegate : ListViewAdapterDelegate
    
    
    //MARK: Init
    init(tableView : UITableView , delegate : ListViewAdapterDelegate, viewModel :ListViewModel){
        self.tableView = tableView
        self.delegate = delegate
        self.viewModel = viewModel
        super.init()
        registerCells()
    }
    
    //MARK: Public Methods
    func configureDataSourceForSelection() {
        self.dataSource = viewModel?.dataSource ?? []
        loadData()
    }
    
    //MARK: Private Methods
    private func registerCells() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: CGFloat(35), left: 0, bottom: 0, right: 0)
        tableView.register(UINib(nibName: "ListDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "ListDetailsTableViewCell")
    }
    
    
    private func loadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
    //MARK: UITableViewDataSource
extension  ListViewAdapter : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell : ListDetailsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ListDetailsTableViewCell", for: indexPath) as? ListDetailsTableViewCell  else  {
            return UITableViewCell()
        }
        
        cell.configureCell(viewModel: dataSource[indexPath.row])
        
        return cell
    }
}



//MARK: UITableViewDelegate
extension  ListViewAdapter : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didSelectCellCallBack(index: indexPath)
    }
}


