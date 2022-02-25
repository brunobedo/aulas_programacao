function fout = waitbar2(x, whichbar, varargin)
% WAITBAR2 - Displays wait bar with fancy color shift effect
%
% Adaptation of the MatLab standard waitbar function:
%
%   H = WAITBAR2(X,'title', property, value, property, value, ...)
%   creates and displays a waitbar of fractional length X.  The
%   handle to the waitbar figure is returned in H.
%   X should be between 0 and 1.  Optional arguments property and
%   value allow to set corresponding waitbar figure properties.
%   Property can also be an action keyword 'CreateCancelBtn', in
%   which case a cancel button will be added to the figure, and
%   the passed value string will be executed upon clicking on the
%   cancel button or the close figure button.
%
%   WAITBAR2(X) will set the length of the bar in the most recently
%   created waitbar window to the fractional length X.
%
%   WAITBAR2(X, H) will set the length of the bar in waitbar H
%   to the fractional length X.
%
%   WAITBAR2(X, H, 'updated title') will update the title text in
%   the waitbar figure, in addition to setting the fractional
%   length to X.
%
%   WAITBAR2 is typically used inside a FOR loop that performs a
%   lengthy computation.  A sample usage is shown below:
%
%       h = waitbar(0,'Please wait...', 'BarColor', 'g');
%       for i = 1:100,
%           % computation here %
%           waitbar(i/100, h);
%       end
%       close(h);
%
% Examples for the 'BarColor' option:
%   - Standard color names: 'red', 'blue', 'green', etcetera
%   - Standard color codes: 'r', 'b', 'k', etcetera
%   - A RGB vector, such as [.5 0 .5] (deep purple)
%   - Two RGB colors in a matrix, such as [1 0 0; 0 0 1] (gradient red-blue)
%
% The latter example shows how to create a custom color-shift effect. The top
% row of the 2x3 matrix gives the initial color, and the bottom row the
% end color.
%
%   Clay M. Thompson 11-9-92
%   Vlad Kolesnikov  06-7-99
%   Jasper Menger    12-5-05 ['BarColor' option added, code cleaned up]
%   (Copyright 1984-2002 The MathWorks, Inc.)

if nargin >= 2
    if ischar(whichbar)
        % We are initializing
        type = 2; 
        name = whichbar;
    elseif isnumeric(whichbar)
        % We are updating, given a handle
        type = 1; 
        f    = whichbar;
    else
        error(['Input arguments of type ', class(whichbar), ' not valid.']);
    end
elseif nargin == 1
    f = findobj(allchild(0), 'flat', 'Tag', 'TMWWaitbar');
    if isempty(f)
        type = 2;
        name = 'Waitbar';
    else
        type = 1;
        f    = f(1);
    end
else
    error('Input arguments not valid.');
end

% Progress coordinate (0 - 100%)
x = max(0, min(100 * x, 100));

