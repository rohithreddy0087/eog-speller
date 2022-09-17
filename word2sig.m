
dat = {'E','A','R','I','.','Back','Space','Enter';
                                'O','T','N','S','B','F','W','Y';
                                'L','C','U','D','K','V','X','Z';
                                'P','M','H','G','J','Q','1','2';
                                '3','4','5','6','7','8','9','0';
                                '+','x','/','-','=','&','?','!'};
            
word = 'MATERIALSENGG';

main_sig = zeros(strlength(word)*400*2,3);
x = 0:5e-3:strlength(word)*400*2*5e-3;
x = x(1:end-1)';
main_sig(1:strlength(word)*400*2,1) = x;
k = 0;
for i = 1:strlength(word)
    tmp = word(i);
    letter = cellfun(@(x)isequal(x,tmp),dat);
    [row,col] = find(letter);
    mov = gen_signal(col,sig_up,sig_dn,sig_lt,sig_rt,sig_tr,sig_br,sig_bl,sig_tl);
    main_sig(k*400+1:(k+1)*400,2:3)=mov(1:400,2:3);
    k = k + 1;
    mov = gen_signal(row,sig_up,sig_dn,sig_lt,sig_rt,sig_tr,sig_br,sig_bl,sig_tl);
    main_sig(k*400+1:(k+1)*400,2:3)=mov(1:400,2:3);
    k = k + 1;
end
plot([main_sig(:,2) main_sig(:,3)]);
function ret = gen_signal(n,sig_up,sig_dn,sig_lt,sig_rt,sig_tr,sig_br,sig_bl,sig_tl)
    if n == 1
        ret = sig_up;
    elseif n == 2
        ret = sig_rt;
    elseif n == 3
        ret = sig_dn;
    elseif n == 4
        ret = sig_lt;
    elseif n == 5
        ret = sig_tr;
    elseif n == 6
        ret = sig_br;
    elseif n == 7
        ret = sig_bl;
    elseif n == 8
        ret = sig_tl;
    end

end