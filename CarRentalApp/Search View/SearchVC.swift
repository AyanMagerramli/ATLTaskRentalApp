//
//  SearchVC.swift
//  CarRentalApp
//
//  Created by Ayan on 27.10.23.
//

import UIKit

class SearchVC: UIViewController {
    
    @IBOutlet weak var searchText: UITextField!
    @IBOutlet weak var searchFieldView: UIView!
    @IBOutlet weak var searchCollectionView: UICollectionView!
 
    let coreData = CoreData(context: AppDelegate().persistentContainer.viewContext)
    var viewModel: SearchViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        viewModel = SearchViewModel (coreData: coreData)
        viewModel.itemsDidChange = { [weak self] in
            self?.searchCollectionView.reloadData()
        }
        updateItems()
        navigationItem.title = "Search"
    }
    
    @IBAction func searchAction(_ sender: Any) {
        if let searchText = searchText.text {
            viewModel.filterItems(with: searchText)
        }
    }
    
    func configureUI () {
        searchFieldView.layer.cornerRadius = 30
        searchCollectionView.delegate = self
        searchCollectionView.dataSource = self
        searchCollectionView.register(UINib(nibName: "CollectionCell", bundle: nil), forCellWithReuseIdentifier: "CollectionCell")
    }
    
    func updateItems () {
        viewModel.fetchItems()
    }
}

//MARK: -Data Source
extension SearchVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        cell.layer.cornerRadius = 35
        cell.configureCarCell(data: viewModel.items[indexPath.row])
        return cell
    }
}

//MARK: -Delegate
extension SearchVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //
    }
}

//MARK: -Delegate Flow layout
extension SearchVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width*0.855, height: 340)
    }
}
