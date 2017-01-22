function out = ImplicitEuler(u,dt,dx,N)
    lamb = dt/(dx*dx);
    u_old = u(2:N+1,2:N+1);
    A1 = gallery('tridiag',N,-1,2,-1);
    A = speye(N*N)+lamb*(kron(speye(N),A1)+kron(A1,speye(N)));
    u_new = u_old(:)\A;
    u_new = reshape(u_new,N,N);
    out = zeros(N+2,N+2);
    out(2:N+1,2:N+1)=u_new;
end