#include<iostream>
#include<algorithm>
using namespace std;

int main(){

    string str;
    cin >> str;

    string rev = str;
    reverse(rev.begin(),rev.end()); 

    if(str ==rev){
        cout<<"Palindrome";
    }
    else{
        cout<<"Not palindrome";
    }

    


    return 0;
}