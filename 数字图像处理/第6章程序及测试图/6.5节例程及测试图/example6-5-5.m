% 创建系统对象，用于读入待处理视频
filename = 'viptraffic.avi';
hvfr = vision.VideoFileReader(filename, 'ImageColorSpace', 'RGB');
% 创建系统对象，用于色彩空间转换
hcsc = vision.ColorSpaceConverter('Conversion', 'RGB to intensity');
% 创建系统对象，用于用高斯混合模型检测背景
hfdet = vision.ForegroundDetector(...
        'NumTrainingFrames', 5, ...     % 取连续五帧进行检测背景
        'InitialVariance', (30/255)^2);   % 初始标准差为 30/255
% 创建系统对象，用于检测出包含汽车运动的图像块
hblob = vision.BlobAnalysis( ...
                    'CentroidOutputPort', false, ...
                    'AreaOutputPort', true, ...
                    'BoundingBoxOutputPort', true, ...
                    'OutputDataType', 'single', ...
                    'MinimumBlobArea', 250, ...
                    'MaximumBlobArea', 3600, ...
                    'MaximumCount', 80);
% 创建系统对象，用于对检测出的运动车辆进行框画
hshapeins = vision.ShapeInserter( ...
            'BorderColor', 'Custom', ...
            'CustomBorderColor', [0 255 0]);
% 创建系统对象，用于标注检测到车辆的个数
htextins = vision.TextInserter( ...
        'Text', '%4d', ...
        'Location',  [1 1], ...
        'Color', [255 255 255], ...
        'FontSize', 12);

% 创建系统对象，用于显示结果
sz = get(0,'ScreenSize');
pos = [20 sz(4)-300 200 200];
hVideoOrig = vision.VideoPlayer('Name', 'Original', 'Position', pos);
pos(1) = pos(1)+220;  %在右侧建立下一个视窗
hVideoFg = vision.VideoPlayer('Name', 'Foreground', 'Position', pos);
pos(1) = pos(1)+220;
hVideoRes = vision.VideoPlayer('Name', 'Results', 'Position', pos);
line_row = 23; % 定义感兴趣区域(ROI)

% 以下的程序段为对输入的视频图像进行处理
while ~isDone(hvfr)
    image = step(hvfr);      % 读入视频的每一帧
    y = step(hcsc, image);    % 将彩色图像转换成灰度图像

% 采用自动白平衡算法去除灰度突变
y = y-mean(y(:));

    fg_image = step(hfdet, y); % 检验背景

    % 采用数学形态学，在前景图像中检测变化的联通图像块区域的面积
    [area, bbox] = step(hblob, fg_image);

    image_out = image;
    image_out(22:23,:,:) = 255;  % 仅对经过白线后的车辆进行计数
    image_out(1:15,1:30,:) = 0;  % 将背景置为黑色

    Idx = bbox(:,2) > line_row;    %选择感兴趣区域.

   % 当在感兴趣区域中，联通图像块的比例占整个变化区域的40%以上时，便认为是车辆
    ratio = zeros(length(Idx),1);
    ratio(Idx) = single(area(Idx,1))./single(bbox(Idx,3).*bbox(Idx,4));
    ratiob = ratio > 0.4;
    count = int32(sum(ratiob));    % 车辆的数量
    bbox(~ratiob,:) = int32(-1);

    % 将检测出的车辆圈画出来
    image_out = step(hshapeins, image_out, bbox);

    % 显示检测汽车的数量
    image_out = step(htextins, image_out, count);

    step(hVideoOrig, image);          % 原始视频
    step(hVideoFg,   fg_image);       % 前景
    step(hVideoRes,  image_out);      % 用方框勾画检测出的车辆
end

%关闭视频文件
release(hvfr);
