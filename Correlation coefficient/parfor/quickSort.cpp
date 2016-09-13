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
    double privotKey = a[low];                             //��׼Ԫ��  
    while(low < high){                                   //�ӱ�����˽�������м�ɨ��  
        while(low < high  && a[high] >= privotKey) --high;  //��high ��ָλ����ǰ���������ൽlow+1 λ�á����Ȼ�׼Ԫ��С�Ľ������Ͷ�  
        swap(&a[low], &a[high]);  
        while(low < high  && a[low] <= privotKey ) ++low;  
        swap(&a[low], &a[high]);  
    }  
    return low;  
}  
void quickSort(double *a,int low,int high){
    if(low < high){  
        int privotLoc = partition(a,  low,  high);  //����һ��Ϊ��  
        quickSort(a,  low,  privotLoc -1);          //�ݹ�Ե��ӱ�ݹ�����  
        quickSort(a,   privotLoc + 1, high);        //�ݹ�Ը��ӱ�ݹ�����  
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