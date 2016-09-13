/*r=corrforlm(double *xs,double *xsm,double *y,double *rp)
 *输入:x的排序xs,-x的排序xsm,y的排序ys,皮尔孙相关系数rp
 *输出:新相关系数r
*/
#include "mex.h"
#include "algorithm"
using namespace std;

double mycorr(int m,int n,int start,double *x,double *y,double rp)
{
    int i;double u,v1,v2,a,b,r;
    double mx=0;double my=0;
    for(i=0;i<m;i++) mx=mx+x[i]; mx=mx/m;
    for(i=0;i<m;i++) my=my+y[start+i];my=my/m;
    u=0.0;v1=0.0;v2=0.0;a=0;b=0;
	for(i=0;i<m;i++)
    {
        a=x[i]-mx;b=y[start+i]-my;
        u=u+a*b;
        v1=v1+a*a;
        v2=v2+b*b;
    }
    r=u/(sqrt(v1*v2));
    return rp/r;  
}

void mexFunction( int nlhs , mxArray *plhs[] , int nrhs, mxArray *prhs[]) 
{
	double *xs;double *xsm;double *ys;double *rp;
    double *r;
    //double *mx;double *my;
    mwSize mrows = mxGetM(prhs[2]);
    mwSize ncols = mxGetN(prhs[2]);
    int m = (int)mrows;int n = (int)ncols;
	plhs[0] = mxCreateDoubleMatrix(1,ncols,mxREAL);
	xs = mxGetPr(prhs[0]);xsm = mxGetPr(prhs[1]);
	ys = mxGetPr(prhs[2]);
    rp = mxGetPr(prhs[3]);
	//mx = mxGetPr(prhs[2]);
    //my = mxGetPr(prhs[3]);
    r = mxGetPr(plhs[0]);
    int start;
    for(int i=0;i<n;i++){
        //mexPrintf("r[%d]=%f ,i,rp[]);
        start = i*m;
        if(rp[i]<0)
            r[i] = mycorr(m,n,start,xsm,ys,rp[i]);
        else
            r[i] = mycorr(m,n,start,xs,ys,rp[i]);
    }
}