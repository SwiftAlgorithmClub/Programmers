
// MARK: - 이진트리, Binary Tree Example

public class BinaryTreeNode<T> {
    public var value: T
    public var leftChild: BinaryTreeNode? // 왼쪽 자식노드
    public var rightChild: BinaryTreeNode? // 오른쪽 자식노드
    public init(value: T) {
        self.value = value
    }

    // In-Order 탐색
    public func traverseInOrder(visit: (T) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value) // 값을 받아 실행하는 반환값 없는 클로저가 실행되는데 이때의 값은 순회중인 현재 인스턴스의 value가 된다.
        rightChild?.traverseInOrder(visit: visit)
    }

    public func traversePreOrder(visit: (T) -> Void) {
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }

    public func traversePostOrder(visit: (T) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
}

let rootTree = BinaryTreeNode<Int>(value: 0)
let one = BinaryTreeNode<Int>(value: 1)
let two = BinaryTreeNode<Int>(value: 2)
let three = BinaryTreeNode<Int>(value: 3)
let four = BinaryTreeNode<Int>(value: 4)
let five = BinaryTreeNode<Int>(value: 5)

rootTree.leftChild = one
rootTree.rightChild = two
one.leftChild = three
one.rightChild = four
two.leftChild = five

// traverseInOrder의 처음이자 마지막 매개변수는 값을 받아 실행하는 클로져였다.
// 마지막 매개변수이므로 해당 클로져는 후행클로져 형태로 넣어 아래와 같이 실행할 수 있다.
// 현재 구성한 트리의 상태 ▼

// .        0 <- Root Node
// .    1       2  <- Sub Node
// .  3   4   5

// InOrder 출력 결과 -> 3 1 4 0 5 2
print("traverseInOrder Result ▼")
rootTree.traverseInOrder { print($0, terminator: "->") }
print()
print("traversePreOrder Result ▼")
rootTree.traversePreOrder { print($0, terminator: "->") }
print()
print("traversePostOrder Result ▼")
rootTree.traversePostOrder { print($0, terminator: "->") }

// traverseInOrder Result ▼
// 3->1->4->0->5->2->
// traversePreOrder Result ▼
// 0->1->3->4->2->5->
// traversePostOrder Result ▼
// 3->4->1->5->2->0->
