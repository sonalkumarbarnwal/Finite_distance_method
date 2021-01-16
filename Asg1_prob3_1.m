%% This is a sample program for EE 735 students by P.R. Nair, EE, IITB. 
%% Here we attempt to solve a second order differential equation 
%% using finite difference method

% The equation being solved is d^2V/dx^2=0 with boundary conditions V(0)=0
% and V(L)=1; Note that equations are explicitly written for the boundary
% nodes. So there are N equations. Else, one could solve by
% considering only N-2 unknowns and setting up the equations appropriately.

close all
clear all

L=10; % spatial extent
N=11; % number of grid points
xx=linspace(0,L,N); % the grid on space coordinates

% We now set up the equation as A_mat*V=B_mat;

A_mat=zeros(N,N); 
B_mat=zeros(N,1);

for ii=2:N-1
    A_mat(ii,ii-1)=1;
    A_mat(ii,ii)=-2;
    A_mat(ii,ii+1)=1;
end
% The boundary conditions
A_mat(1,1)=1;
A_mat(N,N)=1;
B_mat(N)=1;
% The solution

V=A_mat\B_mat; % Explore about the backslash operator
disp(size(xx));
disp(size(V));
% Plot the results
figure(1)
plot(xx,V,'-*','linewidth',1,'markersize',5) 
%xlim([0 10.5])
%ylim([-8 0])
xlabel('spatial distance')
ylabel('Voltage')
title('Volatge vs distance')

