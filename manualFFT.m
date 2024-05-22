clear all; close all hidden;
z = @(t) cos(2*pi*t)+cos(2*pi*2*t);
Ts = 0.0001;
Tnyq = 1/(2*pi*2);
t =0:Tnyq:1;

% plot(t,z(t))

X = mFFT(z(t),20);
plot(1:size(X,1),abs(X))

function X = mFFT(x,k)

p = floor(log2(size(x,2)));
N = 2^p;
x = x(1:N);

X = zeros(k,1);
for m = 1:k
    for n = 1:N/2
        X(m) = X(m) + (x(n)+x(n+N/2)*(-1)^m)*exp((-1i*m*pi*n)/N);
    end
    X(m) = (1/N)*X(m);
end

end
