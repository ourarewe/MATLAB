/*[y,r1,r2]=LM(double model,doubl *x,double factor,double *noise)
 *输入第几号模型，列向量x，信噪比或rho，白噪声noise
 *输出y,皮尔森相关系数r1，新相关系数r2
*/
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

double corr(double *x,double *y,int start,int numofX){
    int i;double u,v1,v2,a,b,r;
    u=0.0;v1=0.0;v2=0.0;a=0;b=0;
    double mx=0;double my=0;
    for(i=0;i<numofX;i++)mx=mx+x[i];mx=mx/numofX;
    for(i=0;i<numofX;i++)my=my+y[start+i];my=my/numofX;
	for(i=0;i<numofX;i++)
    {
        a=x[i]-mx;b=y[start+i]-my;
        u=u+a*b;
        v1=v1+a*a;
        v2=v2+b*b;
    }
    return r=u/(sqrt(v1*v2));
}

double newcorr(double *x,double *y,double r,int start,int numofX){
    int i=0;double *yy=new double[numofX];double *xx=new double[numofX];
    for(i=0;i<numofX;i++) xx[i]=x[i];quickSort(xx,0,numofX-1);
    if(r<0)
        for(i=0;i<numofX;i++) yy[i]=-y[start+i];
    else
        for(i=0;i<numofX;i++) yy[i]=y[start+i];
    quickSort(yy,0,numofX-1);
    double rr;rr=corr(xx,yy,0,numofX);
    delete []xx; delete []yy;
    return r/rr;
}

void makey(double model,mwSize numofX,double *x,double *y,double *noise,double factor,int N) {
    double f1=factor;double f2=sqrt(1-factor*factor);
    int a=(int)model;
    switch(a){
        case 1:
            for(int i=0;i<N;i++){
                for(int j=0;j<numofX;j++){
                    y[numofX*i+j]=x[j]+factor*noise[numofX*i+j];
                }
            }
            //return y;
            break;
        case 2:
            //double f1=factor;double f2=sqrt(1-factor*factor);
            for(int i=0;i<N;i++){
                for(int j=0;j<numofX;j++){
                    y[numofX*i+j]=f1*x[j]+f2*noise[numofX*i+j];
                }
            }
            break;
    /*    case 3:
            int i,j,k;
            for(i=0;i<N;i++){
                for(int j=0;j<numofX;j++){
                    y[numofX*i+j]=x[j]+factor*noise[numofX*i+j];
                }
            }
            for(int i=0;i<N;i++){
                int start=i*m;int l=0;
                for(int j=-100;j<0;j++){
                    double *x3=new double[numofX+j];
                    double *y3=new double[numofX+j];
                    for(k=0;k<numofX+j;k++) x3[k]=x[-j+k];
                    for(k=0;k<numofX+j;k++) y3[k]=y[start+k];
                    a1[l] = corr(x3,y3,0,numofX+j);
                    a2[l]=newcorr(x3,y3,a1[l],0,numofX+j);l++;
                }
                for(;j<=100;j++){
                    double *x3=new double[numofX-j];
                    double *y3=new double[numofX-j];
                    for(k=0;k<numofX+j;k++) y3[k]=y[start-j+k];
                    for(k=0;k<numofX+j;k++) x3[k]=x[k];
                    a1[l] = corr(x3,y3,0,numofX+j);
                    a2[l]=newcorr(x3,y3,a1[l],0,numofX+j);l++;
                }
                    
            }
            break;*/
        case 4:
            for(int i=0;i<N;i++){
                for(int j=0;j<numofX;j++){
                    y[numofX*i+j]=f1*x[j]+f2*noise[numofX*i+j];
                }
            }
            break;
    }
}

void mexFunction(int nlhs,mxArray *plhs[],int nrhs,const mxArray *prhs[]) {
 double *x;double *y;
 double *noise;
 double model;double factor;
 int N,m;
 double *r1;double *r2;
 mwSize numofX = mxGetM(prhs[1]); m = (int)numofX;
 mwSize colofnoise = mxGetN(prhs[3]);N = (int)colofnoise;
 //mxSize numofxplot=mxGetN(prhs[2]);
 
 model = *(mxGetPr(prhs[0]));
 x = mxGetPr(prhs[1]);
 factor = *(mxGetPr(prhs[2]));
 noise = mxGetPr(prhs[3]);
 
 plhs[0] = mxCreateDoubleMatrix(m, N,mxREAL);
 plhs[1] = mxCreateDoubleMatrix(N, 1, mxREAL);
 plhs[2] = mxCreateDoubleMatrix(N, 1, mxREAL);
 
 y = mxGetPr(plhs[0]);
 r1 = mxGetPr(plhs[1]);
 r2 = mxGetPr(plhs[2]);
 
 makey(model,numofX,x,y,noise,factor,N);
 for(int i=0;i<N;i++){
     int start=i*m;
     r1[i] = corr(x,y,start,m);
     r2[i]=newcorr(x,y,r1[i],start,m);
 }
}