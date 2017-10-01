//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

var str = "Hello, playground"

var array = [1, 2, 3, 5]

for number in array {
    print(number)
    array = [7,8,9,0]
}
print(array)


var a = 12
var b = String(a)
print(a)

class MyViewController : UIViewController {
    override func viewDidLoad() {
        let view = UIView()
        view.backgroundColor = .white
        title = "Workshop"
        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Test Test"
        label.textColor = .black
        view.addSubview(label)
        self.view = view
        
        let button = UIButton()
        button.backgroundColor = UIColor.blue
        button.setTitle("Button", for: .normal)
        button.titleLabel?.textColor = UIColor.white
        view.addSubview(button)
        

    }
}

let controller = MyViewController()
let navigation = UINavigationController(rootViewController: controller)
//PlaygroundPage.current.liveView = controller
PlaygroundPage.current.liveView = navigation

