#include <iostream>
#include <string>
using namespace std;
int main(){
    string n;
    cin>>n;

    int len = n.length();
    for(int i = len - 1;i>=0;i--){
        cout<<n[i];
    }

    cout<<endl;
    return 0;
}