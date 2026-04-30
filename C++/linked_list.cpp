#include<iostream>
using namespace std;


class Node{
    public:
    int data;
    Node* next;

    Node(int val){
        data = val;
        next = NULL;
    }
};

// insert at beginning
void insertAtHead(Node* &head, int val){
    Node* newNode = new Node(val);
    newNode->next = head;
    head = newNode;
}

void insertAtend(Node* &head, int val){
    Node* newNode = new Node(val);

    if(head==NULL){
        head = newNode;
        return;
    }

    Node* temp = head;
    while(temp->next!=NULL){
        temp = temp->next;
    }

    temp->next = newNode;

}

// Delete a node by value
void deleteNode(Node* &head, int val) {
    if (head == NULL) return;

    // If head needs to be deleted
    if (head->data == val) {
        Node* toDelete = head;
        head = head->next;
        delete toDelete;
        return;
    }

    Node* temp = head;

    while (temp->next != NULL && temp->next->data != val) {
        temp = temp->next;
    }

    if (temp->next == NULL) return;

    Node* toDelete = temp->next;
    temp->next = temp->next->next;
    delete toDelete;
}

// Display linked list
void display(Node* head) {
    Node* temp = head;

    while (temp != NULL) {
        cout << temp->data << " -> ";
        temp = temp->next;
    }

    cout << "NULL" << endl;
}

int main() {
    Node* head = NULL;

    insertAtend(head, 10);
    insertAtend(head, 20);
    insertAtend(head, 30);

    insertAtHead(head, 5);

    display(head);

    deleteNode(head, 20);

    display(head);


    return 0;

}