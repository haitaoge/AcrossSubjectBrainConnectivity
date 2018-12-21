function AS_STAT_GUI
D.fig = figure('Name','AS stastic(two groups)',...            
    'units','normalized',...      
    'menubar','none',...       
    'numbertitle','off',...      
    'color',[0.95 0.95 0.95],...
    'position',[0.20 0.15 0.5 0.5]);
movegui(D.fig,'center'); 
%%
D.OutputText = uicontrol('parent',D.fig,...
    'units','normalized',...
    'pos',[0.05,0.9,0.1,0.08],...
    'style','text',...
    'string',{'Output','Directory'},...
    'Fontsize',10);
D.OutputEDIT = uicontrol('parent',D.fig,...
    'units','normalized',...
    'pos',[0.15,0.9,0.7,0.08],...
    'style','edit',...
    'string','NULL');
D.OutputSel = uicontrol('parent',D.fig,...
    'units','normalized',...
    'pos',[0.86,0.9,0.09,0.08],...
    'style','pushbutton',...
    'string','...');
%%
D.Type1 = uicontrol('parent',D.fig,...
    'units','norm',...
    'pos',[0.1,0.8,0.3,0.08],...
    'style','rad',...
    'string','Map mode');
D.Type2 = uicontrol('parent',D.fig,...
    'units','norm',...
    'pos',[0.6,0.8,0.3,0.08],...
    'style','rad',...
    'string','Matrix mode');

%%
D.InputTEXT1 = uicontrol('parent',D.fig,...
    'units','normalized',...
    'pos',[0.05,0.7,0.1,0.08],...
    'style','text',...
    'string',{'Group1 Input','Directory'},...
    'Fontsize',10);
D.InputEDIT1 = uicontrol('parent',D.fig,...
    'units','normalized',...
    'pos',[0.15,0.7,0.7,0.08],...
    'style','edit',...
    'string','NULL');
D.InputSel1 = uicontrol('parent',D.fig,...
    'units','normalized',...
    'pos',[0.86,0.7,0.09,0.08],...
    'style','pushbutton',...
    'string','...');

D.InputTEXT2 = uicontrol('parent',D.fig,...
    'units','normalized',...
    'pos',[0.05,0.6,0.1,0.08],...
    'style','text',...
    'string',{'Group2 Input','Directory'},...
    'Fontsize',10);
D.InputEDIT2 = uicontrol('parent',D.fig,...
    'units','normalized',...
    'pos',[0.15,0.6,0.7,0.08],...
    'style','edit',...
    'string','NULL');
D.InputSel2 = uicontrol('parent',D.fig,...
    'units','normalized',...
    'pos',[0.86,0.6,0.09,0.08],...
    'style','pushbutton',...
    'string','...');
%%

D.STType1 = uicontrol('parent',D.fig,...
    'units','norm',...
    'pos',[0.2,0.5,0.1,0.08],...
    'style','rad',...
    'string','Interaction');
D.STType2 = uicontrol('parent',D.fig,...
    'units','norm',...
    'pos',[0.5,0.5,0.1,0.08],...
    'style','rad',...
    'string','Permutation');
D.STpermtext = uicontrol('parent',D.fig,...
    'units','norm',...
    'pos',[0.65,0.5,0.1,0.08],...
    'style','text',...
    'string',{'Permutation', 'times'});
D.STpermedit = uicontrol('parent',D.fig,...
    'units','norm',...
    'pos',[0.75,0.5,0.1,0.08],...
    'style','edit',...
    'string','5000');
%%
D.COVMOD = uicontrol('parent',D.fig,...
    'units','normalized',...
    'pos',[0.05,0.4,0.1,0.08],...
    'style','radiobutton',...
    'string','with COV',...
    'Fontsize',10,...
    'value',1);


D.COV1 = uicontrol('parent',D.fig,...
    'units','norm',...
    'pos',[0.16,0.4,0.1,0.08],...
    'style','text',...
    'Fontsize',10,...
    'string',{'Group1','COV'});
D.COVedit1 = uicontrol('parent',D.fig,...
    'units','norm',...
    'pos',[0.26,0.4,0.6,0.08],...
    'style','edit');
