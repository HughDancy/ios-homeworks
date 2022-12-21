//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Борис Киселев on 20.12.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    //MARK: - Subviews
    
    private lazy var photosGallery: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        collectionView.showsVerticalScrollIndicator = false
        
        return collectionView
    }()

    //MARK: - Init
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(photosGallery)
        setupLayout()
        title = "Photo Gallery"
    }
    
    //MARK: - Setup Layout
    
    private func setupLayout() {
        photosGallery.translatesAutoresizingMaskIntoConstraints = false
        photosGallery.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        photosGallery.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        photosGallery.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        photosGallery.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

   //MARK: - Extension PhotosViewContoller

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = photosGallery.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! PhotosCollectionViewCell
        cell.image.image = photos.reversed()[indexPath.row]
        
        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let wh = (photosGallery.frame.width - 4 * 8) / 3
        
        return CGSize(width: wh, height: wh)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = PhotoViewController()
        vc.photo.image = photos.reversed()[indexPath.row]
        present(vc, animated: true)
    }
}

