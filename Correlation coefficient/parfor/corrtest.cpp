#include "mex.h"
//#include "math.h"
#include "algorithm"
//#include "iostream"
using namespace std;

void mycorr(int m,int n,double *x,double *y,double *r)
{
    int i,j,start;double u,v1,v2,a,b;
    double mx=0;double my=0;
    for(i=0;i<m;i++) mx=mx+x[i]; mx=mx/m;
    
	for(i=0;i<n;i++)
    {
        start = i*m;
        for(j=0;j<m;j++) my=my+y[start+j];my=my/m;
        u=0.0;v1=0.0;v2=0.0;a=0;b=0;
        for(j=0;j<m;j++)
        {
            a=x[j]-mx;b=y[start+j]-my;
            u=u+a*b;
            v1=v1+a*a;
            v2=v2+b*b;
        }
        r[i]=u/(sqrt(v1*v2));
    }
}

void mexFunction( int nlhs , mxArray *plhs[] , int nrhs, mxArray *prhs[]) 
{
	double *x;double *y;
    double *r;
    //double *mx;double *my;
    mwSize mrows = mxGetM(prhs[1]);
    mwSize ncols = mxGetN(prhs[1]);
    int m = (int)mrows;int n = (int)ncols;
	plhs[0] = mxCreateDoubleMatrix(1,ncols,mxREAL);
	x = mxGetPr(prhs[0]);
	y = mxGetPr(prhs[1]);
	//mx = mxGetPr(prhs[2]);
    //my = mxGetPr(prhs[3]);
    r = mxGetPr(plhs[0]);
    mycorr(m,n,x,y,r);
    //mxArray *out[1];double *outdata;
    //mxArray *in[2];double *indatax;double *indatay;
    //out[0] = mxCreateDoubleMatrix(1,1,mxREAL);//outdata = mxGetPr(out[0]);
    //in[0] = prhs[0];//indatax = x;
    //in[0] = mxCreateDoubleMatrix(mrows,1,mxREAL);indatax = mxGetPr(in[0]);
    //in[1] = mxCreateDoubleMatrix(mrows,1,mxREAL);indatay = mxGetPr(in[1]);
    /*int mexCallMATLAB(int nlhs,mxArray *plhs[],
     *                  int nrhs,mxArray *prhs[],
     *                  const char *command_name)*/
    //mexCallMATLAB(1, out, 2, prhs, "corr");outdata = mxGetPr(out[0]);
	//corr(mrows,ncols,x,y,r,mx,my); 
    //memcpy(r,rrr,1*sizeof(double));
    //r[0]=oit[0];
    //for(int i=0;i<mrows;i++) r[i]=x[i];
    //double y[10]={1,2,3,4,5,6,7,8,9,0};
    //for(int i=0;i<10;i++) indata[i]=y[i];
    //plhs[0]=out[0];//in[0]=prhs[0];
    //mexCallMATLAB(1,plhs,1,prhs,"'");
    //mexCallMATLAB(0,NULL,1,out,"disp");
    //double a;a=outdata[0];
    //double *after; after=mxGetPr(plhs[0]);
    //mexPrintf("first=%f  after=%f\n",r[0],after[0]);
    //cout<<rrr[0]<<endl;
    //mxDestroyArray(out[0]);
    //double y[10];
    //sort(y,0,10);
    /*
    for(int i=0;i<n;i++){
        for(int j=0;j<m;j++) indatay[j]=y[i*m+j];
        mexCallMATLAB(1, out, 2, in, "corr");//outdata = mxGetPr(out[0]);
        r[i] = *(mxGetPr(out[0]));
    } 
    */
}