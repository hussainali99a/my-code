#include <iostream>
using namespace std;

#define MAX 100

class Stack {
    int arr[MAX];       // int arr[max];
    int top;           // int top;

public:                     
    Stack() {                  // stack(){top = -1;}
        top = -1;
    }

    // Push operation
    void push(int x) {                                  // void push(int x)
        if (top >= MAX - 1) {                             // if(top >= max -1 ){cout<<"Stack Overflow"};
            cout << "Stack Overflow\n";                  // return;
            return;
        }
        arr[++top] = x;                                    // arr[++top] = x;
    }

    // Pop operation
    void pop() {
        if (top < 0) {
            cout << "Stack Underflow\n";
            return;
        }
        top--;
    }

    // Peek operation
    int peek() {
        if (top < 0) {
            cout << "Stack is empty\n";
            return -1;
        }
        return arr[top];
    }

    // Display stack
    void display() {
        if (top < 0) {
            cout << "Stack is empty\n";
            return;
        }

        for (int i = top; i >= 0; i--) {
            cout << arr[i] << " ";
        }
        cout << endl;
    }
};

int main() {
    Stack s;

    s.push(10);
    s.push(20);
    s.push(30);

    s.display();

    cout << "Top element: " << s.peek() << endl;

    s.pop();
    s.display();

    return 0;
}