D.COVsel1 = uicontrol('parent',D.fig,...
    'units','norm',...
    'pos',[0.86,0.4,0.09,0.08],...
    'style','pushbutton',...
    'string','...');

D.COV2 = uicontrol('parent',D.fig,...
    'units','norm',...
    'pos',[0.16,0.3,0.1,0.08],...
    'style','text',...
    'Fontsize',10,...
    'string',{'Group2','COV'});
D.COVedit2 = uicontrol('parent',D.fig,...
    'units','norm',...
    'pos',[0.26,0.3,0.6,0.08],...
    'style','edit');
D.COVsel2 = uicontrol('parent',D.fig,...
    'units','norm',...
    'pos',[0.86,0.3,0.09,0.08],...
    'style','pushbutton',...
    'string','...');

%%
D.mask = uicontrol('parent',D.fig,...
    'units','norm',...
    'pos',[0.05,0.2,0.1,0.08],...
    'style','text',...
    'Fontsize',10,...
    'string','mask');
D.maskedit = uicontrol('parent',D.fig,...
    'units','norm',...
    'pos',[0.15,0.2,0.7,0.08],...
    'style','edit',...
    'string','NULL');
D.masksel = uicontrol('parent',D.fig,...
    'units','norm',...
    'pos',[0.86,0.2,0.09,0.08],...
    'style','pushbutton',...
    'string','...');
%%
D.Comp = uicontrol('parent',D.fig,...
    'units','norm',...
    'pos',[0.1,0.1,0.3,0.08],...
    'style','pushbutton',...
    'string','Compute',...
    'Fontsize',10);
D.Exit = uicontrol('parent',D.fig,...
    'units','norm',...
    'pos',[0.6,0.1,0.3,0.08],...
    'style','pushbutton',...
    'string','Exit',...
    'Fontsize',10);
set(D.Type1,'val',1);
set(D.Type2,'val',0);
set(D.STType1,'val',0);
set(D.STType2,'val',1);
% There are some problem in using interaction
set(D.STType1,'enable','off');
%
% set(D.STpermedit,'enable','off');
% set(D.STpermtext,'enable','off');
% set(D.COVMOD,'enable','off');
% set(D.COV1,'enable','off');
% set(D.COV2,'enable','off');
%
set(D.OutputSel,'callback',{@OutputSel,D});
set(D.InputSel1,'callback',{@InputSel1,D});
set(D.InputSel2,'callback',{@InputSel2,D});
set(D.COVsel1,'callback',{@COVSel1,D});
set(D.COVsel2,'callback',{@COVSel2,D});
set(D.masksel,'callback',{@SelMASK,D});
set(D.COVMOD,'callback',{@COVmodeselection,D});
set(D.STType1,'callback',{@UseInt,D});
set(D.STType2,'callback',{@UsePerm,D});
set(D.Type1,'callback',{@selcomptype1,D});
set(D.Type2,'callback',{@selcomptype2,D});
set(D.Exit,'callback',{@Exit,D});
set(D.Comp,'callback',{@calcustat,D});
end
function calcustat(varargin)
D = varargin{3};

Outputdir = get(D.OutputEDIT,'string');
if strcmp(Outputdir,'NULL')
    errordlg('Please Select Outputdir');
    error('Please Select Outputdir');
end
Parameter.Outputdir = Outputdir;
Inputdir1 = get(D.InputEDIT1,'string');
if strcmp(Inputdir1,'NULL')
    errordlg('Please Select Inputdir');
    error('Please Select Inputdir');
end
Parameter.Inputdir1 = Inputdir1;
Inputdir2 = get(D.InputEDIT2,'string');
if strcmp(Inputdir2,'NULL')
    errordlg('Please Select Inputdir');
    error('Please Select Inputdir');
end
Parameter.Inputdir2 = Inputdir2;
MODELS = get(D.Type1,'val');
Parameter.Mapmod = MODELS;
if MODELS==1
    maskdir = get(D.maskedit,'string');
    if strcmp(maskdir,'NULL')
        errordlg('Please Select Outputdir');
        error('Please Select Outputdir');
    end
    Parameter.maskdir = maskdir;
