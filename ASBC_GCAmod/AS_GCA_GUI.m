function AS_GCA_GUI
D.figall = figure('Name','Granger Causality Analysis Across subjects',...            
    'units','normalized',...      
    'menubar','none',...       
    'numbertitle','off',...      
    'color',[0.95 0.95 0.95],...
    'position',[0.20 0.15 0.5 0.5]);
movegui(D.figall,'center'); 

D.Type1 = uicontrol('parent',D.figall,...
    'units','norm',...
    'pos',[0.1,0.92,0.3,0.06],...
    'style','rad',...
    'string','Map mode');
D.Type2 = uicontrol('parent',D.figall,...
    'units','norm',...
    'pos',[0.6,0.92,0.3,0.06],...
    'style','rad',...
    'string','Matrix mode');
D.PermP = uicontrol('parent',D.figall,...
    'units','norm',...
    'pos',[0.1,0.05,0.2,0.04],...
    'style','rad',...
    'string','PermPval?(5000times)',...
    'val',0);
D.Comp = uicontrol('parent',D.figall,...
    'units','norm',...
    'pos',[0.4,0.05,0.2,0.04],...
    'style','pushbutton',...
    'string','Compute',...
    'Fontsize',10);
D.Exit = uicontrol('parent',D.figall,...
    'units','norm',...
    'pos',[0.7,0.05,0.2,0.04],...
    'style','pushbutton',...
    'string','Exit',...
    'Fontsize',10);
%% map
D.Mapmain = uibuttongroup('parent',D.figall,...
    'units','norm',...
    'pos',[0.05,0.1,0.9,0.8]);
%% matrix
D.Matrixmain = uibuttongroup('parent',D.figall,...
    'units','norm',...
    'pos',[0.05,0.1,0.9,0.8]);
set(D.Mapmain,'vis','on')
set(D.Matrixmain,'vis','off')

set(D.Type1,'val',1);
set(D.Type2,'val',0);
%% %%%%%%%%%%%%%%

D.OutputText1 = uicontrol('parent',D.Mapmain,...
    'units','normalized',...
    'pos',[0.05,0.9,0.1,0.08],...
    'style','text',...
    'string',{'Output','Directory'},...
    'Fontsize',10);
D.OutputEDIT1 = uicontrol('parent',D.Mapmain,...
    'units','normalized',...
    'pos',[0.15,0.9,0.7,0.08],...
    'style','edit',...
    'string','NULL');
D.OutputSel1 = uicontrol('parent',D.Mapmain,...
    'units','normalized',...
    'pos',[0.86,0.9,0.09,0.08],...
    'style','pushbutton',...
    'string','...');
%%
D.InputTEXT1 = uicontrol('parent',D.Mapmain,...
    'units','normalized',...
    'pos',[0.05,0.8,0.1,0.08],...
    'style','text',...
    'string',{'Input','Directory'},...
    'Fontsize',10);
D.InputEDIT1 = uicontrol('parent',D.Mapmain,...
    'units','normalized',...
    'pos',[0.15,0.8,0.7,0.08],...
    'style','edit',...
    'string','NULL');
D.InputSel1 = uicontrol('parent',D.Mapmain,...
    'units','normalized',...
    'pos',[0.86,0.8,0.09,0.08],...
    'style','pushbutton',...
    'string','...');
%%
D.COVTEXT1 = uicontrol('parent',D.Mapmain,...
    'units','normalized',...
    'pos',[0.05,0.7,0.1,0.08],...
    'style','radiobutton',...
    'string','COV',...
    'Fontsize',10);
D.COVEDIT1 = uicontrol('parent',D.Mapmain,...
    'units','normalized',...
    'pos',[0.15,0.7,0.7,0.08],...
    'style','edit',...
    'string','NULL');
D.COVSel1 = uicontrol('parent',D.Mapmain,...
    'units','normalized',...
    'pos',[0.86,0.7,0.09,0.08],...
    'style','pushbutton',...
    'string','...');
%%
D.mask1 = uicontrol('parent',D.Mapmain,...
    'units','norm',...
    'pos',[0.05,0.61,0.1,0.08],...
    'style','text',...
    'Fontsize',10,...
    'string','mask');
D.maskedit1 = uicontrol('parent',D.Mapmain,...
    'units','norm',...
    'pos',[0.15,0.61,0.7,0.08],...
    'style','edit',...
    'string','Defaults');
D.masksel1 = uicontrol('parent',D.Mapmain,...
    'units','norm',...
    'pos',[0.86,0.61,0.09,0.08],...
    'style','pushbutton',...
    'string','...');


D.Seedtype1_1 = uibuttongroup('parent',D.Mapmain,...
    'units','norm',...
    'pos',[0.05,0.5,0.9,0.10]);
D.Seedtype2_1 = uibuttongroup('parent',D.Mapmain,...
    'units','norm',...
    'pos',[0.05,0.38,0.9,0.10]);
D.Seedtype3_1 = uibuttongroup('parent',D.Mapmain,...
    'units','norm',...
    'pos',[0.05,0.26,0.9,0.10]);
D.Seedtype4_1 = uibuttongroup('parent',D.Mapmain,...
    'units','norm',...
    'pos',[0.05,0.14,0.9,0.10]);

