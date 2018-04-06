
%
%
% cfg.amode.cue_font
% cfg.amode.cue_font_size
%
% cfg.cuepictures
%
% cfg.Markers for cue  (e.g. in present_cue)
%
%
% TODO unfinished
% present_cue


function GraLeTaG_v098()

% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY;
%
% Version 0.98 by Michael Lindner m.lindner@reading.ac.uk
% University of Reading, 2017
% Center for Integrative Neuroscience and Neurodynamics
% https://www.reading.ac.uk/cinn/cinn-home.aspx
%


GraLe_ver=0.98;

BackgroundColor=[ 0 0 0];
NameColor=[1 .2 0];
FontColor=[1 1 1];
SmallFontColor=[.55 .55 .55];

logo=imread('GraLe_Logo.png');
logoy=size(logo,1);

cfg.figure_pos=calculate_figure_pos;

figure('Name', 'Gradient Learning Task Generator', ...
    'Visible', 'on', 'Units', 'pixels', ...
    'MenuBar', 'none', 'ToolBar', 'none', ...
    'Resize', 'off', 'NumberTitle', 'off',...
    'Position', cfg.figure_pos,...
    'Color',BackgroundColor);

uicontrol('units','pixels','position',[50 430 300 125],'cdata',logo)


% uicontrol('Style','text', ...
%     'HorizontalAlignment','center', ...
%     'Position',[20,420,380,30], ...
%     'FontSize',20,...
%     'FontWeight','bold',...
%     'ForegroundColor',NameColor,...
%     'String',name,...
%     'BackgroundColor',BackgroundColor);
uicontrol('Style','text', ...
    'HorizontalAlignment','center', ...
    'Position',[20,390,380,30], ...
    'FontSize',13,...
    'ForegroundColor',NameColor,...
    'String','Gradient Learning Task Generator',...
    'BackgroundColor',BackgroundColor);

uicontrol('Style','text', ...
    'HorizontalAlignment','left', ...
    'Position',[150,365,170,20], ...
    'FontSize',10,...
    'ForegroundColor',FontColor,...
    'String',['Version: ', num2str(GraLe_ver)],...
    'BackgroundColor',BackgroundColor);


uicontrol('Style','text', ...
    'HorizontalAlignment','center', ...
    'Position',[20,330,380,20], ...
    'FontSize',10,...
    'ForegroundColor',FontColor,...
    'String','by Michael Lindner and Anastasia Christakou',...
    'BackgroundColor',BackgroundColor);

uicontrol('Style','text', ...
    'HorizontalAlignment','center', ...
    'Position',[20,300,380,20], ...
    'FontSize',10,...
    'ForegroundColor',FontColor,...
    'String','University of Reading',...
    'BackgroundColor',BackgroundColor);
uicontrol('Style','text', ...
    'HorizontalAlignment','center', ...
    'Position',[20,260,380,40], ...
    'FontSize',10,...
    'ForegroundColor',FontColor,...
    'String','School of Psychology and Clinical Language Sciences &',...
    'BackgroundColor',BackgroundColor);
uicontrol('Style','text', ...
    'HorizontalAlignment','center', ...
    'Position',[20,230,380,40], ...
    'FontSize',10,...
    'ForegroundColor',FontColor,...
    'String','Center for Integrative Neuroscience and Neurodynamics',...
    'BackgroundColor',BackgroundColor);



% generate button
uicontrol('Style', 'pushbutton', ...
    'String', 'Generate Gradient Learning Task', ...
    'Units', 'pixels',...
    'BackgroundColor',BackgroundColor,...
    'ForegroundColor',FontColor,...
    'Position', [10,140,380,80],...
    'Callback',@generate_task);

% generate button
uicontrol('Style', 'pushbutton', ...
    'String', 'Run Gradient Learning Task', ...
    'Units', 'pixels',...
    'BackgroundColor',BackgroundColor,...
    'ForegroundColor',FontColor,...
    'Position', [10,50,380,80],...
    'Callback',@start_task);


% about button - as pushbutton - bottom right
uicontrol('Style', 'pushbutton', ...
    'String', 'Help', ...
    'Units', 'pixels',...
    'BackgroundColor',BackgroundColor,...
    'ForegroundColor',FontColor,...
    'Position', [150,20,100,20],...
    'Callback',@menu_about_function);


% quit button - as pushbutton - bottom right
uicontrol('Style', 'pushbutton', ...
    'String', 'Quit', ...
    'Units', 'pixels',...
    'BackgroundColor',BackgroundColor,...
    'ForegroundColor',FontColor,...
    'Position', [290,20,100,20],...
    'Callback',@menu_quit_function);



