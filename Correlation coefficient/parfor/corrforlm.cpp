/*r=corrforlm(doubl *x,double *y)
 *����:������x,����y
 *���:Ƥ�������ϵ��r
*/
#include "mex.h"
#include "algorithm"
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
   
}