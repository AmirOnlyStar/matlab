function out = show_vect (R)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%     clf;
%     ax = axes();
%     view(ax,[10 45]);
%     origin = [0 0 0];
%     grid on;
%     ax.YDir = 'reverse';
%     ax.XLim = [-3 3];
%     ax.YLim = [-3 3];
%     ax.ZLim = [-3 3];
%     hold on;
%     plot3([origin(2) v(1)], [origin(2) v(2)], [origin(3) v(3)], 'r', ...
%         'LineWidth', 50);
%     pause(0.01);
    vx = [1 ;0 ;0];
    vy = [0 ;1 ;0];
    vz = [0 ;0 ;1];
    
    vx_new = R*vx;
    vy_new = R*vy;
    vz_new = R*vz;
    
    ax = axes();
    view(ax,[20 30]);
    origin = [0 0 0];
    grid on;
    ax.YDir = 'reverse';
    ax.XLim = [-3 3];
    ax.YLim = [-3 3];
    ax.ZLim = [-3 3];
    hold on;
    
    plot3([origin(2) vx_new(1)], [origin(2) vx_new(2)], [origin(3) vx_new(3)], '->r', ...
        'LineWidth', 2);
    plot3([origin(2) vy_new(1)], [origin(2) vy_new(2)], [origin(3) vy_new(3)], '->g', ...
        'LineWidth', 2);
    plot3([origin(2) vz_new(1)], [origin(2) vz_new(2)], [origin(3) vz_new(3)], '->b', ...
        'LineWidth', 2);
    pause(0.01);

end