uicontrol('Style','text', ...
    'HorizontalAlignment','left', ...
    'Position',[1,3,390,10], ...
    'FontSize',6,...
    'ForegroundColor',SmallFontColor,...
    'String','Gradient Learning Task Generator by Michael Lindner and Anastasia Christakou, University of Reading',...
    'BackgroundColor',BackgroundColor);

    function generate_task(~,~)
        
        Prepare_GraLe
        
    end

    function start_task(~,~)
        
        close all
        Run_GraLe
        
    end


    function menu_about_function(~,~)
        
        about_text={'',...
            'Gradient Learning Task Generator  ',...
            '','',...
            'This tool is designed to generate Gradient Learning Tasks.',...
            '',...
            'Read the user manual for detailed information about ',...
            'how to use this tool or type in "doc GraLe.m"',...
            'or "help GraLe.m" for an overview of all the',...
            'the parameters.',...
            '',...
            'Enjoy playing around with this tool!',...
            '',...
            'This program is distributed in the hope that it will be useful,',...
            'but WITHOUT ANY WARRANTY!',...
            '',...
            ['Version ',num2str(GraLe_ver),' by Michael Lindner and Anastasia Christakou'],...
            'm.lindner@reading.ac.uk',...
            'University of Reading, 2016',...
            'Center for Integrative Neuroscience and Neurodynamics',...
            'https://www.reading.ac.uk/cinn/cinn-home.aspx'};
        
        f=figure('menu','none','toolbar','none','name',...
            'Example script','NumberTitle','Off');
        hPan = uipanel(f,'Units','normalized');
        uicontrol(hPan, 'Style','listbox', ...
            'HorizontalAlignment','left', ...
            'Units','normalized', 'Position',[0 .2 1 .8], ...
            'String',about_text);
        
        
        uicontrol('Style','pushbutton','String','Close',...
            'position',[10 10 200 20],...
            'Callback',@close_about);
        
        function close_about(~, ~)
            close(f)
        end
    end

    function figure_pos=calculate_figure_pos
        % calculate figure position at ~ center of screen
        % get actual screen resolution
        screen_size=get(0,'Screensize');
        % lower left corner horizontal position
        figure_pos(1)=screen_size(3)/2-200;
        % lower left corner vertical position
        figure_pos(2)=screen_size(4)/2-200;
        % horizontal size of the GUI
        figure_pos(3)=400;
        % vertical size of the GUI
        %         figure_pos(4)=460+logoy;
        figure_pos(4)=430+logoy;
    end

    function menu_quit_function(~,~)
        clear
        clc
        close all
        fprintf(['\n',...
            '############################################\n',...
            '#                                          #\n',...
            '#           Thank you for using            #\n',...
            '#                                          #\n',...
            '#                GraLe-TaG                 #\n',...
            '#                                          #\n',...
            '# Anastasia Christakou and Michael Lindner #\n',...
            '#                                          #\n',...
            '############################################\n'])
        pause(3)
    end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Generate experiment
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



    function Prepare_GraLe()
        
        % def globels
        global experiment_parameters pixsize fixstim wavmax wavmin wavsteps rotmax rotmin rotsteps
        global phaseshift posx posy masktype masktext stimrandtype nameexp numsubj
        global inittime stimtime itifix fixs mixing instbox insttext screensize
        global voc_length rule_edit_user rule_order rules huser SDEF RDEF
        global cuet3 cueorder cuet4 cueAratio
        
        % start input GUI
        GraLeTaG_GUItest3()
        
        
        %##########################################################################
        %##########################################################################
        % Nested functions for generating GraLe experiment
        %##########################################################################
        %##########################################################################
        
        
        % #################################################################
        % Input GUI
        % #################################################################
        
        function GraLeTaG_GUItest3()
            
            
            BackgroundColor=[ 0 0 0];
            BoxBackgroundColor=[ .25 .25 .25];
            ButtonBackgroundColor=[ .15 .15 .15];
            ButtonForegroundColor=[.4 .8 1];
            NameColor=[1 1 1];
            FontColor=[1 1 1];
            InfoColor=[.3 .9 .7];
            HeadColor=[.4 .8 1];
            LineColor=[.4 .8 1];
            BoxFontColor=[1 1 1];
            ReccColor=[1 .2 0];
            DoneColor=[.3 .9 .7];
            % SmallFontColor=[.55 .55 .55];
            NameSize = 24;
            HeadSize = 12;
            FontSize = 12;
            RuleFontSize = 10;
            ButtonFontSize = 24;
            
            
            guix = 1500;
            guiy = 830;
            
            fieldshift = 5;
            %
            % logo=imread('GraLe_Logo.png');
            % logoy=size(logo,1);
            
            cfg.figure_pos=calculate_figure_pos(guix,guiy);
            
            global hmain
            
            hmain = figure('Name', 'Gradient Learning Task Generator', ...
                'Visible', 'on', 'Units', 'pixels', ...
                'MenuBar', 'none', 'ToolBar', 'none', ...
                'Resize', 'off', 'NumberTitle', 'off',...
                'Position', cfg.figure_pos,...
                'Color',BackgroundColor);
            
            a = axes;
            set(a, 'Visible', 'off');
            set(a, 'Position', [0, 0, 1, 1]);
            set(a, 'Xlim', [0, 1], 'YLim', [0, 1]);
            
            shift1 = 20;
            shift2 = 20;
            ons_t1 = 20;
            ons_f1 = 370;
            ons_t2 = 780;
            ons_f2 = 1160;
            
            screensize = get(0,'Screensize');
            
            experiment_parameters = [];
            
            experiment_parameters.key{1} = 'x'; % left button
            experiment_parameters.key{2} = 'm'; % right button
            experiment_parameters.key{3} = 'space'; % start button
            experiment_parameters.key{4} = 'q'; % quit button
            
            SDEF=0;
            RDEF=0;
            
            % Title
            uicontrol('Style','text', ...
                'HorizontalAlignment','center', ...
                'Position',[guix/2-300,guiy-(NameSize*2),580,40], ...
                'FontSize',NameSize,...
                'ForegroundColor',NameColor,...
                'String','Gradient Learning Task Generator',...
                'BackgroundColor',BackgroundColor);
            
            % -----------------------------------------------------------------------
            % Frames
            % -----------------------------------------------------------------------
            
            % Stimuli
            uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t1,guiy-100,80,30], ...
                'FontSize',HeadSize,...
                'FontWeight','bold',...
                'ForegroundColor',HeadColor,...
                'String','Stimuli',...
                'BackgroundColor',BackgroundColor);
            
            % Rules
            uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t1,guiy-427,80,30], ...
                'FontSize',HeadSize,...
                'FontWeight','bold',...
                'ForegroundColor',HeadColor,...
                'String','Rules',...
                'BackgroundColor',BackgroundColor);
            
            % General
            uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t1,guiy-627,80,30], ...
                'FontSize',HeadSize,...
                'FontWeight','bold',...
                'ForegroundColor',HeadColor,...
                'String','General',...
                'BackgroundColor',BackgroundColor);
            
            % Inst
            uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t2,guiy-100,100,30], ...
                'FontSize',HeadSize,...
                'FontWeight','bold',...
                'ForegroundColor',HeadColor,...
                'String','Instructions',...
                'BackgroundColor',BackgroundColor);
            
            % Task
            uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t2,guiy-190,100,30], ...
                'FontSize',HeadSize,...
                'FontWeight','bold',...
                'ForegroundColor',HeadColor,...
                'String','Task',...
                'BackgroundColor',BackgroundColor);
            
            % attention mode
            uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t2,guiy-520,130,30], ...
                'FontSize',HeadSize,...
                'FontWeight','bold',...
                'ForegroundColor',HeadColor,...
                'String','Attention mode',...
                'BackgroundColor',BackgroundColor);
            
            
            
            % Lines
            line([0.03, .5], [(guiy-104+2*HeadSize)/guiy, (guiy-104+2*HeadSize)/guiy],...
                'Color',LineColor,'LineWidth',1,'Parent', a)
            line([0.03, .5], [(guiy-410)/guiy, (guiy-410)/guiy],...
                'Color',LineColor,'LineWidth',1,'Parent', a)
            line([0.03, .5], [(guiy-610)/guiy, (guiy-610)/guiy],...
                'Color',LineColor,'LineWidth',1,'Parent', a)
            line([0.53, 1], [(guiy-104+2*HeadSize)/guiy, (guiy-104+2*HeadSize)/guiy],...
                'Color',LineColor,'LineWidth',1,'Parent', a)
            line([0.53, 1], [(guiy-172)/guiy, (guiy-172)/guiy],...
                'Color',LineColor,'LineWidth',1,'Parent', a)
            line([0.53, 1], [(guiy-501)/guiy, (guiy-501)/guiy],...
                'Color',LineColor,'LineWidth',1,'Parent', a)
            
            line([0.5, 0.5], [0.1, .903],...
                'Color',LineColor,'LineWidth',1,'Parent', a)
            
            
            % -----------------------------------------------------------------------
            % Left side
            % -----------------------------------------------------------------------
            
            % pixel size
            uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t1+shift1,guiy-150,400,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','Size of the gratings in pixel:',...
                'BackgroundColor',BackgroundColor);
            pixsize = uicontrol('Style','edit', ...
                'Position',[ons_f1+shift1-150,guiy-150+fieldshift,80,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',BoxFontColor,...
                'String','150',...
                'BackgroundColor',BoxBackgroundColor);
            
            fixstimtext = uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_f1+shift1-50,guiy-150,200,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','fixation point on stimulus:',...
                'BackgroundColor',BackgroundColor);
            fixstim = uicontrol('Style','popup', ...
                'String', {'Select','yes','no'},...
                'Position',[ons_f1+shift1+150,guiy-150+fieldshift,80,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',ReccColor,...
                'BackgroundColor',BoxBackgroundColor,...
                'Callback',@getfixsize);
            
            % wave
            uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t1+shift1,guiy-190,400,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','Min and max wavelength of the grating (in pixel):',...
                'BackgroundColor',BackgroundColor);
            uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_f1+65+shift1,guiy-190,30,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','to',...
                'BackgroundColor',BackgroundColor);
            wavmin = uicontrol('Style','edit', ...
                'Position',[ons_f1+shift1,guiy-190+fieldshift,50,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',BoxFontColor,...
                'String','5',...
                'BackgroundColor',BoxBackgroundColor);
            wavmax = uicontrol('Style','edit', ...
                'Position',[ons_f1+90+shift1,guiy-190+fieldshift,50,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',BoxFontColor,...
                'String','25',...
                'BackgroundColor',BoxBackgroundColor);
            
            
            % wave steps
            uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_f1+shift1+170,guiy-190,80,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','stepwidth:',...
                'BackgroundColor',BackgroundColor);
            wavsteps = uicontrol('Style','edit', ...
                'Position',[ons_f1+shift1+250,guiy-190+fieldshift,50,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',BoxFontColor,...
                'String','.25',...
                'BackgroundColor',BoxBackgroundColor);
            
            % rotation
            uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t1+shift1,guiy-230,400,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','Min and max rotation of the gratings (in degree):',...
                'BackgroundColor',BackgroundColor);
            uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_f1+65+shift1,guiy-230,30,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','to',...
                'BackgroundColor',BackgroundColor);
            rotmin = uicontrol('Style','edit', ...
                'Position',[ons_f1+shift1,guiy-230+fieldshift,50,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',BoxFontColor,...
                'String','5',...
                'BackgroundColor',BoxBackgroundColor);
            rotmax = uicontrol('Style','edit', ...
                'Position',[ons_f1+90+shift1,guiy-230+fieldshift,50,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',BoxFontColor,...
                'String','85',...
                'BackgroundColor',BoxBackgroundColor);
            
            % rotation steps
            uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_f1+shift1+170,guiy-230,80,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','stepwidth:',...
                'BackgroundColor',BackgroundColor);
            rotsteps = uicontrol('Style','edit', ...
                'Position',[ons_f1+shift1+250,guiy-230+fieldshift,50,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',BoxFontColor,...
                'String','.25',...
                'BackgroundColor',BoxBackgroundColor);
            
            % phase shifts
            uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t1+shift1,guiy-270,400,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','Phase shift (0 -> 1):',...
                'BackgroundColor',BackgroundColor);
            phaseshift = uicontrol('Style','edit', ...
                'Position',[ons_f1+shift1,guiy-270+fieldshift,80,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',BoxFontColor,...
                'String','0',...
                'BackgroundColor',BoxBackgroundColor);
            
            
            % Grating positions
            uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t1+shift1,guiy-310,500,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','Position of grating in relation to screen center (in pixel)   X:',...
                'BackgroundColor',BackgroundColor);
            posx = uicontrol('Style','edit', ...
                'Position',[ons_f1+80+shift1,guiy-310+fieldshift,80,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',BoxFontColor,...
                'String','0',...
                'BackgroundColor',BoxBackgroundColor);
            uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_f1+shift1+200,guiy-310,30,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','Y:',...
                'BackgroundColor',BackgroundColor);
            posy = uicontrol('Style','edit', ...
                'Position',[ons_f1+shift1+230,guiy-310+fieldshift,80,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',BoxFontColor,...
                'String','0',...
                'BackgroundColor',BoxBackgroundColor);
            
            
            
            % mask
            uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t1+shift1,guiy-350,400,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','Select a mask style for the gratings:',...
                'BackgroundColor',BackgroundColor);
            masktype = uicontrol('Style','popup',...
                'String', {'full','gauss','circle'},...
                'Position',[ons_f1+shift1-80,guiy-350+fieldshift,100,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',BoxFontColor,...
                'BackgroundColor',BoxBackgroundColor,...
                'Callback', @getmaskval);
            masktext=uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_f1+shift1+30,guiy-350,320,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',InfoColor,...
                'String','',...
                'BackgroundColor',BackgroundColor);
            
            
            % order of gratings
            uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t1+shift1,guiy-390,400,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','Order of gratings (between subjects):',...
                'BackgroundColor',BackgroundColor);
            stimrandtype = uicontrol('Style','popup',...
                'String', {'random','pseudorandom'},...
                'Position',[ons_f1-80+shift1,guiy-390+fieldshift,100,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',BoxFontColor,...
                'BackgroundColor',BoxBackgroundColor);
            
            
            
            
            % rules
            rulebutton = uicontrol('Style', 'pushbutton', ...
                'String', 'Define Rules', ...
                'Units', 'pixels',...
                'FontSize',FontSize,...
                'BackgroundColor',BoxBackgroundColor,...
                'ForegroundColor',ReccColor,...
                'Position', [ons_t1+shift1,guiy-460+fieldshift,150,30],...
                'TooltipString', 'Specify Rules for the gratings using bmp images!!',...
                'Callback',@defrules);
            ruletexthead = uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t1+shift1+160,guiy-460,500,30], ...
                'FontSize',RuleFontSize,...
                'ForegroundColor',InfoColor,...
                'String','',...
                'BackgroundColor',BackgroundColor);
            ruletext = uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t1+shift1+160,guiy-460-130,500,100], ...
                'FontSize',RuleFontSize,...
                'ForegroundColor',InfoColor,...
                'String','',...
                'BackgroundColor',BackgroundColor);
            ruletext2 = uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t1+shift1,guiy-500,150,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',InfoColor,...
                'String','',...
                'BackgroundColor',BackgroundColor);
            
            
            
            % Name
            
             uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t1+shift1,guiy-660,200,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','Outputfolder:',...
                'BackgroundColor',BackgroundColor);
            outpath = uicontrol('Style','edit', ...
                'Position',[ons_t1+shift1+150,guiy-660+fieldshift,300,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',BoxFontColor,...
                'String','',...
                'BackgroundColor',BoxBackgroundColor);
            outbutton = uicontrol('Style', 'pushbutton', ...
                'String', 'Browse', ...
                'Units', 'pixels',...
                'FontSize',FontSize,...
                'BackgroundColor',BoxBackgroundColor,...
                'ForegroundColor',ReccColor,...
                'Position', [ons_t1+shift1+550,guiy-660+fieldshift,100,30],...
                'TooltipString', 'Specify output directory for the experiment parameter file!!',... %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                'Callback',@defoutp);
            
            uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t1+shift1,guiy-700,400,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','Name of Experiment (no spaces allowed):',...
                'BackgroundColor',BackgroundColor);
            nameexp = uicontrol('Style','edit', ...
                'Position',[ons_f1+shift1,guiy-700+fieldshift,300,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',BoxFontColor,...
                'String','Name_of_experiment',...
                'BackgroundColor',BoxBackgroundColor);
            
            % Subjects
            uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t1+shift1,guiy-740,300,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','Number of subjects:',...
                'BackgroundColor',BackgroundColor);
            numsubj = uicontrol('Style','edit', ...
                'Position',[ons_t1+shift1+170,guiy-740+fieldshift,50,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',BoxFontColor,...
                'String','25',...
                'BackgroundColor',BoxBackgroundColor);
            
            % save stimuli
            savestim = uicontrol('Style','checkbox',...
                'Position',[ons_f1+shift1,guiy-740+fieldshift,30,30],...
                'BackgroundColor',BackgroundColor,...
                'Callback',@defsavestim);
            uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_f1+shift1+20,guiy-740,250,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','Save simuli in experiment file?',...
                'TooltipString', ['Saving the stimuli could lead a very big parameter file!',newline,...
                'But it is essential to extract the stimuli if needed!'],...
                'BackgroundColor',BackgroundColor);
            
            % -----------------------------------------------------------------------
            % Right side
            % -----------------------------------------------------------------------
            
            
            % instructions
            
            uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t2+shift2,guiy-140,200,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','Add instructions:',...
                'TooltipString', 'Specify n consecutive instruction iamges and buttons to end them',...
                'BackgroundColor',BackgroundColor);
            instbox = uicontrol('Style','popup',...
                'String', {'Select','yes','no'},...
                'Position',[ons_t2+shift2+130,guiy-140+fieldshift,80,30],...
                'FontSize',FontSize,...
                'ForegroundColor',ReccColor,...
                'BackgroundColor',BoxBackgroundColor,...
                'Callback',@definst);
            insttext=uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t2+shift2+220,guiy-140,1000,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','',...
                'TooltipString', 'Specify n consecutive instruction iamges and buttons to end them',...
                'BackgroundColor',BackgroundColor);
            
            
            % init
            uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t2+shift2,guiy-230,400,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','Length of initial time before the first stimulus appears:',...
                'BackgroundColor',BackgroundColor);
            inittime = uicontrol('Style','edit', ...
                'Position',[ons_f2+shift1,guiy-230+fieldshift,80,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',BoxFontColor,...
                'String','1500',...
                'BackgroundColor',BoxBackgroundColor);
            
            % stim time
            uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t2+shift2,guiy-270,400,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','Stimulus representation time:',...
                'BackgroundColor',BackgroundColor);
            stimtime = uicontrol('Style','popup',...
                'String', {'Select','limited','endless'},...
                'Position',[ons_f2+shift1-120,guiy-270+fieldshift,80,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',ReccColor,...
                'BackgroundColor',BoxBackgroundColor,...
                'Callback',@getstimtime);
            limtext=uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_f2+shift2-10,guiy-270,500,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',InfoColor,...
                'String','',...
                'BackgroundColor',BackgroundColor);
            
            
            % iti time
            uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t2+shift2,guiy-310,100,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','ITI type:',...
                'TooltipString', 'Define presentation time of ITI (random or prseudorandom)!!',...
                'BackgroundColor',BackgroundColor);
            uicontrol('Style','popup',...
                'String', {'Select','constant','random','pseudorandom'},...
                'Position',[ons_t2+shift2+100,guiy-310+fieldshift,80,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',ReccColor,...
                'BackgroundColor',BoxBackgroundColor,...
                'TooltipString', 'Define presentation time of ITI (random or prseudorandom)!!',...
                'Callback',@defitirand);
            itiinfo = uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t2+shift2+200,guiy-310,200,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',InfoColor,...
                'String','',...
                'TooltipString', 'Define presentation time of ITI?',...
                'BackgroundColor',BackgroundColor);
            uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_f2+shift2,guiy-310,100,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','Fixation:',...
                'TooltipString', 'Present fixation cross during ITI?',...
                'BackgroundColor',BackgroundColor);
            itifix = uicontrol('Style','popup',...
                'String', {'Select','yes','no'},...
                'Position',[ons_f2+shift2+70,guiy-310+fieldshift,80,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',ReccColor,...
                'BackgroundColor',BoxBackgroundColor,...
                'TooltipString', 'Present fixation cross during ITI?',...
                'Callback',@getfixsize);
            fixs=uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_f2+shift2+160,guiy-310,50,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',InfoColor,...
                'String','',...
                'BackgroundColor',BackgroundColor);
            
            
            %mixing
            uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t2+shift2,guiy-350,500,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','Length of equal condition mixing:',...
                'TooltipString', 'Nr max trials of each rule need to be dividable by this number!!',...
                'BackgroundColor',BackgroundColor);
            mixing = uicontrol('Style','edit',...
                'Position',[ons_f2+shift1,guiy-350+fieldshift,80,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',BoxFontColor,...
                'String', '20',...
                'TooltipString', 'Nr max trials of each rule need to be dividable by this number!!',...
                'BackgroundColor',BoxBackgroundColor);
            
            
            % buttons
            uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t2+shift2,guiy-390,400,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','Buttons:',...
                'BackgroundColor',BackgroundColor);
            buttontext = uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t2+shift2+100,guiy-390,400,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',InfoColor,...
                'String',['Left: ',experiment_parameters.key{1}, '  Right: ',experiment_parameters.key{2}],...
                'BackgroundColor',BackgroundColor);
            uicontrol('Style', 'pushbutton', ...
                'String', 'Change buttons', ...
                'Units', 'pixels',...
                'FontSize',FontSize,...
                'BackgroundColor',BoxBackgroundColor,...
                'ForegroundColor',BoxFontColor,...
                'Position', [ons_f2+shift2,guiy-390+fieldshift,150,30],...
                'TooltipString', 'Change the key/buttons used for the responses!!',...
                'Callback',@change_button);
            
            % Feedback
            uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t2+shift2,guiy-470,200,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','Present Feedback:',...
                'TooltipString', 'Present picture or text as feedback?',...
                'BackgroundColor',BackgroundColor);
            feedback = uicontrol('Style','popup',...
                'String', {'Select','yes','no'},...
                'Position',[ons_t2+shift1+150,guiy-470+fieldshift,80,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',ReccColor,...
                'BackgroundColor',BoxBackgroundColor,...
                'TooltipString', 'Present picture or text as feedback?',...
                'Callback',@deffeedback);
            fbtext=uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_f2+shift2-130,guiy-470,500,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',InfoColor,...
                'String','',...
                'BackgroundColor',BackgroundColor);
            
            % -----------------------------------------------------------------------
            % attention mode
            
            amode = uicontrol('Style','checkbox', ...
                'Position',[ons_t2+shift2,guiy-550+fieldshift,30,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'BackgroundColor',BackgroundColor,...
                'Callback',@attentionmode);
            uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t2+shift2+30,guiy-550,200,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','activate attention mode',...
                'BackgroundColor',BackgroundColor);
            
            
            
            cuet0 = uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t2+shift2,guiy-590,50,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'FontWeight','bold',...
                'String','CUE:',...
                'TooltipString', 'Cue of for attention mode.',...
                'Visible', 'off',...
                'BackgroundColor',BackgroundColor);
            cuet1 = uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t2+shift2+80,guiy-590,50,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','type:',...
                'TooltipString', 'Specify type of cue (text or pictures)!',...
                'Visible', 'off',...
                'BackgroundColor',BackgroundColor);
            cuetype = uicontrol('Style','popup',...
                'String', {'Select','text','picture'},...
                'Position',[ons_t2+shift2+130,guiy-590+fieldshift,100,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',ReccColor,...
                'BackgroundColor',BoxBackgroundColor,...
                'TooltipString', 'Specify type of cue (text or pictures)!',...
                'Visible', 'off',...
                'Callback',@defcuetype);
            cuet2 = uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t2+shift2+250,guiy-590,60,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','time:',...
                'TooltipString', 'Constant, random or pseudorandom stimulus presentation time.',...
                'Visible', 'off',...
                'BackgroundColor',BackgroundColor);
            cuetime = uicontrol('Style','popup',...
                'String', {'Select','constant','random','pseudorandom'},...
                'Position',[ons_t2+shift2+300,guiy-590+fieldshift,100,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',ReccColor,...
                'BackgroundColor',BoxBackgroundColor,...
                'TooltipString', 'Constant, random or pseudorandom stimulus presentation time.',...
                'Visible', 'off',...
                'Callback',@defcuetime);
            cueinfo = uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t2+shift2+410,guiy-590,400,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',InfoColor,...
                'String','',...
                'Visible', 'off',...
                'BackgroundColor',BackgroundColor);
            
            
            
            cuet3 = uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t2+shift2+80,guiy-630,50,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','order:',...
                'TooltipString', 'Specify order of cue (text or pictures)!',...
                'Visible', 'off',...
                'BackgroundColor',BackgroundColor);
            cueorder = uicontrol('Style','popup',...
                'String', {'Select','random','pseudorandom'},...
                'Position',[ons_t2+shift2+130,guiy-630+fieldshift,100,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',ReccColor,...
                'BackgroundColor',BoxBackgroundColor,...
                'TooltipString', 'Specify order of cue (text or pictures)!',...
                'Visible', 'off',...
                'Callback',@defcueorder);
            cuet4 = uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t2+shift2+250,guiy-630,100,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','ratio (cue 1):',...
                'TooltipString', 'Ratio of cue order. Value for cue type 1.',...
                'Visible', 'off',...
                'BackgroundColor',BackgroundColor);
            cueAratio = uicontrol('Style','edit',...
                'Position',[ons_t2+shift2+400,guiy-630+fieldshift,80,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',BoxFontColor,...
                'String', '50',...
                'TooltipString', 'Ratio of cue order. Value for cue type 1.',...
                'Visible', 'off',...
                'BackgroundColor',BoxBackgroundColor);
%             cuetime = uicontrol('Style','popup',...
%                 'String', {'Select','constant','random','pseudorandom'},...
%                 'Position',[ons_t2+shift2+300,guiy-630+fieldshift,100,30], ...
%                 'FontSize',FontSize,...
%                 'ForegroundColor',ReccColor,...
%                 'BackgroundColor',BoxBackgroundColor,...
%                 'TooltipString', 'Constant, random or pseudorandom stimulus presentation time.',...
%                 'Visible', 'off',...
%                 'Callback',@defcuetime);
            
            
            
            
            
            isit0 = uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t2+shift2,guiy-670,50,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'FontWeight','bold',...
                'String','ISI:',...
                'TooltipString', 'attention mode ISI between cue and stimulus presentation.',...
                'Visible', 'off',...
                'BackgroundColor',BackgroundColor);
            isit1 = uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t2+shift2+80,guiy-670,60,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','time:',...
                'TooltipString', 'Constant, random or pseudorandom time between cue ad stimulus presentation.',...
                'Visible', 'off',...
                'BackgroundColor',BackgroundColor);
            isitime = uicontrol('Style','popup',...
                'String', {'Select','constant','random','pseudorandom'},...
                'Position',[ons_t2+shift2+130,guiy-670+fieldshift,100,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',ReccColor,...
                'BackgroundColor',BoxBackgroundColor,...
                'TooltipString', 'Constant, random or pseudorandom time between cue and stimulus presentation.',...
                'Visible', 'off',...
                'Callback',@defisitime);
            
            isit2 = uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t2+shift2+440,guiy-670,60,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','fixation:',...
                'TooltipString', 'Present fixation point during ISI.',...
                'Visible', 'off',...
                'BackgroundColor',BackgroundColor);
            isifix = uicontrol('Style','popup',...
                'String', {'Select','yes','no'},...
                'Position',[ons_t2+shift2+510,guiy-670+fieldshift,80,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',ReccColor,...
                'BackgroundColor',BoxBackgroundColor,...
                'TooltipString', 'Present fixation point during ISI.',...
                'Visible', 'off',...
                'Callback',@getfixsize);
            isiinfo = uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t2+shift2+250,guiy-670,150,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',InfoColor,...
                'String','',...
                'Visible', 'off',...
                'BackgroundColor',BackgroundColor);
            
            
            
            
            
            
            stimt0 = uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t2+shift2,guiy-710,50,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'FontWeight','bold',...
                'String','STIM:',...
                'TooltipString', 'Specify parameters for the two stimlui of attention mode.',...
                'Visible', 'off',...
                'BackgroundColor',BackgroundColor);
            stimt1 = uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t2+shift2+80,guiy-710,60,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','type:',...
                'TooltipString', ['Define type of the second (unattended) stimulus. Either a mirrored version,',newline,...
                'using parameters from the unused parts of the rules or random ones.'],...
                'Visible', 'off',...
                'BackgroundColor',BackgroundColor);
            stimtype = uicontrol('Style','popup',...
                'String', {'Select','0 from rules','mirror','random'},...
                'Position',[ons_t2+shift2+130,guiy-710+fieldshift,100,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',ReccColor,...
                'BackgroundColor',BoxBackgroundColor,...
                'TooltipString', ['Define type of the second (unattended) stimulus. Either a mirrored version,',newline,...
                'using parameters from the unused parts of the rules or random ones.'],...
                'Visible', 'off',...
                'Callback',@defstimtype);
            
            stimbutton = uicontrol('Style', 'pushbutton', ...
                'String', 'Define stim positions', ...
                'Units', 'pixels',...
                'FontSize',FontSize,...
                'BackgroundColor',BoxBackgroundColor,...
                'ForegroundColor',ReccColor,...
                'Position', [ons_t2+shift2+250,guiy-710+fieldshift,170,30],...
                'Visible', 'off',...
                'TooltipString', ['Define x and y coordinates of the two stimuli in relation',newline,...
                'to center of the screen. (e.g. x1=-300; y1=0; x1=300; y2=0 for',newline,...
                'left and right presentation shifted 300 pixel from the center.)'],...
                'Callback',@defstimbutton);
            
            stimt2 = uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t2+shift2+440,guiy-710,60,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',FontColor,...
                'String','fixation:',...
                'TooltipString', 'Present fixation on stimuli screen.',...
                'Visible', 'off',...
                'BackgroundColor',BackgroundColor);
            stimfix = uicontrol('Style','popup',...
                'String', {'Select','yes','no'},...
                'Position',[ons_t2+shift2+510,guiy-710+fieldshift,80,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',ReccColor,...
                'BackgroundColor',BoxBackgroundColor,...
                'TooltipString', 'Present fixation on stimuli screen.',...
                'Visible', 'off',...
                'Callback',@getfixsize);
            stiminfo = uicontrol('Style','text', ...
                'HorizontalAlignment','left', ...
                'Position',[ons_t2+shift2+130,guiy-750,500,30], ...
                'FontSize',FontSize,...
                'ForegroundColor',InfoColor,...
                'String','',...
                'Visible', 'off',...
                'BackgroundColor',BackgroundColor);
            
            
            
            
            % -----------------------------------------------------------------------
            % button
            % -----------------------------------------------------------------------
            % generate button
            uicontrol('Style', 'pushbutton', ...
                'String', 'Generate Gradient Learning Task', ...
                'Units', 'pixels',...
                'FontSize',ButtonFontSize,...
                'FontWeight','bold',...
                'BackgroundColor',ButtonBackgroundColor,...
                'ForegroundColor',ButtonForegroundColor,...
                'Position', [300,guiy-820+3,900,70],...
                'Callback',@generate_task);
            
            % -----------------------------------------------------------------------
            % Helper fuctions
            % -----------------------------------------------------------------------
            
            function generate_task(~,~)
                
                experiment_parameters.version = GraLe_ver;
        
                startgen = 1;
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                % check selection
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                
                if get(instbox , 'Value') == 1
                    msgfunc
                    startgen = 0;
                elseif get(stimtime , 'Value') == 1
                    msgfunc
                    startgen = 0;
                elseif get(itifix , 'Value') == 1
                    msgfunc
                    startgen = 0;
                elseif get(feedback , 'Value') == 1
                    msgfunc
                    startgen = 0;
                end
                
                if RDEF == 0
                    errordlg('Rules need to be specified!','Input error')
                    startgen = 0;
                end
                
                
                s=get(savestim, 'Value');
                if s == 0
                    experiment_parameters.savestim = 'no';
                elseif s == 1
                    experiment_parameters.savestim = 'yes';
                end
                
                Items = get(masktype,'string');
                select= get(masktype,'Value');
                experiment_parameters.imagemask = Items{select};
                
                experiment_parameters.initialITI = str2num(get(inittime, 'String'));
                %         Items = get(itirand,'string');
                %         select= get(itirand,'Value');
                %         experiment_parameters.ITIrand = Items{select};
                %         experiment_parameters.ITIvar = num2str(get(ititime, 'String'));
                experiment_parameters.mixtype = str2num(get(mixing, 'String'));
                experiment_parameters.NameExperiment = get(nameexp, 'String');
                if isempty(experiment_parameters.outputpath)
                    errordlg('Name of experiment needs to be specified!','Input error')
                    startgen = 0;
                end
                experiment_parameters.outputpath = get(outpath, 'String');
                if isempty(experiment_parameters.outputpath)
                    errordlg('Output folder needs to be specified!','Input error')
                    startgen = 0;
                end
                experiment_parameters.NumberSubjects = str2num(get(numsubj, 'String'));
                Items = get(itifix,'string');
                select= get(itifix,'Value');
                experiment_parameters.present_fix = Items{select};
                
                Items = get(stimrandtype,'string');
                select= get(stimrandtype,'Value');
                experiment_parameters.SelectingGrating = Items{select};
                
                s=get(amode, 'Value');
                if s == 0
                    experiment_parameters.attentionmode = 'no';
                elseif s == 1
                    experiment_parameters.attentionmode = 'yes';
                end
                
                if strcmpi(experiment_parameters.attentionmode, 'yes')
                    
                    Items = get(cuetime,'string');
                    select= get(cuetime,'Value');
                    experiment_parameters.amode.cueSTIMrand = Items{select};
                    
                    Items = get(isifix,'string');
                    select= get(isifix,'Value');
                    experiment_parameters.amode.isi_fix = Items{select};
                    Items = get(stimfix,'string');
                    select= get(stimfix,'Value');
                    experiment_parameters.amode.stim_fix = Items{select};
                    
                    experiment_parameters.amode.cueAratio = str2num(get(cueAratio, 'String'));
                
                    
                    if SDEF == 0
                        errordlg('Stimuli positions need to be specified!', 'Input error');
                        startgen = 0;
                    end
                    
                    if get(cuetype , 'Value') == 1
                        msgfunc
                        startgen = 0;
                    elseif get(cueorder , 'Value') == 1
                        msgfunc
                        startgen = 0;
                    elseif get(cuetime , 'Value') == 1
                        msgfunc
                        startgen = 0;
                    elseif get(isitime , 'Value') == 1
                        msgfunc
                        startgen = 0;
                    elseif get(isifix, 'Value') == 1
                        msgfunc
                        startgen = 0;
                    elseif get(stimfix, 'Value') == 1
                        msgfunc
                        startgen = 0;
                    elseif get(stimtype , 'Value') == 1
                        msgfunc
                        startgen = 0;
                    end
                    
                    experiment_parameters.present_fix_s = 'no';
                    
                else
                    if get(fixstim , 'Value') == 1
                        msgfunc
                        startgen = 0;
                    end
                    Items = get(fixstim,'string');
                    select= get(fixstim,'Value');
                    experiment_parameters.present_fix_s = Items{select};
                end
                
                %         experiment_parameters.stimuli = ;
                %         experiment_parameters.subject = ;
                %         experiment_parameters.version = ;
                
                experiment_parameters.Inputtrigger = 'no';
                experiment_parameters.Sendtrigger = 'no';
                
                
                %         experiment_parameters.amode.cue_type
                %         experiment_parameters.amode.cueISIrand
                %         experiment_parameters.amode.cue_presenttime
                %         experiment_parameters.amode.isi_rand
                %         experiment_parameters.amode.isi_fix
                %         experiment_parameters.amode.isi_presenttime
                %         experiment_parameters.amode.img2type
                %         experiment_parameters.amode.stim_fix
                %         experiment_parameters.amode.stim_posx{}
                %         experiment_parameters.amode.stim_posy{}
                
                %         experiment_parameters;
                
                % check mixtype in relation to nr trials per rule
                for rrr=1:size(experiment_parameters.rule_order,1)
                    if mod(experiment_parameters.rule_order{rrr,3},experiment_parameters.mixtype) ~= 0
                        errordlg(['ERROR: Number of trials in rule ',num2str(rrr),': ',num2str(experiment_parameters.rule_order{rrr,3}),' is not divisable by ',experiment_parameters.mixtype ,' without remainder!'],'Input error')
                        error(['ERROR: Number of trials in rule ',num2str(rrr),': ',num2str(experiment_parameters.rule_order{rrr,3}),' is not divisable by ',experiment_parameters.mixtype ,' without remainder!'])
                    end
                end
                
                %                 output = experiment_parameters;
                
                if startgen == 1
                    create_experiment()
                end
            end
            
            
            % ------------------------------------------------------------------
            function msgfunc()
                errordlg('Not all required fields are specified! Check red fields!','Input error')
            end
            
            
            % ------------------------------------------------------------------
            function attentionmode(source,~)
                
                s=get(source, 'Value');
                if s == 0
                    experiment_parameters.attentionmode = 'no';
                    set(cuet0, 'Visible', 'off')
                    set(cuet1, 'Visible', 'off')
                    set(cuetype, 'Visible', 'off')
                    set(cuet2, 'Visible', 'off')
                    set(cuetime, 'Visible', 'off')
                    set(cueinfo, 'Visible', 'off')
                    set(cuet3, 'Visible', 'off')
                    set(cueorder, 'Visible', 'off')
                    set(cuet4, 'Visible', 'off')
                    set(cueAratio, 'Visible', 'off')
                    
                    set(isit0, 'Visible', 'off')
                    set(isit1, 'Visible', 'off')
                    set(isitime, 'Visible', 'off')
                    set(isit2, 'Visible', 'off')
                    set(isifix, 'Visible', 'off')
                    set(isiinfo, 'Visible', 'off')
                    
                    set(stimt0, 'Visible', 'off')
                    set(stimt1, 'Visible', 'off')
                    set(stimtype, 'Visible', 'off')
                    set(stimbutton, 'Visible', 'off')
                    set(stimt2, 'Visible', 'off')
                    set(stimfix, 'Visible', 'off')
                    set(stiminfo, 'Visible', 'off')
                    
                    set(fixstimtext, 'Visible', 'on')
                    set(fixstim, 'Visible', 'on')
                    
                    
                elseif s == 1
                    experiment_parameters.attentionmode = 'yes';
                    set(cuet0, 'Visible', 'on')
                    set(cuet1, 'Visible', 'on')
                    set(cuetype, 'Visible', 'on')
                    set(cuet2, 'Visible', 'on')
                    set(cuetime, 'Visible', 'on')
                    set(cueinfo, 'Visible', 'on')
                    set(cuet3, 'Visible', 'on')
                    set(cueorder, 'Visible', 'on')
                    set(cuet4, 'Visible', 'on')
                    set(cueAratio, 'Visible', 'on')
                    
                    set(isit0, 'Visible', 'on')
                    set(isit1, 'Visible', 'on')
                    set(isitime, 'Visible', 'on')
                    set(isit2, 'Visible', 'on')
                    set(isifix, 'Visible', 'on')
                    set(isiinfo, 'Visible', 'on')
                    
                    set(stimt0, 'Visible', 'on')
                    set(stimt1, 'Visible', 'on')
                    set(stimtype, 'Visible', 'on')
                    set(stimbutton, 'Visible', 'on')
                    set(stimt2, 'Visible', 'on')
                    set(stimfix, 'Visible', 'on')
                    set(stiminfo, 'Visible', 'on')
                    
                    set(fixstimtext, 'Visible', 'off')
                    set(fixstim, 'Visible', 'off')
                    
                    
                end
                
                %         if strcmpi(experiment_parameters.attentionmode, 'yes')
                %
                %             %            ??????????????????????
                %
                %         end
            end
            
            
            % ------------------------------------------------------------------
            function defcueorder(source,event) %#ok<*INUSD>
                s=get(source, 'Value');
                Items = get(source,'string');
                
                if s == 2 || s == 3
                    experiment_parameters.amode.cueorder = Items{s};
                    set(source, 'ForegroundColor', DoneColor);
                else
                    errordlg('Invalid selection for cue order! Only random or pseudorandom are valid inputs!','Input error')
                end
            end
            
            
            
            % ------------------------------------------------------------------
            function defitirand(source,event) %#ok<*INUSD>
                s=get(source, 'Value');
                Items = get(source,'string');
                
                if s == 2
                    experiment_parameters.ITIrand = Items{s};
                    answer = inputdlg('Specify constant ITI presentation time:', 'Specify parameters of ITI',[1 40],{'2000'});
                    experiment_parameters.ITIvar = str2num(answer{1}); %#ok<*ST2NM>
                    iiinfo = [answer{1}, 'ms'];
                    
                    set(itiinfo, 'String', iiinfo);
                    set(source, 'ForegroundColor', DoneColor);
                    
                elseif s == 3 || s == 4
                    experiment_parameters.ITIrand = Items{s};
                    
                    prompts={'Specify MIN ITI presentation time:','Specify MAX ITI presentation time:'};
                    defaults={'1000','2000'};
                    answer = inputdlg(prompts, 'Specify parameters of ITI',[1 80],defaults);
                    experiment_parameters.ITIvar = [str2num(answer{1}),str2num(answer{2})];
                    iiinfo = [answer{1},'-',answer{2}, 'ms'];
                    
                    set(itiinfo, 'String', iiinfo);
                    set(source, 'ForegroundColor', DoneColor);
                    
                else
                    errordlg('Invalid selection for cue type! Only text or picture are valid inputs!','Input error')
                end
            end
            
            % ------------------------------------------------------------------
            function defcuetype(source,event)
                s=get(source, 'Value');
                Items = get(source,'string');
                
                
                if s == 2
                    experiment_parameters.amode.cue_type = Items{s};
                    
                    % Text
                    prompt = {'Text for cue 1:',...
                        'Text colour for cue 1:',...
                        'Text for cue 2:',...
                        'Text colour for cue 2:',...
                        'Font size',...
                        'Horizontal shift'};
                    dlg_title = 'Define text for cues';
                    num_lines = 1;
                    defaultans = {'Cue 1',...
                        '[255 255 255]',...
                        'Cue 2',...
                        '[255 255 255]',...
                        '24',...
                        '0'};
                    cuetext = inputdlg(prompt,dlg_title,num_lines,defaultans);
                    
                    experiment_parameters.amode.cuetext{1} = cuetext{1};
                    experiment_parameters.amode.cuetext{2} = cuetext{3};
                    experiment_parameters.amode.cuecolors{1} = str2num(cuetext{2});
                    experiment_parameters.amode.cuecolors{2} = str2num(cuetext{4});
                    experiment_parameters.amode.cue_font_size = str2num(cuetext{5});
                    experiment_parameters.amode.cue_horshift = str2num(cuetext{6});
                    
                    set(source, 'ForegroundColor', DoneColor);
                    
                elseif s == 3
                    experiment_parameters.amode.cue_type = Items{s};
                    
                    % Picture
                    
                    % get and load images
                    [filename, pathname] = uigetfile({'*.png';'*.bmp'}, 'Select image for cue 1:','MultiSelect','off');
                    f=fullfile(pathname,filename{ii});
                    experiment_parameters.amode.cuepictures{1} = imread(f);
                    
                    [filename, pathname] = uigetfile({'*.png';'*.bmp'}, 'Select image for cue 2:','MultiSelect','off');
                    f=fullfile(pathname,filename{ii});
                    experiment_parameters.amode.cuepictures{2} = imread(f);
                    
                    if size(experiment_parameters.amode.cuepictures{1},1) == size(experiment_parameters.amode.cuepictures{2},1)
                        cfg.CueimSizeY = size(experiment_parameters.amode.cuepictures{1},1);
                    else
                        errordlg('ERROR: Cue images need to have the same size.','Input error')
                        error('ERROR: Cue images need to have the same size.')
                    end
                    if size(experiment_parameters.amode.cuepictures{1},2) == size(experiment_parameters.amode.cuepictures{2},2)
                        cfg.CueimSizeX = size(experiment_parameters.amode.cuepictures{1},2);
                    else
                        errordlg('ERROR: Feedback images need to have the same size.','Input error')
                        error('ERROR: Feedback images need to have the same size.')
                    end
                    
                    set(source, 'ForegroundColor', DoneColor);
                else
                    errordlg('Invalid selection for cue type! Only text or picture are valid inputs!','Input error')
                end
            end
            
            % ------------------------------------------------------------------
            function defcuetime(source,event)
                s=get(source, 'Value');
                Items = get(source,'string');
                
                if s == 2
                    experiment_parameters.amode.cueISIrand = Items{s};
                    answer = inputdlg('Specify constant cue presentation time:', 'Specify parameters of attention mode',[1 40],{'2000'});
                    experiment_parameters.amode.cue_presenttime = str2num(answer{1});
                    Acueinfo = [answer{1}, 'ms'];
                    
                    set(cueinfo, 'String', Acueinfo);
                    set(source, 'ForegroundColor', DoneColor);
                    
                elseif s == 3
                    experiment_parameters.amode.cueISIrand = Items{s};
                    prompts={'Specify MIN cue presentation time:','Specify MAX cue presentation time:'};
                    defaults={'1000','2000'};
                    answer = inputdlg(prompts, 'Specify parameters of attention mode',[1 80],defaults);
                    experiment_parameters.amode.cue_presenttime = [str2num(answer{1}),str2num(answer{2})];
                    Acueinfo = [answer{1},'-',answer{2}, 'ms'];
                    
                    set(cueinfo, 'String', Acueinfo);
                    set(source, 'ForegroundColor', DoneColor);
                    
                elseif s == 4
                    experiment_parameters.amode.cueISIrand = Items{s};
                    prompts={'Specify MIN cue presentation time:','Specify MAX cue presentation time:'};
                    defaults={'1000','2000'};
                    answer = inputdlg(prompts, 'Specify parameters of attention mode',[1 80],defaults);
                    experiment_parameters.amode.cue_presenttime = [str2num(answer{1}),str2num(answer{2})];
                    Acueinfo = [answer{1},'-',answer{2}, 'ms'];
                    
                    set(cueinfo, 'String', Acueinfo);
                    set(source, 'ForegroundColor', DoneColor);
                    
                else
                    errordlg('Invalid selection for cue presentation time! Only constant, random or pseudorandom are valid inputs!','Input error')
                end
            end
            
            
            
            % ------------------------------------------------------------------
            function defisitime(source,event)
                s=get(source, 'Value');
                Items = get(source,'string');
                
                if s == 2
                    experiment_parameters.amode.isi_rand = Items{s};
                    answer = inputdlg('Specify constant isi presentation time:', 'Specify parameters of attention mode',[1 40],{'2000'});
                    experiment_parameters.amode.isi_presenttime = str2num(answer{1});
                    Aisiinfo = [answer{1}, 'ms'];
                    
                    set(isiinfo, 'String', Aisiinfo);
                    set(source, 'ForegroundColor', DoneColor);
                    
                elseif s == 3
                    experiment_parameters.amode.isi_rand = Items{s};
                    prompts={'Specify MIN isi presentation time:','Specify MAX isi presentation time:'};
                    defaults={'1000','2000'};
                    answer = inputdlg(prompts, 'Specify parameters of attention mode',[1 80],defaults);
                    experiment_parameters.amode.isi_presenttime = [str2num(answer{1}),str2num(answer{2})];
                    Aisiinfo = [answer{1},'-',answer{2}, 'ms'];
                    
                    set(isiinfo, 'String', Aisiinfo);
                    set(source, 'ForegroundColor', DoneColor);
                    
                elseif s == 4
                    experiment_parameters.amode.isi_rand = Items{s};
                    prompts={'Specify MIN isi presentation time:','Specify MAX isi presentation time:'};
                    defaults={'1000','2000'};
                    answer = inputdlg(prompts, 'Specify parameters of attention mode',[1 80],defaults);
                    experiment_parameters.amode.isi_presenttime = [str2num(answer{1}),str2num(answer{2})];
                    Aisiinfo = [answer{1},'-',answer{2}, 'ms'];
                    
                    set(isiinfo, 'String', Aisiinfo);
                    set(source, 'ForegroundColor', DoneColor);
                    
                else
                    errordlg('Invalid selection for isi presentation time! Only constant, random or pseudorandom are valid inputs!','Input error')
                end
            end
            
            % ------------------------------------------------------------------
            function defstimtype(source,event)
                s=get(source, 'Value');
                Items = get(source,'string');
                
                if s == 1
                    errordlg('Invalid selection for isi presentation time! Only constant, random or pseudorandom are valid inputs!','Input error')
                elseif s == 2
                    experiment_parameters.amode.img2type = 'rule0';
                else
                    experiment_parameters.amode.img2type = Items{s};
                end
                if strcmp(experiment_parameters.amode.img2type,'random') || strcmp(experiment_parameters.amode.img2type,'rule0') 
                    answer = inputdlg('Random or pseudorandom order of second stimulus:', 'Specify order of 2nd stim',1,{'random'});
                    if answer{1}(1) == 'r'
                        experiment_parameters.amode.img2rand = 'random';
                    else
                        experiment_parameters.amode.img2rand = 'pseudorandom';
                    end
                end
                set(source, 'ForegroundColor', DoneColor);
            end
            
            % ------------------------------------------------------------------
            function defstimbutton(source,event)
                
                prompt = {'x shift of stim 1:',...
                    'y shift of stim 1:',...
                    'x shift of stim 2:',...
                    'y shift of stim 2:'};
                dlg_title = 'Define text for feedback';
                num_lines = [1 80];
                defaultans = {'-400',...
                    '0',...
                    '400',...
                    '0'};
                spos = inputdlg(prompt,dlg_title,num_lines,defaultans);
                
                experiment_parameters.amode.stim_posx{1} = str2num(spos{1});
                experiment_parameters.amode.stim_posy{1} = str2num(spos{2});
                experiment_parameters.amode.stim_posx{2} = str2num(spos{3});
                experiment_parameters.amode.stim_posy{2} = str2num(spos{4});
                
                tt = ['stim1 (X,Y): (', spos{1},',', spos{2},')','; stim2 (X,Y): (', spos{3},',', spos{4},')'];
                
                set(stiminfo, 'String', tt);
                set(source, 'ForegroundColor', DoneColor);
                
                SDEF=1;
            end
            
            % ------------------------------------------------------------------
            function deffeedback(source,event)
                s=get(source, 'Value');
                
                if s == 2
                    experiment_parameters.Feedback = 'yes';
                    
                    answer = inputdlg('Feedback presentation time:', 'Prepare GraLe-TaG Experiment',1,{'2000'});
                    experiment_parameters.feedback_presenttime = str2num(answer{1});
                    ft = [answer{1}, 'ms'];
                    
                    selstr = {'Picture','Text'};
                    [selection,o] = listdlg('PromptString','Select a type of feedback:',...
                        'SelectionMode','single',...
                        'ListString',selstr);
                    if o==1
                        experiment_parameters.Feedbacktype=selection;
                    else
                        errordlg('No selection was made.','Input error')
                        error('No selection was made.')
                    end
                    
                    ft = [ft, '; ',selstr{experiment_parameters.Feedbacktype}];
                    
                    if strcmpi(selstr{experiment_parameters.Feedbacktype},'Picture')
                        % get and load images
                        [filename, pathname] = uigetfile({'*.png';'*.bmp'}, 'Select feedback image for INCORRECT answers:','MultiSelect','off');
                        f=fullfile(pathname,filename{ii});
                        experiment_parameters.Feedbackpictures{1} = imread(f);
                        
                        [filename, pathname] = uigetfile({'*.png';'*.bmp'}, 'Select feedback image for CORRECT answers:','MultiSelect','off');
                        f=fullfile(pathname,filename{ii});
                        experiment_parameters.Feedbackpictures{2} = imread(f);
                        
                        if size(experiment_parameters.Feedbackpictures{1},1) == size(experiment_parameters.Feedbackpictures{2},1)
                            cfg.FBimSizeY = size(experiment_parameters.Feedbackpictures{1},1);
                        else
                            errordlg('ERROR: Feedback images need to have the same size.','Input error')
                            error('ERROR: Feedback images need to have the same size.')
                        end
                        if size(experiment_parameters.Feedbackpictures{1},2) == size(experiment_parameters.Feedbackpictures{2},2)
                            cfg.FBimSizeX = size(experiment_parameters.Feedbackpictures{1},2);
                        else
                            errordlg('ERROR: Feedback images need to have the same size.','Input error')
                            error('ERROR: Feedback images need to have the same size.')
                        end
                        
                        
                    elseif strcmpi(selstr{experiment_parameters.Feedbacktype},'Text')
                        % specify feedback texts
                        prompt = {'Text for INCORRECT answers:',...
                            'Text colour for INCORRECT answers:',...
                            'Text for CORRECT answers:',...
                            'Text colour for CORRECT answers:'};
                        dlg_title = 'Define text for feedback';
                        num_lines = 1;
                        defaultans = {'wrong',...
                            '[255 0 0]',...
                            'correct',...
                            '[0 255 0]'};
                        feedtext = inputdlg(prompt,dlg_title,num_lines,defaultans);
                        
                        experiment_parameters.Feedbacktexts{1} = feedtext{1};
                        experiment_parameters.Feedbackcolors{1} = str2num(feedtext{2});
                        experiment_parameters.Feedbacktexts{2} = feedtext{3};
                        experiment_parameters.Feedbackcolors{2} = str2num(feedtext{4});
                    end
                    
                    prompt={'ISI - Time between button press and presenting feedback (single value or range [min max] in ms): ',...
                        'Present fixation point during ISI?'};
                    defaultans={'1000 2000',...
                        'yes'};
                    answer = inputdlg(prompt, 'Prepare GraLe-TaG Experiment',1,defaultans);
                    experiment_parameters.ISIvar = str2num(answer{1});
                    ft = [ft, '; ISI: ',answer{1}];
                    if length(experiment_parameters.ISIvar)>1
                        answ = inputdlg('ISI over subjects: ''random'' or ''pseudorandom''? ',...
                            'Input options for experiment and task',1,{'random'});
                        if strcmpi(answ{1},'random')
                            experiment_parameters.ISIrand = 'random';
                        elseif strcmpi(answ{1},'pseudorandom')
                            experiment_parameters.ISIrand = 'pseudorandom';
                        else
                            errordlg('ERROR: Only ''random'' or ''pseudorandom'' are valid inputs for ITI over subjects!','Input error')
                            error('ERROR: Only ''random'' or ''pseudorandom'' are valid inputs for ITI over subjects!')
                        end
                        ft = [ft, ' ', answ{1}];
                    end
                    if strcmpi(answer{2},'yes')
                        experiment_parameters.present_fix2 = 'yes';
                        ft = [ft, '; fix'];
                    else
                        experiment_parameters.present_fix2 = 'no';
                    end
                    
                    
                    set(fbtext, 'String', ft)
                    set(feedback, 'ForegroundColor', DoneColor)
                    
                elseif s == 3
                    experiment_parameters.Feedback = 'no';
                    set(feedback, 'ForegroundColor', DoneColor)
                else
                    errordlg('Invalid selection for feedback! Only yes and no are valid inputs!','Input error')
                end
            end
            
            
            % ------------------------------------------------------------------
            function defoutp(source,event)
                experiment_parameters.outputpath = uigetdir(pwd,'Select output directory');
                
                set(outpath, 'String', experiment_parameters.outputpath)
                set(outbutton, 'ForegroundColor', DoneColor)
            end
            
            % ------------------------------------------------------------------
            function defsavestim(source,event)
                s=get(source, 'Value');
                if s == 0
                    experiment_parameters.savestim = 'no';
                elseif s == 1
                    experiment_parameters.savestim = 'yes';
                end
            end
            
            % ------------------------------------------------------------------
            function getmaskval(source,event)
                
                s=get(source, 'Value');
                if s == 1
                    tt = '';
                elseif s == 2
                    prompt = {'Gaussian SD in pixel:','Gaussian filter (smaller values will be set to 0):','Width of 2D Gauss kernel:'};
                    dlg_title = 'Input options for Gaussian mask';
                    num_lines = [1 50];
                    defaultans = {'10','0.001','6'};
                    answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
                    
                    experiment_parameters.sigma = str2num(answer{1});
                    %     experiment_parameters.phase = str2num(answer{2});
                    experiment_parameters.trim = str2num(answer{2});
                    experiment_parameters.widthgauss = str2num(answer{3});
                    
                    tt = ['SD: ',answer{1},', G. Filter: ',answer{2},', Kernel Width: ',answer{3}];
                elseif s == 3
                    def = {num2str(str2num(get(pixsize,'String'))/2-1)};
                    answer=inputdlg('Radius of circle mask (in pixel):','Input options for circular mask',[1 50],def);
                    experiment_parameters.radius = str2num(answer{1});
                    tt = ['Radius: ',answer{1}];
                end
                
                set(masktext, 'String', tt)
            end
            
            % ------------------------------------------------------------------
            function change_button(source,event)
                
                prompt = {'Button for A:','Button for B:'};
                dlg_title = 'Define buttons';
                defaultans = {'z','m'};
                buttons = inputdlg(prompt,dlg_title, [1, 40],defaultans);
                
                experiment_parameters.key{1} = buttons{1}; % left button
                experiment_parameters.key{2} = buttons{2}; % right button
                
                set(buttontext, 'String', ['Left: ',experiment_parameters.key{1}, '  Right: ',experiment_parameters.key{2}])
            end
            
            
            
            % ------------------------------------------------------------------
            function defrules(source,event)
                
                % get values
                
                experiment_parameters.imSize = str2num(get(pixsize, 'String'));
                experiment_parameters.lamdarange = [str2num(get(wavmin, 'String')), str2num(get(wavmax, 'String'))];
                experiment_parameters.nrlamdas=length(experiment_parameters.lamdarange(1) : str2num(get(wavsteps, 'String')) : experiment_parameters.lamdarange(2));
                experiment_parameters.thetarange = [str2num(get(rotmin, 'String')), str2num(get(rotmax, 'String'))];
                experiment_parameters.nrthetas=length(experiment_parameters.thetarange(1) : str2num(get(rotsteps, 'String')) : experiment_parameters.thetarange(2));
                experiment_parameters.phase = str2num(get(phaseshift, 'String'));
                experiment_parameters.StimPosShift(1) = str2num(get(posx, 'String'));
                experiment_parameters.StimPosShift(2) = str2num(get(posy, 'String'));
                experiment_parameters.lamdas=experiment_parameters.lamdarange(1):(experiment_parameters.lamdarange(2)-experiment_parameters.lamdarange(1))/(experiment_parameters.nrlamdas-1):experiment_parameters.lamdarange(2);
                experiment_parameters.thetas=experiment_parameters.thetarange(1):(experiment_parameters.thetarange(2)-experiment_parameters.thetarange(1))/(experiment_parameters.nrthetas-1):experiment_parameters.thetarange(2);
                
                % load rules
                [filename, pathname] = uigetfile({'*.png';'*.bmp'},...
                    'Select rule images (The x axis of the RGB image is representing the frequency and the y axis the rotation of the gratings):',...
                    'MultiSelect','on');
                
                % adjust rules
                if isequal(filename,0)
                    errordlg('User selected Cancel','Input error')
                    error('User selected Cancel')
                else
                    hrule=figure('Name', 'Visualize user defined rules', ...
                        'Visible', 'on', 'Units', 'pixels', ...
                        'MenuBar', 'none', 'ToolBar', 'none',...
                        'NumberTitle', 'off',...
                        'Position',[10 10 screensize(3)/3 screensize(4)-20]); %#ok<NASGU>
                    %     filename=sort([filename]);
                    
                    if iscell(filename)
                        
                        for ii=1:length(filename)
                            
                            subplot(length(filename),2,2*ii-1)
                            f=fullfile(pathname,filename{ii});
                            l=imread(f);
                            imagesc(l)
                            title(['Rule ',num2str(ii), 'original'])
                            ylabel('Rotation')
                            xlabel('Wavelength')
                            colormap hot
                            axis off
                            
                            lrs = round(imresize(l,[experiment_parameters.nrthetas experiment_parameters.nrlamdas]))+1;
                            
                            rul = zeros(size(lrs,1),size(lrs,2));
                            colvec = cell(3,1);
                            for cc=1:3
                                cx=lrs(:,:,cc);
                                colvec{cc}=find(cx(:)>125);
                                rul(colvec{cc})=cc;
                                clear cx
                            end
                            
                            if length(intersect(colvec{1},intersect(colvec{2},colvec{3})))>0 %#ok<ISMT>
                                errordlg('ERROR: Wrong colors are used for the rule figures. See help!','Input error')
                                error('ERROR: Wrong colors are used for the rule figures. See help!')
                            end
                            
                            clear lrs
                            
                            subplot(length(filename),2,2*ii)
                            imagesc(rul)
                            title(['Rule ',num2str(ii), ' rescaled and categorized'])
                            ylabel('Rotation (in degree)')
                            set(gca, 'YTick',1:10:experiment_parameters.nrthetas)
                            set(gca, 'YTickLabel',{experiment_parameters.thetas(1:10:experiment_parameters.nrthetas)})
                            xlabel('Wavelength (in freq)')
                            set(gca, 'XTick',1:10:experiment_parameters.nrlamdas)
                            set(gca, 'XTickLabel',{experiment_parameters.lamdas(1:10:experiment_parameters.nrlamdas)})
                            
                            colormap hot
                            
                            rules{ii}=rul;
                            clear f l locs pks
                        end
                    else
                        subplot(1,2,1)
                        f=fullfile(pathname,filename);
                        l=imread(f);
                        imagesc(l)
                        title('Rule original')
                        ylabel('Rotation')
                        xlabel('Wavelength')
                        colormap hot
                        axis off
                        
                        lrs = round(imresize(l,[experiment_parameters.nrthetas experiment_parameters.nrlamdas]))+1;
                        
                        rul = zeros(size(lrs,1),size(lrs,2));
                        colvec = cell(3,1);
                        for cc=1:3
                            cx=lrs(:,:,cc);
                            colvec{cc}=find(cx(:)>125);
                            rul(colvec{cc})=cc;
                            clear cx
                        end
                        
                        if length(intersect(colvec{1},intersect(colvec{2},colvec{3})))>0 %#ok<ISMT>
                            errordlg('ERROR: Wrong colors are used for the rule figures. See help!','Input error')
                            error('ERROR: Wrong colors are used for the rule figures. See help!')
                        end
                        
                        clear lrs
                        
                        subplot(1,2,2)
                        imagesc(rul)
                        title('Rule rescaled and categorized')
                        ylabel('Rotation (in degree)')
                        set(gca, 'YTick',0:10:experiment_parameters.nrthetas)
                        set(gca, 'YTickLabel',{experiment_parameters.thetas(1:10:experiment_parameters.nrthetas)})
                        xlabel('Wavelength (in freq)')
                        set(gca, 'XTick',1:10:experiment_parameters.nrlamdas)
                        set(gca, 'XTickLabel',{experiment_parameters.lamdas(1:10:experiment_parameters.nrlamdas)})
                        colormap hot
                        
                        rules{1}=rul;
                        clear f l locs pks
                        
                    end
                end
                
                
                % Define parameters for each rule
                % --------------------------------
                define_rule_order
                uiwait(gcf);
                experiment_parameters.rules=rules;
                experiment_parameters.rule_order=rule_order(:,1:4);
                experiment_parameters.ACCcheck_crit = rule_order(:,5:6);
                experiment_parameters.trialbreaks = rule_order(:,7);
                
                
                rth = {'Rule    p-val    max trials    after max    mean over   acc thr.   break'};
                set(ruletexthead, 'String', rth)
                
                rt = cellstr(num2str(cell2mat(rule_order)));
                set(ruletext, 'String', rt)
                
                rt2 = ['Rule images: ',num2str(length(rules))];
                set(ruletext2, 'String', rt2)
                
                set(rulebutton, 'String', 'done')
                set(rulebutton, 'ForegroundColor', DoneColor)
                
                RDEF = 1;
            end
            
            
            % ------------------------------------------------------------------
            function definst(source,~)
                s=get(source, 'Value');
                %         insttext0 = '';
                insttext1 = '';
                %         insttext2 = '';
                if s == 2
                    experiment_parameters.Instruction = 'yes';
                    answer = inputdlg('How many instruction images consecutively?:', 'Prepare GraLe-TaG Experiment',1,{'1'});
                    if isemtpy(answer)
                        set(instbox, 'Value', 1)
                    else
                        insttext0 = answer{1};
                        experiment_parameters.InstructionNrImages = str2num(answer{1});
                    end
                    
                    
                    for ini=1:experiment_parameters.InstructionNrImages
                        [FileName,PathName] = uigetfile({'*.gif';'*.jpeg';'*.jpg';'*.png';'*.tif';'*.tiff'},['Select Instruction image ',num2str(ini)]);
                        experiment_parameters.InstructionImages{ini} = imread(fullfile(PathName, FileName));
                        insttext1 = [insttext1, FileName, '; ']; 
                    end
                    
                    answer = inputdlg('Specify buttons to end each instruction image separated by semicolon? left, right or any (e.g. any;left;right for three instruction images)', 'Prepare GraLe-TaG Experiment',1);
                    x=lower(answer{1});
                    x(x==' ')=[];
                    insttext2 = x;
                    experiment_parameters.InstructionButtons = strsplit(x,';');
                    experiment_parameters.InstructionButtonsNr = experiment_parameters.InstructionButtons;
                    experiment_parameters.InstructionButtonsNr(strcmp('left', experiment_parameters.InstructionButtonsNr))={1};
                    experiment_parameters.InstructionButtonsNr(strcmp('right', experiment_parameters.InstructionButtonsNr))={2};
                    experiment_parameters.InstructionButtonsNr(strcmp('any', experiment_parameters.InstructionButtonsNr))={99};
                    
                    if length(experiment_parameters.InstructionButtons) ~= experiment_parameters.InstructionNrImages
                        errordlg('Number of instruction images and number of instruction buttons need to be identical.','Input Error');
                    end
                    
                    insttext = [insttext0 , '  ',insttext1 , '  ',insttext2];
                elseif s == 3
                    experiment_parameters.Instruction = 'no';
                    itxt = '';
                else
                    errordlg('Invalid selection for instruction! Only yes and no are valid inputs!','Input error')
                end
                set(insttext, 'String', itxt)
                set(instbox, 'ForegroundColor', DoneColor)
            end
            
            % ------------------------------------------------------------------
            function getstimtime(source,event)
                
                s=get(source, 'Value');
                
                if s == 2
                    experiment_parameters.Stimtimetype='limited';
                    xxx = inputdlg({'Max presentation time (ms)','Equal trial length? (yes or no)'},...
                        'Input stimulus options',1,{'2000','no'});
                    experiment_parameters.Stimprestime=str2num(xxx{1});
                    experiment_parameters.Equaltriallength=xxx{2};
                    limtxt = [xxx{1}, 'ms, equal length: ', xxx{2}];
                    
                    if strcmpi(experiment_parameters.Equaltriallength,'yes')
                        experiment_parameters.Equaltriallength='yes';
                        yyy = inputdlg('Stimuli should "disappear" or "stay" after button press until end of trial?','Prepare GraLe-TaG Experiment',1,{'disappear'});
                        if strcmpi(yyy{1},'disappear')
                            experiment_parameters.DotTrialEnd='disappear';
                        else
                            experiment_parameters.DotTrialEnd='stay';
                        end
                        limtxt = [limtxt, ', stimuli ', experiment_parameters.DotTrialEnd];
                    end
                    
                elseif s == 3
                    experiment_parameters.Stimtimetype='endless';
                    limtxt = '';
                else
                    errordlg('Invalid selection for stimulus presenation time! Only limited or endless are valid inputs!','Input error')
                end
                
                set(limtext, 'String', limtxt)
                set(stimtime, 'ForegroundColor', DoneColor)
            end
            
            % ------------------------------------------------------------------
            function getfixsize(source,event)
                
                s=get(source, 'Value');
                if s == 1
                    errordlg('Invalid selection for fixation point! Only yes and no are valid inputs!','Input error')
                elseif s == 2
                    if ~isfield(experiment_parameters, 'fixsize')
                        answer=inputdlg('Size of fixation point:','Input',1,{'10'});
                        experiment_parameters.fixsize = str2num(answer{1});
                        it = answer{1};
                        set(fixs, 'String', it)
                    end
                    
                elseif s == 3
                    %             try
                    %                 experiment_parametersrmfield(experiment_parameters, 'fixsize')
                    %             end
                    it = '';
                    set(fixs, 'String', it)
                    
                end
                
                set(source, 'ForegroundColor', DoneColor)
                
            end
            
            % ------------------------------------------------------------------
            function figure_pos=calculate_figure_pos(xx,yy)
                
                % calculate figure position at ~ center of screen
                % get actual screen resolution
                screen_size=get(0,'Screensize');
                
%                 MP = get(0, 'MonitorPositions');
%                 if size(MP,1) > 1
%                     ss1 = MP(2,1);
%                     ss2 = screen_size(4)+MP(2,2);
%                 else
                    ss1 = screen_size(3);
                    ss2 = screen_size(4);
%                 end
                
                % lower left corner horizontal position
                figure_pos(1)=ss1/2-xx/2;
                % lower left corner vertical position
                figure_pos(2)=ss2/2-yy/2;
                % horizontal size of the GUI
                figure_pos(3)=xx;
                % vertical size of the GUI
                %         figure_pos(4)=460+logoy;
                figure_pos(4)=yy;
            end
            
            % -------------------------------------------------------------------------
            function define_rule_order
                
                voc_length_str = inputdlg('How many consecutive rules do you want to define?',...
                    'Input rule options', [1 50]);
                voc_length = str2double(voc_length_str{:});
                
                
                fheight = voc_length*40+80+50;
                fwidth = 1150;
                figure_pos_user = [screensize(3)/2-fwidth/2, screensize(4)/2-fheight/2,fwidth,fheight];
                
                upos = 80:40:voc_length*40+80;
                
                ero=ones(voc_length,1)*length(rules);
                ero(1:length(rules))=1:length(rules);
                
                %         screen_size=get(0,'Screensize');
                %         experiment_parameters.figure_pos_user(2)=screen_size(4)/2-experiment_parameters.figure_pos_user(4)/2;
                %
                
                huser=figure('Tag', 'Define rules', 'Name', 'Define rules', ...
                    'Visible', 'on', 'Units', 'pixels', ...
                    'MenuBar', 'none', 'ToolBar', 'none', ...
                    'Resize', 'off', 'NumberTitle', 'off',...
                    'Position', figure_pos_user);%,...
                %             'Color',BackgroundColor);
                
                pos = get(huser,'position');
                ax = axes('units','pix','outerposition',[0 0 pos([3 4])],...
                    'position',[0 0 pos([3 4])],'parent',huser,'visible','off','xlim',...
                    [0 pos(3)],'ylim',[0 pos(4)]);
                
                
                for voc=1:voc_length
                    rule_edit_user(voc_length+1-voc,1)=uicontrol('Style', 'edit',...
                        'String', num2str(ero(voc_length+1-voc)),...
                        'Position', [50,upos(voc),100,20]);
                    uicontrol('Style','text', ...
                        'HorizontalAlignment','left', ...
                        'Position',[180,upos(voc),40,20], ...
                        'String','->');
                    rule_edit_user(voc_length+1-voc,2) = uicontrol('Style', 'edit',...
                        'String', num2str(.5),...
                        'Position', [200,upos(voc),100,20]);
                    rule_edit_user(voc_length+1-voc,3) = uicontrol('Style', 'edit',...
                        'String', num2str(200),...
                        'Position', [350,upos(voc),100,20]);
                    rule_edit_user(voc_length+1-voc,4) = uicontrol('Style', 'popup',...
                        'String', {'go further','stop experiment'},...
                        'Position', [500,upos(voc),100,20]);
                    
                    rule_edit_user(voc_length+1-voc,5) = uicontrol('Style', 'edit',...
                        'String', num2str(20),...
                        'Position', [650,upos(voc),100,20]);
                    rule_edit_user(voc_length+1-voc,6) = uicontrol('Style', 'edit',...
                        'String', num2str(90),...
                        'Position', [800,upos(voc),100,20]);
                    
                    rule_edit_user(voc_length+1-voc,7) = uicontrol('Style', 'popup',...
                        'String', {'no','yes'},...
                        'Position', [1000,upos(voc),100,20]);
                    
                    
                end
                
                uicontrol('Style','text', ...
                    'HorizontalAlignment','left', ...
                    'Position',[50,upos(end)+20,160,20], ...
                    'String','Specify parameter per rules:');
                uicontrol('Style','text', ...
                    'HorizontalAlignment','left', ...
                    'Position',[650,upos(end)+20,200,20], ...
                    'String','Adaptive Leraning criteria per rule:');
                
                uicontrol('Style','text', ...
                    'HorizontalAlignment','left', ...
                    'Position',[50,upos(end)-15,160,20], ...
                    'String','Rule numbers:');
                uicontrol('Style','text', ...
                    'HorizontalAlignment','left', ...
                    'Position',[200,upos(end)-15,160,20], ...
                    'String','P-value for A:');
                uicontrol('Style','text', ...
                    'HorizontalAlignment','left', ...
                    'Position',[350,upos(end)-15,160,20], ...
                    'String','Max Nr trials');
                uicontrol('Style','text', ...
                    'HorizontalAlignment','left', ...
                    'Position',[500,upos(end)-15,160,20], ...
                    'String','After max trials');
                
                uicontrol('Style','text', ...
                    'HorizontalAlignment','left', ...
                    'Position',[650,upos(end)-15,160,20], ...
                    'String','Roll average over');
                uicontrol('Style','text', ...
                    'HorizontalAlignment','left', ...
                    'Position',[800,upos(end)-15,160,20], ...
                    'String','Acc threshhold');
                
                uicontrol('Style','text', ...
                    'HorizontalAlignment','left', ...
                    'Position',[1000,upos(end)-15,160,20], ...
                    'String','A break after?');
                
                line([50 600],[upos(end)+10 upos(end)+15],'Color','k','parent',ax)
                line([650 960],[upos(end)+15 upos(end)+15],'Color','k','parent',ax)
                
                uicontrol('Style', 'pushbutton', ...
                    'Tag', 'button_quit',...
                    'String', 'Done', ...
                    'Units', 'pixels',...
                    'Position', [fwidth/2-150,10,300,20],...
                    'Callback',@get_rule_order);
            end
            
            % -------------------------------------------------------------------------
            function get_rule_order(~,~)
                
                %         rule_edit_user
                
                rule_order=cell(voc_length,2);
                for ro=1:voc_length
                    for vvv=1:size(rule_edit_user,2)
                        %                 x=get(rule_edit_user(rrr,voc),'String');
                        if vvv==7
                            x2=get(rule_edit_user(ro,vvv),'value');
                            rule_order{ro,vvv}=x2;
                        elseif vvv==4
                            x=get(rule_edit_user(ro,vvv),'value');
                            rule_order{ro,vvv}=2-x;
                        else
                            x=get(rule_edit_user(ro,vvv),'String');
                            if isempty(x)
                                warndlg('All fields need to be filled in!')
                            else
                                rule_order{ro,vvv}=str2num(x);
                            end
                        end
                    end
                end
                close(huser)
            end
        end
        
        
        
        % #################################################################
        % Create Experiment
        % #################################################################
        
        function create_experiment()
            
            % Creating stimuli
            % --------------------------------
            % create waitbar
            h = waitbar(0,'Creating stimuli ...');
            
            fprintf('Creating stimuli ')
            stimuli = cell(length(experiment_parameters.lamdas), length(experiment_parameters.thetas));
            lamdacount=0;
            for lamda=experiment_parameters.lamdas
                lamdacount=lamdacount+1;
                waitbar(lamdacount / length(experiment_parameters.lamdas))
                thetacount=0;
                for theta=experiment_parameters.thetas
                    thetacount=thetacount+1;
                    
                    gabor=create_stim(experiment_parameters,lamda,theta);
                    stimuli{lamdacount,thetacount}=gabor;
                    
                end
            end
            
            if strcmpi(experiment_parameters.savestim,'yes')
                experiment_parameters.stimuli=stimuli;
            end
            
            fprintf(' - done!\n')
            
            % close waitbar
            close(h)
            
            
            % Check images
            % --------------------------------
            hstim=figure('Name', 'Check subsample of stimuli', ...
                'Visible', 'on', 'Units', 'pixels', ...
                'MenuBar', 'none', 'ToolBar', 'none',...
                'NumberTitle', 'off',...
                'Position',[screensize(3)/3+1 10 screensize(3)*2/3 screensize(4)-20]); %#ok<NASGU>
            scount=0;
            llx=ceil([1:size(stimuli,1)/5:size(stimuli,1),size(stimuli,1)]);
            ttx=ceil([1:size(stimuli,2)/5:size(stimuli,2),size(stimuli,2)]);
            for ll=llx
                for ttr=ttx
                    scount=scount+1;
                    subplot(length(llx),length(ttx),scount)
                    imagesc(stimuli{ll,ttr})
                    colormap gray
                    title({['W: ',num2str(experiment_parameters.lamdas(ll))],[' R: ',num2str(experiment_parameters.thetas(ttr))]})
                    axis off
                end
            end
            
            
            % create subject cell
            experiment_parameters.subject=cell(experiment_parameters.NumberSubjects,1);
            
            
            % Create ISI vectors
            % -----------------------------------------------
            if strcmp(experiment_parameters.Feedback, 'yes')
                fprintf('ISI ')
                if strcmpi(experiment_parameters.ISIrand, 'random')
                    for subj=1:experiment_parameters.NumberSubjects
                        for iiiix = 1:size(experiment_parameters.rule_order,1)
                            experiment_parameters.subject{subj,1}.ISI{iiiix,1} = (experiment_parameters.ITIvar(2)-experiment_parameters.ISIvar(1)).*rand(experiment_parameters.rule_order{iiiix,3},1) + experiment_parameters.ISIvar(1);
                        end
                    end
                else
                    ISI = cell(size(experiment_parameters.rule_order,1),1);
                    for iiiix = 1:size(experiment_parameters.rule_order,1)
                        ISI{iiiix} = (experiment_parameters.ISIvar(2)-experiment_parameters.ISIvar(1)).*rand(experiment_parameters.rule_order{iiiix,3},1) + experiment_parameters.ISIvar(1);
                    end
                    
                    for subj=1:experiment_parameters.NumberSubjects
                        experiment_parameters.subject{subj,1}.ISI = ISI;
                    end
                end
                
                fprintf(' - done!\n')
            end
            
            
            % Create ITI vectors
            % -----------------------------------------------
            fprintf('ITI ')
            if strcmpi(experiment_parameters.ITIrand, 'random')
                for subj=1:experiment_parameters.NumberSubjects
                    for ii = 1:size(experiment_parameters.rule_order,1)
                        experiment_parameters.subject{subj,1}.ITI{ii,1} = (experiment_parameters.ITIvar(2)-experiment_parameters.ITIvar(1)).*rand(experiment_parameters.rule_order{ii,3},1) + experiment_parameters.ITIvar(1);
                    end
                end
            elseif strcmpi(experiment_parameters.ITIrand, 'constant')
                
                for subj=1:experiment_parameters.NumberSubjects
                    for ii = 1:size(experiment_parameters.rule_order,1)
                        experiment_parameters.subject{subj,1}.ITI{ii,1} = ones(experiment_parameters.rule_order{ii,3},1).*experiment_parameters.ITIvar(1);
                    end
                end
                
            else
                ITI = cell(size(experiment_parameters.rule_order,1),1);
                for ii = 1:size(experiment_parameters.rule_order,1)
                    ITI{ii} = (experiment_parameters.ITIvar(2)-experiment_parameters.ITIvar(1)).*rand(experiment_parameters.rule_order{ii,3},1) + experiment_parameters.ITIvar(1);
                end
                
                for subj=1:experiment_parameters.NumberSubjects
                    experiment_parameters.subject{subj,1}.ITI = ITI;
                end
            end
            fprintf(' - done!\n')
            
            
            % Create random order of stimuli
            % -----------------------------------------------
            cond1=0;
            fprintf('Get distributions of rules')
            experiment_parameters.rule_dist=cell(size(experiment_parameters.rule_order,1),3);
            for ii = 1:size(experiment_parameters.rule_order,1)
                for val = 1:3
                    
                    experiment_parameters.rule_dist{ii,val} = find(experiment_parameters.rules{experiment_parameters.rule_order{ii,1}}==val);
                    if val==1
                        if length(find(experiment_parameters.rules{experiment_parameters.rule_order{ii,1}}==val))>0 %#ok<ISMT>
                            cond1=1;
                        end
                    end
                    
                end
                if strcmp(experiment_parameters.attentionmode, 'yes')
                    if strcmp(experiment_parameters.amode.img2type, 'rule0')
                        experiment_parameters.amode.rule_zeros{ii} = find(experiment_parameters.rules{experiment_parameters.rule_order{ii,1}}==0);
                    end
                end
            end
            fprintf(' - done!\n')
            
            if cond1 == 1
                answer = inputdlg('Red condition was found in rules! How many consecutive correct answers of subject before red area is detected as sigificant?', 'Specify rule of uncertainty',1,{'3'});
                cfg.redcond=str2num(answer{1});
            else
                cfg.redcond=3;
            end
            
            
            
            if strcmpi(experiment_parameters.SelectingGrating, 'random')
                for subj=1:experiment_parameters.NumberSubjects
                    for ii = 1:size(experiment_parameters.rule_order,1)
                        
                        % A
                        inda=experiment_parameters.rule_dist{ii,3};
                        nra=ceil(experiment_parameters.rule_order{ii, 2}*experiment_parameters.rule_order{ii, 3});
                        [~,idxa]=sort(rand(length(inda),1));
                        A=inda(idxa);
                        if length(A)<nra
                            Ao=A;
                            while length(A)<nra
                                A=[A;Ao];
                            end
                        end
                        
                        % B
                        indb=[experiment_parameters.rule_dist{ii,2};experiment_parameters.rule_dist{ii,1}];
                        indbcon=[ones(length(experiment_parameters.rule_dist{ii,2}),1)*2;ones(length(experiment_parameters.rule_dist{ii,1}),1)*3];
                        nrb=experiment_parameters.rule_order{ii, 3}-nra;
                        [~,idxb]=sort(rand(length(indb),1));
                        B=indb(idxb);
                        Bcon=indbcon(idxb);
                        if length(B)<nrb
                            Bo=B;
                            Bocon=Bcon;
                            while length(B)<nrb
                                B=[B;Bo];
                                Bcon=[Bcon;Bocon];
                            end
                        end
                        clear inda idxa indb idxb
                        
                        
                        %                     if strcmpi(experiment_parameters.mixtype,'full')
                        %                         % full mix
                        %                         AB = [A(1:nra); B(1:nrb)];
                        %                         cAB = [ones(length(A),1); ones(length(B),1)*2];
                        %                         [~,id]=sort(rand(length(AB),1));
                        %                         [tilt,fre]=ind2sub([experiment_parameters.nrlamdas,experiment_parameters.nrthetas],AB(id));
                        %                         experiment_parameters.subject{subj,1}.stimorder{ii,1}.tilt=tilt;
                        %                         experiment_parameters.subject{subj,1}.stimorder{ii,1}.freq=fre;
                        %                         experiment_parameters.subject{subj,1}.condorder{ii,1}=cAB(id);
                        %                         clear AB id cAB tilt fre
                        %
                        %                     else
                        %                         try
                        % equal mix
                        pst=round(experiment_parameters.mixtype*experiment_parameters.rule_order{ii,2});
                        AB=[];
                        cAB = [];
                        acount = 1; bcount = 1;
                        for xx=1:floor(experiment_parameters.rule_order{ii,3}/experiment_parameters.mixtype)
                            
                            ab = [ A(acount:acount+pst-1); B(bcount:bcount+(experiment_parameters.mixtype-pst)-1) ];
                            %                             cab = [ones(pst,1); ones(experiment_parameters.mixtype-pst,1)*2];
                            cab = [ones(pst,1); Bcon(bcount:bcount+(experiment_parameters.mixtype-pst)-1) ];
                            [~,id]=sort(rand(experiment_parameters.mixtype,1));
                            AB = [AB; ab(id)];
                            cAB = [cAB; cab(id)];
                            acount = acount + pst;
                            bcount = bcount + (experiment_parameters.mixtype-pst);
                            
                        end
                        [tilt,fre]=ind2sub(size(experiment_parameters.rules{ii}),AB);
                        experiment_parameters.subject{subj,1}.stimorder{ii,1}.tiltindex=tilt;
                        experiment_parameters.subject{subj,1}.stimorder{ii,1}.freqindex=fre;
                        experiment_parameters.subject{subj,1}.stimorder{ii,1}.tiltvalue=experiment_parameters.thetas(tilt);
                        experiment_parameters.subject{subj,1}.stimorder{ii,1}.freqvalue=experiment_parameters.lamdas(fre);
                        experiment_parameters.subject{subj,1}.condorder{ii,1}=cAB;
                        %                         catch
                        %                             % full mix
                        %                             AB = [A(1:nra); B(1:nrb)];
                        %                             cAB = [ones(length(A),1); ones(length(B),1)*2];
                        %                             [~,id]=sort(rand(length(AB),1));
                        %                             [tilt,fre]=ind2sub([100 100],AB(id));
                        %                             experiment_parameters.subject{subj,1}.stimorder{ii,1}.tilt=tilt;
                        %                             experiment_parameters.subject{subj,1}.stimorder{ii,1}.freq=fre;
                        %                             experiment_parameters.subject{subj,1}.condorder{ii,1}=cAB(id);
                        %                             clear AB id cAB tilt fre
                        %
                        %                         end
                        %                     end
                        
                        clear nra nrb
                    end
                end
                
            else
                stimorder=cell(size(experiment_parameters.rule_order,1),1);
                condorder=cell(size(experiment_parameters.rule_order,1),1);
                
                for ii = 1:size(experiment_parameters.rule_order,1)
                    % A
                    inda=experiment_parameters.rule_dist{ii,3};
                    nra=ceil(experiment_parameters.rule_order{ii, 2}*experiment_parameters.rule_order{ii, 3});
                    [~,idxa]=sort(rand(length(inda),1));
                    A=inda(idxa(1:nra));
                    
                    % B
                    indb=[experiment_parameters.rule_dist{ii,2};experiment_parameters.rule_dist{ii,1}];
                    indbcon=[ones(length(experiment_parameters.rule_dist{ii,2}),1)*2;ones(length(experiment_parameters.rule_dist{ii,1}),1)*3];
                    nrb=experiment_parameters.rule_order{ii, 3}-nra;
                    [~,idxb]=sort(rand(length(indb),1));
                    B=indb(idxb(1:nrb));
                    Bcon=indbcon(idxb);
                    if length(B)<nrb
                        Bo=B;
                        Bocon=Bcon;
                        while length(B)<nrb
                            B=[B;Bo];
                            Bcon=[Bcon;Bocon];
                        end
                    end
                    clear indb nrb idxb inda nra idxa
                    
                    %                 if strcmpi(experiment_parameters.mixtype,'full')
                    %                     % full mix
                    %                     AB = [A; B];
                    %                     cAB = [ones(length(A),1); ones(length(B),1)*2];
                    %                     [~,id]=sort(rand(length(AB),1));
                    %                     [tilt,fre]=ind2sub([experiment_parameters.nrlamdas,experiment_parameters.nrthetas ],AB(id));
                    %                     stimorder{ii}.tilt=tilt;
                    %                     stimorder{ii}.freq=fre;
                    %                     condorder{ii}=cAB(id);
                    %                     clear AB id cAB tilt fre
                    %                 else
                    % equal mix
                    pst=round(experiment_parameters.mixtype*experiment_parameters.rule_order{ii,2});
                    AB=[];
                    cAB = [];
                    acount = 1; bcount = 1;
                    for xx=1:floor(experiment_parameters.rule_order{ii,3}/experiment_parameters.mixtype)
                        
                        ab = [ A(acount:acount+pst-1); B(bcount:bcount+(experiment_parameters.mixtype-pst)-1) ];
                        %                         cab = [ones(pst,1); ones(experiment_parameters.mixtype-pst,1)*2];
                        cab = [ones(pst,1); Bcon(bcount:bcount+(experiment_parameters.mixtype-pst)-1) ];
                        [~,id]=sort(rand(experiment_parameters.mixtype,1));
                        AB = [AB; ab(id)]; %#ok<*AGROW>
                        cAB = [cAB; cab(id)];
                        acount = acount + pst;
                        bcount = bcount + (20-pst);
                    end
                    [tilt,fre]=ind2sub(size(experiment_parameters.rules{ii}),AB);
                    stimorder{ii,1}.tiltindex=tilt;
                    stimorder{ii,1}.freqindex=fre;
                    stimorder{ii,1}.tiltvalues=experiment_parameters.thetas(tilt);
                    stimorder{ii,1}.freqvalues=experiment_parameters.lamdas(fre);
                    
                    condorder{ii,1}=cAB;
                    %                 end
                end
                
                for subj=1:experiment_parameters.NumberSubjects
                    experiment_parameters.subject{subj,1}.stimorder = stimorder;
                    experiment_parameters.subject{subj,1}.condorder = condorder;
                end
            end
            
            
            % Create attention mode values
            % ---------------------------------------------------------------------------
            
            
            if strcmp(experiment_parameters.attentionmode, 'yes')
                
                fprintf('Attention mode\n')
                
                fprintf('Order of 2nd stimuli')
                % create order of second stim of attention mode
                if strcmp(experiment_parameters.amode.img2type, 'rule0') 
                    % Order for 0 values of rules
                    if strcmp(experiment_parameters.amode.img2rand, 'random')
                        for subj=1:experiment_parameters.NumberSubjects
                            stim2order=cell(size(experiment_parameters.rule_order,1),1);
                            for ii = 1:size(experiment_parameters.rule_order,1)
                                x = experiment_parameters.amode.rule_zeros{ii};
                                [~,idxa]=sort(rand(length(experiment_parameters.amode.rule_zeros{ii}),1));
                                X = x(idxa);
                                while X < experiment_parameters.rule_order{ii,3}
                                    [~,idxr]=sort(rand(length(experiment_parameters.amode.rule_zeros{ii}),1));
                                    X = [X, x(idxr)] ;
                                end
                                X = X(1:experiment_parameters.rule_order{ii,3});
        
                                [tilt,fre]=ind2sub(size(experiment_parameters.rules{ii}),X);
                                stim2order{ii,1}.tiltindex=tilt;
                                stim2order{ii,1}.freqindex=fre;
                                stim2order{ii,1}.tiltvalues=experiment_parameters.thetas(tilt);
                                stim2order{ii,1}.freqvalues=experiment_parameters.lamdas(fre);
                            end
                            experiment_parameters.subject{subj,1}.stim2order = stim2order;
                        end
                        
                    elseif strcmp(experiment_parameters.amode.img2rand, 'pseudorandom')
                        stim2order=cell(size(experiment_parameters.rule_order,1),1);
                        for ii = 1:size(experiment_parameters.rule_order,1)
                            x = experiment_parameters.amode.rule_zeros{ii};
                            [~,idxa]=sort(rand(length(experiment_parameters.amode.rule_zeros{ii}),1));
                            X = x(idxa);
                            while X < experiment_parameters.rule_order{ii,3}
                                [~,idxr]=sort(rand(length(experiment_parameters.amode.rule_zeros{ii}),1));
                                X = [X, x(idxr)] ;
                            end
                            X = X(1:experiment_parameters.rule_order{ii,3});
        
                            [tilt,fre]=ind2sub(size(experiment_parameters.rules{ii}),X);
                            stim2order{ii,1}.tiltindex=tilt;
                            stim2order{ii,1}.freqindex=fre;
                            stim2order{ii,1}.tiltvalues=experiment_parameters.thetas(tilt);
                            stim2order{ii,1}.freqvalues=experiment_parameters.lamdas(fre);
                        end
                        for subj=1:experiment_parameters.NumberSubjects
                            experiment_parameters.subject{subj,1}.stim2order = stim2order;
                        end
                    end
                    
                elseif strcmp(experiment_parameters.amode.img2type, 'random')
                    % Random order of all value combinations
                    
                    if strcmp(experiment_parameters.amode.img2rand, 'random')
                        for subj=1:experiment_parameters.NumberSubjects
                            stim2order=cell(size(experiment_parameters.rule_order,1),1);
                            for ii = 1:size(experiment_parameters.rule_order,1)
                                x = 1:size(experiment_parameters.rules{ii},1)*size(experiment_parameters.rules{ii},2);
                                [~,idxa]=sort(rand(length(x),1));
                                X = x(idxa);
                                X = X(1:experiment_parameters.rule_order{ii,3});
        
                                [fre,tilt]=ind2sub(size(experiment_parameters.rules{ii}),X);
                                stim2order{ii,1}.tiltindex=tilt;
                                stim2order{ii,1}.freqindex=fre;
                                stim2order{ii,1}.tiltvalues=experiment_parameters.thetas(tilt);
                                stim2order{ii,1}.freqvalues=experiment_parameters.lamdas(fre);
                            end
                            experiment_parameters.subject{subj,1}.stim2order{ii,1} = stim2order;
                        end
                        
                    elseif strcmp(experiment_parameters.amode.img2rand, 'pseudorandom')
                        stim2order=cell(size(experiment_parameters.rule_order,1),1);
                        for ii = 1:size(experiment_parameters.rule_order,1)
                            x = 1:size(experiment_parameters.rules{ii},1)*size(experiment_parameters.rules{ii},2);
                            [~,idxa]=sort(rand(length(x),1));
                            X = x(idxa);
                            X = X(1:experiment_parameters.rule_order{ii,3});
                            [fre,tilt]=ind2sub(size(experiment_parameters.rules{ii}),X);
                            stim2order{ii,1}.tiltindex=tilt;
                            stim2order{ii,1}.freqindex=fre;
                            stim2order{ii,1}.tiltvalues=experiment_parameters.thetas(tilt);
                            stim2order{ii,1}.freqvalues=experiment_parameters.lamdas(fre);
                        end
                        for subj=1:experiment_parameters.NumberSubjects
                            experiment_parameters.subject{subj,1}.stim2order{ii,1} = stim2order;
                        end
                    end
                end
                fprintf(' - done\n')
            
            
            
                % Cue order
                fprintf('Cue order')
                if strcmpi(experiment_parameters.amode.cueorder, 'random')
                    
                    for subj=1:experiment_parameters.NumberSubjects
                        for ii = 1:size(experiment_parameters.rule_order,1)
                            pst = round(experiment_parameters.mixtype*(experiment_parameters.amode.cueAratio/100));
                            XX = [];
                            acount = 1;
                            for xx=1:floor(experiment_parameters.rule_order{ii,3}/experiment_parameters.mixtype)
                                x = ones(experiment_parameters.mixtype,1);
                                x(1:pst) = 2;
                                [~,id]=sort(rand(experiment_parameters.mixtype,1));
                                XX = [XX; x(id)]; %#ok<*AGROW>
                                acount = acount + pst;
                            end
                            experiment_parameters.subject{subj,1}.cueorder{ii,1} = XX;
                        end
                    end
                    
                elseif strcmpi(experiment_parameters.amode.cueorder, 'random')
                    
                    CO = cell(size(experiment_parameters.rule_order,1),1);
                    for ii = 1:size(experiment_parameters.rule_order,1)
                        pst = round(experiment_parameters.mixtype*(experiment_parameters.amode.cueAratio/100));
                        XX = [];
                        acount = 1;
                        for xx=1:floor(experiment_parameters.rule_order{ii,3}/experiment_parameters.mixtype)
                            x = ones(experiment_parameters.mixtype,1);
                            x(1:pst) = 2;
                            [~,id]=sort(rand(experiment_parameters.mixtype,1));
                            XX = [XX; x(id)]; %#ok<*AGROW>
                            acount = acount + pst;
                        end
                        CO{ii,1} = XX;
                    end
                    
                    for subj=1:experiment_parameters.NumberSubjects
                    	experiment_parameters.subject{subj,1}.cueorder = CO;
                    end
                end
                
                fprintf(' - done!\n')
                
                
                
                fprintf('Cue presentation time')
                if strcmpi(experiment_parameters.amode.cueSTIMrand, 'random')
                    for subj=1:experiment_parameters.NumberSubjects
                        for ii = 1:size(experiment_parameters.rule_order,1)
                            experiment_parameters.subject{subj,1}.cueSTIMtime{ii,1} = (experiment_parameters.amode.cue_presenttime(2)-experiment_parameters.amode.cue_presenttime(1)).*rand(experiment_parameters.rule_order{ii,3},1) + experiment_parameters.amode.cue_presenttime(1);
                        end
                    end
                elseif strcmpi(experiment_parameters.amode.cueSTIMrand, 'constant')
                
                    for subj=1:experiment_parameters.NumberSubjects
                        for ii = 1:size(experiment_parameters.rule_order,1)
                            experiment_parameters.subject{subj,1}.cueSTIMtime{ii,1} = ones(experiment_parameters.rule_order{ii,3},1).*experiment_parameters.amode.cue_presenttime(1);
                        end
                    end
                
                else
                    STIMtime = cell(size(experiment_parameters.rule_order,1),1);
                    for ii = 1:size(experiment_parameters.rule_order,1)
                        STIMtime{ii} = (experiment_parameters.amode.cue_presenttime(2)-experiment_parameters.amode.cue_presenttime(1)).*rand(experiment_parameters.rule_order{ii,3},1) + experiment_parameters.amode.cue_presenttime(1);
                    end
                
                    for subj=1:experiment_parameters.NumberSubjects
                        experiment_parameters.subject{subj,1}.cueSTIMtime = STIMtime;
                    end
                end
                fprintf(' - done!\n')

                
                fprintf('Cue ISI')
                if strcmpi(experiment_parameters.amode.cueISIrand, 'random')
                    for subj=1:experiment_parameters.NumberSubjects
                        for ii = 1:size(experiment_parameters.rule_order,1)
                            experiment_parameters.subject{subj,1}.cueISI{ii,1} = (experiment_parameters.amode.isi_presenttime(2)-experiment_parameters.amode.isi_presenttime(1)).*rand(experiment_parameters.rule_order{ii,3},1) + experiment_parameters.amode.isi_presenttime(1);
                        end
                    end
                elseif strcmpi(experiment_parameters.amode.cueISIrand, 'constant')
                
                    for subj=1:experiment_parameters.NumberSubjects
                        for ii = 1:size(experiment_parameters.rule_order,1)
                            experiment_parameters.subject{subj,1}.cueISI{ii,1} = ones(experiment_parameters.rule_order{ii,3},1).*experiment_parameters.amode.isi_presenttime(1);
                        end
                    end
                
                else
                    ITI = cell(size(experiment_parameters.rule_order,1),1);
                    for ii = 1:size(experiment_parameters.rule_order,1)
                        ITI{ii} = (experiment_parameters.amode.isi_presenttime(2)-experiment_parameters.amode.isi_presenttime(1)).*rand(experiment_parameters.rule_order{ii,3},1) + experiment_parameters.amode.isi_presenttime(1);
                    end
                
                    for subj=1:experiment_parameters.NumberSubjects
                        experiment_parameters.subject{subj,1}.cueISI = ITI;
                    end
                end
                fprintf(' - done!\n')

                
                
            end
            
            
            
            % Create Output marker
            % -----------------------------------------------
