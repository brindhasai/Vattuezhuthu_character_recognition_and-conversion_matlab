disp('testing')
load ('featureout.mat');
p=featureout;
disp(p)

net.inputs{1}.processFcns = {'removeconstantrows','mapminmax'};
load net.mat;
load net;
disp("=======")
y10=sim(net,p);

disp(y10);
[C I]=max(y10);
disp(I)
disp(C)
 
  
fid = fopen('output.html','a');
%fprintf(fid,'<html><body><p>');
%fprintf(fid,"<html><head><script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script>$(document).ready(function(){$('#convert').click(function(){var res = $('#res').children().text();$('#tamil_str').text(res);});});</script></head><body><div id='res'>");
  
if (I==1)
    fprintf(fid,'');
elseif (I==2)
    fprintf(fid,'');   
       
elseif (I==3)
   fprintf(fid,'<p>&#x0BA4;&#x0BC1;</p>\n');
     
elseif (I==4)
    fprintf(fid,'');
       
elseif (I==5)
    fprintf(fid,'<p>&#x0BB0;&#x0BBE</p>\n');
       
elseif (I==6)
    fprintf(fid,'<p>&#x0BA4;&#x0BCD;</p>\n');
       
elseif (I==7)
    fprintf(fid,'');
    
elseif (I==8)
    fprintf(fid,'');
    
elseif (I==9)
    fprintf(fid,'');
       
elseif (I==10)
    fprintf(fid,'');   
elseif (I==11)
    fprintf(fid,'<p>&#x0BA9;&#x0BCD;</p>\n');
elseif (I==12)
    fprintf(fid,'');   
elseif (I==13)
    fprintf(fid,'');   
elseif (I==14)
    fprintf(fid,'');   
elseif (I==15)
    fprintf(fid,'');   
elseif (I==16)
     fprintf(fid,'');  
elseif (I==17)
    fprintf(fid,'<p>&#x0BAA</p>\n');   
elseif (I==18)
    fprintf(fid,'');
elseif (I==19)
    fprintf(fid,'');   
elseif (I==20)
    fprintf(fid,'&#x0B99');   
elseif (I==21)
    fprintf(fid,'');   
elseif (I==22)
     fprintf(fid,'');  
elseif (I==23)
   fprintf(fid,'');    
elseif (I==24)
    fprintf(fid,'');
elseif (I==25)
    fprintf(fid,'');   
elseif (I==26)
    fprintf(fid,'');
elseif (I==27)
    fprintf(fid,'');
elseif (I==28)
    fprintf(fid,'');
elseif (I==29)
    fprintf(fid,'');
   
elseif (I==30)
    fprintf(fid,'');
   
elseif (I==31)
    fprintf(fid,'<p>&#x0BAF;&#x0BBF</p>\n');
   
elseif (I==32)
   fprintf(fid,'');
elseif (I==33)
    fprintf(fid,'');
elseif (I==34)
    fprintf(fid,'&#x0BAE');
elseif (I==35)
    fprintf(fid,'');
elseif (I==36)
    fprintf(fid,'');
elseif (I==37)
    fprintf(fid,'');
elseif (I==38)
    fprintf(fid,'');
elseif (I==39)
    fprintf(fid,'');
elseif (I==40)
    fprintf(fid,'');
elseif (I==41)
    fprintf(fid,'');
elseif (I==42)
    fprintf(fid,'');  
elseif (I==43)
    fprintf(fid,'');
elseif (I==44)
    fprintf(fid,'');
elseif (I==45)
    fprintf(fid,'');
elseif (I==46)
    fprintf(fid,'');  
elseif (I==47)
    fprintf(fid,'');
elseif (I==48)
    fprintf(fid,'');
elseif (I==49)
    fprintf(fid,'&#x0B95');
elseif (I==50)
    fprintf(fid,'<p>&#x0BA9;&#x0BC0;</p>\n');
elseif (I==51)
    fprintf(fid,'');
elseif (I==52)
    fprintf(fid,'');
elseif (I==53)
    fprintf(fid,'');
elseif (I==54)
    fprintf(fid,'');
elseif (I==55)
    fprintf(fid,'');
elseif (I==56)
    fprintf(fid,'<p>&#x0B9C</p>');
elseif (I==57)
    fprintf(fid,'');
% elseif (I==27)
%     fprintf(fid,'A');
%    
 else
     disp(' not Found');
     
   clear
end
%fprintf(fid, "</div><div><button id='convert'>Convert Text</button><br/><br/></div><div><p id='tamil_str'></p></div></body></html>");
fclose(fid);
 
 
 