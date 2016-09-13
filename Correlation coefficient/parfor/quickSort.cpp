#include "mex.h"
#include "algorithm"
using namespace std;

void swap(double *a, double *b)  
{  
    double tmp = *a;  
    *a = *b;  
    *b = tmp;  
}  
int partition(double *a, int low, int high)  
{  
    double privotKey = a[low];                             //基准元素  
    while(low < high){                                   //从表的两端交替地向中间扫描  
        while(low < high  && a[high] >= privotKey) --high;  //从high 所指位置向前搜索，至多到low+1 位置。将比基准元素小的交换到低端  
        swap(&a[low], &a[high]);  
        while(low < high  && a[low] <= privotKey ) ++low;  
        swap(&a[low], &a[high]);  
    }  
    return low;  
}  
void quickSort(double *a,int low,int high){
    if(low < high){  
        int privotLoc = partition(a,  low,  high);  //将表一分为二  
        quickSort(a,  low,  privotLoc -1);          //递归对低子表递归排序  
        quickSort(a,   privotLoc + 1, high);        //递归对高子表递归排序  
    }  
}

void mexFunction(int nlhs,mxArray *plhs[],int nrhs,const mxArray *prhs[]) {
 double *x;//double *y;
 int N,m;
 //double *r1;double *r2;
 mwSize numofX = mxGetM(prhs[0]); m = (int)numofX;
 mwSize colofnoise = mxGetN(prhs[0]);N = (int)colofnoise;
 x = mxGetPr(prhs[0]);
 //for(int j=0;j<m*N;j++) mexPrintf("x[%d]=%f ",j,x[j]);mexPrintf("\n");
 //mexPrintf("x[0]=%f x[m]=%f\n",x[0],x[m]);
 int low,high;
 for(int i=0;i<N;i++){
     low = i*m; high = (i+1)*m-1;
     quickSort(x,low,high);
     //mexPrintf("low=%d high=%d\n",low,high);
 }
 //x[0]=0;
}