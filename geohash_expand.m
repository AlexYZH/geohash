function expand=geohash_expand(geoh)
% ���볤��    
Len=size(geoh,2);
% Base32����    
Base32= '0123456789bcdefghjkmnpqrstuvwxyz';
% geohΪ�������ı��룬���ַ���
n=0;
str1='';
str='';
expand=cell(3);

for i=1:Len
    n=find(Base32==geoh(i));
    n=n-1;
    str1=dec2bin(n,5);
    str=[str,str1];
end

code=str;
len=size(code,2);              
code=findup(code,len);            %�Ź��񣬵�һ��geohash
code=findleft(code,len);
expand(1,1)={bin2geohash(code,len)};

code=str;
code=findup(code,len);
expand(1,2)={bin2geohash(code,len)}; %�Ź��񣬵ڶ���geohash

code=str;
code=findup(code,len);
code=findright(code,len);
expand(1,3)={bin2geohash(code,len)};%�Ź��񣬵�����geohash

code=str;
code=findleft(code,len);
expand(2,1)={bin2geohash(code,len)};%�Ź��񣬵��ĸ�geohash

expand(2,2)={geoh};    %�Ź��񣬵����geohash��Ҳ��������λ��

code=str;
code=findright(code,len);
expand(2,3)={bin2geohash(code,len)};%�Ź��񣬵�����geohash

code=str;
code=finddown(code,len);
code=findleft(code,len);
expand(3,1)={bin2geohash(code,len)};%�Ź��񣬵��߸�geohash

code=str;
code=finddown(code,len);
expand(3,2)={bin2geohash(code,len)};%�Ź��񣬵ڰ˸�geohash

code=str;
code=finddown(code,len);
code=findright(code,len);
expand(3,3)={bin2geohash(code,len)};%�Ź��񣬵ھŸ�geohash
expand


%%���ڽ��������ַ���ת����geohash
function geohash=bin2geohash(str,len)
Base32= '0123456789bcdefghjkmnpqrstuvwxyz';
geohash='';
str1='';
len=(len/5);
for i=1:len
    str1=Base32(bin2dec(str((i-1)*5+1:i*5))+1);
    geohash=[geohash,str1];
end



