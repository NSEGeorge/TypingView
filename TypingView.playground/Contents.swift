//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let typingView = TypingView(frame: CGRect(x: 145, y: 300,
                                                  width: 83, height: 25))
        
        view.addSubview(typingView)
        typingView.startAnimation()
        
        self.view = view
    }
}

class TypingView: UIView {
    var color = UIColor.blue
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startAnimation() {
        // Animated paths
        
        let firstDote = createDoteView(withOffset: .zero)
        let secondDote = createDoteView(withOffset: CGPoint(x: firstDote.frame.maxX + 4, y: 0))
        let thirdDote = createDoteView(withOffset: CGPoint(x: secondDote.frame.maxX + 4, y: 0))
        
        addSubview(firstDote)
        addSubview(secondDote)
        addSubview(thirdDote)
        
        firstDote.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        secondDote.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        thirdDote.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        
        UIView.animate(withDuration: 0.6, delay: 0.0, options: [.repeat, .autoreverse], animations: {
            firstDote.transform = CGAffineTransform.identity
        }, completion: nil)
        UIView.animate(withDuration: 0.6, delay: 0.2, options: [.repeat, .autoreverse], animations: {
            secondDote.transform = CGAffineTransform.identity
        }, completion: nil)
        UIView.animate(withDuration: 0.6, delay: 0.4, options: [.repeat, .autoreverse], animations: {
            thirdDote.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    private func createDoteView(withOffset offset: CGPoint) -> UIView {
        let view = UIView(frame: CGRect(x: offset.x, y: offset.y, width: self.bounds.height, height: self.bounds.height))
        view.backgroundColor = color
        view.layer.cornerRadius = self.bounds.height / 2
        return view
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
