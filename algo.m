
interval = 1.5;
blink_int = 0.2;
threshold = 1;
sig = main_sig;
plot(sig(:,1),[sig(:,2) sig(:,3)]);

skip_samples = 40;
mem_1 = 0;
mem_2 = 0;
pos1 = 0;
neg1 = 0;
pos2 = 0;
neg2 = 0;
blink1 = 0;
blink2 = 0;
ch1 = -1;
ch2 = -30;
count = 0;
[len, col] = size(sig);
for i = 1:len
    if sig(i,2) > threshold && i > mem_1+skip_samples
        j = i;
        while sig(j,1)-sig(i,1)<interval 
            if j > len-1
                break
            end
            if sig(j,2) < -1*threshold
                if sig(j,1)-sig(i,1) < blink_int
                    blink1 = 1;
                else
                    ch1 = i;
                    pos1 = 1;
                end
                mem_1 = j;
                break
            end
            j=j+1;
        end
    elseif sig(i,2) < -1*threshold && i > mem_1+skip_samples
        j = i;
        while sig(j,1)-sig(i,1)<interval
            if j > len-1
                break
            end
            if sig(j,2) > threshold
                ch1 = i;
                neg1 = 1;
                mem_1 = j;
                break
            end
            j=j+1;
        end
    end
    if sig(i,3) > threshold && i > mem_2+skip_samples
        j1 = i;
        while sig(j1,1)-sig(i,1)<interval 
            if j1 > len-1
                break
            end
            if sig(j1,3) < -1*threshold
                if sig(j1,1)-sig(i,1) < blink_int
                    blink2 = 1;
                else
                    ch2 = i;
                    pos2 = 1;
                end
                mem_2 = j1;
                break
            end
            j1=j1+1;
        end
    elseif sig(i,3) < -1*threshold && i > mem_2+skip_samples
        j1 = i;
        while sig(j1,1)-sig(i,1)<interval
            if j1 > len-1
                break
            end
            if sig(j1,3) > threshold
                ch2 = i;
                neg2 = 1;
                mem_2 = j1;
                break
            end
            j1=j1+1;
        end
    end
    if pos1 == 1 || pos2 == 1 || neg1 == 1 || neg2 == 1 || blink1 == 1 || blink2 == 1
        count = count + 1;
    end
   
    if count > 12
        if abs(ch1-ch2) < 10
            if pos1 == 1 && pos2 == 1 && neg1 == 0 && neg2 == 0
                disp("Top Right")
            elseif pos1 == 1 && pos2 == 0 && neg1 == 0 && neg2 == 1
                disp("Top Left")
            elseif pos1 == 0 && pos2 == 0 && neg1 == 1 && neg2 == 1
                disp("Bottom Left")
            elseif pos1 == 0 && pos2 == 1 && neg1 == 1 && neg2 == 0
                disp("Bottom Right")
            end
        else
            if pos1 == 1 && pos2 == 0 && neg1 == 0 && neg2 == 0
                disp("Up")
            elseif pos1 == 0 && pos2 == 0 && neg1 == 1 && neg2 == 0
                disp("Down")
            elseif pos1 == 0 && pos2 == 1 && neg1 == 0 && neg2 == 0
                disp("Right")
            elseif pos1 == 0 && pos2 == 0 && neg1 == 0 && neg2 == 1
                disp("Left")
            elseif pos1 == 0 && pos2 == 0 && neg1 == 0 && neg2 == 0 && blink1 ==1 && blink2==1
                disp("Blink")
            end
        end
    pos1 = 0;
    neg1 = 0;
    pos2 = 0;
    neg2 = 0;
    count = 0;
    blink1 = 0;
    blink2 = 0;
    end
end