D.seedtypes_1(1) = uicontrol('parent',D.Seedtype1_1,...
    'units','norm',...
    'pos',[0.01,0.05,0.25,0.9],...
    'style','radiobutton',...
    'string','MNI',...
    'Fontsize',10,...
    'value',1);
D.seedtypes_1(2) = uicontrol('parent',D.Seedtype2_1,...
    'units','norm',...
    'pos',[0.01,0.05,0.25,0.9],...
    'style','radiobutton',...
    'string','Nifti Image ROIs',...
    'Fontsize',10,...
    'value',0);
D.seedtypes_1(3) = uicontrol('parent',D.Seedtype3_1,...
    'units','norm',...
    'pos',[0.01,0.05,0.25,0.9],...
    'style','radiobutton',...
    'string','Mat file(*.mat)',...
    'Fontsize',10,...
    'value',0);
D.seedtypes_1(4) = uicontrol('parent',D.Seedtype4_1,...
    'units','norm',...
    'pos',[0.01,0.05,0.25,0.9],...
    'style','radiobutton',...
    'string','Text File(*.txt)',...
    'Fontsize',10,...
    'value',0);

D.seedtype1_xtext_1 = uicontrol('parent',D.Seedtype1_1,...
    'units','norm',...
    'pos',[0.3,0.3,0.05,0.4],...
    'style','text',...
    'string','x = ');
D.seedtype1_xedit_1 = uicontrol('parent',D.Seedtype1_1,...
    'units','norm',...
    'pos',[0.35,0.3,0.1,0.4],...
    'style','edit');
D.seedtype1_ytext_1 = uicontrol('parent',D.Seedtype1_1,...
    'units','norm',...
    'pos',[0.45,0.3,0.05,0.4],...
    'style','text',...
    'string','y = ');
D.seedtype1_yedit_1 = uicontrol('parent',D.Seedtype1_1,...
    'units','norm',...
    'pos',[0.5,0.3,0.1,0.4],...
    'style','edit');
D.seedtype1_ztext_1 = uicontrol('parent',D.Seedtype1_1,...
    'units','norm',...
    'pos',[0.6,0.3,0.05,0.4],...
    'style','text',...
    'string','z = ');
D.seedtype1_zedit_1 = uicontrol('parent',D.Seedtype1_1,...
    'units','norm',...
    'pos',[0.65,0.3,0.1,0.4],...
    'style','edit');
D.seedtype1_radtext_1 = uicontrol('parent',D.Seedtype1_1,...
    'units','norm',...
    'pos',[0.75,0.3,0.1,0.4],...
    'style','text',...
    'string','rad(mm) = ');
D.seedtype1_radedit_1 = uicontrol('parent',D.Seedtype1_1,...
    'units','norm',...
    'pos',[0.85,0.3,0.1,0.4],...
    'style','edit');

D.seedtype2_edit_1 = uicontrol('parent',D.Seedtype2_1,...
    'units','norm',...
    'pos',[0.3,0.05,0.6,0.9],...
    'style','edit',...
    'string','NULL');
D.seedtype2_sel_1 = uicontrol('parent',D.Seedtype2_1,...
    'units','norm',...
    'pos',[0.9,0.05,0.08,0.9],...
    'style','pushbutton',...
    'string','...',...
    'Tooltipstring','Select single ROI or multiple ROIs in one nifti file.');

D.seedtype3_edit_1 = uicontrol('parent',D.Seedtype3_1,...
    'units','norm',...
    'pos',[0.3,0.05,0.4,0.9],...
    'style','edit',...
    'string','NULL');
D.seedtype3_sel_1 = uicontrol('parent',D.Seedtype3_1,...
    'units','norm',...
    'pos',[0.7,0.05,0.08,0.9],...
    'style','pushbutton',...
    'string','...');
D.seedtype3_matname_1 = uicontrol('parent',D.Seedtype3_1,...
    'units','norm',...
    'pos',[0.8,0.55,0.18,0.4],...
    'style','text',...
    'string','variable name');
D.seedtype3_matnameedit_1 = uicontrol('parent',D.Seedtype3_1,...
    'units','norm',...
    'pos',[0.8,0.05,0.18,0.4],...
    'style','edit');

D.seedtype4_edit_1 = uicontrol('parent',D.Seedtype4_1,...
    'units','norm',...
    'pos',[0.3,0.05,0.6,0.9],...
    'style','edit',...
    'string','NULL');
D.seedtype4_sel_1 = uicontrol('parent',D.Seedtype4_1,...
    'units','norm',...
    'pos',[0.9,0.05,0.08,0.9],...
    'style','pushbutton',...
    'string','...');

set(D.seedtypes_1(2),'val',0);
set(D.seedtype2_edit_1,'enable','off');
set(D.seedtype2_sel_1,'enable','off');
set(D.seedtypes_1(3),'val',0);
set(D.seedtype3_edit_1,'enable','off');
set(D.seedtype3_sel_1,'enable','off');
set(D.seedtype3_matname_1,'enable','off');
set(D.seedtype3_matnameedit_1,'enable','off');
set(D.seedtypes_1(4),'val',0);
set(D.seedtype4_edit_1,'enable','off');
set(D.seedtype4_sel_1,'enable','off');