switch type
    case 1
        % waitbar(x) update
        p = findobj(f, 'Tag', 'patch');
        l = findobj(f, 'Tag', 'line');
        if isempty(f) | isempty(p) | isempty(l),
            error('Couldn''t find waitbar handles.');
        end
        xpatch  = [0 x x 0];
        xline   = get(l, 'XData');
        b_map   = get(f, 'ColorMap');
        p_color = b_map(floor(x / 100 * 63) + 1, :);
        set(p, 'XData'    , xpatch);
        set(p, 'FaceColor', p_color);
        set(l, 'XData'    , xline);

        if nargin > 2
            % Update waitbar title
            hAxes  = findobj(f, 'type', 'axes');
            hTitle = get(hAxes, 'title');
            set(hTitle, 'string', varargin{1});
        end

    case 2
        % waitbar(x,name) initialize
        vertMargin = 0;
        if nargin > 2
            % we have optional arguments: property-value pairs
            if rem(nargin, 2) ~= 0
                error( 'Optional initialization arguments must be passed in pairs' );
            end
        end

        % Set units to points, and put the waitbar in the centre of the screen
        oldRootUnits = get(0,'Units');
        set(0, 'Units', 'points');
        
        screenSize     = get(0,'ScreenSize');
        axFontSize     = get(0,'FactoryAxesFontSize');
        pointsPerPixel = 72/get(0,'ScreenPixelsPerInch');
        width          = 360 * pointsPerPixel;
        height         = 75 * pointsPerPixel;
        pos            = [screenSize(3) / 2 - width / 2, ...
                          screenSize(4) / 2 - height / 2, ...
                          width, height];

        % Default color shift: dark red -> light
        barcolor1 = [0.5 0 0];
        barcolor2 = [1.0 0 0];

        f = figure(...
            'Units'        , 'points', ...
            'BusyAction'   , 'queue', ...
            'Position'     , pos, ...
            'Resize'       , 'off', ...
            'CreateFcn'    , '', ...
            'NumberTitle'  , 'off', ...
            'IntegerHandle', 'off', ...
            'MenuBar'      , 'none', ...
            'Tag'          , 'TMWWaitbar',...
            'Interruptible', 'off', ...
            'Visible'      , 'off');

        %%%%%%%%%%%%%%%%%%%%%
        % set figure properties as passed to the function
        % pay special attention to the 'cancel' request
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        if nargin > 2
            propList         = varargin(1:2:end);
            valueList        = varargin(2:2:end);
            cancelBtnCreated = 0;
            for ii = 1:length(propList)
                try
                    if strcmp(lower(propList{ii}), 'createcancelbtn') & ~cancelBtnCreated
                        % Create a cancel button
                        cancelBtnHeight = 23 * pointsPerPixel;
                        cancelBtnWidth  = 60 * pointsPerPixel;
                        newPos          = pos;
                        vertMargin      = vertMargin + cancelBtnHeight;
                        newPos(4)       = newPos(4) + vertMargin;
                        callbackFcn     = [valueList{ii}];
                        set(f, 'Position', newPos, 'CloseRequestFcn', callbackFcn);
                        cancelButt = uicontrol(...
                            'Parent'       , f, ...
                            'Units'        , 'points', ...
                            'Callback'     , callbackFcn, ...
                            'ButtonDownFcn', callbackFcn, ...
                            'Enable'       , 'on', ...
                            'Interruptible', 'off', ...
                            'String'       , 'Cancel', ...
                            'Tag'          , 'TMWWaitbarCancelButton', ...
                            'Position'     , [pos(3) - cancelBtnWidth * 1.4, 7, ...
                                              cancelBtnWidth, cancelBtnHeight]);                        
                        cancelBtnCreated = 1;
                    elseif strcmp(lower(propList{ii}), 'barcolor')
                        % Set color of waitbar
                        barcolor = valueList{ii};
                        if ischar(barcolor)
                            % Character color input: convert color code or name to RGB vector
                            switch lower(barcolor)
                                case {'r', 'red'}    , barcolor2 = [1 0 0];
                                case {'g', 'green'}  , barcolor2 = [0 1 0];
                                case {'b', 'blue'}   , barcolor2 = [0 0 1];
                                case {'c', 'cyan'}   , barcolor2 = [0 1 1];
                                case {'m', 'magenta'}, barcolor2 = [1 0 1];
                                case {'y', 'yellow'} , barcolor2 = [1 1 0];
                                case {'k', 'black'}  , barcolor2 = [0 0 0];
                                case {'w', 'white'}  , barcolor2 = [1 1 1];
                                otherwise            , barcolor2 = rand(1, 3);
                            end
                            % Color shift: dark -> light
                            barcolor1 = 0.5 * barcolor2;
                        else
                            % RGB vector color input
                            barcolor1 = barcolor(1, :);
                            if size(barcolor, 1) > 1
                                barcolor2 = barcolor(2, :);
                            else
                                barcolor2 = barcolor1;
                            end
                        end % of BarColor option
                    else
                        % simply set the prop/value pair of the figure
                        set(f, propList{ii}, valueList{ii});
                    end
                catch
                    % Something went wrong, so display warning
                    disp(sprintf('Warning: could not set property ''%s'' with value ''%s'' ', propList{ii}, num2str(valueList{ii})));
                end % of try
            end % of proplist loop
        end % of setting figure properties

        % -----------------------------------------------------------------
       
        % Create axes
        axNorm = [.05 .3 .9 .2];
        axPos  = axNorm .* [pos(3:4), pos(3:4)] + [0 vertMargin 0 0];
        h = axes(...
            'XLim'          , [0 100], ...
            'YLim'          , [0 1], ...
            'Box'           , 'on', ...
            'Units'         , 'Points', ...
            'FontSize'      , axFontSize, ...
            'Position'      , axPos, ...
            'XTickMode'     , 'manual', ...
            'YTickMode'     , 'manual', ...
            'XTick'         , [], ...
            'YTick'         , [], ...
            'XTickLabelMode', 'manual', ...
            'XTickLabel'    , [], ...
            'YTickLabelMode', 'manual', ...
            'YTickLabel'    , []);

        % Display text on top of axes
        tHandle       = title(name);
        tHandle       = get(h,'title');
        oldTitleUnits = get(tHandle,'Units');
        tExtent       = get(tHandle,'Extent');
        set(tHandle, 'Units', 'points', 'String', name, 'Units', oldTitleUnits);

        % Make sure the lay-out is OK
        titleHeight = tExtent(4) + axPos(2) + axPos(4) + 5;
        if titleHeight > pos(4)
            pos(4)      = titleHeight;
            pos(2)      = screenSize(4) / 2 - pos(4) / 2;
            figPosDirty = true;
        else
            figPosDirty = false;
        end
        if tExtent(3) > pos(3) * 1.1;
            pos(3)       = min(tExtent(3) * 1.1, screenSize(3));
            pos(1)       = screenSize(3) / 2 - pos(3) / 2;
            axPos([1,3]) = axNorm([1, 3]) * pos(3);
            figPosDirty  = true;
            set(h, 'Position', axPos);            
        end
        if figPosDirty
            set(f, 'Position', pos);
        end

        % Create two color gradient colormap
        for i = 1:64
            b_map(i, 1:3) = barcolor1 + (i - 1) / (64 - 1) * (barcolor2 - barcolor1);
        end
        set(f, 'ColorMap', b_map);

        % Draw the bar
        xpatch  = [0 x x 0];
        ypatch  = [0 0 1 1];
        xline   = [100 0 0 100];
        yline   = [0 0 1 1];
        p_color = b_map(floor(x / 100 * 63) + 1, :);
        l_color = get(gca, 'XColor');
        warning off
        p       = patch(xpatch, ypatch, p_color, 'Tag', 'patch', 'EdgeColor', 'none', 'EraseMode', 'xor');
        l       = patch(xline, yline, 'w', 'Tag', 'line', 'FaceColor', 'none', 'EdgeColor', l_color, 'EraseMode', 'xor');
        
        % Make figure visible, and restore the original units
        set(f, 'HandleVisibility', 'Callback', 'Visible', 'on');
        set(0, 'Units', oldRootUnits);

end % of case
drawnow;

% Pass on figure handles to output
if nargout == 1,
    fout = f;
end