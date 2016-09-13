clear
I=imread('pic18.jpg');
I=rgb2gray(I);
subplot(121),imshow(I),title('原始图像');
I=double(I);
[M,N]=size(I);
L=256;
for i=1:M
    for j=1:N
        if I(i,j)<L/4
            R(i,j)=0;
            G(i,j)=4*I(i,j);
            B(i,j)=L;
        else if I(i,j)<=L/2
                R(i,j)=0;
                G(i,j)=L;
                B(i,j)=4*I(i,j)+2*L;
            else if I(i,j)<=3*L/4
                    R(i,j)=4*I(i,j)-2*L;
                    G(i,j)=L;
                    B(i,j)=0;
                else
                    R(i,j)=L;
                    G(i,j)=-4*I(i,j)+4*L;
                    B(i,j)=0;
                end
            end
        end
    end
end
for i=1:M
    for j=1:N
        G2C(i,j,1)=R(i,j);
        G2C(i,j,2)=G(i,j);
        G2C(i,j,3)=B(i,j);
    end
end
G2C=G2C/256;
subplot(122),imshow(G2C),title('伪彩增强后的图像');