end
ST_TYPE = get(D.STType1,'val');
Parameter.sttype = ST_TYPE;
if ST_TYPE==0
    PERMTIME = get(D.STpermedit,'string');
    permtime = str2num(PERMTIME);
    Parameter.permtime = permtime;
    COVCOND = get(D.COVMOD,'val');
    Parameter.COVCOND = COVCOND;
    if COVCOND
        COV1DIR = get(D.COVedit1,'string');
        COV2DIR = get(D.COVedit2,'string');
        Parameter.Cov1dir = COV1DIR;
        Parameter.Cov2dir = COV2DIR;
    end
end
outputmat = fullfile(Outputdir,'SetUpparameter.mat');
save(outputmat,'Parameter');
AS_stat_computemain(Parameter)
uiwait(msgbox('Finished'));
end
function Exit(varargin)
D = varargin{3};
close(D.fig);
ASBCmain;
end
function selcomptype1(varargin)
D = varargin{3};
set(D.Type1,'val',1);
set(D.Type2,'val',0);
set(D.mask,'enable','on');
set(D.masksel,'enable','on');
set(D.maskedit,'enable','on');
end
function selcomptype2(varargin)
D = varargin{3};
set(D.Type1,'val',0);
set(D.Type2,'val',1);
set(D.mask,'enable','off');
set(D.masksel,'enable','off');
set(D.maskedit,'enable','off');
end
function UseInt(varargin)
D = varargin{3};
set(D.STType1,'val',1);
set(D.STType2,'val',0);
set(D.STpermedit,'enable','off');
set(D.STpermtext,'enable','off');
set(D.COVMOD,'enable','off');
set(D.COV1,'enable','off');
set(D.COV2,'enable','off');
set(D.COVedit1,'enable','off');
set(D.COVedit2,'enable','off');
set(D.COVsel1,'enable','off');
set(D.COVsel2,'enable','off');
end
function UsePerm(varargin)
D = varargin{3};
set(D.STType1,'val',0);
set(D.STType2,'val',1);
set(D.STpermedit,'enable','on');
set(D.STpermtext,'enable','on');
set(D.COVMOD,'enable','on');
set(D.COV1,'enable','on');
set(D.COV2,'enable','on');
set(D.COVedit1,'enable','on');
set(D.COVedit2,'enable','on');
set(D.COVsel1,'enable','on');
set(D.COVsel2,'enable','on');
end
function OutputSel(varargin)
D = varargin{3};
PG = uigetdir(pwd,'Output Directory Selection');
set(D.OutputEDIT,'string',PG)
end
function InputSel1(varargin)
D = varargin{3};
PG = uigetdir(pwd,'Input Directory Selection');
set(D.InputEDIT1,'string',PG)
end
function InputSel2(varargin)
D = varargin{3};
PG = uigetdir(pwd,'Input Directory Selection');
set(D.InputEDIT2,'string',PG)
end
function COVSel1(varargin)
D = varargin{3};
[FileName,PathName,FilterIndex] = uigetfile('*.txt','COVtext selection');
PGtxt = fullfile(PathName,FileName);
set(D.COVedit1,'string',PGtxt);
end
function COVSel2(varargin)
D = varargin{3};
[FileName,PathName,FilterIndex] = uigetfile('*.txt','COVtext selection');
PGtxt = fullfile(PathName,FileName);
set(D.COVedit2,'string',PGtxt);
end
function SelMASK(varargin)
D = varargin{3};
[FileName,PathName,FilterIndex] = uigetfile({'*.nii';'*.img'},'maskfile selection');
PGseed = fullfile(PathName,FileName);
set(D.maskedit,'string',PGseed);
end
function COVmodeselection(varargin)
D = varargin{3};
vals = get(D.COVMOD,'val');
if vals==1
    set(D.COV1,'enable','on');
    set(D.COV2,'enable','on');
    set(D.COVedit1,'enable','on');
    set(D.COVedit2,'enable','on');
    set(D.COVsel1,'enable','on');
    set(D.COVsel2,'enable','on');
else
    set(D.COV1,'enable','off');
    set(D.COV2,'enable','off');
    set(D.COVedit1,'enable','off');
    set(D.COVedit2,'enable','off');
    set(D.COVsel1,'enable','off');
    set(D.COVsel2,'enable','off');
end
end