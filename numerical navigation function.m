clc
clear all
syms B W 
%W represents a cell where it is possible to move.
%B represents an obstacle
%0 is the goal point
B=-1

A=[W,B,B,W,W,W,W,W,W,W;
   W,W,B,W,W,W,W,B,W,W;
   W,0,B,W,W,W,W,B,W,W;
   W,W,B,W,W,W,W,B,W,W;
   W,W,B,W,B,W,W,B,W,W;
   W,W,W,W,W,W,W,W,W,W;
   W,W,W,W,W,W,B,W,W,W;]

k=0
found=0

%while loop ends when all the reachable cells have been numbered.
%If z==k means that no new cells have been numbered, because all of them have already been
while (found==0)
    for i=1:1:7
        for j=1:1:10
            if (A(i,j)==k & i<7 & A(i+1,j)==W)
                A(i+1,j)=k+1;
                z=k+1;
            end
            if (A(i,j)==k & i>1 & A(i-1,j)==W)
                A(i-1,j)=k+1;
                z=k+1;
            end
            if (A(i,j)==k & j<10 & A(i,j+1)==W)
                A(i,j+1)=k+1;
                z=k+1;
            end
            if (A(i,j)==k & j>1 & A(i,j-1)==W)
                A(i,j-1)=k+1;
                z=k+1;
            end   

        end
    end
    
    if(z==k)   
        found=true
    end
    k=k+1;
end

fprintf('The results of the navigation function are \n')
A




 x = zeros(1,15);
 y = zeros(1,15);

 
 x(1)=2;
 y(1)=9;
 i=1;
 reached=0;
 x
 y
 t=1

%With the final part of this algorithm, we proceed backwards, going from one node to 
%another node labeled with a lower value, avoid passing through the
%obstacles (-1). The algorithm ends when the goal is reached.
 while reached==0
    if(y(t)<10 && ((A(x(t),y(t)+1))<A(x(t),y(t))) && A(x(t),y(t)+1)>=0)
        x(t+1)=x(t);
        y(t+1)=y(t)+1;
    end
    
    if(x(t)<7 && ((A(x(t)+1,y(t)))<A(x(t),y(t)))  && A(x(t)+1,y(t))>=0)
        x(t+1)=x(t)+1;
        y(t+1)=y(t);
    end
    
    if(y(t)>1 && ((A(x(t),y(t)-1))<A(x(t),y(t)))  && A(x(t),y(t)-1)>=0)
        x(t+1)=x(t);
        y(t+1)=y(t)-1;
    end
    
     if(x(t)>1 && ((A(x(t)-1,y(t)))<A(x(t),y(t))) && A(x(t)-1,y(t))>=0)
        x(t+1)=x(t)-1;
        y(t+1)=y(t);
    end
   if(A(x(t),y(t))==0)
        reached=1
   end
    
   t=t+1;

 end
 %the sequence of cells from the start to the goal is:
 x
 y
 
 Matrix=[1 0 0 1 1 1 1 1 1 1;
    1 1 0 1 1 1 1 0 1 1;
    1 1 0 1 1 1 1 0 1 1;
    1 1 0 1 1 1 1 0 1 1;
    1 1 0 1 0 1 1 0 1 1;
    1 1 1 1 1 1 1 1 1 1;
    1 1 1 1 1 1 0 1 1 1;]
for i=1:length(x)
    Matrix(x(i),y(i))=0.8;
end 
imshow(Matrix,'InitialMagnification', 5000)
hold on,
plot(y,x,'o','Color','red')