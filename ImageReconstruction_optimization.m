img =imread('C:/Users/priya/Documents/Wallpapers/jeffrey-dungen-9Ng0FrXhP84-unsplash.jpg');
I = rgb2gray(img);
g = im2double(I);
figure(1);imagesc(g); axis image; colormap(gray);
[gx, gy] = gradient(g);
TV = sum(sum(sqrt(gx.^2 + gy.^2)))

[gx, gy] = gradient(g);
epsilon = 1e-10;
grad = sum(sum(sqrt(gx.^2 + gy.^2  + epsilon.^2)));
gradTV = (-1)*divergence(gx./sqrt(gx.^2+gy.^2+epsilon^2), gy./sqrt(gx.^2+gy.^2+epsilon^2));
h=gradTV;
figure(2);imagesc(h);

for c = 1:50;
    h=gradTV;
    nh=norm(h,'fro');
    ng=norm(g,'fro');
    result=(0.001.*ng)/nh;
    g=g-result.*h;
    
end
figure(3);imagesc(g); colormap(gray);