%%
D.ORD1 = uicontrol('parent',D.Mapmain,...
    'units','norm',...
    'pos',[0.05,0.05,0.1,0.08],...
    'style','text',...
    'Fontsize',10,...
    'string',{'Image', 'Orders'});
D.ORDedit1 = uicontrol('parent',D.Mapmain,...
    'units','norm',...
    'pos',[0.15,0.05,0.3,0.08],...
    'style','edit',...
    'string','Defaults');
D.ORDsel1 = uicontrol('parent',D.Mapmain,...
    'units','norm',...
    'pos',[0.46,0.05,0.09,0.08],...
    'style','pushbutton',...
    'string','...');
D.calord = uicontrol('parent',D.Mapmain,...
    'units','norm',...
    'pos',[0.56,0.05,0.09,0.08],...
    'style','text',...
    'string',{'GCA', 'order'});
D.calordedit = uicontrol('parent',D.Mapmain,...
    'units','norm',...
    'pos',[0.66,0.05,0.09,0.08],...
    'style','edit',...
    'string','1');
D.Calmethod = uibuttongroup('parent',D.Mapmain,...
    'units','norm',...
    'pos',[0.76 0.05 0.19 0.08]);
D.Calmethod1 = uicontrol('parent',D.Calmethod,...
    'units','norm',...
    'pos',[0.01,0.01,0.48,0.98],...
    'style','rad',...
    'string','residual');
D.Calmethod2 = uicontrol('parent',D.Calmethod,...
    'units','norm',...
    'pos',[0.51,0.01,0.48,0.98],...
    'style','rad',...
    'string','Coefficient');
set(D.Calmethod1,'val',1);
set(D.Calmethod2,'val',0);
set(D.COVTEXT1,'val',1);
%% %%%%%%%%%%%%%%%%%%%%%%%%%%
%% matrix
D.OutputText_2 = uicontrol('parent',D.Matrixmain,...
    'units','normalized',...
    'pos',[0.05,0.9,0.1,0.08],...
    'style','text',...
    'string',{'Output','Directory'},...
    'Fontsize',10);
D.OutputEDIT_2 = uicontrol('parent',D.Matrixmain,...
    'units','normalized',...
    'pos',[0.15,0.9,0.7,0.08],...
    'style','edit',...
    'string','NULL');
D.OutputSel_2 = uicontrol('parent',D.Matrixmain,...
    'units','normalized',...
    'pos',[0.86,0.9,0.09,0.08],...
    'style','pushbutton',...
    'string','...');
%%
D.InputTEXT_2 = uicontrol('parent',D.Matrixmain,...
    'units','normalized',...
    'pos',[0.05,0.8,0.1,0.08],...
    'style','text',...
    'string',{'Input','Directory'},...
    'Fontsize',10);
D.InputEDIT_2 = uicontrol('parent',D.Matrixmain,...
    'units','normalized',...
    'pos',[0.15,0.8,0.7,0.08],...
    'style','edit',...
    'string','NULL');
D.InputSel_2 = uicontrol('parent',D.Matrixmain,...
    'units','normalized',...
    'pos',[0.86,0.8,0.09,0.08],...
    'style','pushbutton',...
    'string','...');
%%
D.COVTEXT_2 = uicontrol('parent',D.Matrixmain,...
    'units','normalized',...
    'pos',[0.05,0.7,0.1,0.08],...
    'style','radiobutton',...
    'string','COV',...
    'Fontsize',10,...
    'value',1);
D.COVEDIT_2 = uicontrol('parent',D.Matrixmain,...
    'units','normalized',...
    'pos',[0.15,0.7,0.7,0.08],...
    'style','edit',...
    'string','NULL');
D.COVSel_2 = uicontrol('parent',D.Matrixmain,...
    'units','normalized',...
    'pos',[0.86,0.7,0.09,0.08],...
    'style','pushbutton',...
    'string','...');
%%
D.Seedtype1_2 = uibuttongroup('parent',D.Matrixmain,...
    'units','norm',...
    'pos',[0.05,0.56,0.9,0.12]);
D.Seedtype2_2 = uibuttongroup('parent',D.Matrixmain,...
    'units','norm',...
    'pos',[0.05,0.42,0.9,0.12]);
D.Seedtype3_2 = uibuttongroup('parent',D.Matrixmain,...
    'units','norm',...
    'pos',[0.05,0.28,0.9,0.12]);
D.Seedtype4_2 = uibuttongroup('parent',D.Matrixmain,...
    'units','norm',...
    'pos',[0.05,0.14,0.9,0.12]);

D.seedtypes_2(1) = uicontrol('parent',D.Seedtype1_2,...
    'units','norm',...
    'pos',[0.01,0.05,0.25,0.9],...
    'style','radiobutton',...
    'string','seperated ROIs',...
    'Fontsize',10,...
    'value',1);
D.seedtypes_2(2) = uicontrol('parent',D.Seedtype2_2,...
    'units','norm',...
    'pos',[0.01,0.05,0.25,0.9],...
    'style','radiobutton',...
    'string','combined ROIs',...
    'Fontsize',10,...
    'value',0);
