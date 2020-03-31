//
//  ViewController.swift
//  Durgaprasad_Task
//
//  Created by ItsDp on 31/03/20.
//  Copyright © 2020 None. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var webservice :Webservice!
    private var sourceListViewModel :SourceListViewModel!
    private var dataSource :TableViewDataSource<CustomTableViewCell,ModalList>!
    
    private let refreshControl = UIRefreshControl()

    var tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateUI()
        setupTableview()
    }
    
    //MARK:: ------------ viewDidAppear -------------------
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //MARK:: ------------ Updating UI -------------------
    @objc private func refreshWeatherData(_ sender: Any) {
        // Fetch Weather Data
        updateUI()
        self.refreshControl.endRefreshing()
    }
    
    //Update UI after fetching data from web Service
    private func updateUI() {
        
        self.webservice = Webservice()
        self.sourceListViewModel = SourceListViewModel(webservice: webservice)
        // setting up the bindings
        self.sourceListViewModel.bindToSourceViewModels = {
            self.updateDataSource()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //updating the tableview datasources
    private func updateDataSource() {
        self.dataSource = TableViewDataSource(cellIdentifier: Cells.source, items: self.sourceListViewModel.sourceViewModels) { cell, vm in
            //            DispatchQueue.main.async {
            self.title = self.sourceListViewModel.title

                cell.nameLabel.text = "Title: \(vm.title ?? "")"
                cell.detailLabel.text = "Description: \(vm.desc ?? "")"
            DispatchQueue.main.async {
                cell.userImage.setImageFromUrl(ImageURL: "\(vm.imageHref ?? "")")
            }
        }
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self.dataSource
        self.tableView.tableFooterView = UIView()
        self.tableView.reloadData()
    }
}

//MARK:: Setup Tableview without Storyboard

extension ViewController{
    
    private func setupTableview(){
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableView.automaticDimension
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.backgroundColor = UIColor.white
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: Cells.source)
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        // Add Refresh Control to Table View
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        
        // Configure Refresh Control
        refreshControl.addTarget(self, action: #selector(refreshWeatherData(_:)), for: .valueChanged)
        refreshControl.tintColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
        
        
    }
    
}

