function model=CreateModel()


% Node 1 is depot and has zeros demand.

x=[292,298,309,307,336,320,321,322,323,324,323,314,311,304,293,296,261,297,315,314,321,321,314,313,304,295,283,279,271,264,277,290,319];
%X-Cor

y=[495,427,445,464,475,439,437,437,433,433,429,435,442,427,421,418,384,410,407,406,391,398,394,378,382,402,406,399,401,414,439,434,433];
%Y-Cor

r=[0,700,400,400,1200,40,80,2000,900,600,750,1500,150,250,1600,450,700,550,650,200,400,300,1300,700,750,1400,4000,600,1000,500,2500,1700,1100];
%Demands

Cap=8000;
%Vehicles capacity




c=repmat(Cap,1,ceil(sum(r)/Cap));
J=numel(c);
I=numel(x);

d=zeros(I,I);
for i=1:I
    for i2=i+1:I
        d(i,i2)=round(sqrt((x(i)-x(i2))^2+(y(i)-y(i2))^2));
        d(i2,i)=d(i,i2);
    end
    
end

model.x=x;
model.y=y;

model.I=I;
model.J=J;
model.r=r;
model.c=c;
model.d=d;


end