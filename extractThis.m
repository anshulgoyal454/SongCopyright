function position=extractThis(file,n)
wm_sz     = 20000;                        
px_sz     = wm_sz/8;                      
im_sz     = sqrt(px_sz); 
SearchFile=file+".wav";
host_new  = audioread (char(SearchFile));
host_new  = uint8(255*(host_new + 0.5)); 
host_bin  = dec2bin(host_new, 8);
wm_bin_str = host_bin(1:wm_sz, 8);
wm_bin = reshape(wm_bin_str, px_sz , 8);
wm_str = zeros(px_sz, 1, 'uint8');
for i = 1:px_sz                                       
wm_str(i, :) = bin2dec(wm_bin(i, :));      
end
wm = reshape(wm_str, im_sz , im_sz);
for i=1:n
    watermark="watermark"+i+".png";
    ref= imread(char(watermark));
    ref=rgb2gray(ref);
    ssimval = ssim(wm,ref);
    if(ssimval>0.95)
        position=i;
    end
end
