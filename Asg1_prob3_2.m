%% This is a sample program for EE 735 students by P.R. Nair, EE, IITB. 
%% Here we attempt to solve a second order differential equation 
%% using finite difference method

% The equation being solved is d^2V/dx^2=0 with boundary conditions V(0)=0
% and V(L)=1; Note that equations are explicitly written for the boundary
% nodes. So there are N equations. Else, one could solve by
% considering only N-2 unknowns and setting up the equations appropriately.

close all
clear all

L1=5*10^-7; % spatial extent
N1=11; % number of grid points
L = 10^-6;
N2 = 25;
xx1=linspace(0,L1,N1); % the grid on space coordinates
xx2 = linspace(L1+ 2*10^-8,L,N2);
xx = [xx1 xx2];
% We now set up the equation as A_mat*V=B_mat;

A_mat=zeros((N1+N2),(N1+N2)); 
B_mat=zeros((N1+N2),1);

for ii=2:N1+N2-1
    A_mat(ii,ii-1)=1;
    A_mat(ii,ii)=-2;
    A_mat(ii,ii+1)=1;
end
% The boundary conditions
A_mat(1,1)=1;
A_mat(N1+N2,N1+N2)=1;
B_mat(N1+11)=-(10^14)/(9*8.85);
B_mat(N1+N2) = 1;
% The solution

V=A_mat\B_mat; % Explore about the backslash operator
disp(xx);
disp(size(V));
% Plot the results
figure(1)
plot(xx ,V,'-*','linewidth',1,'markersize',5) 
%xlim([0 10.5])
%ylim([-8 0])
xlabel('spatial distance')
ylabel('Voltage')
title('Volatge vs distance')

