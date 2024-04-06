//
//  CounterView.swift
//  Practice
//
//  Created by Mohd Kashif on 05/04/24.
//

import SwiftUI

struct CounterView: View {
    @ObservedObject var counter=Counter()
//    let control:Control
//    var control:Control
//    init(control:Control) {
//        self.control = Control(delegate: counter)
//    }
    var control: Control = {
        let control = Control(delegate: Counter())
        return control
    }()
//    lazy var control: Control = Control(delegate: self.counter)
//    init(){
//        self.control=Control(delegate: counter)
//    }
//    init(){
//        self.controlObj=Control(delegate: counter)
//    }
    var body: some View {
        VStack{
            Text("\(counter.count)")
                .foregroundColor(.black)
            Button("Increment") {
                self.control.buttonClicked()
            }
        }
    }
}

protocol CounterDelegate{
    func increment()->Void
    func decrement()->Void
    func reset()->Void
}

class Control{
     var delegate:CounterDelegate
    
    init(delegate: CounterDelegate) {
        self.delegate = delegate
    }
    
    func buttonClicked(){
        self.delegate.increment()
    }
}

class Counter:CounterDelegate, ObservableObject{
    @Published var count:Int=0{
        didSet{
            print(count, "val")
        }
    }
    func decrement() {
        self.count -= 1
    }
    
    func reset() {
        self.count=0
    }
    

    func increment() {
        self.count += 1
    }
}
//#Preview {
//    CounterView()
//}
