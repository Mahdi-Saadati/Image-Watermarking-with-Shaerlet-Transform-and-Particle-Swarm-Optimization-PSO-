function out=PSOextracting()
 
% Problem Definition
CostFunction=@fitness_PSNR;     % Cost Function
nVar=1;                   % Number of Decison Variables
VarSize=[1 nVar];          % Size of Decision Variables Matrix
VarMin=0.01;                % Lower Bound of Decision Variables
VarMax=1;                 % Upper Bound of Decision Variables
VelMax=(VarMax-VarMin)/10;
%% PSO Parameters
MaxIt=100;                  % Maximum Number of Iterations
nPop=8;                     % swarm Size
phi1=2.05;
phi2=2.05;
phi=phi1+phi2;
chi=2/(phi-2+sqrt(phi^2-4*phi));
 
w=chi;                       % Inertia Weight
wdamp=1;                     % Inertia Weight Damping Ratio
c1=chi*phi1;                 % Personal Learning Coefficient
c2=chi*phi2;                 % Global Learning Coefficient
 
%% Initialization
empty_particle.Position=[];
empty_particle.Velocity=[];
empty_particle.Cost=[];
empty_particle.Best.Position=[];
empty_particle.Best.Cost=[];
 
particle=repmat(empty_particle,nPop,1);
GlobalBest.Cost=inf;
 
for i=1:nPop
    particle(i).Position=unifrnd(VarMin,VarMax,VarSize);
    particle(i).Velocity=zeros(VarSize);
    particle(i).Cost=CostFunction(particle(i).Position);
    particle(i).Best.Position=particle(i).Position;
    particle(i).Best.Cost=particle(i).Cost;
    if particle(i).Best.Cost<GlobalBest.Cost
        GlobalBest=particle(i).Best;
    end 
%     disp([' i=' num2str(i) '  Position=' num2str(particle(i).Position) '  Cost=' num2str(100-particle(i).Cost) ' GlobalBest.Position:' num2str(GlobalBest.Position) '    GlobalBest.Cost:' num2str(100-GlobalBest.Cost)]);
end
BestCost=zeros(MaxIt,1);
BestScalingFactor=zeros(MaxIt,1);
%% PSO Main Loop
for it=1:MaxIt
    for i=1:nPop
        particle(i).Velocity = w * particle(i).Velocity ...
        +c1*rand*(particle(i).Best.Position - particle(i).Position) ...
        +c2*rand*(GlobalBest.Position - particle(i).Position);
particle(i).Velocity=min(max(particle(i).Velocity,-VelMax),+VelMax);
        particle(i).Position=particle(i).Position+particle(i).Velocity;
        flag=(particle(i).Position<VarMin | particle(i).Position>VarMax);
        particle(i).Velocity(flag)=-particle(i).Velocity(flag);
        particle(i).Position=min(max(particle(i).Position,VarMin),VarMax);
        particle(i).Cost=CostFunction(particle(i).Position);
        if particle(i).Cost<particle(i).Best.Cost
            particle(i).Best.Position=particle(i).Position;
            particle(i).Best.Cost=particle(i).Cost;
            if particle(i).Best.Cost<GlobalBest.Cost
                GlobalBest=particle(i).Best;    
            end
        end
% disp([' i=' num2str(i) '  Position=' num2str(particle(i).Position) '  Cost=' num2str(100-particle(i).Cost) ' GlobalBest.Position:' num2str(GlobalBest.Position) '    GlobalBest.Cost:' num2str(100-GlobalBest.Cost)]);
    end
    BestCost(it)=GlobalBest.Cost;
    BestScalingFactor(it)=GlobalBest.Position;
%     disp(['Iteration ' num2str(it) ' =>  Scaling factor = ' num2str(GlobalBest.Position) ' : Best Cost = ' num2str(100-GlobalBest.Cost)]);
    w=w*wdamp;
    if GlobalBest.Cost<=0.0001
        break;
    end
end
out=GlobalBest.Position;
end
%%
function out=fitness_PSNR(Scaling_Factor)
global  InputImage watermark0 ExtractWatermark ;
global  m2 n2; 
global  LL_R_S  LL_G_S  LL_B_S;
global  LL_R_S2 LL_G_S2 LL_B_S2;
 
ExtractWatermark_R=(LL_R_S2-LL_R_S)/Scaling_Factor;
ExtractWatermark_G=(LL_G_S2-LL_G_S)/Scaling_Factor;
ExtractWatermark_B=(LL_B_S2-LL_B_S)/Scaling_Factor;
 
ExtractWatermark=cat(3,ExtractWatermark_R,ExtractWatermark_G,ExtractWatermark_B);
ExtractWatermark = double(imresize((ExtractWatermark),[m2,n2]));
x=PSNR(watermark0,ExtractWatermark);
out=100-x;
end

%%
% function out = MSE (pic1, pic2)
%     [rows, columns, ~] = size(pic1);
%     Rpic1=pic1(:,:,1);
%     Gpic1=pic1(:,:,2);
%     Bpic1=pic1(:,:,3);
%  
%     Rpic2=pic2(:,:,1);
%     Gpic2=pic2(:,:,2);
%     Bpic2=pic2(:,:,3);
%     mse=0;
%  
%     for i=1:rows
%         for j=1:columns
%             mse = mse + double(((Rpic1(i,j)-Rpic2(i,j))^2)+((Gpic1(i,j)-Gpic2(i,j))^2)+((Bpic1(i,j)-Bpic2(i,j))^2));
%         end
%     end
%     out = mse / (3*rows * columns);
% end
% %%
% function out=PSNR(pic1,pic2)
% m=MSE(pic1, pic2);
% out = 10 * log10( double((255*255) / m));
% end