D.seedtypes_2(3) = uicontrol('parent',D.Seedtype3_2,...
    'units','norm',...
    'pos',[0.01,0.05,0.25,0.9],...
    'style','radiobutton',...
    'string','Mat file(*.mat)',...
    'Fontsize',10,...
    'value',0);
D.seedtypes_2(4) = uicontrol('parent',D.Seedtype4_2,...
    'units','norm',...
    'pos',[0.01,0.05,0.25,0.9],...
    'style','radiobutton',...
    'string','Text File(*.txt)',...
    'Fontsize',10,...
    'value',0);

D.seedtype1_edit_2 = uicontrol('parent',D.Seedtype1_2,...
    'units','norm',...
    'pos',[0.3,0.05,0.6,0.9],...
    'style','edit',...
    'string','NULL');
D.seedtype1_sel_2 = uicontrol('parent',D.Seedtype1_2,...
    'units','norm',...
    'pos',[0.9,0.05,0.08,0.9],...
    'style','pushbutton',...
    'string','...',...
    'Tooltipstring','Select nifti images(one ROI one nifti).');


D.seedtype2_edit_2 = uicontrol('parent',D.Seedtype2_2,...
    'units','norm',...
    'pos',[0.3,0.05,0.6,0.9],...
    'style','edit',...
    'string','NULL');
D.seedtype2_sel_2 = uicontrol('parent',D.Seedtype2_2,...
    'units','norm',...
    'pos',[0.9,0.05,0.08,0.9],...
    'style','pushbutton',...
    'string','...',...
    'Tooltipstring','Select multiple ROIs in one nifti file.');

D.seedtype3_edit_2 = uicontrol('parent',D.Seedtype3_2,...
    'units','norm',...
    'pos',[0.3,0.05,0.4,0.9],...
    'style','edit',...
    'string','NULL');
D.seedtype3_sel_2 = uicontrol('parent',D.Seedtype3_2,...
    'units','norm',...
    'pos',[0.7,0.05,0.08,0.9],...
    'style','pushbutton',...
    'string','...');
D.seedtype3_matname_2 = uicontrol('parent',D.Seedtype3_2,...
    'units','norm',...
    'pos',[0.8,0.55,0.18,0.4],...
    'style','text',...
    'string','variable name');
D.seedtype3_matnameedit_2 = uicontrol('parent',D.Seedtype3_2,...
    'units','norm',...
    'pos',[0.8,0.05,0.18,0.4],...
    'style','edit');

D.seedtype4_edit_2 = uicontrol('parent',D.Seedtype4_2,...
    'units','norm',...
    'pos',[0.3,0.05,0.6,0.9],...
    'style','edit',...
    'string','NULL');
D.seedtype4_sel_2 = uicontrol('parent',D.Seedtype4_2,...
    'units','norm',...
    'pos',[0.9,0.05,0.08,0.9],...
    'style','pushbutton',...
    'string','...');

set(D.seedtypes_2(2),'val',0);
set(D.seedtype2_edit_2,'enable','off');
set(D.seedtype2_sel_2,'enable','off');
set(D.seedtypes_2(3),'val',0);
set(D.seedtype3_edit_2,'enable','off');
set(D.seedtype3_sel_2,'enable','off');
set(D.seedtype3_matname_2,'enable','off');
set(D.seedtype3_matnameedit_2,'enable','off');
set(D.seedtypes_2(4),'val',0);
set(D.seedtype4_edit_2,'enable','off');
set(D.seedtype4_sel_2,'enable','off');

%%
D.ORD_2 = uicontrol('parent',D.Matrixmain,...
    'units','norm',...
    'pos',[0.05,0.05,0.1,0.08],...
    'style','text',...
    'Fontsize',10,...
    'string',{'Image', 'Orders'});
D.ORDedit_2 = uicontrol('parent',D.Matrixmain,...
    'units','norm',...
    'pos',[0.15,0.05,0.3,0.08],...
    'style','edit',...
    'string','Defaults');
D.ORDsel_2 = uicontrol('parent',D.Matrixmain,...
    'units','norm',...
    'pos',[0.46,0.05,0.09,0.08],...
    'style','pushbutton',...
    'string','...');
D.calord_2 = uicontrol('parent',D.Matrixmain,...
    'units','norm',...
    'pos',[0.56,0.05,0.09,0.08],...
    'style','text',...
    'string',{'GCA', 'order'});
D.calordedit_2 = uicontrol('parent',D.Matrixmain,...
    'units','norm',...
    'pos',[0.66,0.05,0.09,0.08],...
    'style','edit',...
    'string','1');
D.Calmethod_2 = uibuttongroup('parent',D.Matrixmain,...
    'units','norm',...
    'pos',[0.76 0.05 0.19 0.08]);
D.Calmethod1_2 = uicontrol('parent',D.Calmethod_2,...
    'units','norm',...
    'pos',[0.01,0.01,0.48,0.98],...
    'style','rad',...
    'string','residual');
D.Calmethod2_2 = uicontrol('parent',D.Calmethod_2,...
    'units','norm',...
    'pos',[0.51,0.01,0.48,0.98],...
    'style','rad',...
    'string','Coefficient');
