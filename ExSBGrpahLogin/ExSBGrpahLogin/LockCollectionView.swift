//
//  GraphLockCollectionView.swift
//  ExSBGrpahLogin
//
//  Created by Ting-Wei Lee on 2020/11/2.
//

import UIKit

protocol LockCollectionViewDelegate: class {
    func move(to point: CGPoint)                    /// 手指滑動時的反應
    func moveEnded()                                /// 手指滑動完成後的反應
    func selectedItem(at indexPath: IndexPath)
}

class LockCollectionView: UICollectionView {

    weak var lockCollectionViewDelegate: LockCollectionViewDelegate?
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touchPoint = touches.first?.location(in: self) else { return }
        
        if let indexPath = self.indexPathForItem(at: touchPoint) {
            lockCollectionViewDelegate?.selectedItem(at: indexPath); return
        }
        
        lockCollectionViewDelegate?.move(to: touchPoint)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        lockCollectionViewDelegate?.moveEnded()
    }

}
