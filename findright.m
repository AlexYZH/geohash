function code=findright(code,len)
if len<=1
    return;
end
len=len-1;
if code(len) == '1'
    len=len-1;
    code=findright(code,len);  %��Ҫд��code=findright(code,len-1),�˷���һ������ԭ��
    code(len+1) = '0';
else
    code(len) = '1';
end

