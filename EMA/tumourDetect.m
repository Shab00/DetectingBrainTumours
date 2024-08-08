mri= imread('mri3.jpg');

grey = im2bw(mri, 0.7);

label = bwlabel(grey); 


stats = regionprops(label, 'Solidity', 'Area');

density = [stats.Solidity];
area = [stats.Area];

denseArea = density > 0.5;
maxArea = max(area(denseArea));
tumourLabel = find(area == maxArea);
tumour = ismember(label, tumourLabel);

se = strel('square',5);
tumour = imdilate(tumour,se);

figure(2)

subplot(1,3,1)
imshow(mri,[])
title('MRI Scan')

subplot(1,3,2)
imshow(tumour, [])
title('Segmented Area')

[B,L] = bwboundaries(tumour, 'noholes');
subplot(1,3,3)
imshow(mri, [])
hold on
for i = 1:length(B)
    plot(B{i}(:,2), B{i}(:,1), 'y', 'linewidth',1.45)
end
title('Detected Tumours')
hold off