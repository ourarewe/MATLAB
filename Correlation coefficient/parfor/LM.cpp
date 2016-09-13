/*y=LM(double model,doubl *x,double factor,double *noise)
 *输入第几号模型，列向量x，信噪比或rho，白噪声noise
 *输出y
*/
#include "mex.h"
#include "algorithm"
using namespace std;

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
        case 3:
            for(int i=0;i<N;i++){
                for(int j=0;j<numofX;j++){
                    y[numofX*i+j]=x[j]+factor*noise[numofX*i+j];
                }
            }
            break;
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
 //double *r1;double *r2;
 mwSize numofX = mxGetM(prhs[1]); m = (int)numofX;//xd的长度
 mwSize colofnoise = mxGetN(prhs[3]);N = (int)colofnoise;//计算N次
 //mxSize numofxplot=mxGetN(prhs[2]);
 
 model = *(mxGetPr(prhs[0]));
 x = mxGetPr(prhs[1]);
 factor = *(mxGetPr(prhs[2]));
 noise = mxGetPr(prhs[3]);
 
 plhs[0] = mxCreateDoubleMatrix(m, N,mxREAL);
 //plhs[1] = mxCreateDoubleMatrix(N, 1, mxREAL);
 //plhs[2] = mxCreateDoubleMatrix(N, 1, mxREAL);
 
 y = mxGetPr(plhs[0]);
 //r1 = mxGetPr(plhs[1]);
 //r2 = mxGetPr(plhs[2]);
 
 makey(model,numofX,x,y,noise,factor,N);
 
 
}