%             experiment_parameters.Markers = [5,...
%                 10,...
%                 20,...
%                 50,...
%                 100,...
%                 110,...
%                 120,...
%                 130,...
%                 140,...
%                 200,...
%                 201,...
%                 1,...
%                 30];
            
            
            % Final check of user
            % -----------------------------------------------
            selstr = {'NO','YES'};
            [selection,o] = listdlg('PromptString',{'Do you agree with the rules and the stimuli','and do you want to save the parameter file?'},...
                'SelectionMode','single',...
                'ListSize',[300,50],...
                'ListString',selstr);
            if o==1
                if selection == 2
                    saveparamfile = 1;
                else
                    saveparamfile = 0; %#ok<NASGU>
                    errordlg('Parameter file has not beed saved.',' ')
                    error('Parameter file has not beed saved.')
                end
            else
                errordlg('No selection was made.','Input error')
                error('No selection was made.')
            end
            
            
            if saveparamfile == 1
                
                % Save parameter file
                % -----------------------------------------------
                fprintf('Save parameter file ')
                savename=[experiment_parameters.outputpath, filesep, experiment_parameters.NameExperiment,'_parameters.mat'];
                save(savename,'experiment_parameters');
                fprintf(' - done!')
                
                
                % Save marker file
                % -----------------------------------------------
                if strcmp(experiment_parameters.Sendtrigger, 'yes')
                    
                    fprintf('Save marker file ')
                    % save marker file
                    %                     savename=[outputpath, filesep, cfg.Expname, '_Markers.txt'];
                    %                     fid=fopen(savename,'w');
                    
                    %                     fprintf(fid,['\nStart key pressed: ',num2str(experiment_parameters.Markers(1))]);
                    %                     fprintf(fid,['\nFirst trigger: ',num2str(experiment_parameters.Markers(2))]);
                    %                     fprintf(fid,['\nInstruction images: ',num2str(experiment_parameters.Markers(3)), ' - 20+n']);
                    %                     fprintf(fid,['\nstart exp: ',num2str(experiment_parameters.Markers(4))]);
                    %                     fprintf(fid,['\nInstruction Button: ',num2str(experiment_parameters.Markers(5))]);
                    %                     fprintf(fid,['\nStart experiment: ',num2str(experiment_parameters.Markers(6))]);
                    %                     fprintf(fid,['\nStart Block: ',num2str(experiment_parameters.Markers(7))]);
                    %                     fprintf(fid,['\nEnd Block: ',num2str(experiment_parameters.Markers(8))]);
                    %                     fprintf(fid,['\nStart ISI: ',num2str(experiment_parameters.Markers(9))]);
                    %                     fprintf(fid,['\nStart ISI: ',num2str(experiment_parameters.Markers(10)]);
                    %                     fprintf(fid,['\nStart ISI: ',num2str(experiment_parameters.Markers(11))]);
                    %                     fprintf(fid,['\nStart ISI: ',num2str(experiment_parameters.Markers(12))]);
                    %
                    %
                    %     fprintf(fid,'\n[previous n trials] [actual trial] -> Marker');
                    %     if strcmp(cfg.Triggertype,'smart')
                    %         for ii=1:2
                    %             for xx=1:size(xcases,1)
                    %                 fprintf(fid,['\n ',xcases(xx,:), '\t',num2str(ii-1),' -> ', num2str(ii*100 + xx) ]);
                    %             end
                    %         end
                    %     else
                    %         for ii=1:2
                    %             fprintf(fid,['\n ',num2str(ii-1),' -> ', num2str(ii*100) ]);
                    %         end
                    %     end
                    %     fprintf(fid,['\nButton 1: ',num2str(experiment_parameters.MarkersBP(5))]);
                    %     fprintf(fid,['\nButton 2: ',num2str(experiment_parameters.MarkersBP(6))]);
                    %     fprintf(fid,['\nButton 1 correct: ',num2str(experiment_parameters.MarkersBP(1))]);
                    %     fprintf(fid,['\nButton 1 incorrect: ',num2str(experiment_parameters.MarkersBP(2))]);
                    %     fprintf(fid,['\nButton 2 correct: ',num2str(experiment_parameters.MarkersBP(3))]);
                    %     fprintf(fid,['\nButton 2 incorrect: ',num2str(experiment_parameters.MarkersBP(4))]);
                    %     fprintf(fid,['\nStop Button: ',num2str(experiment_parameters.MarkersBP(7))]);
                    %     fclose(fid);
                    fprintf(' - done!')
                end
                
            end
            
            fprintf(['\n',...
                '############################################\n',...
                '#                                          #\n',...
                '#           Thank you for using            #\n',...
                '#                                          #\n',...
                '#                GraLe-TaG                 #\n',...
                '#                                          #\n',...
                '# Anastasia Christakou and Michael Lindner #\n',...
                '#                                          #\n',...
                '############################################\n'])
            pause(3)
            
        end
        
        
        
        % Create stimuli
        % -------------------------------------------------------------------------
        % -------------------------------------------------------------------------
        function gabor=create_stim(experiment_parameters,lam,thet)
            
            % X is a vector from 1 to imageSize
            X = 1:experiment_parameters.imSize;
            % rescale X -> -.5 to .5
            X0 = (X / experiment_parameters.imSize) - .5;               
            % compute frequency from wavelength
            freq = experiment_parameters.imSize/lam;                  
            % convert to radians: 0 -> 2*pi
            phaseRad = (experiment_parameters.phase * 2* pi);           
            % 2D matrices
            [Xm, Ym] = meshgrid(X0, X0);              
            % convert experiment_parameters.theta (orientation) to radians
            thetaRad = (thet / 360) * 2*pi;          
            % compute proportion of Xm for given orientation
            Xt = Xm * cos(thetaRad) ;                 
            % compute proportion of Ym for given orientation
            Yt = Ym * sin(thetaRad) ;                 
            % sum X and Y components
            XYt = Xt + Yt;                            
            % convert to radians and scale by frequency
            XYf = XYt * freq * 2*pi;                  
            % make 2D sinewave
            grating = sin( XYf + phaseRad);           
            % make grating positive
            grating = grating + abs(min(grating(:))); 
            % normalize grating to values between 1 and 255
            grating = grating * 255/max(grating(:));  
            
            if strcmpi(experiment_parameters.imagemask,'gauss')
                % gaussian width as fraction of imageSize
                s = experiment_parameters.sigma / experiment_parameters.imSize;                 
                % formula for 2D gaussian
                gauss = exp( -(((Xm.^2)+(Ym.^2)) ./ (experiment_parameters.widthgauss* s^2)) ); 
                % experiment_parameters.trim around edges (for 8-bit colour displays)
                gauss(gauss < experiment_parameters.trim) = 0;                 
                mask=gauss;
                gabor = grating .* mask;
            elseif strcmpi(experiment_parameters.imagemask,'circle')
                [x,y]=meshgrid(-(floor(experiment_parameters.imSize/2)-1):(experiment_parameters.imSize-floor(experiment_parameters.imSize/2)),-(floor(experiment_parameters.imSize/2)-1):(experiment_parameters.imSize-floor(experiment_parameters.imSize/2)));
                mask=((x.^2+y.^2)<=experiment_parameters.radius^2);
                gabor = grating .* mask;
                backmask=zeros(size(grating));
                backmask(mask==0)=1;
                gabor(backmask==1)=0;
            elseif strcmpi(experiment_parameters.imagemask,'full')
                mask = ones(experiment_parameters.imSize);
                gabor = grating .* mask;
            else
                error('Wrong input for mask')
            end
        end
        
        
    end




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Run GraLe experiment
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





    function Run_GraLe()
        
        % line added by AC to close all textures and off-screen windows
        % (helps memory usage and timing)
        Screen('Close');
        
        experiment_parameters = [];
        
        % get experiment name to load parameters
        [FileName, PathName] = uigetfile('*_parameters.mat','Select experiment parameter file');
        
        % build filename
        filename = [PathName, FileName];
        % load data
        load(filename); %#ok<LOAD>
        % create cfg structure from loaded file
        cfg = experiment_parameters;
        %         cfg.expname = expnam{1};
        
        if cfg.version<GraLe_ver
            errordlg('Invalid parameter files! The parameter file was created with an older version of GraLe-TaG. Plase recreate the parameter file with the actual version of GraLe-TaG.','Input Error');
        end
        
        % get subject number
        subj = inputdlg('Input Subject number:','Subject number');
        cfg.subjectid = str2num(subj{1});
        
        % get screen type
        answer = inputdlg('Present experiment in ''full'' screen or ''windowed'' :','Input Screen type',1,{'full'});
        if strcmp(answer{1},'full')
            cfg.screen = 1;
        else
            cfg.screen = 0;
            prompt = {'Window size X (in pixel):',...
                'Window size X (in pixel):'};
            dlg_title = 'Input size of window:';
            num_lines = 1;
            defaultans = {'800','600'};
            answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
            cfg.screenx=str2num(answer{1});
            cfg.screeny=str2num(answer{2});
        end
        
        
        
        % get display number to present the experiment
        MP = get(0, 'MonitorPositions');
        if size(MP,1)>1
            answer = inputdlg(['Multiple displays detected! Specify the display number on which you want to present the experiment: (0 to ',num2str(size(MP,1)),')'],'Display number',1,{'0'});
            dispnum = str2num(answer{1});
        else
            dispnum = 0;
        end
        
        
        
        
        % Creating stimuli
        % --------------------------------
        
        if ~isfield(cfg, 'stimuli')
            % create waitbar
            h = waitbar(0,'Creating stimuli ...');
            
            stimuli = cell(length(cfg.lamdas), length(cfg.thetas));
            lamdacount=0;
            for lamda=cfg.lamdas
                lamdacount=lamdacount+1;
                waitbar(lamdacount / length(cfg.lamdas))
                thetacount=0;
                for theta=cfg.thetas
                    thetacount=thetacount+1;
                    
                    gabor=create_stim(cfg,lamda,theta);
                    stimuli{lamdacount,thetacount}=gabor;
                    
                end
            end
            
            cfg.stimuli=stimuli;
            
            close(h)
        end
        
        
        %         tr=1;
        %         ff=1;
        %         tt=1;
        %         cc=1;
        %
        
        % specify defaults
        %--------------------------
        startkey = KbName(cfg.key{3});
        
        % instruction font
        cfg.inst_font = 'Courier';
        cfg.inst_font_size = 18;
        cfg.inst_font_color = [255,255,255];
        cfg.instkey = 'Space';
        
        % cue font
        cfg.cue_font = 'Courier';
        
        % feedback font
        cfg.feedback_font_color =  [255,255,255];
        cfg.feedback_font_size = 28;
        cfg.feedback_font = 'Courier';
        
        %         % block font
        %         cfg.block_text3 = 'Press space bar to continue.';
        %         cfg.block_prestime = 2;
        %         cfg.block_font_color =  [255,255,255];
        %         cfg.block_font_size = 28;
        %         cfg.block_font = 'Arial';
        %
        % end font
        cfg.end_text = 'End of the experiment';
        cfg.stop_text = 'Experiment terminated by pressing q button';
        cfg.end_prestime = 2;
        cfg.end_font_color =  [255,255,255];
        cfg.end_font_size = 28;
        cfg.end_font = 'Arial';
        
        cfg.BackgroundColor = [0 0 0];
        cfg.fixcolor = [255,255,255];
        %
        %
        %
        %
        %
        %
        %
        
        cfg.stimzoom = 1;
        
        
        % setup trigger port
        %--------------------------
        if strcmp(cfg.Sendtrigger, 'yes')
            if strcmp(cfg.Triggerport, 'COM')
                
                %         %create COM object
                %         obj=serial(['COM',cfg.COM.Port]);
                %         % set COM parameters
                %         obj.Baudrate=cfg.COM.Baudrate;
                %         obj.DataBits=cfg.COM.Databits;
                %         obj.StopBits=cfg.COM.Stopbits;
                %         obj.Parity=cfg.COM.Parity;
                %
                %         % display COM parameters in command windowCCC
                %         instrfind('Type', 'serial', 'Port', ['COM',num2str(port)], 'Tag', '')
                %
                %         % empty buffer
                %         flushinput(obj)
                %
                %         % open COM port
                %         fopen(obj);
                
            elseif strcmp(cfg.Triggerport, 'LPT')
                config_io
            end
        end
        
        % get date string for output file
        actdat=datestr(datetime('now','TimeZone','local','Format','d-MMM-y_HH-mm-ss'));
        actdat(actdat==' ')='_';
        actdat(actdat==':')='-';
        
        % open txt file for output
        ouptufilename = [cfg.NameExperiment,'_output_subject',num2str(cfg.subjectid),'_',actdat,'.txt'];
        FID = fopen(ouptufilename,'w');
        
        %
        %
        fprintf(FID,'RuleNr\tRuletype\tTrialNr\tTime\tCond\tButtonNr\tACC\tRT(ms)\tRollACC\tCrit\ttilt\tfreq\tITI');
        if strcmp(cfg.Feedback, 'yes')
            fprintf(FID,'\tISI');
        end
        fprintf(FID,'\r\n');
        %
        %
        %
        
        
        %PsychDefaultSetup(2);
        AssertOpenGL;
%         Screen('Preference', 'SkipSyncTests', 0);
        Screen('Preference', 'SkipSyncTests', 2);        % Only for testing on desktop
        Screen('Preference', 'VisualDebuglevel',3);      % remove welcome screen
        
        
        %         try
        
        HideCursor;
        
        % specify on which display the experiment should be presented (if more
        % than one monitor is connected)
        cfg.display=dispnum;
        
        %         fprintf('\ndebug1')
        
        % Generate/Open a screen window
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if cfg.screen==1
            [w] = Screen('OpenWindow', cfg.display, [0 0 0]);
        else
            [w] = Screen('OpenWindow', cfg.display, [0 0 0],[100, 100, cfg.screenx, cfg.screeny]);
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        % get framerate and frameduration
        cfg.hz = Screen('FrameRate', w);
        if cfg.hz == 0; cfg.hz = 60; end
        cfg.frameDuration = Screen('GetFlipInterval', w);
        
        % get screen info
        if cfg.screen==1
            screen_info = Screen('Resolution', cfg.display);
            cfg.screen_res = [screen_info.width  screen_info.height];
        else
            cfg.screen_res = [cfg.screenx  cfg.screeny];
        end
        
        % stim position
        cfg.x1 = cfg.screen_res(1)/2 - cfg.StimPosShift(1) - cfg.imSize*cfg.stimzoom/2;
        cfg.y1 = cfg.screen_res(2)/2 - cfg.StimPosShift(2) - cfg.imSize*cfg.stimzoom/2;
        cfg.x2 = cfg.screen_res(1)/2 - cfg.StimPosShift(1) + cfg.imSize*cfg.stimzoom/2;
        cfg.y2 = cfg.screen_res(2)/2 - cfg.StimPosShift(2) + cfg.imSize*cfg.stimzoom/2;
        
        
        if strcmp(experiment_parameters.Feedback, '')
            % feedback positions
            cfg.fpx1 = cfg.screen_res(1)/2 - cfg.StimPosShift(1) - cfg.FBimSizeX*cfg.stimzoom/2;
            cfg.fpy1 = cfg.screen_res(2)/2 - cfg.StimPosShift(2) - cfg.FBimSizeY*cfg.stimzoom/2;
            cfg.fpx2 = cfg.screen_res(1)/2 - cfg.StimPosShift(1) + cfg.FBimSizeX*cfg.stimzoom/2;
            cfg.fpy2 = cfg.screen_res(2)/2 - cfg.StimPosShift(2) + cfg.FBimSizeY*cfg.stimzoom/2;
        end
        
        % fix positions 
        cfg.cx1 = cfg.screen_res(1)/2 - cfg.fixsize/2;
        cfg.cy1 = cfg.screen_res(2)/2 - cfg.fixsize/2;
        cfg.cx2 = cfg.screen_res(1)/2 + cfg.fixsize/2;
        cfg.cy2 = cfg.screen_res(2)/2 + cfg.fixsize/2;
        
        % Give the display a moment to recover from the change of display mode when
        
        if strcmp(experiment_parameters.attentionmode,'yes')
            % cue positions 
            if strcmp(cfg.amode.cue_type, 'text')
                cfg.cuex1 = cfg.screen_res(1)/2 - cfg.amode.cue_horshift;
                cfg.cuey1 = cfg.screen_res(2)/2;
                cfg.cuex2 = cfg.screen_res(1)/2 - cfg.amode.cue_horshift;
                cfg.cuey2 = cfg.screen_res(2)/2;
            else
                
                cfg.cuex1 = cfg.screen_res(1)/2 - cfg.amode.cue_horshift - cfg.CueimSizeX/2;
                cfg.cuey1 = cfg.screen_res(2)/2 - cfg.CueimSizeX/2;
                cfg.cuex2 = cfg.screen_res(1)/2 - cfg.amode.cue_horshift  + cfg.CueimSizeY/2;
                cfg.cuey2 = cfg.screen_res(2)/2 + cfg.CueimSizeY/2;
            end
        
            % stim positions
            cfg.s1x1 = cfg.screen_res(1)/2 - cfg.amode.stim_posx{1} - cfg.imSize*cfg.stimzoom/2;
            cfg.s1y1 = cfg.screen_res(2)/2 - cfg.amode.stim_posy{1} - cfg.imSize*cfg.stimzoom/2;
            cfg.s1x2 = cfg.screen_res(1)/2 - cfg.amode.stim_posx{1} + cfg.imSize*cfg.stimzoom/2;
            cfg.s1y2 = cfg.screen_res(2)/2 - cfg.amode.stim_posy{1} + cfg.imSize*cfg.stimzoom/2;

            cfg.s2x1 = cfg.screen_res(1)/2 - cfg.amode.stim_posx{2} - cfg.imSize*cfg.stimzoom/2;
            cfg.s2y1 = cfg.screen_res(2)/2 - cfg.amode.stim_posy{2} - cfg.imSize*cfg.stimzoom/2;
            cfg.s2x2 = cfg.screen_res(1)/2 - cfg.amode.stim_posx{2} + cfg.imSize*cfg.stimzoom/2;
            cfg.s2y2 = cfg.screen_res(2)/2 - cfg.amode.stim_posy{2} + cfg.imSize*cfg.stimzoom/2;
        end

                
        % opening a window. It takes some monitors and LCD scan converters a few seconds to resync.
        WaitSecs(1);
        
        %         fprintf('\ndebug3')
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Button test
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        
        Screen('FillRect',w ,cfg.BackgroundColor);
        Screen('DrawText',w ,'Please press button for A', cfg.screen_res(1)/2-240, cfg.screen_res(2)/2, cfg.inst_font_color);
        Screen('Flip', w);
        check_button(1)
        
        Screen('FillRect',w ,cfg.BackgroundColor);
        Screen('DrawText',w ,'Please press button for B', cfg.screen_res(1)/2-240, cfg.screen_res(2)/2, cfg.inst_font_color);
        Screen('Flip', w);
        check_button(2)
        
        Screen('FillRect',w ,cfg.BackgroundColor);
        Screen('Flip', w);
        WaitSecs(1);
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Instruction
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        if strcmp(experiment_parameters.Instruction, 'yes')
            
            % ## Instructions
            Screen('FillRect',w ,cfg.BackgroundColor);
            % set font type
            %                 Screen('TextFont',w ,cfg.inst_font);
            % set fontsize
            %                 Screen('TextSize',w ,cfg.inst_font_size);
            % create text
            Screen('DrawText',w ,'Press space bar to start the Instructions', cfg.screen_res(1)/2-(length('Press space bar to start the Instructions')*cfg.inst_font_size/2.5), cfg.screen_res(2)/2-cfg.inst_font_size/2, cfg.inst_font_color);
            % send trigger
            if strcmp(cfg.Sendtrigger, 'yes'); Sendtrigger(cfg, cfg.Markers(3)); end
            % present screen
            Screen('Flip', w);
            
            %         fprintf('\ndebug4')
            
            
            % wait for start key
            keycode = zeros(1,256);
            while(~keycode(startkey))
                [~,~,keycode] = KbCheck;
            end
            clear k1 k2
            % send trigger
            if strcmp(cfg.Sendtrigger, 'yes'); Sendtrigger(cfg, cfg.Markers(1)); end
            
            
            
            % Instruction images
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            
            for inii = 1:cfg.InstructionNrImages
                
                Screen('FillRect', w, cfg.BackgroundColor);
                
                tex = Screen('MakeTexture', w, cfg.InstructionImages{inii});
                %Screen('DrawTexture', w, tex, [100 100 screen_info.width-100  screen_info.height-100]);
                Screen('DrawTexture', w, tex, [],[],0);
                Screen('Flip', w);
                
                
                % wait for inst button
                if cfg.InstructionButtonsNr{inii} == 99
                    KbStrokeWait;
                else
                    keycode = zeros(1,256);
                    while(~keycode(KbName(experiment_parameters.key{experiment_parameters.InstructionButtonsNr{inii}})))
                        [~,~,keycode] = KbCheck;
                    end
                end
                
                % send trigger
                if strcmp(cfg.Sendtrigger, 'yes'); Sendtrigger(cfg, cfg.Markers(3)+inii); end
            end
        end
        
        
        WaitSecs(1);
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Start experiment
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        % set Background
        Screen('FillRect',w ,cfg.BackgroundColor);
        % set font type
        %             Screen('TextFont',w ,cfg.inst_font);
        % set fontsize
        Screen('TextSize',w ,cfg.inst_font_size);
        % create text
        Screen('DrawText',w ,'Press space bar to start the experiment', cfg.screen_res(1)/2-(length('Press space bar to start the experiment')*cfg.inst_font_size/2.5), cfg.screen_res(2)/2-cfg.inst_font_size/2, cfg.inst_font_color);
        % send trigger
        if strcmp(cfg.Sendtrigger, 'yes'); Sendtrigger(cfg, cfg.Markers(12)); end
        % present screen
        Screen('Flip', w);
        
        %         fprintf('\ndebug4')
        
        % wait for start key
        keycode = zeros(1,256);
        while(~keycode(startkey))
            [~,~,keycode] = KbCheck;
        end
        clear k1 k2
        % send trigger
        if strcmp(cfg.Sendtrigger, 'yes'); Sendtrigger(cfg, cfg.Markers(1)); end
        
        % get start time
        starttime = GetSecs;
        
        stop_exp=0;
        
        
        %             fprintf('\ndebug4b')
        
        % initial ITI
        % -----------------------------
        Screen('FillRect', w, cfg.BackgroundColor);
        % present fixation dot
        if strcmp(cfg.Feedback, 'yes');if strcmp(cfg.present_fix2,'yes'); present_fix(); end; end
        if strcmp(cfg.Sendtrigger, 'yes'); Sendtrigger(cfg,0); end
        % present screen
        Screen('Flip', w);
        % Wait for defined time
        tic
        while toc<cfg.initialITI/1000
        end
        
        %             fprintf('\ndebug4c ')
        
        % ##########################
        %    loop over rules
        % ##########################
        
        for rule = 1:size(cfg.rule_order,1)
            
            
            accvec = nan(cfg.rule_order{rule,3},1);
            
            % ##########################
            %    loop over trials
            % ##########################
            
            for trial = 1:cfg.rule_order{rule,3}
                
                distime = 0;
                
                cumtime = GetSecs-starttime;
                time0 = GetSecs;
                
                
                % Present cue
                % ------------------------------------
                
                if strcmp(experiment_parameters.attentionmode,'yes')
                    
                    % start timer
                    tic
                    % present cue screen
                    present_cue()
                    % calculate number fo frames for isi
                    cuepres = round(cfg.subject{cfg.subjectid}.cueSTIMtime{rule}(trial)/1000 /cfg.frameDuration)*cfg.frameDuration - cfg.frameDuration;
                    % wait until time for isi is over
                    while toc<cuepres
                    end
                    
                    % start timer
                    tic
                    % present isi screen
                    present_cue_isi()
                    % calculate number fo frames for isi
                    cueisi = round(cfg.subject{cfg.subjectid}.cueISI{rule}(trial)/1000 /cfg.frameDuration)*cfg.frameDuration - cfg.frameDuration;
                    % wait until time for isi is over
                    while toc<cueisi
                    end
                end
                
                
                % Present gabor grating(s)
                % ------------------------------------
                
                if strcmp(experiment_parameters.attentionmode,'no')
                    % get image
                    cfg.img = cfg.stimuli{cfg.subject{cfg.subjectid}.stimorder{rule}.freqindex(trial),cfg.subject{cfg.subjectid}.stimorder{rule}.tiltindex(trial)};
                    % present stimulus
                    present_gabor_single(cfg)
                    
                elseif strcmp(experiment_parameters.attentionmode,'yes')
                    % get image
                    cfg.img1 = cfg.stimuli{cfg.subject{cfg.subjectid}.stimorder{rule}.freqindex(trial),cfg.subject{cfg.subjectid}.stimorder{rule}.tiltindex(trial)};
                    if strcmp(cfg.amode.img2type,'rule0')
                        cfg.img2 = cfg.stimuli{cfg.subject{cfg.subjectid}.stim2order{rule}.freqindex(trial),cfg.subject{cfg.subjectid}.stimorder{rule}.tiltindex(trial)};
                    elseif strcmp(cfg.amode.img2type,'random')
                        cfg.img2 = cfg.stimuli{cfg.subject{cfg.subjectid}.stim2order{rule}.freqindex(trial),cfg.subject{cfg.subjectid}.stimorder{rule}.tiltindex(trial)};
                    else
                        cfg.img2 = flipdim(cfg.img1,2);
                    end
                        
%                     cfg.img2 = cfg.stimuli2{cfg.subject{cfg.subjectid}.stimorder{rule}.freqindex(trial),cfg.subject{cfg.subjectid}.stimorder{rule}.tiltindex(trial)};
                    % present stimulus
                    present_gabor_dual(cfg)
                end
                
                cfg.img = [];
                
                
                % detect response
                % ----------------------------------------
                
                tic
                bs = 0;
                rtime = nan;
                while bs == 0
                    
                    
                    % check keyboard input
                    [keyisdown,secs,keycode] = KbCheck;
                    if keyisdown == 1
                        rtime = secs-time0;
                        % detect key
                        if keycode(KbName(cfg.key{1})) % check left button
                            bp = 1;
                            bpout = 1;
                            %                                 bp_pos = 'A';
                            if strcmp(cfg.Sendtrigger, 'yes'); Sendtrigger(cfg, cfg.Markers(6)); end
                        elseif keycode(KbName(cfg.key{2})) % check right button
                            bp = 2;
                            bpout = 2;
                            %                                 bp_pos = 'B';
                            if strcmp(cfg.Sendtrigger, 'yes'); Sendtrigger(cfg,  cfg.Markers(6)+1); end
                        elseif keycode(KbName(cfg.key{4})) % check stop button
                            stop_exp = 1;
                            if strcmp(cfg.Sendtrigger, 'yes'); Sendtrigger(cfg,cfg.Markers(6)+2); end
                            break
                        else
                            bp = 99;
                            %                                 bp_pos = 'nan';
                        end
                        if bp < 99
                            
                            if strcmpi(cfg.Stimtimetype,'limited')
                                if strcmpi(cfg.Equaltriallength,'yes')
                                    if strcmpi(cfg.DotTrialEnd,'stay')
                                        if toc<str2num(cfg.Stimprestime)/1000
                                            WaitSecs(str2num(cfg.Stimprestime)/1000-rtime);
                                        end
                                    else
                                        distime=str2num(cfg.Stimprestime)/1000-rtime;
                                    end
                                end
                            end
                            
                            bs = 1;
                        end
                        
                        %                     t_diff = toc;
                    end
                    
                    if strcmpi(cfg.Stimtimetype,'limited')
                        if toc>cfg.Stimprestime/1000
                            bp = 'nan';
                            %                                 bp_pos = 'nan';
                            bs = 1;
                            rtime = secs-time0;
                        end
                    end
                end
                clear bs
                
                % if stop key was pressed end trial loop
                if stop_exp == 1
                    break
                end
                
                % fprintf('\ndebug8b')
                
                % check accuracy
                % ----------------
                if cfg.subject{cfg.subjectid}.condorder{rule}(trial) == bp
                    acc = 1;
                    %                     elseif cfg.subject{cfg.subjectid}.condorder{rule}(trial) == 1;
                    %                         if trial > cfg.redcond
                    %                             if bp == 3 || sum(accvec(trial-(cfg.redcond+1):trial-1))
                    %                                 acc = 1;
                    %                             end
                    %                         end
                else
                    acc = 0;
                end
                
                %                     cfg.subject{cfg.subjectid}.condorder{rule}(trial)
                %                     bp
                %                     acc
                %
                accvec(trial)=acc;
                
                
                % check rolling accuracy
                % ------------------------
                if trial < cfg.ACCcheck_crit{rule,1}
                    
                    rolavg = sum(accvec(1:trial))/trial*100;
                    crit=0;
                else
                    
                    rolavg = sum(accvec(trial-cfg.ACCcheck_crit{rule,1}+1:trial))/cfg.ACCcheck_crit{rule,1}*100;
                    if rolavg >= cfg.ACCcheck_crit{rule,2}
                        crit=1;
                    else
                        crit=0;
                    end
                end
                
                
                % if equal length of trial add the time difference to RT
                if strcmpi(cfg.Stimtimetype,'limited')
                    if strcmpi(cfg.Equaltriallength,'yes')
                        if strcmpi(cfg.DotTrialEnd,'disappear')
                            
                            % create empty screen
                            Screen('FillRect',w,cfg.BackgroundColor);
                            if strcmp(cfg.present_fix, 'yes'); present_fix(); end
                            Screen('Flip', w);
                            
                            WaitSecs(distime);
                        end
                    end
                end
                
                %
                
                
                % ISI and feedback if specified
                % ----------------------------
                if strcmp(cfg.Feedback, 'yes')
                    
                    
                    % ISI
                    % ----------------------------
                    % start timer
                    tic
                    % present isi screen
                    present_isi()
                    % calculate number fo frames for isi
                    isi = round(cfg.subject{cfg.subjectid}.ISI{rule}(trial)/1000 /cfg.frameDuration)*cfg.frameDuration - cfg.frameDuration;
                    % wait until time for isi is over
                    while toc<isi
                    end
                    
                    % Feedback
                    % ----------------------------
                    cfg.acc=acc;
                    % start timer
                    tic
                    % present feedback
                    present_feedback(cfg)
                    % sendtrigger
                    if strcmp(cfg.Sendtrigger, 'yes')
                        Sendtrigger(cfg,cfg.Marker(8));
                    end
                    % wait for feedback present time
                    fbtime = round(cfg.feedback_presenttime/1000 /cfg.frameDuration)*cfg.frameDuration - cfg.frameDuration;
                    while toc<fbtime
                    end
                    
                    cfg.acc=[];
                end
                
                % fprintf('\ndebug9')
                
                % ITI
                % ----------------------------
                % start timer
                tic
                % present isi screen
                present_iti()
                % send trigger
                if strcmp(cfg.Sendtrigger, 'yes')
                    Sendtrigger(cfg,cfg.Marker(9));
                end
                % calculate number fo frames for isi
                iti = round(cfg.subject{cfg.subjectid}.ITI{rule}(trial)/1000 /cfg.frameDuration)*cfg.frameDuration - cfg.frameDuration;
                % wait until time for isi is over
                while toc<iti
                end
                
                
                % write data into text file
                % ----------------------------
                fprintf(FID,[num2str(rule),'\t',...
                    num2str(cfg.rule_order{rule,1}),'\t',...
                    num2str(trial),'\t',...
                    num2str(cumtime),'\t',...
                    num2str(cfg.subject{cfg.subjectid}.condorder{rule}(trial)),'\t',...
                    num2str(bpout),'\t',...
                    num2str(acc),'\t',...
                    num2str(rtime*1000),'\t',...
                    num2str(rolavg),'\t',...
                    num2str(crit),'\t',...
                    num2str(cfg.subject{cfg.subjectid}.stimorder{rule}.tiltvalue(trial)),'\t',...
                    num2str(cfg.subject{cfg.subjectid}.stimorder{rule}.freqvalue(trial)),'\t',...
                    num2str(iti*1000)]);
                
                if strcmp(cfg.Feedback, 'yes')
                    fprintf(FID,['\t',num2str(isi*1000)]);
                end
                
                fprintf(FID,'\r\n');
                
                
                % if criterium was reached stop trial loop
                if crit==1
                    break
                end
                
                % if stop key was pressed stop trial loop
                if stop_exp==1
                    break
                end
                
                
                
                
            end % end of trial loop
            
            % if stop key was pressed end experiment
            if stop_exp==1
                break
            end
            
            % Present self paced continue screen between blocks
            % --------------------------------------------------------
            if cfg.trialbreaks{rule} == 2
                % set Background
                Screen('FillRect',w ,cfg.BackgroundColor);
                % set font type
                Screen('TextFont',w ,cfg.inst_font);
                % set fontsize
                Screen('TextSize',w ,cfg.inst_font_size);
                % create text
                Screen('DrawText',w ,'Press space bar to continue', cfg.screen_res(1)/2-(length('Press space bar to continue')*cfg.inst_font_size/2.5), cfg.screen_res(2)/2-cfg.inst_font_size/2, cfg.inst_font_color);
                % send trigger
                if strcmp(cfg.Sendtrigger, 'yes'); Sendtrigger(cfg, cfg.Markers(12)); end
                % present screen
                Screen('Flip', w);
                
                % wait for start key
                keycode = zeros(1, 256);
                while(~keycode(startkey))
                    [~, ~, keycode] = KbCheck;
                end
                clear k1 k2
                
                % initial ITI
                % -----------------------------
                Screen('FillRect', w, cfg.BackgroundColor);
                % present fixation dot
                if strcmp(cfg.Feedback, 'yes'); if strcmp(cfg.present_fix2,'yes'); present_fix(); end; end
                if strcmp(cfg.Sendtrigger, 'yes'); Sendtrigger(cfg,0); end
                % present screen
                Screen('Flip', w);
                % Wait for defined time
                tic
                while toc<cfg.initialITI/1000
                end
            end
            
            
        end % end of rule loop
        
        % present end
        % ----------------
        
        Screen('FillRect', w, cfg.BackgroundColor);
        Screen('TextFont', w, cfg.end_font);
        Screen('TextSize', w, cfg.end_font_size);
        if strcmp(cfg.Sendtrigger, 'yes')
            if stop_exp == 1
                marker = cfg.Markers(11);
                Screen('DrawText', w, cfg.stop_text, round(cfg.screen_res(1) / 2 - (length(cfg.stop_text)*(cfg.end_font_size - 1)) / 2), round(cfg.screen_res(2) / 2), cfg.end_font_color);
            else
                marker = cfg.Markers(10);
                Screen('DrawText', w, cfg.end_text, round(cfg.screen_res(1) / 2 - (length(cfg.end_text)*(cfg.end_font_size - 1)) / 2), round(cfg.screen_res(2) / 2), cfg.end_font_color);
                % Screen('DrawText', w, 'Thank you for participating!', cfg.screen_res(1)/2-10*cfg.end_font_size, cfg.screen_res(2)/2+100, cfg.end_font_color);
            end
            Sendtrigger(cfg, marker);
        end
        
        Screen(w, 'Flip');
        %wait for delay
        tic
        while toc < cfg.end_prestime
        end
        
        sca
        ShowCursor
        
        %         catch
        %             sca
        %             ShowCursor
        %         end
        
        
        % -------------------------------------------------------------------------
        function Sendtrigger(cfg, marker)
            if strcmp(cfg.Triggerport, 'COM')
                
            elseif strcmp(cfg.Triggerport, 'LPT')
                config_io
                outp(hex2dec(cfg.LPT.Portaddress),marker);
            end
        end
        
        % -------------------------------------------------------------------------
        function present_cue()
            
            % create empty screen
            Screen('FillRect',w ,cfg.BackgroundColor);
            
            if strcmp(cfg.amode.cue_type, 'text')
                % present text
                Screen('TextFont', w, cfg.cue_font);
                Screen('TextSize', w, cfg.amode.cue_font_size);
                ctext = cfg.amode.cuetext{cfg.subject{cfg.subjectid}.cueorder{rule}(trial)};
                ftx=round(cfg.screen_res(1) / 2 - (length(ctext)*(cfg.amode.cue_font_size -1)) / 2.8);
                fty=round(cfg.screen_res(2) / 2 - cfg.amode.cue_font_size / 2.8);
                Screen('DrawText', w, ctext, ftx, fty, cfg.amode.cuecolors{cfg.subject{cfg.subjectid}.cueorder{rule}(trial)});
            else
                % present picture
                t = Screen('MakeTexture',w,cfg.amode.cuepictures{cfg.subject{cfg.subjectid}.cueorder{rule}(trial)});
                Screen('DrawTexture',w,t,[],[cfg.cuex1(1) cfg.cuey1(1) cfg.cuex2(1) cfg.cuey2(1)]);
            end
            
            % send trigger
            if strcmp(cfg.Sendtrigger, 'yes'); Sendtrigger(cfg, cfg.Markers(13)); end
            % present screen
            Screen('Flip', w);
        end
        
        % -------------------------------------------------------------------------
        function present_cue_isi()
            
            % create empty screen
            Screen('FillRect',w ,cfg.BackgroundColor);
            % present fixation dot
            if strcmp(cfg.amode.isi_fix, 'yes'); if strcmp(cfg.amode.isi_fix,'yes'); present_fix(); end; end
            % send trigger
            if strcmp(cfg.Sendtrigger, 'yes'); Sendtrigger(cfg, cfg.Markers(7)); end
            % present screen
            Screen('Flip', w);
        end
        
        % -------------------------------------------------------------------------
        function present_gabor_single(cfg)
            
            % create empty screen
            Screen('FillRect', w, cfg.BackgroundColor);
            % present gabor grating
            t = Screen('MakeTexture',w,cfg.img);
            Screen('DrawTexture',w,t,[],[cfg.x1(1) cfg.y1(1) cfg.x2(1) cfg.y2(1)]);
            % present fixation dot
            if strcmp(cfg.present_fix_s,'yes'); present_fix(); end
            % check if marker is set and send it
            if strcmp(cfg.Sendtrigger, 'yes'); Sendtrigger(cfg, cfg.Markers(5)); end
            % present screen
            Screen('Flip', w);
        end
        
        % -------------------------------------------------------------------------
        function present_gabor_dual(cfg)
            % create empty screen
            Screen('FillRect', w, cfg.BackgroundColor);
            % present gabor grating
            t1 = Screen('MakeTexture',w,cfg.img1);
            Screen('DrawTexture',w,t1,[],[cfg.s1x1(1) cfg.s1y1(1) cfg.s1x2(1) cfg.s1y2(1)]);
            t2 = Screen('MakeTexture',w,cfg.img2);
            Screen('DrawTexture',w,t2,[],[cfg.s2x1(1) cfg.s2y1(1) cfg.s2x2(1) cfg.s2y2(1)]);
            
            % present fixation dot
            if strcmp(cfg.amode.stim_fix,'yes'); present_fix(); end
            % check if marker is set and send it
            if strcmp(cfg.Sendtrigger, 'yes'); Sendtrigger(cfg, cfg.Markers(5)); end
            % present screen
            Screen('Flip', w);
        end
        
        % -------------------------------------------------------------------------
        function present_feedback(cfg)
            
            % create empty screen
            Screen('FillRect', w, cfg.BackgroundColor);
            
            if strcmp(cfg.Feedback, '')
                % present picture
                t = Screen('MakeTexture',w,cfg.Feedbackpictures{cfg.acc+1});
                Screen('DrawTexture',w,t,[],[cfg.fpx1(1) cfg.fpy1(1) cfg.fpx2(1) cfg.fpy2(1)]);
            else
                % present text
                Screen('TextFont', w, cfg.feedback_font);
                Screen('TextSize', w, cfg.feedback_font_size);
                ftx=round(cfg.screen_res(1) / 2 - (length(cfg.Feedbacktexts{cfg.acc+1})*(cfg.feedback_font_size -1)) / 2.8);
                fty=round(cfg.screen_res(2) / 2 - cfg.feedback_font_size / 2.8);
                Screen('DrawText', w, cfg.Feedbacktexts{cfg.acc+1}, ftx,fty , cfg.Feedbackcolors{cfg.acc+1});
            end
            
            % send trigger
            if strcmp(cfg.Sendtrigger, 'yes'); Sendtrigger(cfg, cfg.Markers(8)); end
            
            % present screen
            Screen('Flip', w);
        end
        
        % -------------------------------------------------------------------------
        function present_isi()
            
            % create empty screen
            Screen('FillRect',w ,cfg.BackgroundColor);
            % present fixation dot
            if strcmp(cfg.Feedback, 'yes'); if strcmp(cfg.present_fix2,'yes'); present_fix(); end; end
            % send trigger
            if strcmp(cfg.Sendtrigger, 'yes'); Sendtrigger(cfg, cfg.Markers(7)); end
            % present screen
            Screen('Flip', w);
        end
        
        % -------------------------------------------------------------------------
        function present_iti()
            
            % create empty screen
            Screen('FillRect',w ,cfg.BackgroundColor);
            % present fixation dot
            if strcmp(cfg.present_fix, 'yes'); present_fix(); end
            % send tigger
            if strcmp(cfg.Sendtrigger, 'yes'); Sendtrigger(cfg, cfg.Markers(9)); end
            % present screen
            Screen('Flip', w);
        end
                
        % -------------------------------------------------------------------------
        function present_fix()
            
            % Create dot for fixation dot
            Screen(w, 'FillOval', cfg.fixcolor, [cfg.cx1 cfg.cy1 cfg.cx2 cfg.cy2]);
        end
        
        % ---------------------------------------------------------------
        function check_button(cbk)
            
            % wait until a button is presses
            bx=0;
            while bx==0
                % check keyboard
                [keyisdown,secs,keycode] = KbCheck;
                if keyisdown == 1
                    % check if correct button was pressed
                    if keycode(KbName(cfg.key{cbk}))
                        bx = 1;
                    end
                end
            end
            
            % sent trigger
            if strcmp(cfg.Sendtrigger, 'yes');Sendtrigger(cfg,cfg.Markers(6+cbk));end
            
            % create empty screen
            Screen('FillRect',w,cfg.BackgroundColor);
            % draw text
            Screen('DrawText', w, 'correct', cfg.screen_res(1)/2-100, cfg.screen_res(2)/2, cfg.inst_font_color);
            % present screen
            Screen('Flip', w);
            tic
            while toc<1
            end
        end
        
        % -------------------------------------------------------------------------
        function gabor=create_stim(experiment_parameters,lam,thet)
            
            % X is a vector from 1 to imageSize
            X = 1:experiment_parameters.imSize;
            % rescale X -> -.5 to .5
            X0 = (X / experiment_parameters.imSize) - .5;               
            % compute frequency from wavelength
            freq = experiment_parameters.imSize/lam;                  
            % convert to radians: 0 -> 2*pi
            phaseRad = (experiment_parameters.phase * 2* pi);           
            % 2D matrices
            [Xm, Ym] = meshgrid(X0, X0);              
            % convert experiment_parameters.theta (orientation) to radians
            thetaRad = (thet / 360) * 2*pi;          
            % compute proportion of Xm for given orientation
            Xt = Xm * cos(thetaRad) ;                 
            % compute proportion of Ym for given orientation
            Yt = Ym * sin(thetaRad) ;                 
            % sum X and Y components
            XYt = Xt + Yt;                            
            % convert to radians and scale by frequency
            XYf = XYt * freq * 2*pi;                  
            % make 2D sinewave
            grating = sin( XYf + phaseRad);           
            % make grating positive
            grating = grating + abs(min(grating(:))); 
            % normalize grating to values between 1 and 255
            grating = grating * 255/max(grating(:));  
            
            if strcmpi(experiment_parameters.imagemask,'gauss')
                % gaussian width as fraction of imageSize
                s = experiment_parameters.sigma / experiment_parameters.imSize;                 
                % formula for 2D gaussian
                gauss = exp( -(((Xm.^2)+(Ym.^2)) ./ (experiment_parameters.widthgauss* s^2)) ); 
                % experiment_parameters.trim around edges (for 8-bit colour displays)
                gauss(gauss < experiment_parameters.trim) = 0;                 
                mask=gauss;
                gabor = grating .* mask;
            elseif strcmpi(experiment_parameters.imagemask,'circle')
                [x,y]=meshgrid(-(floor(experiment_parameters.imSize/2)-1):(experiment_parameters.imSize-floor(experiment_parameters.imSize/2)),-(floor(experiment_parameters.imSize/2)-1):(experiment_parameters.imSize-floor(experiment_parameters.imSize/2)));
                mask=((x.^2+y.^2)<=experiment_parameters.radius^2);
                gabor = grating .* mask;
                backmask=zeros(size(grating));
                backmask(mask==0)=1;
                gabor(backmask==1)=0;
            elseif strcmpi(experiment_parameters.imagemask,'full')
                mask = ones(experiment_parameters.imSize);
                gabor = grating .* mask;
            else
                error('Wrong input for mask')
            end
        end
        
        
        
    end
end


