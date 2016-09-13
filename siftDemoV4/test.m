imshow(image);
hold on;
for i = 1: size(locs,1)
    
    plot(locs(i,2),locs(i,1),'.','Color','c');
    
end