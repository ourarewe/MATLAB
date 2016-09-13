#include "mex.h"
#include "math.h"

void corr(mwSize m,mwSize n,
        double *x,double *y,double *r,double *mx,double *my)
{
    int i,j1,j2;double u,v1,v2,a,b;
	for(i=0;i<n;i++)
    {
        u=0.0;v1=0.0;v2=0.0;a=0;b=0;j1=m*i;j2=m*(i+1)-1;
        for(;j1<=j2;j1++)
        {
            a=x[j1]-mx[i];b=y[j1]-my[i];
            u=u+a*b;
            v1=v1+a*a;
            v2=v2+b*b;
        }
        r[i]=u/(sqrt(v1*v2));
    }
    
			
}

void mexFunction( int nlhs , mxArray *plhs[] , int nrhs, const mxArray *prhs[]) 
{
	double *x;double *y;
    double *r;
    double *mx;double *my;
    mwSize mrows = mxGetM(prhs[0]);
    mwSize ncols = mxGetN(prhs[0]);
	plhs[0] = mxCreateDoubleMatrix(1,ncols,mxREAL);
	x = mxGetPr(prhs[0]);
	y = mxGetPr(prhs[1]);
	mx = mxGetPr(prhs[2]);
    my = mxGetPr(prhs[3]);
    r = mxGetPr(plhs[0]);
    
	corr(mrows,ncols,x,y,r,mx,my);
}