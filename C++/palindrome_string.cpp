#include<iostream>
#include<string>
using namespace std;


int main(){
    string s;
    cin>>s;

    int start = 0;
    int end = s.length() - 1;

    bool ispalindrome = true;

    while(start<end){
        if(s[start]!=s[end]){
            ispalindrome = false;
            break;
        }
        start++;
        end--;
    }

    if(ispalindrome)
        cout<<"Palindrome";
    else
        cout<<"Not Palindrome";
        
    return 0;
}