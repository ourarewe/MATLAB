#include "mex.h"
void mexFunction(int nlhs, mxArray *plhs[],
                 int nrhs, mxArray *prhs[])
{
    double *inData;
    mxArray *IN[1];
    mxArray *OUT[1];
    double *outData;
    int M,N;
    int i,j;
    //�쳣����
    if(nrhs!=1)
        mexErrMsgTxt("USAGE: b=rot(a)\n");
    if(!mxIsDouble(prhs[0]))
        mexErrMsgTxt("the Input Matrix must be double!\n");
    //����ת��
    if(mexCallMATLAB(1,OUT,1,prhs,"'"))
        mexErrMsgTxt("Error when compute!\n");
    //�������������Ŀ�����Ƿ���ʾ
    if(nlhs==0)
        mexCallMATLAB(0,IN,1,OUT,"disp");
    else
        plhs[0]=OUT[0];
}