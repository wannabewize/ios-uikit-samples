/**
 * DiffableDataSourceSnapshot 예제
 */

// UIKit 필요
import UIKit

// Section은 Int 타입으로, 데이터의 타입은 문자열
var snapshot = NSDiffableDataSourceSnapshot<Int, String>()

// 섹션 1 생성
snapshot.appendSections([1])
snapshot.appendItems(["a", "b", "c", "d"])

print("== Snapshot1 ==")
print("전체 아이템 개수 :", snapshot.numberOfItems)
// 아이템 삭제
snapshot.deleteItems(["c"])
print("삭제 후 전체 아이템 개수 :", snapshot.numberOfItems)


// Section은 Section enum 으로, 데이터 타입은 Item 타입
enum Section {
    case main
    case sub
}

struct Item: Hashable {
    let id: Int
    let value: String
}

var snapshot2 = NSDiffableDataSourceSnapshot<Section, Item>()
snapshot2.appendSections([.main, .sub])
snapshot2.appendItems([
    Item(id: 0, value: "가"),
    Item(id: 1, value: "나"),
    Item(id: 2, value: "라"),
], toSection: .main)

snapshot2.appendItems([
    Item(id: 10, value: "A"),
    Item(id: 11, value: "B"),
], toSection: .sub)

print("== Snapshot2 ==")
print("전체 아이템 개수 :", snapshot2.numberOfItems)
print("메인 섹션 내 아이템 개수 : ", snapshot2.numberOfItems(inSection: .main))

