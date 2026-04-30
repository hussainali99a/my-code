#include <iostream>
using namespace std;
int main(){

    int n;
    cout<<"enter the number: "<<endl;
    cin >> n;

    bool prime = true;

    if(n <= 1){
        prime = false;
    }

    for (int i = 2; i * i <=n;i++){
        if (n %i == 0){
            prime = false;
            break;
        }
    }

    if (prime){
        cout<<"Prime"<<endl;
    }
    else{
        cout<<"NOt Prime"<<endl;
    }
    return 0;
}