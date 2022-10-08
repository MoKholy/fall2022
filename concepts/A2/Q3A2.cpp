#include <iostream>
#include <string>
using namespace std;

bool isValidQ1(string s){
    // expression to check for: 0+ 1+ (11)* 0?
    // 0 and 1 must occur
    int n = (int) s.size();
    if(n < 2) return false;
    else if(s[0] != '0') return false;
    else if(s[1] != '1') return false;
    else {
        int i;
        for( i= 2; i < n; i++){
            if(s[i] == '1' && s[i+1] == '1' && i != n-1){
                i++;
                continue;
            }else{
                if(i == n-1){
                    if(s[i] == '0') break;  
                }
                return false;
            }
        }
    }
    return true;
}
int main() {
    string example1 = "0111110"; // valid
    string example2 = "0110"; // invalid
    // should output 1
    cout << isValidQ1(example1) << endl;
    // should output 0
    cout << isValidQ1(example2) << endl;

    return 0;
}