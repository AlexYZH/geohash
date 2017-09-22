function geohash=encode(lat,lot,prec) %����
% Base32����    
Base32= '0123456789bcdefghjkmnpqrstuvwxyz';
latitude=[-90,90];%γ��
longitude=[-180,180];%����
length=prec*5;%��Ҫ�Ķ����Ʊ��볤��
k=1;
bits=zeros(1,5);%��¼��������
l=1;
for i=1:length
    if mod(i,2)~=0  
        mid=mean(longitude);
        if lot>mid
            bits(l)=1;
            l=l+1;
            longitude(1)=mid;
        else
            bits(l)=0;
            l=l+1;
            longitude(2)=mid;
        end
    else
        mid=mean(latitude);  %��1��ʼ����λΪγ��
        if lat>mid
            bits(l)=1;
            l=l+1;
            latitude(1)=mid;
        else
            bits(l)=0;
            l=l+1;
            latitude(2)=mid;
        end
    end
    if ~mod(i,5)
        geohash(k)=Base32(1*bits(5)+2*bits(4)+4*bits(3)+8*bits(2)+16*bits(1)+1);
        bits=zeros(1,5);
        l=1;
        k=k+1;
    end
end

        
        
        

  
    