set(D.Calmethod1_2,'val',1);
set(D.Calmethod2_2,'val',0);
%% %%%%%%%%%%%%%%%%%%%%%%%%%%
%% map
set(D.OutputSel1,'callback',{@OutputSel_I,D});
set(D.InputSel1,'callback',{@InputSel_I,D});
set(D.COVTEXT1,'callback',{@COVselp_I,D}); %
set(D.COVSel1,'callback',{@COVSel_I,D}); %
set(D.seedtypes_1(1),'callback',{@ChangeToMNI_I,D}); %
set(D.seedtypes_1(2),'callback',{@ChangeToROI_I,D}); %
set(D.seedtypes_1(3),'callback',{@ChangeToMAT_I,D}); %
set(D.seedtypes_1(4),'callback',{@ChangeToTEXT_I,D}); %
set(D.masksel1,'callback',{@SelMASK_I,D}); %
set(D.seedtype2_sel_1,'callback',{@SelROI_I,D}); %
set(D.seedtype3_sel_1,'callback',{@Selmat_I,D}); %
set(D.seedtype4_sel_1,'callback',{@Seltext_I,D}); %
set(D.ORDsel1,'callback',{@SelImgord_I,D});
%% matrix
set(D.OutputSel_2,'callback',{@OutputSel_2,D});
set(D.InputSel_2,'callback',{@InputSel_2,D});
set(D.COVTEXT_2,'callback',{@COVselp_2,D});
set(D.COVSel_2,'callback',{@COVSel_2,D});
set(D.seedtypes_2(1),'callback',{@ChangeTosepROI_2,D});
set(D.seedtypes_2(2),'callback',{@ChangeToROI_2,D});
set(D.seedtypes_2(3),'callback',{@ChangeToMAT_2,D});
set(D.seedtypes_2(4),'callback',{@ChangeToTEXT_2,D});
set(D.seedtype1_sel_2,'callback',{@SelROIsep_2,D});
set(D.seedtype2_sel_2,'callback',{@SelROI_2,D});
set(D.seedtype3_sel_2,'callback',{@Selmat_2,D});
set(D.seedtype4_sel_2,'callback',{@Seltext_2,D});
set(D.ORDsel_2,'callback',{@SelImgord_2,D});

%%
set(D.Type1,'callback',{@selcomptype1,D});
set(D.Type2,'callback',{@selcomptype2,D});
set(D.Comp,'callback',{@Compute,D});
set(D.Exit,'callback',{@Exit,D});
end
%%
function Compute(varargin)
D = varargin{3};
Caltype = get(D.Type1,'val');
Parameter.Caltype = Caltype;
if Caltype % Image type
    Outputdir = get(D.OutputEDIT1,'string');
    if strcmp(Outputdir,'NULL')
        errordlg('Please Select Outputdir');
        error('Please Select Outputdir');
    end
    Parameter.Outputdir = Outputdir;
    Inputdir = get(D.InputEDIT1,'string');
    if strcmp(Inputdir,'NULL')
        errordlg('Please Select Inputdir');
        error('Please Select Inputdir');
    end
    Parameter.Inputdir = Inputdir;
    masks = get(D.maskedit1,'string');
    Parameter.masks = masks;
    covs = get(D.COVTEXT1,'val');
    Parameter.covs = covs;
    if covs==1
        COVtext = get(D.COVEDIT1,'string');
        if strcmp(COVtext,'NULL');
            errordlg('Please select covariate text file');
            error('Please select covariate text file');
        end
        Parameter.COVtext = COVtext;
    else
        Parameter.COVtext = '';
    end
    Seedtype = get(D.seedtypes_1,'val');
    if Seedtype{1}
        Parameter.SeedROItype = 1;
        tempv1 = get(D.seedtype1_xedit_1,'string');
        mni(1) = str2num(tempv1);
        tempv2 = get(D.seedtype1_yedit_1,'string');
        mni(2) = str2num(tempv2);
        tempv3 = get(D.seedtype1_zedit_1,'string');
        mni(3) = str2num(tempv3);
        tempr = get(D.seedtype1_radedit_1,'string');
        radius = str2num(tempr);
        Parameter.SeedROI_mni = mni;
        Parameter.SeedROI_radius = radius;
    elseif Seedtype{2}
        Parameter.SeedROItype = 2;
        roipath = get(D.seedtype2_edit_1,'string');
        Parameter.SeedROI_nifti = roipath;
    elseif Seedtype{3}
        Parameter.SeedROItype = 3;
        matpath = get(D.seedtype3_edit_1,'string');
        Parameter.SeedROI_mat = matpath;
        varnam = get(D.seedtype3_matnameedit_1,'string');
        Parameter.SeedROI_varname = varnam;
    else
        Parameter.SeedROItype = 4;
        txtpath = get(D.seedtype4_edit_1,'string');
        Parameter.SeedROI_txt = txtpath;
    end
    ORDedit1 = get(D.ORDedit1,'string');
    Parameter.Imgord = ORDedit1;
    calordedit = get(D.calordedit,'string');
    Parameter.GCAORD = str2num(calordedit);
    Parameter.Calmethod = get(D.Calmethod1,'val');
