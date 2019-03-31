function out = randint(varargin)


warning(message('comm:system:warnobsolete:obsoleteReplace', 'RANDI'));

% Basic function setup.
error(nargchk(0,4,nargin,'struct'));

% --- Placeholder for the signature string.
sigStr = '';
m = [];
n = [];
range = [];
state = [];

% --- Identify string and numeric arguments
for i=1:nargin
   if(i>1)
      sigStr(size(sigStr,2)+1) = '/';
   end;
   % --- Assign the string and numeric flags
   if(isnumeric(varargin{i}))
      sigStr(size(sigStr,2)+1) = 'n';
   else
      error(message('comm:randint:InvalidArg'));
   end;
end;

% --- Identify parameter signatures and assign values to variables
switch sigStr
   % --- randint
   case ''

   % --- randint(m)
   case 'n'
      m		= varargin{1};

	% --- randint(m, n)
	case 'n/n'
      m		= varargin{1};
      n		= varargin{2};

	% --- randint(m, n, range)
	case 'n/n/n'
      m		= varargin{1};
      n  	= varargin{2};
      range = varargin{3};

	% --- randint(m, n, range, state)
	case 'n/n/n/n'
      m		= varargin{1};
      n		= varargin{2};
      range = varargin{3};
      state = varargin{4};

   % --- If the parameter list does not match one of these signatures.
   otherwise
      error(message('comm:randint:InvalidSyntax'));
end;

if isempty(m)
   m = 1;
end
if isempty(n)
   n = m;
end
if isempty(range)
   range = [0, 1];
end

len_range = size(range,1) * size(range,2);

% Typical error-checking.
if all(length(m) > 1) || all(length(n) > 1)
   error(message('comm:randint:InvalidMatrixDims'));
elseif (floor(m) ~= m) || (floor(n) ~= n) || (~isreal(m)) || (~isreal(n))
   error(message('comm:randint:NonIntegerMatrixDims'));
elseif (m < 0) || (n < 0)
   error(message('comm:randint:NonPositiveMatrixDims'));
elseif (~isfinite(m)) || (~isfinite(n))
   error(message('comm:randint:NonFiniteMatrixDims'));
elseif len_range > 2
   error(message('comm:randint:InvalidIrange'));
elseif max(max(floor(range) ~= range)) || (~isreal(range)) || all(~isfinite(range))
   error(message('comm:randint:NonIntIrange'));
end

% If the IRANGE is specified as a scalar.
if len_range < 2
    if range < 0
        range = [range+1, 0];
    elseif range > 0
        range = [0, range-1];
    else
        range = [0, 0];    % Special case of zero range.
    end
end

% Make sure IRANGE is ordered properly.
range = sort(range);

% Calculate the range the distance for the random number generator.
distance = range(2) - range(1);

% Set the initial state if specified.
if ~isempty(state)
   rand('state', state);
end

% Generate the random numbers.
r = floor(rand(m, n) * (distance+1));

% Offset the numbers to the specified value.
out = ones(m,n)*range(1);
out = out + r;

% [EOF] randint.m
