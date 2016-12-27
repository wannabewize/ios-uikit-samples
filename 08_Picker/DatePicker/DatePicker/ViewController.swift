//
// 날짜 피커
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 코드로 날짜 피커 추가하기
        
        // 데이트 피커 객체 생성
        let datePicker = UIDatePicker()
        // 뷰 구조에 추가
        self.view.addSubview(datePicker)
        
        // 오토 레이아웃
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[picker]|", options: [], metrics: nil, views: ["picker":datePicker]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[picker]", options: [], metrics: nil, views: ["picker":datePicker]))
        
        // 날짜/시간 선택 모드
        datePicker.datePickerMode = UIDatePickerMode.dateAndTime
        
        // 일주일 전 ~ 일주일 후
        let week : TimeInterval = 60 * 60 * 24 * 7
        datePicker.minimumDate = Date(timeIntervalSinceNow: -week)
        datePicker.maximumDate = Date(timeIntervalSinceNow: week)
        
        // 날짜 변경 이벤트
        datePicker.addTarget(self, action: #selector(timeChanged(_:)), for: .valueChanged)
    }

    func timeChanged(_ sender : Any) {
        let datePicker = sender as! UIDatePicker
        let date = datePicker.date
        
        // 데이트 포매터
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        
        // 날짜 형식에 맞는 문자열 얻기
        let dateStr = dateFormatter.string(from: date)
        print("선택한 날짜 : \(dateStr)")
    }

}