else % matrix type
    Outputdir = get(D.OutputEDIT_2,'string');
    if strcmp(Outputdir,'NULL')
        errordlg('Please Select Outputdir');
        error('Please Select Outputdir');
    end
    Parameter.Outputdir = Outputdir;
    Inputdir = get(D.InputEDIT_2,'string');
    if strcmp(Inputdir,'NULL')
        errordlg('Please Select Inputdir');
        error('Please Select Inputdir');
    end
    Parameter.Inputdir = Inputdir;
    
    covs = get(D.COVTEXT_2,'val');
    Parameter.covs = covs;
    if covs==1
        COVtext = get(D.COVEDIT_2,'string');
        if strcmp(COVtext,'NULL');
            errordlg('Please select covariate text file');
            error('Please select covariate text file');
        end
        Parameter.COVtext = COVtext;
    else
        Parameter.COVtext = '';
    end
    Seedtype = get(D.seedtypes_2,'val');
    if Seedtype{1}
        Parameter.SeedROItype = 1;
        pgs = get(D.seedtype1_edit_2,'string');
        Parameter.SeedROI_seproi = pgs;
    elseif Seedtype{2}
        Parameter.SeedROItype = 2;
        roipath = get(D.seedtype2_edit_2,'string');
        Parameter.SeedROI_nifti = roipath;
    elseif Seedtype{3}
        Parameter.SeedROItype = 3;
        matpath = get(D.seedtype3_edit_2,'string');
        Parameter.SeedROI_mat = matpath;
        varnam = get(D.seedtype3_matnameedit_2,'string');
        Parameter.SeedROI_varname = varnam;
    else
        Parameter.SeedROItype = 4;
        txtpath = get(D.seedtype4_edit_2,'string');
        Parameter.SeedROI_txt = txtpath;
    end
    ORDedit_2 = get(D.ORDedit_2,'string');
    Parameter.Imgord = ORDedit_2;
    calordedit = get(D.calordedit_2,'string');
    Parameter.GCAORD = str2num(calordedit);
    Parameter.Calmethod = get(D.Calmethod1_2,'val');
end
outputmat = fullfile(Outputdir,'SetUpparameter.mat');
valpermp = get(D.PermP,'val');
if valpermp
    Parameter.Permnum = 5000;
    save(outputmat,'Parameter');
    AS_GCA_pvalcomp_perm(Parameter);
else
    save(outputmat,'Parameter');
    AS_GCA_computemain(Parameter);
end
    
end
function Exit(varargin)
D = varargin{3};
close(D.figall);
ASBCmain
end
function selcomptype1(varargin)
D = varargin{3};
set(D.Type1,'val',1);
set(D.Type2,'val',0);
set(D.Mapmain,'vis','on')
set(D.Matrixmain,'vis','off')
end
function selcomptype2(varargin)
D = varargin{3};
set(D.Type1,'val',0);
set(D.Type2,'val',1);
set(D.Mapmain,'vis','off')
set(D.Matrixmain,'vis','on')
end
%%
function SelImgord_I(varargin)
D = varargin{3};

[FileName,PathName,FilterIndex] = uigetfile({'*.txt'},'image orders');
PGseed = fullfile(PathName,FileName);
set(D.ORDedit1,'string',PGseed);
end
function OutputSel_I(varargin)
D = varargin{3};
PG = uigetdir(pwd,'Output Directory Selection');
set(D.OutputEDIT1,'string',PG)
end
function InputSel_I(varargin)
D = varargin{3};
PG = uigetdir(pwd,'Input Directory Selection');
set(D.InputEDIT1,'string',PG)
end
function COVselp_I(varargin)
D = varargin{3};
val = get(D.COVTEXT1,'value');
if val==1
    set(D.COVSel1,'Enable','on');
    set(D.COVEDIT1,'Enable','on');
else
    set(D.COVSel1,'Enable','off');
    set(D.COVEDIT1,'Enable','off');
