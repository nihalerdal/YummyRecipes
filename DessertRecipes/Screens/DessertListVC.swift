//
//  DessertListVC.swift
//  DessertRecipes
//
//  Created by Nihal Erdal on 9/22/22.
//

import UIKit

class DessertListVC: UIViewController {
    
    var tableView = UITableView()
    var recipe: [Recipe]? = []
    var desserts: [Dessert] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Desserts"
        configureTableView()
        showList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func configureTableView(){
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.register(DessertListCell.self, forCellReuseIdentifier: "DessertCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ])
    }
    
    func setTableViewDelegates(){
        tableView.delegate   = self
        tableView.dataSource = self
    }
    
    
    func showList(){
        TheMealDBClient.getDesserts { dessertResponse, error in
            if error == nil{
                self.desserts = dessertResponse?.desserts ?? []
                self.tableView.reloadData()
                print(self.desserts)
            }
        }
    }
}


extension DessertListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return desserts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DessertCell") as? DessertListCell else {fatalError()}
        let dessert = desserts[indexPath.row]
        cell.set(dessert: dessert)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  
        let dessertAtRow = desserts[indexPath.row]
        let vc           = RecipeVC()
        
        TheMealDBClient.getRecipes(id:dessertAtRow.id) { recipeResponse, error in
            
            if error == nil{
                
                guard let recipeResponse = recipeResponse else {return}
                self.recipe = recipeResponse.desserts
                print(self.recipe)
                
                vc.title = self.recipe?[0].strMeal
                
                guard let url = URL(string: dessertAtRow.url) else { return }
                let data = try? Data(contentsOf: url)

                if let imageData = data {
                    let image = UIImage(data: imageData)
                    vc.dessertImage.image = image
                }
                
                vc.ingredientsTitle.text = "Ingredients"
                vc.recipeText.text = self.recipe?[0].strInstructions
                vc.recipe = self.recipe?[0]
            }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

