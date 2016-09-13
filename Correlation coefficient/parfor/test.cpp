#include "mex.h"
#include "algorithm"
using namespace std;

void mexFunction( int nlhs , mxArray *plhs[] , int nrhs, mxArray *prhs[]) 
{
	double *x;//double *y;
    double *r;
    //double *mx;double *my;
    mwSize mrows = mxGetM(prhs[0]);
    mwSize ncols = mxGetN(prhs[0]);
    int m = (int)mrows;int n = (int)ncols;
	plhs[0] = mxCreateDoubleMatrix(m,1,mxREAL);
	x = mxGetPr(prhs[0]);//y = mxGetPr(prhs[1]);
	//mx = mxGetPr(prhs[2]);my = mxGetPr(prhs[3]);
    r = mxGetPr(plhs[0]);
    //mxArray *out[1];double *outdata;
    mxArray *in[1];double *indatax;//double *indatay;
    //out[0] = mxCreateDoubleMatrix(1,1,mxREAL);//outdata = mxGetPr(out[0]);
    in[0] = prhs[0];//indatax = x;
    //in[0] = mxCreateDoubleMatrix(m,n,mxREAL);indatax = mxGetPr(in[0]);
    //in[1] = mxCreateDoubleMatrix(mrows,1,mxREAL);indatay = mxGetPr(in[1]);
 
    for(int j=0;j<m;j++) {r[j]=x[j];}
    mexCallMATLAB(0, NULL, 1, in, "disp");//outdata = mxGetPr(out[0]);
    
    
    
}