end
end
function COVSel_I(varargin)
D = varargin{3};
[FileName,PathName,FilterIndex] = uigetfile('*.txt','COVtext selection');
PGtxt = fullfile(PathName,FileName);
set(D.COVEDIT1,'string',PGtxt);
end
function ChangeToMNI_I(varargin)
D = varargin{3};
set(D.seedtypes_1(1),'val',1);
set(D.seedtype1_xtext_1,'enable','on');
set(D.seedtype1_xedit_1,'enable','on');
set(D.seedtype1_ytext_1,'enable','on');
set(D.seedtype1_yedit_1,'enable','on');
set(D.seedtype1_ztext_1,'enable','on');
set(D.seedtype1_zedit_1,'enable','on');
set(D.seedtype1_radtext_1,'enable','on');
set(D.seedtype1_radedit_1,'enable','on');
set(D.seedtypes_1(2),'val',0);
set(D.seedtype2_edit_1,'enable','off');
set(D.seedtype2_sel_1,'enable','off');
set(D.seedtypes_1(3),'val',0);
set(D.seedtype3_edit_1,'enable','off');
set(D.seedtype3_sel_1,'enable','off');
set(D.seedtype3_matname_1,'enable','off');
set(D.seedtype3_matnameedit_1,'enable','off');
set(D.seedtypes_1(4),'val',0);
set(D.seedtype4_edit_1,'enable','off');
set(D.seedtype4_sel_1,'enable','off');
end
function ChangeToROI_I(varargin)
D = varargin{3};
set(D.seedtypes_1(1),'val',0);
set(D.seedtype1_xtext_1,'enable','off');
set(D.seedtype1_xedit_1,'enable','off');
set(D.seedtype1_ytext_1,'enable','off');
set(D.seedtype1_yedit_1,'enable','off');
set(D.seedtype1_ztext_1,'enable','off');
set(D.seedtype1_zedit_1,'enable','off');
set(D.seedtype1_radtext_1,'enable','off');
set(D.seedtype1_radedit_1,'enable','off');
set(D.seedtypes_1(2),'val',1);
set(D.seedtype2_edit_1,'enable','on');
set(D.seedtype2_sel_1,'enable','on');
set(D.seedtypes_1(3),'val',0);
set(D.seedtype3_edit_1,'enable','off');
set(D.seedtype3_sel_1,'enable','off');
set(D.seedtype3_matname_1,'enable','off');
set(D.seedtype3_matnameedit_1,'enable','off');
set(D.seedtypes_1(4),'val',0);
set(D.seedtype4_edit_1,'enable','off');
set(D.seedtype4_sel_1,'enable','off');
end
function ChangeToMAT_I(varargin)
D = varargin{3};
set(D.seedtypes_1(1),'val',0);
set(D.seedtype1_xtext_1,'enable','off');
set(D.seedtype1_xedit_1,'enable','off');
set(D.seedtype1_ytext_1,'enable','off');
set(D.seedtype1_yedit_1,'enable','off');
set(D.seedtype1_ztext_1,'enable','off');
set(D.seedtype1_zedit_1,'enable','off');
set(D.seedtype1_radtext_1,'enable','off');
set(D.seedtype1_radedit_1,'enable','off');
set(D.seedtypes_1(2),'val',0);
set(D.seedtype2_edit_1,'enable','off');
set(D.seedtype2_sel_1,'enable','off');
set(D.seedtypes_1(3),'val',1);
set(D.seedtype3_edit_1,'enable','on');
set(D.seedtype3_sel_1,'enable','on');
set(D.seedtype3_matname_1,'enable','on');
set(D.seedtype3_matnameedit_1,'enable','on');
set(D.seedtypes_1(4),'val',0);
set(D.seedtype4_edit_1,'enable','off');
set(D.seedtype4_sel_1,'enable','off');
end
function ChangeToTEXT_I(varargin)
D = varargin{3};
set(D.seedtypes_1(1),'val',0);
set(D.seedtype1_xtext_1,'enable','off');
set(D.seedtype1_xedit_1,'enable','off');
set(D.seedtype1_ytext_1,'enable','off');
set(D.seedtype1_yedit_1,'enable','off');
set(D.seedtype1_ztext_1,'enable','off');
set(D.seedtype1_zedit_1,'enable','off');
set(D.seedtype1_radtext_1,'enable','off');
set(D.seedtype1_radedit_1,'enable','off');
set(D.seedtypes_1(2),'val',0);
set(D.seedtype2_edit_1,'enable','off');
set(D.seedtype2_sel_1,'enable','off');
set(D.seedtypes_1(3),'val',0);
set(D.seedtype3_edit_1,'enable','off');
set(D.seedtype3_sel_1,'enable','off');
set(D.seedtype3_matname_1,'enable','off');
set(D.seedtype3_matnameedit_1,'enable','off');
set(D.seedtypes_1(4),'val',1);
set(D.seedtype4_edit_1,'enable','on');
set(D.seedtype4_sel_1,'enable','on');
end
function Seltext_I(varargin)
D = varargin{3};
[FileName,PathName,FilterIndex] = uigetfile({'*.txt'},'mat file selection');
PGseed = fullfile(PathName,FileName);
set(D.seedtype4_edit_1,'string',PGseed);
end
function Selmat_I(varargin)
D = varargin{3};
[FileName,PathName,FilterIndex] = uigetfile({'*.mat'},'mat file selection');
PGseed = fullfile(PathName,FileName);
set(D.seedtype3_edit_1,'string',PGseed);
end
function SelROI_I(varargin)
D = varargin{3};
[FileName,PathName,FilterIndex] = uigetfile({'*.nii';'*.img'},'SeedROI selection');
PGseed = fullfile(PathName,FileName);
set(D.seedtype2_edit_1,'string',PGseed);
end
function SelMASK_I(varargin)
D = varargin{3};
[FileName,PathName,FilterIndex] = uigetfile({'*.nii';'*.img'},'maskfile selection');
PGseed = fullfile(PathName,FileName);
set(D.maskedit1,'string',PGseed);
end
%%
function SelImgord_2(varargin)
D = varargin{3};

