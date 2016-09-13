#include "mex.h"
//using namespace std;
void mexFunction(int nlhs, mxArray *plhs[],
                 int nrhs, mxArray *prhs[])
{
    double *x;double *y;
    mxArray *IN[2];
    mxArray *OUT[1];
    double *r;double *outdata1;double *outdata2;
    //OUT[0] = mxCreateDoubleMatrix(1, 1, mxREAL);
    outdata1 = mxGetPr(OUT[0]);
    //IN[0]=plhs[0];IN[1]=plhs[1];
    int M,N;
    int i,j;
    mexPrintf("out1=%f\n",*outdata1);
    mexCallMATLAB(1,OUT,2,prhs,"corr");outdata2 = mxGetPr(OUT[0]);
    plhs[0]=OUT[0];
    mexPrintf("out1=%p  out2=%p  \n",outdata1,outdata2);
    
}