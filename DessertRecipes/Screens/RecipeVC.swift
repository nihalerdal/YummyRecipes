//
//  RecipeVC.swift
//  DessertRecipes
//
//  Created by Nihal Erdal on 9/22/22.
//

import UIKit

class RecipeVC: UIViewController {
    
    var recipe : Recipe?
    var dessertImage     = UIImageView()
    var ingredientsTitle = DRLabel(textAlignment: .left, fontSize: 16)
    var recipeText       = UITextView()
    var tableView        = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureImageView()
        configureIngredientsTitle()
        configureTableView()
        configureRecipeText()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)//use this istead of isNavigationBarHidden in order to see navbar during swipe back.
    }
    
    func configureImageView(){
        view.addSubview(dessertImage)
        dessertImage.layer.cornerRadius = 10
        dessertImage.clipsToBounds      = true
        dessertImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dessertImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            dessertImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            dessertImage.heightAnchor.constraint(equalToConstant: 160),
            dessertImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
    
    func configureIngredientsTitle(){
        view.addSubview(ingredientsTitle)
        
        NSLayoutConstraint.activate([
            
            ingredientsTitle.topAnchor.constraint(equalTo: dessertImage.bottomAnchor, constant: 10),
            ingredientsTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            ingredientsTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
            
        ])
    }
    
    func configureRecipeText(){
        view.addSubview(recipeText)
        recipeText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            recipeText.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            recipeText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            recipeText.heightAnchor.constraint(equalToConstant: 350),
            recipeText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
            
        ])
        
    }
    
    func configureTableView(){
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 20
        tableView.separatorColor = .clear
        tableView.register(IngredientsListCell.self, forCellReuseIdentifier: "IngredientsCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: ingredientsTitle.bottomAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
            tableView.heightAnchor.constraint(equalToConstant: 200)
            
        ])
    }
    
    func setTableViewDelegates(){
        tableView.delegate   = self
        tableView.dataSource = self
    }
}

extension RecipeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipe?.createIngredientsArray().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientsCell") as? IngredientsListCell else {fatalError()}
        
        if let ingredients = recipe?.createIngredientsArray()[indexPath.row],
           let measures = recipe?.createMeasuresArray()[indexPath.row]{
            cell.textLabel?.text = "\(String(describing: measures))" + "  " + "\(String(describing: ingredients))"
        }
        return cell
    }
}

