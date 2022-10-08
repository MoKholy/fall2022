
#include <iostream>
#include <string>
#include <unordered_map>
using namespace std;
// contains grammar
unordered_map <char, string> MAP = {{'E', "E-> T{+T}"}, 
        {'T', "T -> F {*F}"},
        {'F', "F -> num | id"}
};
// checks signs 
struct flag{
    bool sign;
    bool first;
};
bool parser(string s, flag f){
    int n = s.size();
    if(n < 1) return true;
    else if( n  < 2){
        cout << s << "\t";
        if((s[0] >= 48 && s[0] <= 57) || (s[0] >= 97 && s[0] <= 122)) {
            cout << MAP['F'] << "\n";
            return true;
        }
        else {
            cout << "Invalid String\n";
            return false;
        }
    }else{
        // if digit or lowercase alpha -> recurse
        cout << s << "\t";
        if((s[0] == '*' || s[0] == '+') && f.first ) {
            cout << "Invalid String\n";
            return false;
        } 
        
        if((s[0] >= 48 && s[0] <= 57) || (s[0] >= 97 && s[0] <= 122)) {
            cout << MAP['F'] << "\n";
            return parser(s.substr(1, n-1), {0,0});
        } else if (s[0] == '*' && !f.sign) {
            cout << MAP['T'] << 
            "\n";
            return parser(s.substr(1, n-1), {1, 0});
        }else if(s[0] == '+' && !f.sign) {
            cout << MAP['E'] << "\n";
            return parser(s.substr(1, n-1), {1, 0});
        } else {
            cout << "Invalid String\n";
            return false;
        }
    }
    
}

int main() {
    string example1 = "1+2+32+34*32827"; // valid
    string example2 = "221+2312+2+"; // not valid
    string example3 = "*123211+212+1"; // not valid
    // sign = 0 and first = 1 at beginning
    parser(example1, {0, 1});
    cout << "\n";
    parser(example2, {0, 1});
    cout << "\n";
    parser(example3, {0, 1});
    cout << "\n";
    return 0;
}