[FileName,PathName,FilterIndex] = uigetfile({'*.txt'},'image orders');
PGseed = fullfile(PathName,FileName);
set(D.ORDedit_2,'string',PGseed);
end
function SelROIsep_2(varargin)
D = varargin{3};
fold_name = uigetdir(pwd,'select the file directory which rois stored');
set(D.seedtype1_edit_2,'string',fold_name);
end
function SelROI_2(varargin)
D = varargin{3};
[FileName,PathName,FilterIndex] = uigetfile({'*.nii';'*.img'},'SeedROI selection');
PGseed = fullfile(PathName,FileName);
set(D.seedtype2_edit_2,'string',PGseed);
end
function Selmat_2(varargin)
D = varargin{3};
[FileName,PathName,FilterIndex] = uigetfile({'*.mat'},'mat file selection');
PGseed = fullfile(PathName,FileName);
set(D.seedtype3_edit_2,'string',PGseed);
end
function Seltext_2(varargin)
D = varargin{3};
[FileName,PathName,FilterIndex] = uigetfile({'*.txt'},'mat file selection');
PGseed = fullfile(PathName,FileName);
set(D.seedtype4_edit_2,'string',PGseed);
end
function ChangeTosepROI_2(varargin)
D = varargin{3};
set(D.seedtypes_2(1),'val',1);
set(D.seedtype1_sel_2,'enable','on');
set(D.seedtype1_edit_2,'enable','on');
set(D.seedtypes_2(2),'val',0);
set(D.seedtype2_edit_2,'enable','off');
set(D.seedtype2_sel_2,'enable','off');
set(D.seedtypes_2(3),'val',0);
set(D.seedtype3_edit_2,'enable','off');
set(D.seedtype3_sel_2,'enable','off');
set(D.seedtype3_matname_2,'enable','off');
set(D.seedtype3_matnameedit_2,'enable','off');
set(D.seedtypes_2(4),'val',0);
set(D.seedtype4_edit_2,'enable','off');
set(D.seedtype4_sel_2,'enable','off');
end
function ChangeToROI_2(varargin)
D = varargin{3};
set(D.seedtypes_2(1),'val',0);
set(D.seedtype1_sel_2,'enable','off');
set(D.seedtype1_edit_2,'enable','off');
set(D.seedtypes_2(2),'val',1);
set(D.seedtype2_edit_2,'enable','on');
set(D.seedtype2_sel_2,'enable','on');
set(D.seedtypes_2(3),'val',0);
set(D.seedtype3_edit_2,'enable','off');
set(D.seedtype3_sel_2,'enable','off');
set(D.seedtype3_matname_2,'enable','off');
set(D.seedtype3_matnameedit_2,'enable','off');
set(D.seedtypes_2(4),'val',0);
set(D.seedtype4_edit_2,'enable','off');
set(D.seedtype4_sel_2,'enable','off');
end
function ChangeToMAT_2(varargin)
D = varargin{3};
set(D.seedtypes_2(1),'val',0);
set(D.seedtype1_sel_2,'enable','off');
set(D.seedtype1_edit_2,'enable','off');
set(D.seedtypes_2(2),'val',0);
set(D.seedtype2_edit_2,'enable','off');
set(D.seedtype2_sel_2,'enable','off');
set(D.seedtypes_2(3),'val',1);
set(D.seedtype3_edit_2,'enable','on');
set(D.seedtype3_sel_2,'enable','on');
set(D.seedtype3_matname_2,'enable','on');
set(D.seedtype3_matnameedit_2,'enable','on');
set(D.seedtypes_2(4),'val',0);
set(D.seedtype4_edit_2,'enable','off');
set(D.seedtype4_sel_2,'enable','off');
end
function ChangeToTEXT_2(varargin)
D = varargin{3};
set(D.seedtypes_2(1),'val',0);
set(D.seedtype1_sel_2,'enable','off');
set(D.seedtype1_edit_2,'enable','off');
set(D.seedtypes_2(2),'val',0);
set(D.seedtype2_edit_2,'enable','off');
set(D.seedtype2_sel_2,'enable','off');
set(D.seedtypes_2(3),'val',0);
set(D.seedtype3_edit_2,'enable','off');
set(D.seedtype3_sel_2,'enable','off');
set(D.seedtype3_matname_2,'enable','off');
set(D.seedtype3_matnameedit_2,'enable','off');
set(D.seedtypes_2(4),'val',1);
set(D.seedtype4_edit_2,'enable','on');
set(D.seedtype4_sel_2,'enable','on');
end
function OutputSel_2(varargin)
D = varargin{3};
PG = uigetdir(pwd,'Output Directory Selection');
set(D.OutputEDIT_2,'string',PG)
end
function InputSel_2(varargin)
D = varargin{3};
PG = uigetdir(pwd,'Input Directory Selection');
set(D.InputEDIT_2,'string',PG)
end
function COVselp_2(varargin)
D = varargin{3};
val = get(D.COVTEXT_2,'value');
if val==1
    set(D.COVSel_2,'Enable','on');
    set(D.COVEDIT_2,'Enable','on');
else
    set(D.COVSel_2,'Enable','off');
    set(D.COVEDIT_2,'Enable','off');
end
end
function COVSel_2(varargin)
D = varargin{3};
[FileName,PathName,FilterIndex] = uigetfile('*.txt','COVtext selection');
PGtxt = fullfile(PathName,FileName);
set(D.COVEDIT_2,'string',PGtxt);
end