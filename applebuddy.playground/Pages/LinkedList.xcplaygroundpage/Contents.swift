
// MARK: Implementation of LinkedList in Swift

import Foundation

// MARK: - Node Definition

public class Node<T> {
    public var value: Int
    public var next: Node?

    public init(value: Int, _ next: Node? = nil) {
        // 두번째 매개변수는 만약 지정되지 않았을 때 default값을 nil로 주도록 설정한다.
        self.value = value
        self.next = next
    }
}

// MARK: - Prints Node Data

extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(value)" // 다음 노드가 없다면 현재 값만 출력한다.
        }

        // 다음 노드(next)가 존재한다면 guard let 이후 코드도 실행된다. -> 다음 노드도 출력한다.
        return "\(value) -> \(String(describing: next)) "
    }
}

let node1 = Node<Int>(value: 1)
let node2 = Node<Int>(value: 3)
let node3 = Node<Int>(value: 5)
node1.next = node2
node2.next = node3
print(node1.description)
