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
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.imageView?.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
        button.tintColor = .systemRed
        button.alpha = 0.0
        button.addTarget(self, action: #selector(closeImage), for: .touchDown)
        
        return button
    }()
    
    lazy var imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0.0
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeImage)))
        
        return imageView
    }()
    
    private lazy var backdropView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: -100, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 100))
        view.backgroundColor = .black
        view.alpha = 0.0
        
        return view
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
        view.addSubview(backdropView)
        view.addSubview(cancelButton)
        view.addSubview(imageView)
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
        
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        cancelButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        
        backdropView.translatesAutoresizingMaskIntoConstraints = false
        backdropView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backdropView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
        backdropView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        backdropView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        backdropView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
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
        UIView.animate(withDuration: 0.4, delay: 0) {
            self.cancelButton.alpha = 1.0
            self.backdropView.alpha = 0.8
            self.imageView.alpha = 1.0
            self.imageView.image = photos.reversed()[indexPath.row]
        }
    }
    
    //MARK: - Button Action
    
    @objc func closeImage() {
        UIView.animate(withDuration: 0.4, delay: 0) {
            self.cancelButton.alpha = 0.0
            self.backdropView.alpha = 0.0
            self.imageView.alpha = 0.0
        }
    }
}
