#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
typedef unsigned long long int ll;


// utulity funciton to calc sum in a range
ll rsum (unsigned l, unsigned r) {
    ll tmp = 0;
    for (unsigned i=l;i<=r;i++) tmp+=i;
    return tmp; 
}

// basic function to test if our parallel_sum is correct or not
ll sum (unsigned n) {
    ll tmp = 0;
    for (unsigned i=1;i<=n;i++) tmp+= i;
    return tmp;
}

// calculate size of array char needed to store teh long long 
int calcSize(ll x) {
    int len = 0;
    while (x>0) len++, x/=10;
    return len;
}

// convert the long long to char array
void tostring (char ans [], ll x)
{
    int len =0;
    ll num =x;
    while (x>0) len++ , x/=10;
    char * temp = malloc (sizeof(char)*len);
    int i=0;
    while (num>0) temp[i++] = (num%10)+'0' , num/=10;
    i = len-1;
    for (int j=0; j<len;j++) ans[j]=temp[i--];
    ans[len]= '\0';
    
}
// utilty funciton to convert char array to long long 
ll toint(char  x[]){
    ll temp = 0;
    int c =0;
    ll ten = 10;
    
    for (int i=strlen(x)-1; i>=0;i--) {
        int digit = (x[i]-'0');
        temp+= digit * ((c>0)?ten:1);
        if (c>0) ten*=10; 
        c++;   
    }
    
    return temp;
}

ll parallel_sum (unsigned n_prc, unsigned n){
    // the parent will initiate n-1 processes
    // it will give each of the n-1 process almost equal ranges
    // we need 2 (n-1) pipes,
    const int rootId = getpid();
    int CP[n_prc][2];   // pipes to send from sum results from children to parent 
   
    for (int i= 0;i<n_prc;i++) if (pipe (CP[i]) == -1) printf("one of CP pipes failed");      

    // forking 
    // int pid[n_prc];
    int pid;
    int mod = n%n_prc;
    int span = n/n_prc;
    int l = 1, r=span;
    // note : I do not need pipres from parent to children , cause the child processes could take the values of l,r from the parent proces
    for (int i=0;i<n_prc ;i++){
        pid=fork();
        if (pid<0 ) printf("error in forking");

        if (pid==0) {
            
            ll isum = rsum(l,r+(mod>0));
            // write the result to the pipe
            int len = calcSize(isum);
            char isumString [len];
            tostring(isumString,isum);
            write (CP[i][1],isumString,strlen(isumString)+1 );
            close(CP[i][1]);
            exit(3);
        }
        l+= span + (mod>0);
        r+= span + (mod>0);
        mod--;
        
    }
    wait (NULL);     // wait for children to finish
    ll ans = 0;
    for (int i=0;i<n_prc;i++) {
        // get the sums from the pipes
        char str [20];
        read(CP[i][0],str, 20 );
        ans+= toint(str);
    }
    return ans;
}
int main (){
    int x =1;
    printf("Entered\n");
    // validating the correctness
    for (int n=0;n<10000 ;n++)   {
    int pr = parallel_sum(3,n);
     x = ((pr == sum(n) ) <x)?(pr == sum(n)):x;
    }
    printf ("%d\n", x);
    x=1;

    // validating the correctness // 2
    for (int npr = 2 ; npr<=4 ;npr++){
        int pr = parallel_sum(npr,203);
        x = ((pr == sum(203) ) <x)?(pr == sum(203)):x;
    }
     printf ("%d\n", x);
    exit(0);
}