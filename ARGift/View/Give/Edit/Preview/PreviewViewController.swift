//
//  PreviewViewController.swift
//  ARGift
//
//  Created by yudai asano on 2022/01/26.
//

import UIKit
import SwiftUI
import Combine
import QuickLook
import ARKit

struct PreviewWrapper: UIViewControllerRepresentable {
    typealias UIViewControllerType = PreviewViewController
    @ObservedObject var viewModel: EditViewModel
    
    func makeUIViewController(context: Context) -> PreviewViewController {
        let viewController: PreviewViewController = .init(viewModel: viewModel)
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: PreviewViewController, context: Context) {
        // update
    }
}

final class PreviewViewController: UIViewController {
    private var cancellable: Set<AnyCancellable> = .init()
    private var contentViewController: UIViewController = .init()
    private var viewModel: EditViewModel
    
    private var selected: Int = 0
    
    init(viewModel: EditViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        setViewHierarchy()
        setRoute()
    }
    
    private func setViewHierarchy() {
        contentViewController = UIHostingController(rootView: PreviewView(viewModel: viewModel))
        addChild(contentViewController)
        contentViewController.didMove(toParent: self)
        view.addSubview(contentViewController.view)
        contentViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            contentViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
    }
    
    private func setRoute() {
        viewModel.$index.sink { [weak self] index in
            guard let self = self else { return }
            if let index = index {
                self.selected = index
                print("debug: \(self.selected)")
                let qlViewController: QLPreviewController = .init()
                qlViewController.delegate = self
                qlViewController.dataSource = self
                self.present(qlViewController, animated: true, completion: nil)
            }
        }.store(in: &cancellable)
    }
}

extension PreviewViewController: QLPreviewControllerDelegate, QLPreviewControllerDataSource {
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        print("debug: \(usdz[selected].objectUrl)")
        let item = Bundle.main.url(forResource: usdz[selected].objectUrl, withExtension: "usdz")!
        return ARQuickLookPreviewItem(fileAt: item)
    }
}
