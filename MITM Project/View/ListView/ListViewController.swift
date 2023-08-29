//
//  ListViewController.swift
//  MITM Project
//
//  Created by Vibhash Kumar on 28/08/23.
//

import UIKit

class ListViewController: UIViewController{
    
    @IBOutlet weak var listView : UITableView!
    var viewModel = ListViewModel()
    private var adapter : ListViewAdapter?
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
         self.configureTableView()
         self.getApiResponse()
        // Do any additional setup after loading the view.
    }
    
    
    //MARK: Configure Tableview Adapter
    func configureTableView(){
        self.adapter = ListViewAdapter(tableView: listView, delegate: self, viewModel: viewModel)
    }

}

extension ListViewController {
    //MARK: Configure Datasource for Adapter
    func getApiResponse(){
        viewModel.getResponseFromApi { response, error in
            self.viewModel.convertListResponseCellViewModel(dataModel: response)
            self.adapter?.configureDataSourceForSelection()
        }
    }
}
//MARK:  delegates for Adapter
extension ListViewController : ListViewAdapterDelegate {
    func didSelectCellCallBack(index: IndexPath) {
        
    }
    
    func deleteItemFromCart(index: IndexPath) {
        
    }
}
