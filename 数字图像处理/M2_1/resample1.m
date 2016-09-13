function newImage=resample1(image,newRow,newCol)
% ���ܣ���ͼ���������
% ���룺image-��Ҫ�������ŵĻҶ�ͼ��
%       newRow-���ź���ͼ���������
%       newCol-���ź���ͼ���������
% �����newImage-���ź��ͼ��

[row,col]=size(image);
image_larger=zeros((row+1),(col+1));
image_larger(1:row,1:col)=image;
image=image_larger;
newImage=zeros(newRow,newCol);
for i=0:(newRow-1)
    for j=0:(newCol-1)
        x=j*(col-1)/(newCol-1);
        y=i*(row-1)/(newRow-1);
        fx=floor(x);
        fy=floor(y);
        
        area_ul=(x-fx)*(y-fy);
        area_ur=(fx+1-x)*(y-fy);
        area_bl=(x-fx)*(fy+1-y);
        area_br=(fx+1-x)*(fy+1-y);
        
        newImage(i+1,j+1)=...
                             image(fy+1,fx+1)*area_br+...
                             image(fy+1,fx+2)*area_bl+...
                             image(fy+2,fx+1)*area_ur+...
                             image(fy+2,fx+2)*area_ul;
    end
end
