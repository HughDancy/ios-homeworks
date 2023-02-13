//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Борис Киселев on 19.12.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    let identifier = "photosCell"
    
    //MARK: - Subview's
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .white
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 20
        
        return stackView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.forward"), for: .normal)
        button.addTarget(self, action: #selector(goToThePhotoGallery), for: .touchDown)
        button.tintColor = .black
        
        return button
    }()
    
    private lazy var previewPhoto: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let preview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        preview.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        preview.delegate = self
        preview.dataSource = self
        preview.showsHorizontalScrollIndicator = false
        preview.isScrollEnabled = false
        
        return preview
    }()
    
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        setupHierarchy()
        setupLayout()
        buttonSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup Hierarchy
    
    private func setupHierarchy() {
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(button)
        contentView.addSubview(stackView)
        contentView.addSubview(previewPhoto)
    }
    
    //MARK: - Setup Layout
    
    private func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 4).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 12).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true
        stackView.bottomAnchor.constraint(equalTo: previewPhoto.topAnchor, constant: -2).isActive = true
//        stackView.heightAnchor.constraint(equalToConstant: label.bounds.height).isActive = true
       
        previewPhoto.translatesAutoresizingMaskIntoConstraints = false
        previewPhoto.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 2).isActive = true
        previewPhoto.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 12).isActive = true
        previewPhoto.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -12).isActive = true
        previewPhoto.heightAnchor.constraint(equalToConstant: 130).isActive = true
        previewPhoto.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -4).isActive = true
        
    }
    
    //MARK: - Button setup
    
    private func  buttonSetup() {
        var configuration = UIButton.Configuration.borderless()
        configuration.image = UIImage(systemName: "arrow.forward")
        
        button.configuration = configuration
    }
    
    //MARK: - Button Action
    
    @objc func goToThePhotoGallery() {
        let photoVc = PhotosViewController()
       
        if let vc = superview as? UITableView {
            if let tc = vc.dataSource as? UIViewController {
                tc.navigationController?.pushViewController(photoVc, animated: true)
            }
        }
    }
    
}

  //MARK: - CHANGE THIS

extension PhotosTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = previewPhoto.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! PhotosCollectionViewCell
        cell.image.image = photos.reversed()[indexPath.row]
        cell.layer.cornerRadius = 6
        cell.clipsToBounds = true
        
        return cell
    }
}

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (previewPhoto.frame.width - 3 * 8) / 4
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photoVc = PhotoViewController()
        photoVc.photo.image = photos.reversed()[indexPath.row]
        
        if let vc = superview as? UITableView {
            if let tc = vc.dataSource as? UIViewController {
                tc.navigationController?.pushViewController(photoVc, animated: true)
            }
        }
    }
    
}
