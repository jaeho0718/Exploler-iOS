//
//  BottomDatePicker.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI

struct KeyboardDatePicker: View {
    @State private var viewID = UUID().uuidString
    @FocusState private var isActive
    @Binding var date: Date
    private var formattedDate: String {
        date.formatted(date: .complete, time: .omitted)
    }
    
    var body: some View {
        TextField(viewID, text: .constant(formattedDate))
            .focused($isActive)
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Button(action: { isActive = false }) {
                        Text("완료")
                            .font(.Pretendard.body)
                    }
                    .tint(.Button.save)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
            .overlay {
                AddInputViewToTextField(viewID: viewID) {
                    DatePicker("", selection: $date, displayedComponents: [.date])
                        .labelsHidden()
                        .datePickerStyle(.wheel)
                }
                .onTapGesture { isActive = true }
            }
    }
}

fileprivate struct AddInputViewToTextField<Content: View>: UIViewRepresentable {
    var viewID: String
    @ViewBuilder var content: Content
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        
        DispatchQueue.main.async {
            if let window = view.window, 
               let textfield = window
                    .allSubViews(type: UITextField.self)
                    .first(where: { $0.placeholder == viewID }) {
                let hostView = UIHostingController(rootView: content).view!
                hostView.backgroundColor = .clear
                hostView.frame.size = hostView.intrinsicContentSize
                
                textfield.inputView = hostView
                textfield.reloadInputViews()
            }
        }
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

fileprivate extension UIView {
    func allSubViews<T: UIView>(type: T.Type) -> [T] {
        var resultViews = subviews.compactMap({ $0 as? T })
        
        for view in subviews {
            resultViews.append(contentsOf: view.allSubViews(type: type))
        }
        
        return resultViews
    }
}
