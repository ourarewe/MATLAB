% ����ϵͳ�������ڶ����������Ƶ
filename = 'viptraffic.avi';
hvfr = vision.VideoFileReader(filename, 'ImageColorSpace', 'RGB');
% ����ϵͳ��������ɫ�ʿռ�ת��
hcsc = vision.ColorSpaceConverter('Conversion', 'RGB to intensity');
% ����ϵͳ���������ø�˹���ģ�ͼ�ⱳ��
hfdet = vision.ForegroundDetector(...
        'NumTrainingFrames', 5, ...     % ȡ������֡���м�ⱳ��
        'InitialVariance', (30/255)^2);   % ��ʼ��׼��Ϊ 30/255
% ����ϵͳ�������ڼ������������˶���ͼ���
hblob = vision.BlobAnalysis( ...
                    'CentroidOutputPort', false, ...
                    'AreaOutputPort', true, ...
                    'BoundingBoxOutputPort', true, ...
                    'OutputDataType', 'single', ...
                    'MinimumBlobArea', 250, ...
                    'MaximumBlobArea', 3600, ...
                    'MaximumCount', 80);
% ����ϵͳ�������ڶԼ������˶��������п�
hshapeins = vision.ShapeInserter( ...
            'BorderColor', 'Custom', ...
            'CustomBorderColor', [0 255 0]);
% ����ϵͳ�������ڱ�ע��⵽�����ĸ���
htextins = vision.TextInserter( ...
        'Text', '%4d', ...
        'Location',  [1 1], ...
        'Color', [255 255 255], ...
        'FontSize', 12);

% ����ϵͳ����������ʾ���
sz = get(0,'ScreenSize');
pos = [20 sz(4)-300 200 200];
hVideoOrig = vision.VideoPlayer('Name', 'Original', 'Position', pos);
pos(1) = pos(1)+220;  %���Ҳཨ����һ���Ӵ�
hVideoFg = vision.VideoPlayer('Name', 'Foreground', 'Position', pos);
pos(1) = pos(1)+220;
hVideoRes = vision.VideoPlayer('Name', 'Results', 'Position', pos);
line_row = 23; % �������Ȥ����(ROI)

% ���µĳ����Ϊ���������Ƶͼ����д���
while ~isDone(hvfr)
    image = step(hvfr);      % ������Ƶ��ÿһ֡
    y = step(hcsc, image);    % ����ɫͼ��ת���ɻҶ�ͼ��

% �����Զ���ƽ���㷨ȥ���Ҷ�ͻ��
y = y-mean(y(:));

    fg_image = step(hfdet, y); % ���鱳��

    % ������ѧ��̬ѧ����ǰ��ͼ���м��仯����ͨͼ�����������
    [area, bbox] = step(hblob, fg_image);

    image_out = image;
    image_out(22:23,:,:) = 255;  % ���Ծ������ߺ�ĳ������м���
    image_out(1:15,1:30,:) = 0;  % ��������Ϊ��ɫ

    Idx = bbox(:,2) > line_row;    %ѡ�����Ȥ����.

   % ���ڸ���Ȥ�����У���ͨͼ���ı���ռ�����仯�����40%����ʱ������Ϊ�ǳ���
    ratio = zeros(length(Idx),1);
    ratio(Idx) = single(area(Idx,1))./single(bbox(Idx,3).*bbox(Idx,4));
    ratiob = ratio > 0.4;
    count = int32(sum(ratiob));    % ����������
    bbox(~ratiob,:) = int32(-1);

    % �������ĳ���Ȧ������
    image_out = step(hshapeins, image_out, bbox);

    % ��ʾ�������������
    image_out = step(htextins, image_out, count);

    step(hVideoOrig, image);          % ԭʼ��Ƶ
    step(hVideoFg,   fg_image);       % ǰ��
    step(hVideoRes,  image_out);      % �÷��򹴻������ĳ���
end

%�ر���Ƶ�ļ�
release(hvfr);
