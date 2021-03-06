//display object

//QuangPNV: Áp dụng cho giờ - phút - giây
function LEN_HOUR(obj) {
    if (obj.value == "") {
        obj.value = '00';
    }
    else {
        var ID = obj.id;
        var L = "";
        L = document.getElementById(ID).value.length;
        if (L == '1') {
            document.getElementById(ID).value = "0" + document.getElementById(ID).value;
        }
    }
}

//TrangNT19: Áp dụng cho giờ - phút - giây - Cho phép rỗng
function LEN_HOUR_NULL(obj) {
    if (obj.value == "") {
        obj.value = '';
    }
    else {
        var ID = obj.id;
        var L = "";
        L = document.getElementById(ID).value.length;
        if (L == '1') {
            document.getElementById(ID).value = "0" + document.getElementById(ID).value;
        }
    }
}

//Check Hour:Minute
function CheckHour_New(obj)
{
    var strvalue = obj.value;
    var hh;
    var mm;
    var strChar = ";";
    
    if(strvalue != "")
    {
        var n = strvalue.length;
        if (n != 5)
        {
            GetAlertError(iTotal, DSAlert, "LD_TMS_0009");
            return false;
        }
        
        var strChar = strvalue.substring(2,3); 
        if(strChar != ":")
        {
            GetAlertError(iTotal, DSAlert, "LD_TMS_0009");
            return false;
        }
        
        var strHH = strvalue.substring(0,2);
        var strMM = strvalue.substring(3,5);
        
        if(isNaN(strHH) == true || isNaN(strMM) == true || strHH.length != 2 || strMM.length != 2)
        {
            GetAlertError(iTotal, DSAlert, "LD_TMS_0009");
            return false;
        }
    }
    return true;
}

//QuangPNV: Áp dụng convert theo kiểu số thực
function CheckFloat(GioPhut)
{
    var So = 0;
    if(GioPhut == '')   
        So = 0;
    else  
        So = parseFloat(GioPhut);    
        
    return Math.round(So * 100)/100;    
}

function ValidateNumeric() {
    var keyCode = window.event.keyCode;
    if (keyCode < 48 || keyCode > 57) {
        window.event.returnValue = false;
    }
    return;
}

function ValidateDecimal() {
    var keyCode = window.event.keyCode;
    if (keyCode == 46)
        return;
    if (keyCode < 48 || keyCode > 57) {
        window.event.returnValue = false;
    }
    return;
}

function collapse(obj, isDisplay) {
    if (isDisplay == null) {
        if (document.getElementById(obj).style.display == "none") {
            document.getElementById(obj).style.display = "";
        }
        else {
            document.getElementById(obj).style.display = "none";
        }
    }
    else {

        if (isDisplay == false) {
            document.getElementById(obj).style.display = "none";
        }
        else {
            document.getElementById(obj).style.display = "";
        }
    }
    return false;
}
//use in list form
function showReportOnly() {
    isDisplay = document.getElementById('_ctl0_chkShowGrid').checked;
    collapse('tdPages', isDisplay);
    collapse('trGrid', isDisplay);
    //if check multi sort
    if (isDisplay == true && document.getElementById('_ctl0_chkSort').checked == true)
        collapse('tdSort', isDisplay);
    else
        collapse('tdSort', !isDisplay);
}

var objShowDialog;
function ShowDialog(formName, width, height) {
    debugger;
    if (width == null || width < 100) width = Math.round((screen.width / 3) * 2) + 100; //900;
    if (width > screen.width) width = screen.width - 100; //900;

    if (height == null || height < 100) height = Math.round((screen.height / 3) * 2);
    if (height > screen.height) height = screen.height - 100; //900;

    l = 0;
    t = 0;
    //fix cho popup gui mail. Neu tu dong gui thi chuyen form ra khoi man hinh
    if (formName.indexOf('MdlSYS/Form/MailPopup.ascx') != -1
	    && formName.indexOf("AutoSend=1") != -1) {
        l = 1000;
        t = 1000;
        width = 0;
        height = 0;
    }

    var optOpen = 'Recipient';
    if (objShowDialog != null) {
        objShowDialog.close();
    }
    else {
        optOpen = '_blank';
    }

    objShowDialog = window.open(formName, optOpen, 'status=1,toolbar=0,scrollbars=1,resizable=1,alwaysRaised=Yes, top=' + t + ', left=' + l + ', width=' + width + ', height=' + height + ',1 ,align=center')
    objShowDialog.focus();
}
//HuyenHB
function ShowDialog_Center(formName, width, height, top, left) {
    if (width == null || width < 100) width = Math.round((screen.availWidth / 3) * 2) + 100; //900;
    if (width > screen.availWidth) width = screen.availWidth - 100; //900;

    if (height == null || height < 100) height = Math.round((screen.availHeight / 3) * 2);
    if (height > screen.height) height = screen.availHeight - 100; //900;
    var scrollW = $(document).width() - window.innerWidth;
    width = width - scrollW;
    l = 0;
    t = 0;
    l = (screen.availWidth / 2) - (width / 2);
    t = (screen.availHeight / 2) - (height / 2);
    top = CheckFloat(top);
    left = CheckFloat(left);
    t = t - top;
    l = l - left;
    height = height + t;

    //fix cho popup gui mail. Neu tu dong gui thi chuyen form ra khoi man hinh
    if (formName.indexOf('MdlSYS/Form/MailPopup.ascx') != -1
	    && formName.indexOf("AutoSend=1") != -1) {
        l = 1000;
        t = 1000;
        width = 0;
        height = 0;
    }

    var optOpen = 'Recipient';
    if (objShowDialog != null) {
        objShowDialog.close();
    }
    else {
        optOpen = '_blank';
    }

    objShowDialog = window.open(formName, optOpen, 'status=1,toolbar=0,scrollbars=1,resizable=1,alwaysRaised=Yes, top=' + t + ', left=' + l + ', width=' + width + ', height=' + height + ',1 ,align=center')
    objShowDialog.focus();
}
//QuangPNV: Mở popup 
function ShowPopup(formName,width,height,resizable)
{
    if (width == null || width < 100) width = Math.round((screen.width / 3) * 2) + 100; //900;
    if (width > screen.width) width = screen.width - 100; //900;

    if (height == null || height < 100) height = Math.round((screen.height / 3) * 2);
    if (height > screen.height) height = screen.height - 100; //900;

    l = 50;
    t = 50;
    
    objShowDialog = window.open(formName, 'Recipient', 'status=1,toolbar=0,scrollbars=1,resizable='+resizable+',alwaysRaised=Yes, top=' + t + ', left=' + l + ', width=' + width + ', height=' + height + ',1 ,align=center')
    objShowDialog.focus();        
}

function ShowPopup_Blank(formName,width,height)
{
    
    objShowDialog = window.open(formName, '_blank','scrollbars=1, width=' + width + ', height=' + height);
    objShowDialog.focus();        
}

function gshowModalDialog(formName, width, height) {
    if (width == null || width < 100) width = Math.round((screen.width / 3) * 2); //900;
    if (width > screen.width) width = screen.width - 100; //900;

    if (height == null || height < 100) height = Math.round((screen.height / 3) * 2);
    if (height > screen.height) height = screen.height - 100; //900;

    l = 0;
    t = 0;
    objShowDialog = window.showModalDialog(formName, 'Recipient', 'status=0;scroll=1;resizable=yes;alwaysRaised=Yes; dialogHeight=' + height + 'px; dialogWidth=' + width + 'px;align=center')
}

//Phim tat: keycode = 13 # phim enter
function KeyDownHandler(strButtonName) {
    // process only the Enter key
    if (event.keyCode == 13) {
        event.returnValue = false;
        event.cancel = true;
        document.getElementById().click(strButtonName);
    }
}

//Check grid checked
function GridCheck(GridName, BeginIndex, EndIndexExt, CtlCheckName) {
    var i;
    var count;
    var NoItemCheck;

    count = document.getElementById(GridName).rows.length;
    NoItemCheck = true;
    if (count > 1) {
        for (i = BeginIndex; i < document.getElementById(GridName).rows.length + EndIndexExt; i++) {
            if (document.getElementById(GridName + "__ctl" + i + "_" + CtlCheckName).checked == true) {
                NoItemCheck = false;
                break;
            }
        }
    }

    if (NoItemCheck) {
        return false;
    }
    else
        return true;
}

//DanL : 20120316 ==> Kiểm tra kiểu số nằm trong đoạn [x,y]
function checkNumeric_(field, MinValue, MaxValue) {
    if (field == null)
        return;
    if (field.value == "")
        return;

    var re;
    re = /,/g;

    var value = field.value.replace(re, '');
    re = /\s+/;
    value = value.replace(re, '');

    if (value == "") {
        field.value = "";
        return;
    }

    if (isNaN(value)) {
        GetAlertError(iTotal, DSAlert, "0013");
        field.value = "";
        field.focus();
        return false;
    }

    if (value < 0) {
        GetAlertError(iTotal, DSAlert, "00012");
        field.value = "";
        field.focus();
        return false;
    }

    if (value < MinValue) {
        GetAlertTextPopUp(GetAlertText(iTotal, DSAlert, '0059').replace('@', MinValue))
        field.value = "";
        field.focus();
        return false;
    }

    if (value > MaxValue) {
        GetAlertTextPopUp(GetAlertText(iTotal, DSAlert, '0054').replace('@', MaxValue))
        field.value = "";
        field.focus();
        return false;
    }
    FormatNumericWithSeparate(field);
}

//DanL : 20120827 ==> Bỏ chọn selecteditems cho các childcombo khi focus
function ClearRadComboSelection(sender, eventArgs) {
    try {
        sender.set_text("");
        sender.set_value("");
        sender.clearSelection();
    } catch (err) { }
}

//QuangPNV : 20120426 ==> Kiểm tra kiểu số nằm trong đoạn [x,y] cho phép kiểm tra số âm
function checkNumeric__(field, MinValue, MaxValue) {
    if (field == null)
        return;
    if (field.value == "")
        return;

    var re;
    re = /,/g;

    var value = field.value.replace(re, '');
    re = /\s+/;
    value = value.replace(re, '');

    if (value == "") {
        field.value = "";
        return;
    }

    if (isNaN(value)) {
        GetAlertError(iTotal, DSAlert, "0013");
        field.value = "";
        field.focus();
        return false;
    }

    if (value < MinValue) {
        GetAlertTextPopUp(GetAlertText(iTotal, DSAlert, '0059').replace('@', MinValue))
        field.value = "";
        field.focus();
        return false;
    }

    if (value > MaxValue) {
        GetAlertTextPopUp(GetAlertText(iTotal, DSAlert, '0054').replace('@', MaxValue))
        field.value = "";
        field.focus();
        return false;
    }
    FormatNumericWithSeparate(field);
}

function checkNumeric_returnNull(field,MaxValue)
{	
	if (field.value == "")
		return;		
	var re;   
	re = /,/g;
	var value = field.value.replace(re,'');
	if (isNaN(value))
	{
		GetAlertError(iTotal,DSAlert,"0013");
		field.value = "";
		field.focus();
		return false;
	}
	//tanldt: Test yeu cau 1 so cho phai lon hon 0
	if (value < 0)
	{		
		//alert("Must not a negative numeric or zero!");
		GetAlertError(iTotal,DSAlert,"0012");
		field.value = "";
		field.focus();
		return false;
	}if (value>MaxValue)
	{
		GetAlertTextPopUp(GetAlertText(iTotal,DSAlert,'0054').replace('@',MaxValue))
		
		field.value = "";
		field.focus();
		return false;
	}
	FormatNumericWithSeparate(field);
}

//TrangNT19: Điền nhanh cho control trên radgrid
//RadGridID: ID của radgrid (ko cần _ctl0_)
//chkSelectID: ID của Checkbox select (ko cần _ctl0_)
//ControlID: ID của control trên radgrid muốn được điền dữ liệu (ko cần _ctl0_)
//ControlType: Loại control; Hiện tại điền cho Radcombo,textbox. Sau này ai cần loại gì thêm thì thêm xử lý vào function này
//Value: Giá trị - Tham số này dùng cho cả combo và textbox
//Text: Text hiển thị. Hiện tại chỉ dùng cho Text hiển thị của Radcombo
function FillRadGrid(RadGridID,chkSelectID,ControlID,ControlType,Value,Text)
{
    var objTable = $find('_ctl0_'+RadGridID).get_masterTableView();
	var count = objTable.get_dataItems().length;
    if (count > 0) {
        for (i = 0; i < count; i++) {
            var row = objTable.get_dataItems()[i];
            var chk = row.findElement(chkSelectID);	
	        
            var Control = row.findElement(ControlID);
            try
            {
                if (chk.checked) 
                {
                    if (ControlType.toLowerCase()=="radcombo")
                    {
                        $find(row.findElement(ControlID).id).set_text(Text); 
	                    $find(row.findElement(ControlID).id).set_value(Value);
	                }
	                else if (ControlType.toLowerCase()=="textbox")
	                {
	                    row.findElement(ControlID).value = Value;
	                }
	                else
	                {
	                    row.findElement(ControlID).value = Value;
	                }
                }
            }
            catch(Error)
            {}
        }
    } 	
}

//TriTV 22-01-2018 
function RadGridIsNotNullAllControl_NoCheckBox(RadGridName, ControlName, MessCode) {
    var masterTable = $find(RadGridName).get_masterTableView();
    if (masterTable != null) {
        var count = masterTable.get_dataItems().length;
        if (count > 0) {
            var Obj;
            for (i = 0; i < count; i++) {
                var row = masterTable.get_dataItems()[i];
                Obj = row.findElement(ControlName);
                if (Obj.type != null) {
                    if (Obj.type.toLowerCase() == "text" || Obj.type.toLowerCase() == "textarea"
                        || Obj.type.toLowerCase() == "password") {
                        if (Obj.value == "") {
                            if (MessCode != null)
                                GetAlertError(iTotal, DSAlert, MessCode);
                            Obj.focus();
                            return false;
                        }
                    }
                    else if (Obj.type.tolowercase().match("select") != null) {
                        if (Obj.options[Obj.selectedindex].value == "") {
                            if (MessCode != null)
                                GetAlertError(iTotal, DSAlert, MessCode);
                            Obj.focus();
                            return false;
                        }
                    }
                }
                else {
                    Obj = $find(Obj.id);
                    if (Object.getTypeName(Obj).indexOf('RadComboBox') != -1) {
                        if (Obj.get_value() == "") {
                            // display error message
                            GetAlertError(iTotal, DSAlert, MessCode);
                            // set focus to input area of RadComboBox
                            var inputArea = Obj.get_inputDomElement();
                            inputArea.focus();
                            return false;
                        }
                    }
                }
            }
        }
    }
    return true;
}

//DanL : 12/07/2011
function RadGridIsNotNullAllControl(RadGridName, CheckboxName, ControlName) {
    var masterTable = $find(RadGridName).get_masterTableView();
    if (masterTable != null) {
        var count = masterTable.get_dataItems().length;
        if (count > 0) {
            var Obj;
            for (i = 0; i < count; i++) {
                var row = masterTable.get_dataItems()[i];
                var chkSelect = row.findElement(CheckboxName);
                if (chkSelect.disabled == false) {
                    if (chkSelect.checked == true) {
                        Obj = row.findElement(ControlName);
                        if (Obj.type != null) {
                            if (Obj.type.toLowerCase() == "text" || Obj.type.toLowerCase() == "textarea"
                                || Obj.type.toLowerCase() == "password") {
                                if (Obj.value == "") {
                                    if (MessCode != null)
                                        $.notify("Không được để trống trường này", {
                                            className: 'error',
                                            globalPosition: 'bottom right'
                                        });
                                    Obj.focus();
                                    return false;
                                }
                            }
                            else if (Obj.type.tolowercase().match("select") != null) {
                                if (Obj.options[Obj.selectedindex].value == "") {
                                    if (MessCode != null)
                                        $.notify("Không được để trống trường này", {
                                            className: 'error',
                                            globalPosition: 'bottom right'
                                        });
                                    Obj.focus();
                                    return false;
                                }
                            }
                        }
                        else {
                            Obj = $find(Obj.id);
                            if (Object.getTypeName(Obj).indexOf('RadComboBox') != -1) {
                                if (Obj.get_value() == "") {
                                    // display error message
                                    $.notify("Không được để trống trường này", {
                                        className: 'error',
                                        globalPosition: 'bottom right'
                                    });
                                    // set focus to input area of RadComboBox
                                    var inputArea = Obj.get_inputDomElement();
                                    inputArea.focus();
                                    return false;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return true;
}

//QuangPNV: Tạm thời chỉ áp dụng cho TextBox, TextArea
function RadGridIsNotNullAllControl_SetColor(RadGridName, CheckboxName, ControlName, MessCode) {
    var masterTable = $find(RadGridName).get_masterTableView();
    if (masterTable != null) {
        var count = masterTable.get_dataItems().length;
        if (count > 0) {
            var Obj;
            for (i = 0; i < count; i++) {
                var row = masterTable.get_dataItems()[i];
                var chkSelect = row.findElement(CheckboxName);
                if (chkSelect.disabled == false) {
                    if (chkSelect.checked == true) {
                        Obj = row.findElement(ControlName);
                        if (Obj.type != null) {
                            if (Obj.type.toLowerCase() == "text" || Obj.type.toLowerCase() == "textarea"
                                || Obj.type.toLowerCase() == "password") {
                                if (Obj.value == "") {
                                    if (MessCode != null)
                                        GetAlertError(iTotal, DSAlert, MessCode);
                                    SetColorControl(Obj,1);
                                    Obj.focus();
                                    return false;
                                }
                                else
                                {
                                    SetColorControl(Obj,2);
                                }
                            }                            
                        }                        
                    }
                }
            }
        }
    }
    return true;
}

function RadGridIsNotNullAllControl_NotFocus(RadGridName, CheckboxName, ControlName, MessCode) {
    var masterTable = $find(RadGridName).get_masterTableView();
    if (masterTable != null) {
        var count = masterTable.get_dataItems().length;
        if (count > 0) {
            var Obj;
            for (i = 0; i < count; i++) {
                var row = masterTable.get_dataItems()[i];
                var chkSelect = row.findElement(CheckboxName);
                if (chkSelect.disabled == false) {
                    if (chkSelect.checked == true) {
                        Obj = row.findElement(ControlName);
                        if (Obj.type != null) {
                            if (Obj.type.toLowerCase() == "text" || Obj.type.toLowerCase() == "textarea"
                                || Obj.type.toLowerCase() == "password") {
                                if (Obj.value == "") {
                                    if (MessCode != null)
                                        GetAlertError(iTotal, DSAlert, MessCode);
                                    return false;
                                }
                            }
                            else if (Obj.type.tolowercase().match("select") != null) {
                                if (Obj.options[Obj.selectedindex].value == "") {
                                    if (MessCode != null)
                                        GetAlertError(iTotal, DSAlert, MessCode);
                                    return false;
                                }
                            }
                        }
                        else {
                            Obj = $find(Obj.id);
                            if (Object.getTypeName(Obj).indexOf('RadComboBox') != -1) {
                                if (Obj.get_value() == "") {
                                    // display error message
                                    GetAlertError(iTotal, DSAlert, MessCode);
                                    return false;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return true;
}

//Kiểm tra giá trị rỗng của 1 control nhưng focus() vào 1 control khác
function RadGridIsNotNullAllControl_(RadGridName, CheckboxName, ControlName, FocusControlName, MessCode) {
    var masterTable = $find(RadGridName).get_masterTableView();
    if (masterTable != null) {
        var count = masterTable.get_dataItems().length;
        if (count > 0) {
            var Obj;
            for (i = 0; i < count; i++) {
                var row = masterTable.get_dataItems()[i];
                var chkSelect = row.findElement(CheckboxName);
                if (chkSelect.disabled == false) {
                    if (chkSelect.checked == true) {
                        Obj = row.findElement(ControlName);
                        if (Obj.type != null) {
                            if (Obj.type.toLowerCase() == "text" || Obj.type.toLowerCase() == "textarea") {
                                if (Obj.value == "") {
                                    if (MessCode != null)
                                        GetAlertError(iTotal, DSAlert, MessCode);
                                    Obj = row.findElement(FocusControlName);
                                    Obj.focus();
                                    return false;
                                }
                            }
                            else if (Obj.type.tolowercase().match("select") != null) {
                                if (Obj.options[Obj.selectedindex].value == "") {
                                    if (MessCode != null)
                                        GetAlertError(iTotal, DSAlert, MessCode);
                                    Obj = row.findElement(FocusControlName);
                                    Obj.focus();
                                    return false;
                                }
                            }
                        }
                        else {
                            Obj = $find(Obj.id);
                            if (Object.getTypeName(Obj).indexOf('RadComboBox') != -1) {
                                if (Obj.get_value() == "") {
                                    // display error message
                                    GetAlertError(iTotal, DSAlert, MessCode);
                                    // set focus to input area of RadComboBox
                                    Obj = row.findElement(FocusControlName);
                                    Obj.focus();
                                    return false;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return true;
}

//QuangPNV: 2013-08-06: Mảng các Control trên 1 dòng của lưới cần kiểm tra rồng
//Kiểm tra các TextBox không được bỏ trống
function RadGridIsNotNullAllControl_Array(RadGridName, CheckboxName, ControlName, MessCode) {        
    var masterTable = $find(RadGridName).get_masterTableView();
    if (masterTable != null) {
        var count = masterTable.get_dataItems().length;
        if (count > 0) {
            var Obj;
            for (i = 0; i < count; i++) {
                var row = masterTable.get_dataItems()[i];
                var chkSelect = row.findElement(CheckboxName);                    
                if (chkSelect.disabled == false) {
                    if (chkSelect.checked == true) {                            
                        for (i = 0; i < ControlName.length; i++) {                                
                            if (row.findElement(ControlName[i]) != null) {
                                Obj = row.findElement(ControlName[i]);
                                if (Obj.type != null) {                                        
                                    if (Obj.type.toLowerCase() == "text" || Obj.type.toLowerCase() == "textarea"
                                        || Obj.type.toLowerCase() == "password") {                                                                                          
                                        if (Obj.value == "") {                                            
                                            if (MessCode != null)
                                                GetAlertError(iTotal, DSAlert, MessCode);
                                            Obj.focus();
                                            return false;
                                        }
                                    }
                                    else if (Obj.type.tolowercase().match("select") != null) {
                                        if (Obj.options[Obj.selectedindex].value == "") {
                                            if (MessCode != null)
                                                GetAlertError(iTotal, DSAlert, MessCode);
                                            Obj.focus();
                                            return false;
                                        }
                                    }
                                }
                                else {
                                    Obj = $find(Obj.id);
                                    if (Object.getTypeName(Obj).indexOf('RadComboBox') != -1) {
                                        if (Obj.get_value() == "") {
                                            // display error message
                                            GetAlertError(iTotal, DSAlert, MessCode);
                                            // set focus to input area of RadComboBox
                                            var inputArea = Obj.get_inputDomElement();
                                            inputArea.focus();
                                            return false;
                                        }
                                    }
                                } 
                            }
                        }
                    }
                }
            }
        }
    }
    return true;
}
    
//QuangPNV : 13/07/2011
//Ham so sanh tu thang hieu luc -> den thang hieu luc
//ControlName1 : Text box tu thang
//ControlName2 : Text box den thang
//Boolean1 : False : Cho nhap rong tu thang  - True: Khong cho nhap rong
//Boolean2 : False : Cho nhap rong den thang - True: Khong cho nhap rong
function RadGridFromSmallOrEqualToMonth(RadGridName, CheckboxName, ControlName1, ControlName2, MessCode, Boolean1, Boolean2) {
    var masterTable = $find(RadGridName).get_masterTableView();
    if (masterTable != null) {
        var count = masterTable.get_dataItems().length;
        if (count > 0) {
            var ObjTuThang;
            var ObjDenThang;
            var BolTuThang = Boolean1;
            var BolDenThang = Boolean2;
            for (i = 0; i < count; i++) {
                var row = masterTable.get_dataItems()[i];
                var chkSelect = row.findElement(CheckboxName);
                if (chkSelect.disabled == false) {
                    if (chkSelect.checked == true) {
                        ObjTuThang = row.findElement(ControlName1);
                        ObjDenThang = row.findElement(ControlName2);

                        if (BolTuThang == true) {
                            if (ObjTuThang.type != null) {
                                if (ObjTuThang.type.toLowerCase() == "text") {
                                    if (ObjTuThang.value == "") {
                                        if (MessCode != null)
                                            GetAlertError(iTotal, DSAlert, MessCode);
                                        ObjTuThang.focus();
                                        return false;
                                    }
                                }
                            }
                        }

                        if (BolDenThang == true) {
                            if (ObjDenThang.type != null) {
                                if (ObjDenThang.type.toLowerCase() == "text") {
                                    if (ObjDenThang.value == "") {
                                        if (MessCode != null)
                                            GetAlertError(iTotal, DSAlert, MessCode);
                                        ObjDenThang.focus();
                                        return false;
                                    }
                                }
                            }
                        }

                        if (ObjTuThang.value != "" && ObjDenThang.value != "") {
                            if (FromSmallOrEqualToMonth(ObjTuThang, ObjDenThang) == false) {
                                GetAlertError(iTotal, DSAlert, "0007");
                                ObjTuThang.focus();
                                return false;
                            }
                        }
                    }
                }
            }
        }
    }
    return true;
}

//QuangPNV : 18/08/2011
//Ham so sanh tu ngay hieu luc -> den ngay hieu luc
//ControlName1 : Text box tu ngay
//ControlName2 : Text box den ngay
//Boolean1 : False : Cho nhap rong tu ngay  - True: Khong cho nhap rong
//Boolean2 : False : Cho nhap rong den ngay - True: Khong cho nhap rong
function RadGridFromSmallOrEqualToDate(RadGridName, CheckboxName, ControlName1, ControlName2, MessCode, Boolean1, Boolean2) {
    var masterTable = $find(RadGridName).get_masterTableView();
    if (masterTable != null) {
        var count = masterTable.get_dataItems().length;
        if (count > 0) {
            var ObjTuNgay;
            var ObjDenNgay;
            var BolTuNgay = Boolean1;
            var BolDenNgay = Boolean2;
            for (i = 0; i < count; i++) {
                var row = masterTable.get_dataItems()[i];
                var chkSelect = row.findElement(CheckboxName);
                if (chkSelect.disabled == false) {
                    if (chkSelect.checked == true) {
                        ObjTuNgay = row.findElement(ControlName1);
                        ObjDenNgay = row.findElement(ControlName2);

                        if (BolTuNgay == true) {
                            if (ObjTuNgay.type != null) {
                                if (ObjTuNgay.type.toLowerCase() == "text") {
                                    if (ObjTuNgay.value == "") {
                                        if (MessCode != null)
                                            GetAlertError(iTotal, DSAlert, MessCode);
                                        ObjTuNgay.focus();
                                        return false;
                                    }
                                }
                            }
                        }

                        if (BolDenNgay == true) {
                            if (ObjDenNgay.type != null) {
                                if (ObjDenNgay.type.toLowerCase() == "text") {
                                    if (ObjDenNgay.value == "") {
                                        if (MessCode != null)
                                            GetAlertError(iTotal, DSAlert, MessCode);
                                        ObjDenNgay.focus();
                                        return false;
                                    }
                                }
                            }
                        }

                        if (ObjTuNgay.value != "" && ObjDenNgay.value != "") {
                            if (FromSmallOrEqualToDate(ObjTuNgay, ObjDenNgay) == false) {
                                GetAlertError(iTotal, DSAlert, MessCode);
                                ObjDenNgay.focus();
                                return false;
                            }
                        }
                    }
                }
            }
        }
    }
    return true;
}

//QuangPNV : 04/09/2012
//Ham so sanh tu ngay hieu luc -> den ngay hieu luc
//ControlName1 : Text box tu ngay
//ControlName2 : Text box den ngay
//Boolean1 : False : Cho nhap rong tu ngay  - True: Khong cho nhap rong
//Boolean2 : False : Cho nhap rong den ngay - True: Khong cho nhap rong
function RadGridFromSmallOrEqualToDate2(RadGridName, CheckboxName, ControlName1, ControlName2, Boolean1, Boolean2) {
    var masterTable = $find(RadGridName).get_masterTableView();
    if (masterTable != null) {
        var count = masterTable.get_dataItems().length;
        if (count > 0) {
            var ObjTuNgay;
            var ObjDenNgay;
            var BolTuNgay = Boolean1;
            var BolDenNgay = Boolean2;
            for (i = 0; i < count; i++) {
                var row = masterTable.get_dataItems()[i];
                var chkSelect = row.findElement(CheckboxName);
                if (chkSelect.disabled == false) {
                    if (chkSelect.checked == true) {
                        ObjTuNgay = row.findElement(ControlName1);
                        ObjDenNgay = row.findElement(ControlName2);

                        if (BolTuNgay == true) {
                            if (ObjTuNgay.type != null) {
                                if (ObjTuNgay.type.toLowerCase() == "text") {
                                    if (ObjTuNgay.value == "") {
                                        GetAlertError(iTotal, DSAlert, '0003');
                                        ObjTuNgay.focus();
                                        return false;
                                    }
                                }
                            }
                        }

                        if (BolDenNgay == true) {
                            if (ObjDenNgay.type != null) {
                                if (ObjDenNgay.type.toLowerCase() == "text") {
                                    if (ObjDenNgay.value == "") {
                                        GetAlertError(iTotal, DSAlert, '0003');
                                        ObjDenNgay.focus();
                                        return false;
                                    }
                                }
                            }
                        }

                        if (ObjTuNgay.value != "" && ObjDenNgay.value != "") {
                            if (FromSmallOrEqualToDate(ObjTuNgay, ObjDenNgay) == false) {
                                GetAlertError(iTotal, DSAlert, '0007');
                                ObjDenNgay.focus();
                                return false;
                            }
                        }
                    }
                }
            }
        }
    }
    return true;
}

//TriTV : 23/01/2018
//Ham so sanh tu ngay hieu luc -> den ngay hieu luc
//ControlName1 : Text box tu ngay
//ControlName2 : Text box den ngay
//Boolean1 : False : Cho nhap rong tu ngay  - True: Khong cho nhap rong
//Boolean2 : False : Cho nhap rong den ngay - True: Khong cho nhap rong
function RadGridFromSmallOrEqualToDate_NoCheckBox(RadGridName, ControlName1, ControlName2, MessCode, Boolean1, Boolean2) {
    var masterTable = $find(RadGridName).get_masterTableView();
    if (masterTable != null) {
        var count = masterTable.get_dataItems().length;
        if (count > 0) {
            var ObjTuNgay;
            var ObjDenNgay;
            var BolTuNgay = Boolean1;
            var BolDenNgay = Boolean2;
            for (i = 0; i < count; i++) {
                var row = masterTable.get_dataItems()[i];

                ObjTuNgay = row.findElement(ControlName1);
                ObjDenNgay = row.findElement(ControlName2);

                if (BolTuNgay == true) {
                    if (ObjTuNgay.type != null) {
                        if (ObjTuNgay.type.toLowerCase() == "text") {
                            if (ObjTuNgay.value == "") {
                                if (MessCode != null)
                                    GetAlertError(iTotal, DSAlert, MessCode);
                                ObjTuNgay.focus();
                                return false;
                            }
                        }
                    }
                }

                if (BolDenNgay == true) {
                    if (ObjDenNgay.type != null) {
                        if (ObjDenNgay.type.toLowerCase() == "text") {
                            if (ObjDenNgay.value == "") {
                                if (MessCode != null)
                                    GetAlertError(iTotal, DSAlert, MessCode);
                                ObjDenNgay.focus();
                                return false;
                            }
                        }
                    }
                }

                if (ObjTuNgay.value != "" && ObjDenNgay.value != "") {
                    if (FromSmallOrEqualToDate(ObjTuNgay, ObjDenNgay) == false) {
                        GetAlertError(iTotal, DSAlert, MessCode);
                        ObjDenNgay.focus();
                        return false;
                    }
                }
            }
        }
    }

    return true;
}

//QuangPNV : 16/09/2011
//Ham dien nhanh tu text box A -> sang text box B
//ControlNameA : Text box A
//ControlNameB : Text box B
//BooleanA : False : Cho nhap rong - True: Khong cho nhap rong
//BooleanB : False : Cho nhap rong - True: Khong cho nhap rong
function RadGridFillTextBox(RadGridName, CheckboxName, ControlNameA, ControlNameB, BooleanB) {
    var masterTable = $find(RadGridName).get_masterTableView();
    if (masterTable != null) {
        var count = masterTable.get_dataItems().length;
        if (count > 0) {
            var ObjTextBoxA;
            var ObjTextBoxB;
            var BolTextBoxB = BooleanB;
            for (i = 0; i < count; i++) {
                var row = masterTable.get_dataItems()[i];
                var chkSelect = row.findElement(CheckboxName);
                if (chkSelect.disabled == false) {
                    if (chkSelect.checked == true) {
                        ObjTextBoxA = row.findElement(ControlNameA);
                        ObjTextBoxB = row.findElement(ControlNameB);

                        if (ObjTextBoxA.type != null) {
                            if (ObjTextBoxA.type.toLowerCase() == "text") {
                                if (BolTextBoxB == true) {
                                    ObjTextBoxB.value = ObjTextBoxA.value
                                }
                                else {
                                    if (ObjTextBoxA.value != "") {
                                        ObjTextBoxB.value = ObjTextBoxA.value
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return false;
}

//Check grid checked cho radgrid
function GridCheck_RadGrid(GridName, CtlCheckName) {
    if (RowCheck_RadGrid(GridName.replace("_ctl0_", "")) == false) return false;
    var i;
    var count;
    var NoItemCheck;
    var masterTable = $find(GridName).get_masterTableView();
    if (masterTable != null) {
        count = masterTable.get_dataItems().length;
        NoItemCheck = true;
        if (count > 0) {
            for (i = 0; i < count; i++) {
                var row = masterTable.get_dataItems()[i];
                var chkSelect = row.findElement(CtlCheckName);
                if(chkSelect != null)
                {
                    if (chkSelect.checked == true) {
                        NoItemCheck = false;
                        break;
                    }
                }
            }
        }
    }

    if (NoItemCheck) {
        return false;
    }
    else
        return true;
}

//kiểm tra số dòng trên lưới > 1 không?
function RowCheck_RadGrid(GridName) {
    var Table = document.getElementById('_ctl0_' + GridName + 'ctl0');
    if (Table == null)
        return false;
    if (Table.rows.length - 1 < 0) {
        return false;
    }
}

function RowCheck_RadGrid_MasterTable(GridName) {
    var masterTable = $find("_ctl0_" + GridName).get_masterTableView();
    if (masterTable.get_dataItems().length > 0)
        return true;
    return false;
}

//BaoNTQ_26/06/2014
function GridCheck_RadGrid_New(GridName, CtlCheckName) {
    var i;
    var count;
    var NoItemCheck;
    var masterTable = $find(GridName.id).get_masterTableView();
    if (masterTable != null) {
        count = masterTable.get_dataItems().length;
        NoItemCheck = true;
        if (count > 0) 
        {
            for (i = 0; i < count; i++) {
                var row = masterTable.get_dataItems()[i];
                var chkSelect = row.findElement(CtlCheckName);
                if(chkSelect != null)
                {
                    if (chkSelect.checked == true) {
                        NoItemCheck = false;
                        break;
                    }
                }
            }
        }
        else
            return false;
    }

    if (NoItemCheck) {
        return false;
    }
    else
        return true;
}

//Check grid checked cho radgrid
function GridReadOnly_RadGrid(GridName, CtlCheckName) {
    var i;
    var count;
    var NoItemCheck;
    var masterTable = $find('_ctl0_' + GridName).get_masterTableView();
    if (masterTable != null) {
        count = masterTable.get_dataItems().length;
        NoItemCheck = true;
        if (count > 0) {
            for (i = 0; i < count; i++) {
                var row = masterTable.get_dataItems()[i];
                
                //QuangPNV: Bổ sung Try catch cho trường hợp nếu trên lưới cột đó bị Visible thì không thể ReadOnly được
                try{                    
                    var obj = row.findElement(CtlCheckName);                    
                    obj.readOnly = true;
                }catch(Error){}
            }
        }
    }

    return true;
}

//Check grid checked cho radgrid
function GridReadOnly_RadGrid_Center(GridName, CtlCheckName) {
    var i;
    var count;
    var NoItemCheck;
    var masterTable = $find('_ctl0_' + GridName).get_masterTableView();
    if (masterTable != null) {
        count = masterTable.get_dataItems().length;
        NoItemCheck = true;
        if (count > 0) {
            for (i = 0; i < count; i++) {
                var row = masterTable.get_dataItems()[i];
                
                //QuangPNV: Bổ sung Try catch cho trường hợp nếu trên lưới cột đó bị Visible thì không thể ReadOnly được
                try{                    
                    var obj = row.findElement(CtlCheckName);                    
                    obj.readOnly = true;
                    obj.className = 'InputCenterReadOnly';
                }catch(Error){}
            }
        }
    }

    return true;
}

//QuangPNV: Cho phép ReadOnlny chuỗi các đối tượng
//GridName: Tên lưới RadGrid
//ArrayCtlCheckName: Mảng Control trên lưới
//isCenter: Giá trị trên TextBox có nằm giữa hay không ?
//Param1, Param2, Param3, Param4, Param5: Chưa được dùng, bổ sung thêm cho 1 số cấu hình sau này
function GridReadOnly_RadGrid_List (GridName,ArrayCtlCheckName, isCenter, Param1, Param2, Param3, Param4, Param5) {
    if(ArrayCtlCheckName.length > 0)
    {
        var i;
        var count;
        var NoItemCheck;
        var masterTable = $find('_ctl0_' + GridName).get_masterTableView();
        if (masterTable != null) {
            count = masterTable.get_dataItems().length;
            NoItemCheck = true;
            if (count > 0) {
                for (i = 0; i < count; i++) {
                    var row = masterTable.get_dataItems()[i];
                    //Chạy vòng lặp For cho các control truyền vào
                    for (j = 0; j < ArrayCtlCheckName.length; j++) {
                        //RadCombo
                        try {
                            if ($find(row.findElement(ArrayCtlCheckName[j]).id) != null && row.findElement(ArrayCtlCheckName[j]).type != "text")
                                $find(row.findElement(ArrayCtlCheckName[j]).id).disable();
                        }
                        catch (error) { }

                        if (row.findElement(ArrayCtlCheckName[j]) != null) {
                            row.findElement(ArrayCtlCheckName[j]).readOnly = true;
                            if(isCenter == true)
                                row.findElement(ArrayCtlCheckName[j]).className = 'InputCenterReadOnly';
                        }
                    }
                }
            }
        }
    }
    return true;
}

function GridReadOnly(GridName, BeginIndex, EndIndexExt, CtlCheckName, IsReadOnly) {
    var i;
    var count;
    count = document.getElementById(GridName).rows.length;
    NoItemCheck = true;
    if (count > 1) {
        for (i = BeginIndex; i < document.getElementById(GridName).rows.length + EndIndexExt; i++) {
            document.getElementById(GridName + "__ctl" + i + "_" + CtlCheckName).readOnly = IsReadOnly;
        }
    }
    return true;
}

function GridDisable(GridName, BeginIndex, EndIndexExt, CtlCheckName, IsDisable) {
    var i;
    var count;
    count = document.getElementById(GridName).rows.length;
    NoItemCheck = true;
    if (count > 1) {
        for (i = BeginIndex; i < document.getElementById(GridName).rows.length + EndIndexExt; i++) {
            document.getElementById(GridName + "__ctl" + i + "_" + CtlCheckName).disabled = IsDisable;
        }
    }
    return true;
}

//Check grid checked
function GridNoHeaderCheck(GridName, BeginIndex, EndIndexExt, CtlCheckName) {
    var i;
    var count;
    var NoItemCheck;

    count = document.getElementById(GridName).rows.length;
    NoItemCheck = true;
    if (count > 0) {
        for (i = BeginIndex; i < document.getElementById(GridName).rows.length + EndIndexExt; i++) {
            if (document.getElementById(GridName + "__ctl" + i + "_" + CtlCheckName).checked == true) {
                NoItemCheck = false;
                break;
            }
        }
    }

    if (NoItemCheck) {
        return false;
    }
    else
        return true;
}

//CheckAll
//Ctl: checkbox checkAll, GridCtl: Checkbox cua grid
function CheckAll(Ctl, GridName, BeginIndex, EndIndexExt, GridCtl) {
    var value = document.getElementById(Ctl).checked;
    var i;
    if (document.getElementById(GridName) != null) {
        count = document.getElementById(GridName).rows.length;
        
        if (count > 1) {
            for (i = BeginIndex; i < document.getElementById(GridName).rows.length + EndIndexExt; i++) {
                if (document.all && !document.getElementByID) {
                    if (document.Form1(GridName + "__ctl" + i + "_" + GridCtl).disabled != true)
                        document.Form1(GridName + "__ctl" + i + "_" + GridCtl).checked = value;
                }
                else {
                    if (!document.getElementById(GridName + "__ctl" + i + "_" + GridCtl).disabled)
                        document.getElementById(GridName + "__ctl" + i + "_" + GridCtl).checked = value;
                }
                
//                if (document.Form1(GridName + "__ctl" + i + "_" + GridCtl).disabled != true)
//                    document.Form1(GridName + "__ctl" + i + "_" + GridCtl).checked = value;
            }
        }
    }
}

//Ctl: checkbox checkAll, GridCtl: Checkbox cua grid
function CheckAll_RadGrid(Ctl, GridName, GridCtl) {
    try {
        var value = document.getElementById(Ctl).checked;
        var i;
        var masterTable = $find(GridName).get_masterTableView();
        if (masterTable != null) {
            count = masterTable.get_dataItems().length;
            if (count > 0) {
                for (i = 0; i < count; i++) {
                    var row = masterTable.get_dataItems()[i];
                    //QuangPNV: Phải kiểm tra đối tượng có tồn tại hay không ?
                    if(row != null){                    
                        var chkSelect = row.findElement(GridCtl);
                        //QuangPNV: Phải kiểm tra đối tượng có tồn tại hay không ?
                        if (chkSelect != null){                        
                            if (chkSelect.disabled == false)
                                chkSelect.checked = value;
                        }
                    }
                }
            }
        }
    }
    catch (Error)
    { }
}

//BaoNTQ
function CheckAll_RadGrid_New(Ctl, GridName, GridCtl) {
    try {
        var Ctl_ID = Ctl.id;
        var GridID = Ctl_ID.replace(GridName, '@');
        var index_ = GridID.indexOf('@');
        GridID = GridID.substring(0, index_);
        GridID = GridID + GridName;
        
        var value = Ctl.checked;
        var i;
        var masterTable = $find(GridID).get_masterTableView();
        if (masterTable != null) {
            count = masterTable.get_dataItems().length;
            if (count > 0) {
                for (i = 0; i < count; i++) {
                    var row = masterTable.get_dataItems()[i];
                    var chkSelect = row.findElement(GridCtl);
                    if (chkSelect.disabled == false)
                        chkSelect.checked = value;
                }
            }
        }
    }
    catch (Error)
    { }
}

//TrangNT: Xóa hết dữ liệu trên lưới
function Clear_RadGrid(GridName) {
    var Table = document.getElementById('_ctl0_' + GridName + 'ctl0');
    if (Table == null)
        return false;
    //Chừa lại 1 dòng trống --> Để vẫn scrool được khi các cột nhiều quá
    var NumOfCells = Table.rows[0].cells.length;
    var RowIns = Table.insertRow(0);
    var CellIns = RowIns.insertCell(0);
    CellIns.colspan=NumOfCells;
    for (i = Table.rows.length - 1; i >= 1; i--) {
        Table.deleteRow(i);
    }
}

//TrangNT: Xóa hết dữ liệu trên lưới asp
function Clear_Grid(GridName) {
    var Table = document.getElementById('_ctl0_' + GridName);
    if (Table == null)
        return false;
    for (i = Table.rows.length - 1; i > 0; i--) {
        Table.deleteRow(i);
    }
    if (document.getElementById('_ctl0_uctrlColumns_lblTotalRow') != null)
        document.getElementById('_ctl0_uctrlColumns_lblTotalRow').innerHTML = "0";
}

//TrangNT:
//var tabs = getElementsByClassName(document.body,'tab');
function getElementsByClassName1(node, classname) {
    var a = [];
    var re = new RegExp('(^| )'+classname+'( |$)');
    var els = node.getElementsByTagName("*");
    for(var i=0,j=els.length; i<j; i++)
        if(re.test(els[i].className))a.push(els[i]);
    return a;
}


//TrangNT: tìm control theo "SearchBy" và ẩn hoặc hiện
function displayControlByHandle(searchBy, ListHandle, sdisplay,buff1,buff2,buff3,buff4,buff5) {
    var strHandle = ListHandle.split('$');

    if (strHandle.length > 0) {
        for (var i = 0; i < strHandle.length; i++) {
            var ctls;
            if(strHandle[i]=="")
                continue;
            if (searchBy.toUpperCase() == "CLASSNAME")
                ctls = getElementsByClassName1(document.body,strHandle[i]);
                //ctls = document.querySelectorAll('.'+strHandle[i]);
            else if (searchBy.toUpperCase() == "NAME")
                ctls = document.getElementsByName(strHandle[i]);

            if (ctls.length > 0) {
                for (var j = 0; j < ctls.length; j++) {
                    try {
                        ctls[j].style.display = sdisplay;
                    }
                    catch (error) { }
                }
            }
        }
    }
}

//CheckAll
//Ctl: checkbox checkAll, GridCtl: Checkbox cua grid
function CheckAllWithClick(Ctl, GridName, BeginIndex, EndIndexExt, GridCtl) {
    var value = document.getElementById(Ctl).checked;
    var i;
    if (document.getElementById(GridName) != null) {
        count = document.getElementById(GridName).rows.length;
        if (count > 1) {
            for (i = BeginIndex; i < document.getElementById(GridName).rows.length + EndIndexExt; i++) {
                if (document.Form1(GridName + "__ctl" + i + "_" + GridCtl).disabled != true) {
                    document.Form1(GridName + "__ctl" + i + "_" + GridCtl).click();
                    document.Form1(GridName + "__ctl" + i + "_" + GridCtl).checked = value;
                }
            }
        }
    }
}

//Loai bo khoang trang
function trim(txt) {
    txt = txt.replace(/^(\s)+/, '');
    txt = txt.replace(/(\s)+$/, '');
    return txt;
}

//Ham goi su kien cua mot nut khac khi bam phim enter
function checkKey(strBtnClick) {
    if (window.event.keyCode == 13) {
        if (document.getElementById(strBtnClick) != null)
            document.getElementById(strBtnClick).click();
        event.returnValue = false;
        event.cancel = true;
    }
}

function checkKey(strBtnClick, ef) {

    var code = (window.event) ? event.keyCode : ef.which;
    //if (window.event.keyCode == 13) {
    if (code == 13) {

        if (document.getElementById(strBtnClick) != null)
            if (window.event) {
            document.getElementById(strBtnClick).click();
            event.returnValue = false;
            event.cancel = true;
        }
        else {
            var elem = document.getElementById(strBtnClick);

            if (typeof elem.onclick == "function") {
                elem.onclick.apply(elem);
            }
        }
    }
}

function checkBit(field) {
    if (field.value != 0 && field.value != 1) {
        GetAlertError(iTotal, DSAlert, "0051");
        field.value = "";
        field.focus();
        return false;
    }
}
function CheckOT(field) {
    if (field.value == "")
        return;
    var re;
    re = /,/g;
    var value = field.value.replace(re, '');
    if (isNaN(value)) {
        GetAlertError(iTotal, DSAlert, "0013");
        field.value = "";
        field.focus();
        return;
    }
    //tanldt: Test yeu cau 1 so cho phai lon hon 0
    if (value < 0) {
        //alert("Must not a negative numeric or zero!");
        GetAlertError(iTotal, DSAlert, "0012");
        field.value = "";
        field.focus();
        return;
    }
    if (field.value < 1 || field.value > 60) {
        GetAlertError(iTotal, DSAlert, "TSPR_0004");
        field.value = "";
        field.focus();
        return false;
    }
    FormatNumericWithSeparate(field);
}
function checkScanCheck(field) {
    if (field.value == "")
        return;
    var re;
    re = /,/g;
    var value = field.value.replace(re, '');
    if (isNaN(value)) {
        GetAlertError(iTotal, DSAlert, "0013");
        field.value = "";
        field.focus();
        return;
    }
    //tanldt: Test yeu cau 1 so cho phai lon hon 0
    if (value < 0) {
        //alert("Must not a negative numeric or zero!");
        GetAlertError(iTotal, DSAlert, "0012");
        field.value = "";
        field.focus();
        return;
    }
    if (field.value != 2 && field.value != 4 && field.value != 6) {
        GetAlertError(iTotal, DSAlert, "TSPR_0001");
        field.value = "";
        field.focus();
        return false;
    }
    FormatNumericWithSeparate(field);
}
function checkStandardDays(field) {
    if (field.value == "")
        return;
    var re;
    re = /,/g;
    var value = field.value.replace(re, '');
    if (isNaN(value)) {
        GetAlertError(iTotal, DSAlert, "0013");
        field.value = "";
        field.focus();
        return;
    }
    //tanldt: Test yeu cau 1 so cho phai lon hon 0
    if (value < 0) {
        //alert("Must not a negative numeric or zero!");
        GetAlertError(iTotal, DSAlert, "0012");
        field.value = "";
        field.focus();
        return;
    }
    if (field.value < 1 || field.value > 30) {
        GetAlertError(iTotal, DSAlert, "TSPR_0002");
        field.value = "";
        field.focus();
        return false;
    }
    FormatNumericWithSeparate(field);
}
function checkHourday(field) {
    if (field == null)
        return;
    if (field.value == "")
        return;
    var re;
    re = /,/g;
    var value = field.value.replace(re, '');
    if (isNaN(value)) {
        GetAlertError(iTotal, DSAlert, "0013");
        field.value = "";
        field.focus();
        return;
    }
    //tanldt: Test yeu cau 1 so cho phai lon hon 0
    if (value < 0) {
        //alert("Must not a negative numeric or zero!");
        GetAlertError(iTotal, DSAlert, "0012");
        field.value = "";
        field.focus();
        return;
    }
    if (field.value < 1 || field.value > 24) {
        GetAlertError(iTotal, DSAlert, "TSPR_0003");
        field.value = "";
        field.focus();
        return false;
    }
    FormatNumericWithSeparate(field);
}
//Kiem tra kieu so
function checkNumeric(field, MaxValue) {
    if (field == null)
        return;
    if (field.value == "")
        return;
    var re;
    re = /,/g;
    var value = field.value.replace(re, '');
    re = /\s+/;
    value = value.replace(re, '');
    if (value == "") {
        field.value = "";
        return;
    }

    if (isNaN(value)) {
        $.notify("Vui lòng nhập giá trị số", {
            className: 'error',
            globalPosition: 'bottom right'
        });//quanbm2 yeu cau 15/07/2014
        field.value = "";
        setTimeout(function () { field.focus(); }, 0);   //quanbm2 yeu cau 15/07/2014
        return false;
    }
    //tanldt: Test yeu cau 1 so cho phai lon hon 0
    if (value < 0) {
        //alert("Must not a negative numeric or zero!");
        $.notify("Vui lòng nhập số lớn hơn hoặc bằng 0 !", {
            className: 'error',
            globalPosition: 'bottom right'
        });
        field.value = "";
        setTimeout(function () { field.focus(); }, 0);
        return false;
    } if (value > MaxValue) {
        $.notify("Giá trị nhập vào không được lớn hơn " + MaxValue, {
            className: 'error',
            globalPosition: 'bottom right'
        });
        field.value = "";
        //alert('');
        setTimeout(function () { field.focus(); }, 0);
        return false;
    }
    FormatNumericWithSeparate(field);
}

//quanbm2 yeu cau 15/07/2014
function checkNumericException(field, MaxValue) {

    if (field == null)
        return;
    if (field.value == "")
        return;
    var re;
    re = /,/g;
    var value = field.value.replace(re, '');
    re = /\s+/;
    value = value.replace(re, '');
    if (value == "") {
        field.value = "";
        return;
    }

    if (isNaN(value)) {
        //GetAlertError(iTotal, DSAlert, "0013"); quanbm2 yeu cau 15/07/2014
        field.value = "";
        //field.focus();   quanbm2 yeu cau 15/07/2014
        return false;
    }
    //tanldt: Test yeu cau 1 so cho phai lon hon 0
    if (value < 0) {
        //alert("Must not a negative numeric or zero!");
        GetAlertError(iTotal, DSAlert, "00012");
        field.value = "";
        field.focus();
        return false;
    } if (value > MaxValue) {
        GetAlertTextPopUp(GetAlertText(iTotal, DSAlert, '0054').replace('@', MaxValue))
        field.value = "";
        //alert('');
        field.focus();
        return false;
    }
    FormatNumericWithSeparate(field);
}

//Kiem tra kieu so
function checkNumericButton(field, MaxValue, button) {
    if (field == null)
        return;
    if (field.value == "") {
        GetAlertError(iTotal, DSAlert, "0003");
        field.focus();
        document.getElementById(button).disabled = true;
        return false;
    }
    var re;
    re = /,/g;
    var value = field.value.replace(re, '');
    if (isNaN(value)) {
        GetAlertError(iTotal, DSAlert, "0013");
        field.value = "";
        field.focus();
        document.getElementById(button).disabled = true;
        return false;
    }
    //tanldt: Test yeu cau 1 so cho phai lon hon 0
    if (value < 0) {
        //alert("Must not a negative numeric or zero!");
        GetAlertError(iTotal, DSAlert, "0012");
        field.value = "";
        field.focus();
        document.getElementById(button).disabled = true;
        return false;
    } if (value > MaxValue) {
        GetAlertTextPopUp(GetAlertText(iTotal, DSAlert, '0054').replace('@', MaxValue))
        //alert('');
        field.focus();
        document.getElementById(button).disabled = true;
        return false;
    }
    document.getElementById(button).disabled = false;
    FormatNumericWithSeparate(field);
}
//Kiem tra kieu so > 0
function checkNumeric1(field) {
    if (field == null)
        return;
    if (field.value == "")
        return;
    var re;
    re = /,/g;
    var value = field.value.replace(re, '');
    if (isNaN(value)) {
        GetAlertError(iTotal, DSAlert, "0013");
        field.value = "";
        field.focus();
        return;
    }
    //tanldt: Test yeu cau 1 so cho phai lon hon 0
    if (value <= 0) {
        //alert("Must not a negative numeric or zero!");
        GetAlertError(iTotal, DSAlert, "0012");
        field.value = "";
        field.focus();
        return;
    }
    FormatNumericWithSeparate(field);
}
//Kiem tra kieu so <cho phep am>
function checkNumber(field) {
    if (field.value == "")
        return false;
    var re;
    re = /,/g;
    var value = field.value.replace(re, '');
    if (isNaN(value)) {
        $.notify("Vui lòng nhập giá trị số", {
            className: 'error',
            globalPosition: 'bottom right'
        });
        field.value = "";
        setTimeout(function () { field.focus(); }, 0);
        return false;
    }
    
}
//Kiem tra kieu so
function checkNumericNotSeparate(field) {
    if (field.value == "")
        return;
    var re;
    re = /,/g;
    var value = field.value.replace(re, '');
    if (isNaN(value)) {
        GetAlertError(iTotal, DSAlert, "0009");
        field.value = "";
        field.focus();
        return;
    }
    if (value < 0) {
        //alert("Must not a negative numeric or zero!");
        GetAlertError(iTotal, DSAlert, "0035");
        field.value = "";
        field.focus();
        return;
    }
}

function EditInput(field) {
    var pos = field.selectionStart;
    //alert(field.selectionStart);    
    var valueInput = ReplaceMoneyNumeric(field);
    field.value = valueInput;
    field.SelectionStart = pos;
}

//Chuyen thanh dang so binh thuong cua dinh dang money: 2,000 -> 2000
function ReplaceMoneyNumeric(field) {
    return field.value.replace(/,/g, '');
}
//Chuyen thanh dang so binh thuong cua dinh dang money: 2,000 -> 2000
function ReplaceMoneyNumericFromValue(Valuefield) {
    return Valuefield.replace(/,/g, '');
}

//dinh dang kieu money ',' (ex: 2,000,000.00) : input = field
function FormatNumericWithSeparate(field) {
    var DecimalNumber = 1;
    var DecimalChar = ".";
    var SeperateChar = ",";
    var ValueString = parseFloat(field.value.replace(/,/g, '')).toString();
    //if (ValueString.includes("e+"))
        //ValueString = field.value.replace(/,/g, '').toString();
    //var ValueString = field.value;
    var ValueStringAfterDecimal = "";
    var ValueStringNew = "";
    //if (field.value < 0)
    if (ValueString < 0) {
        ValueString = ValueString.substring(1, ValueString.length); //Bo dau tru				
    }
    if (ValueString.indexOf(DecimalChar) != -1) {
        ValueStringAfterDecimal = ValueString.substring(ValueString.indexOf(DecimalChar), ValueString.indexOf(DecimalChar) + 2 + DecimalNumber) // Tinh luon dau cham
        //alert(ValueStringAfterDecimal);
        ValueString = ValueString.substring(0, ValueString.indexOf(DecimalChar))
    }

    if (ValueStringAfterDecimal.indexOf(SeperateChar) != -1) {
        GetAlertError(iTotal, DSAlert, "0035");
        field.value = "";
        field.focus();
        return;
    }
    ValueString = ValueString.replace(/,/g, '');
    ValueStringNew = "";
    while (ValueString.length > 3) {
        ValueStringNew = SeperateChar + ValueString.substring(ValueString.length - 3, ValueString.length) + ValueStringNew;
        ValueString = ValueString.substring(0, ValueString.length - 3);
    }
    if (DecimalNumber != 0)
        ValueStringNew = ValueString + ValueStringNew + ValueStringAfterDecimal;
    else
        ValueStringNew = ValueString + ValueStringNew;
    //if (field.value < 0) 
    if (parseFloat(field.value.replace(/,/g, '')) < 0)
        ValueStringNew = "-" + ValueStringNew;

    field.value = ValueStringNew;
}
//dinh dang kieu money ',' (ex: 2,000,000.00) : input = value (2000) -> return value (2,000)
function FormatNumericWithSeparateValue(objValue) {
    var DecimalNumber = 1;
    var DecimalChar = ".";
    var SeperateChar = ",";
    //var ValueString = parseFloat(objValue.replace(/,/g,''));
    var ValueString = objValue.toString();
    var ValueStringAfterDecimal = "";
    var ValueStringNew = "";
    //if (field.value < 0)
    if (ValueString < 0) {
        ValueString = ValueString.substring(1, ValueString.length); //Bo dau tru				
    }
    if (ValueString.indexOf(DecimalChar) != -1) {
        ValueStringAfterDecimal = ValueString.substring(ValueString.indexOf(DecimalChar), ValueString.indexOf(DecimalChar) + 2 + DecimalNumber) // Tinh luon dau cham
        //alert(ValueStringAfterDecimal);
        ValueString = ValueString.substring(0, ValueString.indexOf(DecimalChar))
    }

    if (ValueStringAfterDecimal.indexOf(SeperateChar) != -1) {
        GetAlertError(iTotal, DSAlert, "0035");
        return;
    }
    ValueString = ValueString.replace(/,/g, '');
    ValueStringNew = "";
    while (ValueString.length > 3) {
        ValueStringNew = SeperateChar + ValueString.substring(ValueString.length - 3, ValueString.length) + ValueStringNew;
        ValueString = ValueString.substring(0, ValueString.length - 3);
    }
    if (DecimalNumber != 0)
        ValueStringNew = ValueString + ValueStringNew + ValueStringAfterDecimal;
    else
        ValueStringNew = ValueString + ValueStringNew;
    if (objValue < 0)
    //if (parseFloat(objValue.replace(/,/g,'')) < 0) 	
        ValueStringNew = "-" + ValueStringNew;

    return ValueStringNew;
}
//TrangNT: Hàm format số với phần lẻ theo ý muốn
//dinh dang kieu money ',' (ex: 2,000,000.00) : input = field
function FormatNumericWithSeparate_Decimal(field, NumDecimal) {
    NumDecimal = CheckFloat(NumDecimal);
    var DecimalNumber = 1;
    var DecimalChar = ".";
    var SeperateChar = ",";
    var ValueString = parseFloat(field.value.replace(/,/g, '')).toString();
    //var ValueString = field.value;
    var ValueStringAfterDecimal = "";
    var ValueStringNew = "";
    //if (field.value < 0)
    if (ValueString < 0) {
        ValueString = ValueString.substring(1, ValueString.length); //Bo dau tru				
    }
    if (ValueString.indexOf(DecimalChar) != -1) {
        ValueStringAfterDecimal = ValueString.substring(ValueString.indexOf(DecimalChar), ValueString.indexOf(DecimalChar) + NumDecimal + DecimalNumber) // Tinh luon dau cham
        //alert(ValueStringAfterDecimal);
        ValueString = ValueString.substring(0, ValueString.indexOf(DecimalChar))
    }

    if (ValueStringAfterDecimal.indexOf(SeperateChar) != -1) {
        GetAlertError(iTotal, DSAlert, "0035");
        field.value = "";
        field.focus();
        return;
    }
    ValueString = ValueString.replace(/,/g, '');
    ValueStringNew = "";
    while (ValueString.length > 3) {
        ValueStringNew = SeperateChar + ValueString.substring(ValueString.length - 3, ValueString.length) + ValueStringNew;
        ValueString = ValueString.substring(0, ValueString.length - 3);
    }
    if (DecimalNumber != 0)
        ValueStringNew = ValueString + ValueStringNew + ValueStringAfterDecimal;
    else
        ValueStringNew = ValueString + ValueStringNew;
    //if (field.value < 0) 
    if (parseFloat(field.value.replace(/,/g, '')) < 0)
        ValueStringNew = "-" + ValueStringNew;

    field.value = ValueStringNew;
    return false;
}

function checkNumeric_Decimal(field, MaxValue, NumDecimal) {
    NumDecimal = CheckFloat(NumDecimal);
    if (field == null)
        return;
    if (field.value == "")
        return;
    var re;
    re = /,/g;
    var value = field.value.replace(re, '');
    re = /\s+/;
    value = value.replace(re, '');
    if (value == "") {
        field.value = "";
        return;
    }

    if (isNaN(value)) {
        GetAlertError(iTotal, DSAlert, "0013");
        field.value = "";
        field.focus();
        return false;
    }
    //tanldt: Test yeu cau 1 so cho phai lon hon 0
    if (value < 0) {
        //alert("Must not a negative numeric or zero!");
        GetAlertError(iTotal, DSAlert, "00012");
        field.value = "";
        field.focus();
        return false;
    } if (value > MaxValue) {
        GetAlertTextPopUp(GetAlertText(iTotal, DSAlert, '0054').replace('@', MaxValue))
        field.value = "";
        //alert('');
        field.focus();
        return false;
    }
    FormatNumericWithSeparate_Decimal(field, NumDecimal);
}

function checkNumber_Decimal(field, NumDecimal) {
    NumDecimal = CheckFloat(NumDecimal);
    if (field == null)
        return;
    if (field.value == "")
        return;
    var re;
    re = /,/g;
    var value = field.value.replace(re, '');
    re = /\s+/;
    value = value.replace(re, '');
    if (value == "") {
        field.value = "";
        return;
    }

    if (isNaN(value)) {
        GetAlertError(iTotal, DSAlert, "0013");
        field.value = "";
        field.focus();
        return false;
    }   
   
    FormatNumericWithSeparate_Decimal(field, NumDecimal);
}

//Kiem tra kieu so lam tron theo 0.5
function checkNoRound05(field, MaxValue) {
    if (field.value == "")
        return true;
    var value = field.value.replace(/,/g, '');
    if (isNaN(value)) {
        GetAlertError(iTotal, DSAlert, "0035");
        field.value = "";
        field.focus();
        return false;
    }
    if (value <= 0) {
        GetAlertError(iTotal, DSAlert, "0035");
        field.value = "";
        field.focus();
        return false;
    }
    if (Math.round(parseFloat(value) / 0.5) != (parseFloat(value) / 0.5)) {
        GetAlertError(iTotal, DSAlert, "0036");
        field.value = "";
        field.focus();
        return false;
    } if (value >= MaxValue) {
        GetAlertTextPopUp(GetAlertText(iTotal, DSAlert, '0054').replace('@', MaxValue))
        //alert('');
        field.focus();
        return false;
    }
    return true;
}

function checkNoRound05(field) {
    if (field.value == "")
        return true;
    var value = field.value.replace(/,/g, '');
    if (isNaN(value)) {
        GetAlertError(iTotal, DSAlert, "0035");
        field.value = "";
        field.focus();
        return false;
    }
    if (value < 0) {
        GetAlertError(iTotal, DSAlert, "0035");
        field.value = "";
        field.focus();
        return false;
    }
    if (Math.round(parseFloat(value) / 0.5) != (parseFloat(value) / 0.5)) {
        GetAlertError(iTotal, DSAlert, "0036");
        field.value = "";
        field.focus();
        return false;
    }

    return true;
}

//Kiem tra kieu so lam tron theo 0.5 (0, 0.5, 1)
function DaycheckNoRound05(field) {
    if (field.value == "")
        return true;
    var value = field.value;
    if (isNaN(value)) {
        GetAlertError(iTotal, DSAlert, "0037");
        field.value = "0";
        field.focus();
        return false;
    }
    if (parseFloat(value) != 0 && parseFloat(value) != 0.5
		&& parseFloat(value) != 1) {
        //alert("S? h?p l? là s? có 1 trong 3 giá tr?: 0; 0.5; 1");
        GetAlertError(iTotal, DSAlert, "0038");
        field.value = "0";
        field.focus();
        return false;
    }
    field.value = parseFloat(value);
    return true;
}

//Kiem tra so phan tram
function CheckPercent(field) {
    if (field.value == "")
        return;
    var value = field.value;
    if (isNaN(value)) {
        //alert("Không ph?i là d? li?u s?!");
        GetAlertError(iTotal, DSAlert, "0037");
        field.value = "";
        field.focus();
        return;
    }
    if (value < 0 || value > 100) {
        //alert("S? ph?i n?m trong kho?ng t? 0 d?n 100!");
        GetAlertError(iTotal, DSAlert, "0039");
        field.value = "";
        field.focus();
        return;
    }
}

//Kiem tra so nguyen
function checkInteger(field, MaxValue) {
    field.value = ReplaceMoneyNumeric(field);
    var value = field.value;

    if (isNaN(value)) {
        GetAlertError(iTotal, DSAlert, "0040");
        field.focus();
        field.value = "";
        return false;
    }
    else {
        if (value < 0) {
            //alert("S? không du?c là s? âm!");
            GetAlertError(iTotal, DSAlert, "0010");
            field.focus();
            field.value = "";
            return false;
        }
        else {
            field.value = Math.round(field.value);
            //FormatNumericWithSeparate(field);	
            //return true;
        }
        //debugger;
        if (value >= MaxValue) {
            GetAlertTextPopUp(GetAlertText(iTotal, DSAlert, '0054').replace('@', MaxValue))
            //alert('');
            field.focus();
            return false;
        }
    }
    FormatNumericWithSeparate(field);
}

function RoundMoney(MoneyValue) {
    var tmp = parseFloat(ReplaceMoneyNumericFromValue(MoneyValue));
    var RoundTmp = FormatNumericWithSeparateValue(Math.round(tmp));
    return RoundTmp;
}

//Kiem tra so nguyen
function checkInteger(field) {
    if (field.value == "") return true;

    field.value = ReplaceMoneyNumeric(field);
    var value = field.value;

    if (isNaN(value)) {
        GetAlertError(iTotal, DSAlert, "0040");
        field.focus();
        field.value = "";
        return false;
    }
    else {
        if (value < 0) {
            //alert("S? không du?c là s? âm!");
            GetAlertError(iTotal, DSAlert, "0010");
            field.focus();
            field.value = "";
            return false;
        }
        else {
            field.value = Math.round(field.value);
            FormatNumericWithSeparate(field);
            return true;
        }
    }
    FormatNumericWithSeparate(field);
}
//Kiem tra so nguyen
function checkInt(field, MaxValue) {
    var value = field.value;
    if (value != '') {
        if (isNaN(value)) {
            GetAlertError(iTotal, DSAlert, "0040");
            field.focus();
            field.value = "";
            return false;
        }
        if (value < 1) {
            //alert("S? không du?c là s? âm!");
            GetAlertError(iTotal, DSAlert, "0072");
            field.focus();
            field.value = "";
            return false;
        }
        if (value > MaxValue) {
            GetAlertTextPopUp(GetAlertText(iTotal, DSAlert, '0054').replace('@', MaxValue))
            field.focus();
            return false;
        }
        field.value = Math.round(field.value);
        FormatNumericWithSeparate(field);
        return true;
    }
}

function roundNumber(numberValue, rlength) {
    var rnum = numberValue;
    if (rnum > 8191 && rnum < 10485) {
        rnum = rnum - 5000;
        var newnumber = Math.round(rnum * Math.pow(10, rlength)) / Math.pow(10, rlength);
        //newnumber = newnumber+5000;
    } else {
        var newnumber = Math.round(rnum * Math.pow(10, rlength)) / Math.pow(10, rlength);
    }
    return newnumber;
}
function roundNumberNew(numberValue, rlength) {
    var rnum = parseFloat(numberValue);
    var rlen = parseFloat(rlength);
    var newnumber = Math.round(rnum * Math.pow(10, rlen)) / Math.pow(10, rlen);
    if (rlen == -5)
        return Math.round(newnumber);
    return newnumber;
}

function DeltaHourToHour(field1, field2) {
    var sHour1, sMinute1, sHour2, sMinute2;
    var DataTemp1, DataTemp2;
    DataTemp1 = field1.value;
    DataTemp2 = field2.value;
    var Time1, Time2;

    sHour1 = DataTemp1.substring(0, 2);
    sMinute1 = DataTemp1.substring(3, 5);
    sHour2 = DataTemp2.substring(0, 2);
    sMinute2 = DataTemp2.substring(3, 5);
    Time1 = eval(sHour1) * 60 + eval(sMinute1);
    Time2 = eval(sHour2) * 60 + eval(sMinute2);
    return Time2 - Time1;

}
function checkOfficeHours(field1, isOffice) {
    if (isOffice == 1) return true;

    var sHour1, sMinute1, sHour2, sMinute2, sHoursOff1, sHoursOff2, sMinuteOff1, sMinuteOff2;
    var DataTemp1, DataTemp2;
    DataTemp1 = field1.value;
    var Time1, Time2, TimeOff1, TimeOff2;

    sHour1 = DataTemp1.substring(0, 2);
    sMinute1 = DataTemp1.substring(3, 5);
    sHoursOff1 = '08';
    sMinuteOff1 = '30';
    sHoursOff2 = '17';
    sMinuteOff2 = '30';
    Time1 = eval(sHour1) * 60 + eval(sMinute1);
    TimeOff1 = eval(sHoursOff1) * 60 + eval(sMinuteOff1);
    TimeOff2 = eval(sHoursOff2) * 60 + eval(sMinuteOff2);
    //if ((TimeOff1 - Time1 < 0 && TimeOff1 - Time2 < 0)|| (TimeOff2 - Time1 > 0 && TimeOff2 - Time2>0) )
    //alert(TimeOff1 + '---' + Time1 + '---' + TimeOff2);
    if (TimeOff1 < Time1 && Time1 < TimeOff2) {
        GetAlertError(iTotal, DSAlert, "OT_0004");
        field1.focus();
        return false;
    }
    else
        return true;

}
//Kiem tra gio phut dinh dang(hh:mm)
function formatHours(field) {
    var nSep1, sHour, sMinute, nHour, nMinute;
    var checkstr = "0123456789";
    var DataTemp = "";
    var DataValue = "";
    var value, i;
    DataValue = field.value;
    if (DataValue.length == 0) {
        field.value = "";
        return false;
    }
    //Bo nhung ky tu khong phai ky tu so
    for (i = 0; i < DataValue.length; i++) {
        if (checkstr.indexOf(DataValue.substr(i, 1)) >= 0) {
            DataTemp = DataTemp + DataValue.substr(i, 1);
        }
    }
    if (DataTemp.length != 4) {
        field.value = "";
        return false;

    }
    sHour = DataTemp.substring(0, 2);
    sMinute = DataTemp.substring(2, 4);
    if (isNaN(sHour) || isNaN(sMinute)) {
        field.value = "";
        return false;
    }

    nHour = parseInt(sHour, 10); nMinute = parseInt(sMinute, 10);
    if (nHour < 0 || nMinute < 0) {
        field.value = "";
        return false;
    }
    if (nHour >= 24 || nMinute >= 60) {
        field.value = "";
        return false;
    }
    value = sHour + ":" + sMinute;
    field.value = value;
    return true;
}

//Thêm phút vào giờ định dạng hh:mm
//vHour : hh:mm
//
function AddMinuteToHours(valueHours, valueMinutes) {
    var sHour, sMinute, nHour, nMinute, AddHour, AddMinute;
    sHour = valueHours.substring(0, 2);
    sMinute = valueHours.substring(3, 5);
    
    if(sHour == "" || sHour == null) sHour = "a";
    if(sMinute == "" || sMinute == null) sMinute = "a";
    if (isNaN(sHour) || isNaN(sMinute))
        return "";

    nHour = parseInt(sHour, 10);
    nMinute = parseInt(sMinute, 10);

    if (nHour < 0 || nMinute < 0)
        return "";
    if (nHour >= 24 || nMinute >= 60)
        return "";

    AddHour = Math.floor(valueMinutes / 60);
    AddMinute = valueMinutes - (AddHour * 60);

    if ((nMinute + AddMinute) >= 60) {
        var tmp = Math.floor((nMinute + AddMinute) / 60);
        nMinute = (nMinute + AddMinute) - (tmp * 60);
        nHour += tmp;

    }
    else
        nMinute += AddMinute;

    nHour += AddHour;
    if (nHour >= 24) {
        var tmp2 = Math.floor(nHour / 24);
        nHour = nHour - (tmp2 * 24);
    }

    if (nHour < 10)
        sHour = "0" + nHour.toString();
    else
        sHour = nHour.toString();
    if (nMinute < 10)
        sMinute = "0" + nMinute.toString();
    else
        sMinute = nMinute.toString();

    var valueReturn = sHour + ":" + sMinute;

    return valueReturn;

}

//lucnns compare hai so
function CompareNumber(field1, field2) {
    sNum1 = field1
    sNum2 = field2

    if (sNum1 == sNum2)
        return 0;
    if (sNum1 > sNum2)
        return 1;
    if (sNum1 < sNum2)
        return -1;
}
//trangNT compare hai so trong 2 texbox
function CompareFloat(objID1, objID2) {
    if(
            document.getElementById('_ctl0_'+ objID1)!= null && document.getElementById('_ctl0_'+ objID1).value!=""
            &&
            document.getElementById('_ctl0_'+ objID2)!= null && document.getElementById('_ctl0_'+ objID2).value!=""
        )
    {
        return CompareNumber(parseFloat(document.getElementById('_ctl0_' + objID1).value.replace(',', '')), parseFloat(document.getElementById('_ctl0_' + objID2).value.replace(',', '')));
    }
    else
        return -2
}

function CompareHours(field1, field2) {
    sHour1 = parseFloat(field1.value.substring(0, 2));
    sMinute1 = parseFloat(field1.value.substring(3, 5));
    sHour2 = parseFloat(field2.value.substring(0, 2));
    sMinute2 = parseFloat(field2.value.substring(3, 5));

    value1 = sHour1 * 60 + sMinute1;
    value2 = sHour2 * 60 + sMinute2;

    if (value1 == value2)
        return 0;
    if (value1 > value2)
        return 1;
    if (value1 < value2)
        return -1;
}

function CompareHoursValue(value1, value2) {
    sHour1 = parseFloat(value1.substring(0, 2));
    sMinute1 = parseFloat(value1.substring(3, 5));
    sHour2 = parseFloat(value2.substring(0, 2));
    sMinute2 = parseFloat(value2.substring(3, 5));

    value1 = sHour1 * 60 + sMinute1;
    value2 = sHour2 * 60 + sMinute2;

    if (value1 == value2)
        return 0;
    if (value1 > value2)
        return 1;
    if (value1 < value2)
        return -1;
}

//Kiem tra nam
function CheckYear(field) {
    var checkstr = "0123456789";
    var DateField = field;
    var DateValue = "";
    var DateTemp = "";
    var i;

    DateValue = DateField.value;
    if (DateValue.length == 0) return;
    for (i = 0; i < DateValue.length; i++) {
        if (checkstr.indexOf(DateValue.substr(i, 1)) >= 0) {
            DateTemp = DateTemp + DateValue.substr(i, 1);
        }
    }
    DateValue = DateTemp;

    if (DateValue.length == 2)
        DateValue = "20" + DateValue;

    if ((DateValue.length != 4 && DateValue.length != 0) || DateValue == 0) {

        //alert("Nam không h?p l?!");
        $.notify("Năm không hợp lệ", {
            className: 'error',
            globalPosition: 'bottom right'
        });

        return false;
        DateField.focus();
        
    }
    DateField.value = DateValue;
    
}

//Create by : HanhNTM  Kiem tra nam toi thieu phai 1900
function CheckYear1900(field) {
    var checkstr = "0123456789";
    var DateField = field;
    var DateValue = "";
    var DateTemp = "";
    var i;

    DateValue = DateField.value;
    if (DateValue.length == 0) return;
    for (i = 0; i < DateValue.length; i++) {
        if (checkstr.indexOf(DateValue.substr(i, 1)) >= 0) {
            DateTemp = DateTemp + DateValue.substr(i, 1);
        }
    }
    DateValue = DateTemp;

    if (DateValue.length == 2)
        DateValue = "20" + DateValue;


    if ((DateValue.length != 4 && DateValue.length != 0) || DateValue == 0) {

        //alert("Nam không h?p l?!");
        $.notify("Năm không hợp lệ", {
            className: 'error',
            globalPosition: 'bottom right'
        });
        setTimeout(function () { DateField.focus(); }, 0); 
        return;
        
    }

    DateField.value = DateValue;
    if (DateField.value < 1900) {
        $.notify("Năm không được nhỏ hơn 1900", {
            className: 'error',
            globalPosition: 'bottom right'
        });
        setTimeout(function () { DateField.focus(); }, 0);
        return;
        
    }
}

//Kiem tra Thang
function CheckMonth(field) {
    var checkstr = "0123456789";
    var DateField = field;
    var DateValue = "";
    var DateTemp = "";
    var i;

    DateValue = DateField.value;
    if (DateValue.length == 0) return;
    for (i = 0; i < DateValue.length; i++) {
        if (checkstr.indexOf(DateValue.substr(i, 1)) >= 0) {
            DateTemp = DateTemp + DateValue.substr(i, 1);
        }
    }
    DateValue = DateTemp;

    if (DateValue > 12 || DateValue < 1) {
        //alert("Nam không h?p l?!");
        GetAlertError(iTotal, DSAlert, "0094");
        DateField.focus();
    }
    if (DateValue.length == 1)
        DateValue = '0' + DateValue;
    DateField.value = DateValue;
}
//Kiem tra du lieu thang nam
function CheckMonthYear(field) {
    var checkstr = "0123456789";
    var DateField = field;
    var Datevalue = "";
    var DateTemp = "";
    var seperator = "/";
    var month;
    var year;
    var leap = 0;
    var err = 0;
    var i;
    err = 0;
    DateValue = DateField.value;
    if (DateValue == "") return;
    /* Delete all chars except 0..9 */
    for (i = 0; i < DateValue.length; i++) {
        if (checkstr.indexOf(DateValue.substr(i, 1)) >= 0) {
            DateTemp = DateTemp + DateValue.substr(i, 1);
        }
    }
    DateValue = DateTemp;
    /* Always change date to 6 digits - string*/
    /* if year is entered as 2-digit / always assume 20xx */
    if (DateValue.length == 4) {
        DateValue = DateValue.substr(0, 2) + '20' + DateValue.substr(2, 2);
    }

    if (DateValue.length != 6) {
        err = 19;
    }
    /* year is wrong if year = 0000 */
    year = DateValue.substr(2, 4);
    if (year == 0) {
        err = 20;
    }
    /* Validation of month*/
    month = DateValue.substr(0, 2);
    if ((month < 1) || (month > 12)) {
        err = 21;
    }

    /* if 00 ist entered, no error, deleting the entry */
    if ((month == 0) && (year == 00)) {
        err = 0; month = ""; year = ""; seperator = "";
    }

    if (err == 0) {
        DateField.value = month + seperator + year;
        if (DateField.value == "") {
            $.notify("Tháng không hợp lệ!", {
                className: 'error',
                globalPosition: 'bottom right'
            });
            DateField.focus();
            // HOPTD ADDED
            return false;
            //////////////
        }
    }
    /* Error-message if err != 0 */
    else {
        DateField.value = "";
        DateField.focus();
        //alert("Ð?nh d?ng d? li?u ki?u MM/yyyy!");
        GetAlertError(iTotal, DSAlert, "0042");
        // HOPTD ADDED
        return false;
        //////////////
    }
}

//Kiem tra du lieu ngay
function CheckDate(field) {
    var checkstr = "0123456789";
    var DateField = field;
    var Datevalue = "";
    var DateTemp = "";
    var seperator = "/";
    var day;
    var month;
    var year;
    var leap = 0;
    var err = 0;
    var i;
    err = 0;
    DateValue = DateField.value;
    /* Delete all chars except 0..9 */
    for (i = 0; i < DateValue.length; i++) {
        if (checkstr.indexOf(DateValue.substr(i, 1)) >= 0) {
            DateTemp = DateTemp + DateValue.substr(i, 1);
        }
    }
    DateValue = DateTemp;
    /* Always change date to 8 digits - string*/
    /* if year is entered as 2-digit / always assume 20xx */
    if (DateValue.length == 6) {
        DateValue = DateValue.substr(0, 4) + '20' + DateValue.substr(4, 2);
    }

    if (DateValue.length != 8) {
        err = 19;
    }
    /* year is wrong if year = 0000 */
    year = DateValue.substr(4, 4);
    if (year == 0) {
        err = 20;
    }
    /* Validation of day*/
    day = DateValue.substr(0, 2);

    /* Validation of month*/
    month = DateValue.substr(2, 2);
    if ((month < 1) || (month > 12)) {
        err = 21;
    }


    if (year <= 1900) {
        err = 18;
    }
    if (day < 1) {
        err = 22;
    }
    /* Validation leap-year / february / day */
    if ((year % 4 == 0) || (year % 100 == 0) || (year % 400 == 0)) {
        leap = 1;
    }
    if ((month == 2) && (leap == 1) && (day > 29)) {
        err = 23;
    }
    if ((month == 2) && (leap != 1) && (day > 28)) {
        err = 24;
    }
    /* Validation of other months */
    if ((day > 31) && ((month == "01") || (month == "03") || (month == "05") || (month == "07") || (month == "08") || (month == "10") || (month == "12"))) {
        err = 25;
    }
    if ((day > 30) && ((month == "04") || (month == "06") || (month == "09") || (month == "11"))) {
        err = 26;
    }
    /* if 00 ist entered, no error, deleting the entry */
    if ((day == 0) && (month == 0) && (year == 00)) {
        err = 0; day = ""; month = ""; year = ""; seperator = "";
    }
    /* if no error, write the completed date to Input-Field (e.g. 13.12.2001) */
    if (err == 0) {
        DateField.value = day + seperator + month + seperator + year;
        return true;
    }
    else if (err == 18)/* Error-message if err != 0 */
    {
        DateField.value = "";
        DateField.focus();
        $.notify("Ngày nhập vào không đúng định dạng (DD/MM/YYYY)", {
            className: 'error',
            globalPosition: 'bottom right'
        });
        return false;
    }
    else {
        DateField.value = "";
        DateField.focus();
        $.notify("Ngày tháng nhập vào phải lớn hơn năm 1900", {
            className: 'error',
            globalPosition: 'bottom right'
        });
        return false;
    }
}

//Kiem tra du lieu ngay
function CheckDateValue(DateValue) {
    var checkstr = "0123456789";
    var DateTemp = "";
    var seperator = "/";
    var day;
    var month;
    var year;
    var leap = 0;
    var err = 0;
    var i;
    err = 0;

    /* Delete all chars except 0..9 */
    for (i = 0; i < DateValue.length; i++) {
        if (checkstr.indexOf(DateValue.substr(i, 1)) >= 0) {
            DateTemp = DateTemp + DateValue.substr(i, 1);
        }
    }
    DateValue = DateTemp;
    /* Always change date to 8 digits - string*/
    /* if year is entered as 2-digit / always assume 20xx */
    if (DateValue.length == 6) {
        DateValue = DateValue.substr(0, 4) + '20' + DateValue.substr(4, 2);
    }

    if (DateValue.length != 8) {
        err = 19;
    }
    /* year is wrong if year = 0000 */
    year = DateValue.substr(4, 4);
    if (year == 0) {
        err = 20;
    }
    /* Validation of day*/
    day = DateValue.substr(0, 2);

    /* Validation of month*/
    month = DateValue.substr(2, 2);
    if ((month < 1) || (month > 12)) {
        err = 21;
    }


    if (year <= 1900) {
        err = 18;
    }
    if (day < 1) {
        err = 22;
    }
    /* Validation leap-year / february / day */
    if ((year % 4 == 0) || (year % 100 == 0) || (year % 400 == 0)) {
        leap = 1;
    }
    if ((month == 2) && (leap == 1) && (day > 29)) {
        err = 23;
    }
    if ((month == 2) && (leap != 1) && (day > 28)) {
        err = 24;
    }
    /* Validation of other months */
    if ((day > 31) && ((month == "01") || (month == "03") || (month == "05") || (month == "07") || (month == "08") || (month == "10") || (month == "12"))) {
        err = 25;
    }
    if ((day > 30) && ((month == "04") || (month == "06") || (month == "09") || (month == "11"))) {
        err = 26;
    }
    /* if 00 ist entered, no error, deleting the entry */
    if ((day == 0) && (month == 0) && (year == 00)) {
        err = 0; day = ""; month = ""; year = ""; seperator = "";
    }
    /* if no error, write the completed date to Input-Field (e.g. 13.12.2001) */
    if (err == 0) {
        return true;
    }
    else if (err == 18)/* Error-message if err != 0 */
    {
        return false;
    }
    else {
        return false;
    }
}

function CheckDDMM(field) {
    var checkstr = "0123456789";
    var DateField = field;
    var Datevalue = "";
    var DateTemp = "";
    var seperator = "/";
    var day;
    var month;
    var year;
    var leap = 0;
    var err = 0;
    var i;
    err = 0;
    if (field.value != '')
        DateValue = DateField.value + '/2006';
    else
        DateValue = field.value;

    /* Delete all chars except 0..9 */
    for (i = 0; i < DateValue.length; i++) {
        if (checkstr.indexOf(DateValue.substr(i, 1)) >= 0) {
            DateTemp = DateTemp + DateValue.substr(i, 1);
        }
    }
    DateValue = DateTemp;
    /* Always change date to 8 digits - string*/
    /* if year is entered as 2-digit / always assume 20xx */
    if (DateValue.length == 6) {
        DateValue = DateValue.substr(0, 4) + '20' + DateValue.substr(4, 2);
    }

    if (DateValue.length != 8) {
        err = 19;
    }
    /* year is wrong if year = 0000 */
    year = DateValue.substr(4, 4);
    if (year == 0) {
        err = 20;
    }
    /* Validation of month*/
    month = DateValue.substr(2, 2);
    if ((month < 1) || (month > 12)) {
        err = 21;
    }
    /* Validation of day*/
    day = DateValue.substr(0, 2);

    if (year <= 1900) {
        err = 18;
    }
    if (day < 1) {
        err = 22;
    }
    /* Validation leap-year / february / day */
    if ((year % 4 == 0) || (year % 100 == 0) || (year % 400 == 0)) {
        leap = 1;
    }
    if ((month == 2) && (leap == 1) && (day > 29)) {
        err = 23;
    }
    if ((month == 2) && (leap != 1) && (day > 29)) {
        err = 24;
    }
    /* Validation of other months */
    if ((day > 31) && ((month == "01") || (month == "03") || (month == "05") || (month == "07") || (month == "08") || (month == "10") || (month == "12"))) {
        err = 25;
    }
    if ((day > 30) && ((month == "04") || (month == "06") || (month == "09") || (month == "11"))) {
        err = 26;
    }
    /* if 00 ist entered, no error, deleting the entry */
    if ((day == 0) && (month == 0) && (year == 00)) {
        err = 0; day = ""; month = ""; year = ""; seperator = "";
    }
    /* if no error, write the completed date to Input-Field (e.g. 13.12.2001) */
    if (err == 0) {
        DateField.value = day + seperator + month;
        return true;
    }
    else if (err = 18)/* Error-message if err != 0 */
    {
        DateField.value = "";
        DateField.focus();
        GetAlertError(iTotal, DSAlert, "2010");
        return false;
    }
    else {
        DateField.value = "";
        DateField.focus();
        GetAlertError(iTotal, DSAlert, "0031");
        return false;
    }

}

function addDays(myDate, days) {
    return new Date(myDate.getTime() + days * 24 * 60 * 60 * 1000);
}

function addDays2(value, days) {
    var day = value.substr(0, 2);
    var month = value.substr(3, 2);
    var year = value.substr(6, 4);
    var strDate = month + "/" + day + "/" + year;
    var d = new Date(strDate);
    d.setDate(d.getDate() + parseInt(days));

    if (d.getDate() < 10)
        day = '0' + d.getDate().toString();
    else
        day = d.getDate().toString();

    if (d.getMonth() + 1 < 10)
        month = '0' + (d.getMonth() + 1).toString();
    else
        month = (d.getMonth() + 1).toString();

    year = d.getFullYear().toString();

    return day + "/" + month + "/" + year;
}


function AddDaystoDateFull(field, days) {
    //value: dd/MM/yyyy
    //count: so ngay duoc cong
    //myDate, newDate: MM/dd/yyyy
    var myDate, days, newDate;

    myDate = new Date(ConvertMMDDYYYY(field));
    newDate = new Date(myDate.getTime() + days * 24 * 60 * 60 * 1000);

    var DD = new String(newDate.getDate());
    DD = '0' + DD;
    DD = DD.substring(DD.length, DD.length - 2);
    var MM = new String(newDate.getMonth() + 1);
    MM = '0' + MM;
    MM = MM.substring(MM.length, MM.length - 2);
    var YYYY = new String(newDate.getFullYear());

    strDate = DD + '/' + MM + '/' + YYYY;
    return strDate;
}


function AddDaystoDate(value, count) {
    return addDays2(value, count);
}

function AddMonthstoDate(value, count) {
    var day = value.substr(0, 2);
    var month = value.substr(3, 2);
    var year = value.substr(6, 4);
    var leap;
    count = parseFloat(count);
    month = parseFloat(month) + parseFloat(count);
    var delta = 0;
    while (month - 12 > 0) {
        delta = parseFloat(delta) + 1;
        month = month - 12;
    }
    year = parseFloat(year) + delta;

    if ((year % 4 == 0) || (year % 100 == 0) || (year % 400 == 0)) {
        leap = 1;
    }
    if ((month == 2) && (leap == 1) && (day > 29)) {
        day = 29;
    }
    else if ((month == 2) && (leap != 1) && (day > 28)) {
        day = 28;
    }
    /* Validation of other months */
    else if (day >= 31 && ((month == "01") || (month == "03") || (month == "05") || (month == "07") || (month == "08") || (month == "10") || (month == "12"))) {
        day = 31;
    }
    else if (day > 30 && ((month == "04") || (month == "06") || (month == "09") || (month == "11"))) {
        day = 30;
    }

    if ((day + '').length == 1)
        day = "0" + day;
    if ((month + '').length == 1)
        month = "0" + month;
    return day + "/" + month + "/" + year;

}

//QuangPNV:Cách tính theo tháng chu kỳ: Ví dụ : Ngày 15/05/2013 -> 14/06/2013 là 1 tháng
function AddMonthstoDate2(value, count) {
    var day = value.substr(0, 2);
    var month = value.substr(3, 2);
    var year = value.substr(6, 4);
    var leap;
    count = parseFloat(count);   
    day = CheckFloat(day);    
    month = parseFloat(month) + parseFloat(count);
    year = CheckFloat(year);
        
    var delta = 0;
    while (month - 12 > 0) {
        delta = parseFloat(delta) + 1;
        month = month - 12;
    }
    year = parseFloat(year) + delta;

    if ((year % 4 == 0) || (year % 100 == 0) || (year % 400 == 0)) {
        leap = 1;
    }
    if ((month == 2) && (leap == 1) && (day > 29)) {
        day = 29;
    }
    else if ((month == 2) && (leap != 1) && (day > 28)) {
        day = 28;
    }
    /* Validation of other months */
    else if (day >= 31 && ((month == "01") || (month == "03") || (month == "05") || (month == "07") || (month == "08") || (month == "10") || (month == "12"))) {
        day = 31;
    }
    else if (day > 30 && ((month == "04") || (month == "06") || (month == "09") || (month == "11"))) {
        day = 30;
    }
      
    if(day == 1)
    {
        month = month - 1;
        if(month == 0)
        {
            day = 31;
            month = 12;
            year = year - 1;
        }
        else
        {
            if ((year % 4 == 0) || (year % 100 == 0) || (year % 400 == 0)) {
                leap = 1;
            }
            else
            {
                leap = 0;  
            }
            
            if ((month == 2) && (leap == 1)) {
                day = 29;
            }
            else if ((month == 2) && (leap != 1)) {
                day = 28;
            }            
            else if ((month == 1) || (month == 3) || (month == 5) || (month == 7) || (month == 8) || (month == 10) || (month == 12)) {
                day = 31;
            }
            else if ((month == 4) || (month == 6) || (month == 9) || (month == 11)) {
                day = 30;
            }                
        }                
    }
    else
    {
        day = day - 1;         
    }
            
    if ((day + '').length == 1)
        day = "0" + day;
    if ((month + '').length == 1)
        month = "0" + month;
    return day + "/" + month + "/" + year;

}

function AddYearstoDate(value, count) {
    var day = value.substr(0, 2);
    var month = value.substr(3, 2);
    var year = value.substr(6, 4);
    var leap;
    count = parseFloat(count);
    year = parseFloat(year) + parseFloat(count);

    var delta = 0;
    while (month - 12 > 0) {
        delta = parseFloat(delta) + 1;
        month = month - 12;
    }
    year = parseFloat(year) + delta;

    if ((year % 4 == 0) || (year % 100 == 0) || (year % 400 == 0)) {
        leap = 1;
    }
    if ((month == 2) && (leap == 1) && (day > 29)) {
        day = 29;
    }
    else if ((month == 2) && (leap != 1) && (day > 28)) {
        day = 28;
    }
        /* Validation of other months */
    else if (day >= 31 && ((month == "01") || (month == "03") || (month == "05") || (month == "07") || (month == "08") || (month == "10") || (month == "12"))) {
        day = 31;
    }
    else if (day > 30 && ((month == "04") || (month == "06") || (month == "09") || (month == "11"))) {
        day = 30;
    }

    if (day.length == 1)
        day = "0" + day;
    if (month.length == 1)
        month = "0" + month;
    return day + "/" + month + "/" + year;
}

//Chuyen du lieu ngay dang dd/mm/yyyy thanh mm/dd/yyyy
function ConvertMMDDYYYY(field) {
    if (CheckDate(field) == false)
        return;
    var checkstr = "0123456789";
    var seperator = "/";
    var day;
    var month;
    var year;
    var i;
    var value = field.value;
    var valueTemp = "";
    /* Delete all chars except 0..9 */
    for (i = 0; i < value.length; i++) {
        if (checkstr.indexOf(value.substr(i, 1)) >= 0) {
            valueTemp = valueTemp + value.substr(i, 1);
        }
    }
    value = valueTemp;
    year = value.substr(4, 4);
    month = value.substr(2, 2);
    day = value.substr(0, 2);
    return month + seperator + day + seperator + year;
}

function DeltaTwoDay(value1, value2) {
    if (value1 == "" || value2 == "")
        return;
    var checkstr = "0123456789";
    var seperator = "/";
    var i;
    var valueTemp1 = "";
    var valueTemp2 = "";
    /* Delete all chars except 0..9 */
    for (i = 0; i < value1.length; i++) {
        if (checkstr.indexOf(value1.substr(i, 1)) >= 0) {
            valueTemp1 = valueTemp1 + value1.substr(i, 1);
        }
    }
    for (i = 0; i < value2.length; i++) {
        if (checkstr.indexOf(value2.substr(i, 1)) >= 0) {
            valueTemp2 = valueTemp2 + value2.substr(i, 1);
        }
    }
    value1 = valueTemp1;
    value2 = valueTemp2;
    year1 = value1.substr(4, 4);
    month1 = value1.substr(2, 2);
    day1 = value1.substr(0, 2);
    year2 = value2.substr(4, 4);
    month2 = value2.substr(2, 2);
    day2 = value2.substr(0, 2);
    var delta = Date.UTC(parseInt(year2, 10), parseInt(month2, 10) - 1, parseInt(day2, 10)) - Date.UTC(parseInt(year1, 10), parseInt(month1, 10) - 1, parseInt(day1, 10));
    return ((delta / 86400000) + 1)
}

function DeltaDate1Date2(field1, field2) {
    if (CheckDate(field1) == false)
        return;
    if (CheckDate(field2) == false)
        return;
    var value1 = field1.value;
    var value2 = field2.value;
    if (value1 == "" || value2 == "")
        return;
    var checkstr = "0123456789";
    var seperator = "/";
    var i;
    var valueTemp1 = "";
    var valueTemp2 = "";
    /* Delete all chars except 0..9 */
    for (i = 0; i < value1.length; i++) {
        if (checkstr.indexOf(value1.substr(i, 1)) >= 0) {
            valueTemp1 = valueTemp1 + value1.substr(i, 1);
        }
    }
    for (i = 0; i < value2.length; i++) {
        if (checkstr.indexOf(value2.substr(i, 1)) >= 0) {
            valueTemp2 = valueTemp2 + value2.substr(i, 1);
        }
    }
    value1 = valueTemp1;
    value2 = valueTemp2;
    year1 = value1.substr(4, 4);
    month1 = value1.substr(2, 2);
    day1 = value1.substr(0, 2);
    year2 = value2.substr(4, 4);
    month2 = value2.substr(2, 2);
    day2 = value2.substr(0, 2);
    var delta = Date.UTC(parseInt(year2, 10), parseInt(month2, 10) - 1, parseInt(day2, 10)) - Date.UTC(parseInt(year1, 10), parseInt(month1, 10) - 1, parseInt(day1, 10));
    return ((delta / 86400000) + 1)
}

/*********************************************
*****  Fromdate < ToDate return True    ******
**  Duoc Call boi function FromSmallToDate ***
*********************************************/
function IsSmaller(inputStr1, inputStr2) {
    var delim1 = inputStr1.indexOf("/")
    var delim2 = inputStr1.lastIndexOf("/")

    // lay ngay, thang, nam cua ngay1
    var dd1 = parseInt(inputStr1.substring(0, delim1), 10)
    var mm1 = parseInt(inputStr1.substring(delim1 + 1, delim2), 10)
    var yyyy1 = parseInt(inputStr1.substring(delim2 + 1, inputStr1.length), 10)

    delim1 = inputStr2.indexOf("/")
    delim2 = inputStr2.lastIndexOf("/")

    // lay ngay, thang, nam cua ngay2
    dd2 = parseInt(inputStr2.substring(0, delim1), 10)
    mm2 = parseInt(inputStr2.substring(delim1 + 1, delim2), 10)
    yyyy2 = parseInt(inputStr2.substring(delim2 + 1, inputStr2.length), 10)

    // ngay1 nho hon ngay 2 ?
    if (yyyy2 > yyyy1)
        return true;
    else if (yyyy2 == yyyy1) {
        if (mm2 == mm1) {
            if (dd2 > dd1) {
                return true;
            }
            else {
                return false;
            }
        }
        else {
            if (mm2 > mm1) return true;
            else return false;
        }
    }
    else
        return false;
}
function IsSmallerOrEqual(inputStr1, inputStr2) {
    var delim1 = inputStr1.indexOf("/")
    var delim2 = inputStr1.lastIndexOf("/")

    // lay ngay, thang, nam cua ngay1
    var dd1 = parseInt(inputStr1.substring(0, delim1), 10)
    var mm1 = parseInt(inputStr1.substring(delim1 + 1, delim2), 10)
    var yyyy1 = parseInt(inputStr1.substring(delim2 + 1, inputStr1.length), 10)

    delim1 = inputStr2.indexOf("/")
    delim2 = inputStr2.lastIndexOf("/")

    // lay ngay, thang, nam cua ngay2
    dd2 = parseInt(inputStr2.substring(0, delim1), 10)
    mm2 = parseInt(inputStr2.substring(delim1 + 1, delim2), 10)
    yyyy2 = parseInt(inputStr2.substring(delim2 + 1, inputStr2.length), 10)


    // ngay1 nho hon ngay 2 ?
    if (yyyy2 > yyyy1)
        return true;
    else if (yyyy2 == yyyy1) {
        if (mm2 == mm1) {

            if (dd2 >= dd1) {
                return true;
            }
            else {
                return false;
            }
        }
        else {
            if (mm2 > mm1) return true;
            else return false;
        }
    }
    else
        return false;
}
//Lay thang tu ngay
function MonthOfDate(inputStr) {
    var delim1 = inputStr.indexOf("/")
    var delim2 = inputStr.lastIndexOf("/")
    // lay ngay, thang, nam cua ngay1
    var dd = parseInt(inputStr.substring(0, delim1), 10)
    var mm = parseInt(inputStr.substring(delim1 + 1, delim2), 10)
    var yyyy = parseInt(inputStr.substring(delim2 + 1, inputStr.length), 10)
    var Month = mm + '/' + yyyy;
    return Month

}
/******************************************
**** Kiem tra tu ngay nho hon Den ngay ****
**** objFromDate : Thanh phan cua form ****
**** objToDate : Thanh phan cua form   ****
******************************************/
function FromSmallToDate(objFromDate, objToDate) {
    FromDate = objFromDate.value
    ToDate = objToDate.value
    if ((!isBlank(FromDate)) && (!isBlank(ToDate))) {

        if (!IsSmaller(FromDate, ToDate)) {
            $.notify("Từ ngày phải nhỏ hơn đến ngày", {
                className: 'error',
                globalPosition: 'bottom right'
            });
            objToDate.focus()			
            return false;
        }
        else
            return true;
    }
    else
        return true;
}
/******************************************
**** Kiem tra tu ngay nho hon hoac bang Den ngay ****
**** objFromDate : Thanh phan cua form ****
**** objToDate : Thanh phan cua form   ****
******************************************/
function FromSmallOrEqualToDate(objFromDate, objToDate) {
    FromDate = objFromDate.value
    ToDate = objToDate.value
    if ((!isBlank(FromDate)) && (!isBlank(ToDate))) {

        if (!IsSmallerOrEqual(FromDate, ToDate)) {
            $.notify("Từ ngày phải nhỏ hơn hoặc bằng đến ngày", {
                className: 'error',
                globalPosition: 'bottom right'
            });
            objToDate.focus()
            return false;
        }
        else
            return true;
    }
    else
        return true;
}

function FromSmallOrEqualToDateValue(FromDate, ToDate) {
    if ((!isBlank(FromDate)) && (!isBlank(ToDate))) {

        if (!IsSmallerOrEqual(FromDate, ToDate)) {
            return false;
        }
        else
            return true;
    }
    else
        return true;
}

function FromSmallOrEqualToDate_ddMM(objFromDate, objToDate) {
    FromDate = objFromDate.value + '/2010';
    ToDate = objToDate.value + '/2010';
    if ((!isBlank(FromDate)) && (!isBlank(ToDate))) {

        if (!IsSmallerOrEqual(FromDate, ToDate)) {
            //alert("FromDate must be less than ToDate!");
            //objToDate.focus()
            return false;
        }
        else
            return true;
    }
    else
        return true;
}
/******************************************
**** Kiem tra ngay nho hon ngay hien tai ****
**** objFromDate : Thanh phan cua form ****
******************************************/
function FromSmallNow(objFromDate) {
    FromDate = objFromDate.value
    var now = new Date();
    var sMonth = (now.getMonth() + 1).toString();
    var sDay = now.getDate().toString();
    sDay = parseInt(sDay) + 1;
    var sYear = now.getFullYear().toString();
    ToDate = sDay + '/' + sMonth + '/' + sYear;
    if ((!isBlank(FromDate)) && (!isBlank(ToDate))) {
        if (!IsSmaller(FromDate, ToDate)) {
            return false;
        }
        else
            return true;
    }
    else
        return true;
}
//////them vao

function FromSmallNow1(objFromDate) {
    FromDate = objFromDate.value
    var now = new Date();
    var sMonth = (now.getMonth() + 1).toString();
    var sDay = now.getDate().toString();
    sDay = parseInt(sDay);
    var sYear = now.getFullYear().toString();
    ToDate = sDay + '/' + sMonth + '/' + sYear;
    if ((!isBlank(FromDate)) && (!isBlank(ToDate))) {
        if (!IsSmaller(FromDate, ToDate)) {
            return false;
        }
        else
            return true;
    }
    else
        return true;
}
/////end
/******************************************
**** Kiem tra ngay nho hon ngay hien tai ****
**** objFromDate : Thanh phan cua form ****
******************************************/
function FromSmallNowMonth(objFromMonth) {
    FromDate = '01/' + objFromMonth.value
    var now = new Date();
    var sMonth = (now.getMonth() + 1).toString();
    var sDay = now.getDate().toString();
    var sYear = now.getFullYear().toString();
    ToDate = sDay + '/' + sMonth + '/' + sYear;

    if ((!isBlank(FromDate)) && (!isBlank(ToDate))) {
        if (!IsSmaller(FromDate, ToDate)) {
            return false;
        }
        else
            return true;
    }
    else
        return true;
}
/******************************************
**** Kiem tra ngay nho hon ngay hien tai ****
**** objFromDate : Thanh phan cua form ****
******************************************/
function ToSmallNowMonth() {
    //alert('sss');
    /*FromDate = '01/' + objFromMonth.value	
    var now = new Date();
    var sMonth = (now.getMonth() + 1).toString();
    var sDay = now.getDate().toString();
    var sYear = now.getFullYear().toString();
    ToDate = sDay + '/' + sMonth + '/' + sYear;
  	
    if ((!isBlank(FromDate)) && (!isBlank(ToDate)))
    {
    alert('ddd');
    if  (!IsSmaller(ToDate,FromDate))
    {			
    return false;
    }
    else
    return true;
    }
    else
    return true;
    */
}
/******************************************
**** Kiem tra thang nho hon thang den ****
**** objFromDate : Thanh phan cua form ****
******************************************/
function FromSmallToMonth(objFromMonth, objToMonth) {
    if (isBlank(objFromMonth.value) || isBlank(objToMonth.value))
        return true;
    
    var ToDate, FromDate
    FromDate = '01/' + objFromMonth.value
    if (objToMonth.value == '')
        ToDate = '01/01/2100'
    else
        ToDate = '01/' + objToMonth.value

    if ((!isBlank(FromDate)) && (!isBlank(ToDate))) {
        if (!IsSmaller(FromDate, ToDate)) {
            //alert("FromDate must be less than ToDate!");
            //objToDate.focus()
            return false;
        }
        else
            return true;
    }
    else
        return true;
}

function FromSmallOrEqualToMonth(objFromMonth, objToMonth) {
    if (objFromMonth.value == "" || objToMonth.value == "")
        return true;
    //-----
    var ToDate, FromDate
    FromDate = '01/' + objFromMonth.value;
    if (objToMonth.value == '')
        ToDate = '01/01/2100'
    else
        ToDate = '01/' + objToMonth.value

    if ((!isBlank(FromDate)) && (!isBlank(ToDate))) {
        if (!IsSmallerOrEqual(FromDate, ToDate)) {
            //alert("FromDate must be less than ToDate!");
            //objToDate.focus()
            return false;
        }
        else
            return true;
    }
    else
        return true;
}

function FromSmallToMonth(objFromMonth, objToMonth) {
    var ToDate, FromDate
    FromDate = '01/' + objFromMonth.value;
    if (objToMonth.value == '')
        ToDate = '01/01/2100'
    else
        ToDate = '01/' + objToMonth.value

    if ((!isBlank(FromDate)) && (!isBlank(ToDate))) {
        if (!IsSmaller(FromDate, ToDate)) {
            //alert("FromDate must be less than ToDate!");
            //objToDate.focus()
            return false;
        }
        else
            return true;
    }
    else
        return true;
}

function FromSmallOrEqualToYear_RCB(objFromYear, objToYear) {
    var ToDate = ""; 
    var FromDate = "";
    
    // get client id of RadComboBox
    var comboFromYear = '_ctl0_' + objFromYear;
    var comboToYear = '_ctl0_' + objToYear;
    
    // get RadComboBox control by ClientID
    var comboFY = $find(comboFromYear);
    var comboTY = $find(comboToYear);
    if (comboFY != null && comboTY != null) {        
        if (comboFY.get_value() != "" && comboTY.get_value() != "") 
        {
            FromDate = '01/01/' + comboFY.get_value();
            ToDate = '01/01/' + comboTY.get_value();
                        
            if (!IsSmallerOrEqual(FromDate, ToDate)) {                        
                GetAlertError(iTotal, DSAlert, 'PR_TN001');
                comboFY.get_inputDomElement().focus();                
                return false;
            }
        }
        else
        {
            return true;
        }
    }
    return true;    
}

//Lay thang tu ngay
function MonthOfDate(inputStr) {
    var delim1 = inputStr.indexOf("/")
    var delim2 = inputStr.lastIndexOf("/")
    // lay ngay, thang, nam cua ngay1
    var dd = parseInt(inputStr.substring(0, delim1), 10)
    var mm = parseInt(inputStr.substring(delim1 + 1, delim2), 10)
    var yyyy = parseInt(inputStr.substring(delim2 + 1, inputStr.length), 10)
    var Month = mm + '/' + yyyy;
    return Month

}

function FromSmallToMonthValue(objFromMonth, objToMonth) {
    //alert(objToMonth.value)
    var ToDate, FromDate
    FromDate = '01/' + objFromMonth
    if (objToMonth == '')
        ToDate = '01/01/2100'
    else
        ToDate = '01/' + objToMonth

    if ((!isBlank(FromDate)) && (!isBlank(ToDate))) {
        if (!IsSmallerOrEqual(FromDate, ToDate)) {
            //alert("FromDate must be less than ToDate!");
            //objToDate.focus()
            return false;
        }
        else
            return true;
    }
    else
        return true;
}
function CheckQuarter(field) {
    if (checkNumeric(field) == false)
        return false;
    value = field.value;
    if (value != "1" && value != "2" && value != "3" && value != "4") {
        //alert("Quarter is invalid!");
        GetAlertError(iTotal, DSAlert, "0043");
        field.focus();
        return false;
    }
}

function Confirm_Delete() {

    if (confirm("Dòng được chọn sẽ bị xoá?"))
        return true;
    else
        return false;
}
function EmailCheck(obj) {
    emailStr = obj.value;
    if (emailStr == "")
        return true;
    var emailPat = /^(.+)@(.+)$/;
    var specialChars = "\\(\\)<>@,;:\\\\\\\"\\.\\[\\]";
    var validChars = "\[^\\s" + specialChars + "\]";
    var quotedUser = "(\"[^\"]*\")";
    var ipDomainPat = /^\[(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\]$/;
    var atom = validChars + '+';
    var word = "(" + atom + "|" + quotedUser + ")";
    var userPat = new RegExp("^" + word + "(\\." + word + ")*$");
    var domainPat = new RegExp("^" + atom + "(\\." + atom + ")*$");
    var matchArray = emailStr.match(emailPat);

    if (matchArray == null) {
        //alert("Email address seems incorrect (check @ and .'s)");
        GetAlertError(iTotal, DSAlert, "00005");
        obj.focus();
        return false;
    }

    var user = matchArray[1];
    var domain = matchArray[2];

    if (user.match(userPat) == null) {
        //alert("The username doesn't seem to be valid.");
        GetAlertError(iTotal, DSAlert, "00006");
        obj.focus();
        return false;
    }

    var IPArray = domain.match(ipDomainPat);

    if (IPArray != null) {
        for (var i = 1; i <= 4; i++) {
            if (IPArray[i] > 255) {
                //alert("Destination IP address is invalid!");
                GetAlertError(iTotal, DSAlert, "00007");
                obj.focus();
                return false;
            }
        }
        return true;
    }

    var domainArray = domain.match(domainPat);
    if (domainArray == null) {
        //alert("The domain name doesn't seem to be valid.");
        GetAlertError(iTotal, DSAlert, "00008");
        obj.focus();
        return false;
    }

    var atomPat = new RegExp(atom, "g");
    var domArr = domain.match(atomPat);
    var len = domArr.length;
    if (domArr[domArr.length - 1].length < 2 ||
		domArr[domArr.length - 1].length > 3) {

        //alert("The address must end in a three-letter domain, or two letter country.");
        GetAlertError(iTotal, DSAlert, "00009");
        obj.focus();
        return false;
    }

    if (len < 2) {
        //		var errStr="This address is missing a hostname!";
        //		alert(errStr);
        GetAlertError(iTotal, DSAlert, "00015");
        obj.focus();
        return false;
    }

    return true;
}

//Show calendar
function ShowCalendar(field) {
    document.all[field].value = window.showModalDialog('Calendar.htm', document.all[field].value, 'dialogLeft:450px;dialogTop:300px;dialogHeight:210px;dialogWidth:265px;center:No;help:No;scroll:No;resizable:No;status:No;');
    //return false;
}

function CheckScanCode(field) {
    if (field.value.length != 5 && field.value.length > 0) {
        GetAlertError(iTotal, DSAlert, "0055");
        field.value = "";
        field.focus();
    }
    //return false;
}

function CheckMonthYear(field) {
    var checkstr = "0123456789";
    var DateField = field;
    var Datevalue = "";
    var DateTemp = "";
    var seperator = "/";
    var month;
    var year;
    var leap = 0;
    var err = 0;
    var i;
    err = 0;
    DateValue = DateField.value;
    if (DateValue == "") return;
    /* Delete all chars except 0..9 */
    for (i = 0; i < DateValue.length; i++) {
        if (checkstr.indexOf(DateValue.substr(i, 1)) >= 0) {
            DateTemp = DateTemp + DateValue.substr(i, 1);
        }
    }
    DateValue = DateTemp;
    /* Always change date to 6 digits - string*/
    /* if year is entered as 2-digit / always assume 20xx */
    if (DateValue.length == 4) {
        DateValue = DateValue.substr(0, 2) + '20' + DateValue.substr(2, 2);
    }

    if (DateValue.length != 6) {
        err = 19;
    }
    /* year is wrong if year = 0000 */
    year = DateValue.substr(2, 4);
    if (year < 1900) {
        err = 20;
    }
    if (year == 0) {
        err = 20;
    }
    /* Validation of month*/
    month = DateValue.substr(0, 2);
    if ((month < 1) || (month > 12)) {
        err = 21;
    }
    /* if 00 ist entered, no error, deleting the entry */
    if ((month == 0) && (year == 00)) {
        err = 0; month = ""; year = ""; seperator = "";
    }
    if (err == 0) {
        DateField.value = month + seperator + year;
        if (DateField.value == "") {
            //alert("Ð?nh d?ng d? li?u ki?u: mm/yyyy!");
            GetAlertError(iTotal, DSAlert, "0042");
            DateField.focus();
        }
    }
    /* Error-message if err != 0 */
    else {
        DateField.value = "";
        DateField.focus();
        //alert("Ð?nh d?ng d? li?u ki?u: mm/yyyy!");
        GetAlertError(iTotal, DSAlert, "0042");
    }
}
// -- report 
function ShowReport(report, sql, param, value, path) {
    t = screen.height - 30;
    w = screen.width - 10;
    sql = GetParamReport(sql);
    //FileWindow = window.open(path + '/Reports/COMM_ReportGen.asp?report=' + report + '&sql=' + sql + '&formula=' + param + '&Value=' + value ,'_blank','width=' + w + ', height=' + t + ', left=0, top=0, location=no, scrollbars=yes,resizable');								
    //alert('http://localhost/iHRPCore/Reports/COMM_ReportGen.asp?report=' + report + '&sql=' + sql + '&formula=' + param + '&Value=' + value);
    alert('http://localhost/iHRPCore/Reports/COMM_ReportGen.asp?report=' + report + '&sql=' + sql + '&formula=' + param + '&Value=' + value);

    FileWindow = window.open('http://localhost/iHRPCore/Reports/COMM_ReportGen.asp?report=' + report + '&sql=' + sql + '&formula=' + param + '&Value=' + value, '_blank', 'width=' + w + ', height=' + t + ', left=0, top=0, location=no, scrollbars=yes,resizable');
    FileWindow.focus();
    return true;
}
function replaceChars(entry) {
    out = ","; // replace this
    add = ""; // with this
    temp = "" + entry; // temporary holder

    while (temp.indexOf(out) > -1) {
        pos = temp.indexOf(out);
        temp = "" + (temp.substring(0, pos) + add +
		temp.substring((pos + out.length), temp.length));
    }
    return temp;
}
function GetParamReport(str) {
    for (i = 0; i < window.document.forms(0).length - 1; i++) {
        obj = window.document.forms(0).item(i);

        if (str.indexOf(obj.id) != -1 && obj.id != '') {

            str = str.replace(obj.id, 'N[' + obj.value);
        }
    }
    while (str.indexOf('"') != -1) {
        str = str.replace('"', "'");
        str = str.replace("'N[", "N'");
    }
    return str;
}
/*function GetAlertError(iTotal,obj,sMess)
{		
var sReturnValue="";
var i;
for (i=0;i<=iTotal;i++)
{			
if (obj[0][i]==sMess)
{								
alert(obj[1][i]);	
return;		
}
}
	
}*/
function GetThongBao(noidung) {
    snMsg = noidung;
    snTitle = 'Thông báo';
    return;
}

function GetAlertError(iTotal, obj, sMess) {
    var sReturnValue = "";
    var i;
    for (i = 0; i <= iTotal; i++) {
        if (obj[0][i] == sMess) {
            snMsg = obj[1][i];
            snTitle = 'Thông báo - Alert';
            document.getElementById('btnShow').onclick();
            return false;
        }
    }
    return false;
}

//DanL : 20120514 ==> replace tham số trong câu thông báo
function GetAlertError_Replace(iTotal, obj, sMess, Replaced, By) {
    var sReturnValue = "";
    var i;
    for (i = 0; i <= iTotal; i++) {
        if (obj[0][i] == sMess) {
            snMsg = obj[1][i];
            snMsg = snMsg.replace(Replaced, By);
            snTitle = 'Thông báo - Alert';
            document.getElementById('btnShow').onclick();
            return false;
        }
    }
    return false;
} //End DanL : 20120514


function GetAlertTextPopUp(sMess) {
    snMsg = sMess;
    snTitle = 'Thông báo - Alert';
    document.getElementById('btnShow').onclick();
}

function GetAlertText(iTotal, obj, sMess) {
    var sReturnValue = "";
    var i;
    for (i = 0; i <= iTotal; i++) {
        if (obj[0][i] == sMess) {
            return obj[1][i];
            break;
        }

    }
}

//QuangPNV : 31/05/2012
function GetAlertText_Replace(iTotal, obj, sMess, Replaced, By) {
    var sReturnValue = "";
    var i;
    for (i = 0; i <= iTotal; i++) {
        if (obj[0][i] == sMess) {
            sReturnValue = obj[1][i];
            sReturnValue = sReturnValue.replace(Replaced, By);                                        
            return sReturnValue;
            break;
        }

    }
}
//End QuangPNV : 31/05/2012

/*Tanldt*/
/*
function chkSelect_OnClick(tableRow, checkBox, rowIndex)
{
var bgColor;
if(rowIndex%2 == 0)
bgColor = "#ffffff";
else
bgColor = "#f5f5f5";
if(checkBox.checked == true)
tableRow.style.backgroundColor = "#b0c4de";
else
tableRow.style.backgroundColor = bgColor;
}


function chkSelectAll_OnClick(checkBox,dtgList)
{
re = new RegExp('_chkSelect$')
var j = 0;
for(i = 0; i < document.forms[0].elements.length; i++) 
{
elm = document.forms[0].elements[i]
if (elm.type == 'checkbox') 
{
if (re.test(elm.id)) 
{
elm.checked = checkBox.checked;
var tableId = dtgList.toString() + "_row" + j.toString();
if (tableId != "")
{
var rowIndex = tableId.substring(tableId.length - 1, tableId.length);
chkSelect_OnClick(document.getElementById(tableId), elm, rowIndex);
}
j++;
}
}
		
}	
}
*/
//How To Move Items Between Lists with JavaScript
var selectedList;
var availableList;


   
function createListObjects(sSelectedOptions, sAvailableOptions) {
    availableList = document.getElementById(sAvailableOptions);
    selectedList = document.getElementById(sSelectedOptions);
   
}
function delAttribute() {
    //var selIndex = selectedList.selectedIndex;
    var selIndex;
    for (var i = selectedList.length - 1; i >= 0; i--) {
        if (selectedList.options[i].selected == true) {
            selIndex = selectedList.options[i].index;
            if (selIndex < 0)
                return;
            availableList.appendChild(selectedList.options.item(selIndex))
        }
    }
    selectNone(selectedList, availableList);
    setSize(availableList, selectedList);
}

function addAttribute() {
   //var addIndex = availableList.selectedIndex;
    var addIndex;
    var arr = new Array();
    for (var i = availableList.length - 1; i >= 0; i--) {
        if (availableList.options[i].selected == true) {
            addIndex = availableList.options[i].index;
            if (addIndex < 0)
                return;
           
            arr.push(availableList.options.item(addIndex));
            
        }
    }
    //arr.sort();
    for(var j=arr.length-1;j>=0;j--)
        selectedList.appendChild(arr[j]); 
    selectNone(selectedList, availableList);
    setSize(selectedList, availableList);
}



function delAll() {
    var len = selectedList.length - 1;
    for (i = len; i >= 0; i--) {
        availableList.appendChild(selectedList.item(i));
    }
    selectNone(selectedList, availableList);
    setSize(selectedList, availableList);

}
function addAll() {
    var len = availableList.length - 1;
    for (i = len; i >= 0; i--) {
        selectedList.appendChild(availableList.item(i));
    }
    selectNone(selectedList, availableList);
    setSize(selectedList, availableList);

}
function selectNone(list1, list2) {
    list1.selectedIndex = -1;
    list2.selectedIndex = -1;
    addIndex = -1;
    selIndex = -1;
}
function setSize(list1, list2) {
    list1.size = getSize(list1);
    list2.size = getSize(list2);
}
function getSize(list) {
    /* Mozilla ignores whitespace, IE doesn't - count the elements in the list */
    var len = list.childNodes.length;
    var nsLen = 0;
    //nodeType returns 1 for elements
    for (i = 0; i < len; i++) {
        if (list.childNodes.item(i).nodeType == 1)
            nsLen++;
    }
    if (nsLen < 2)
        return 2;
    else
        return nsLen;
}
function showSelected() {
    var optionList = document.getElementById("selectedOptions").options;
    var data = '';
    var len = optionList.length;
    for (i = 0; i < len; i++) {
        if (i > 0)
            data += ',';
        data += optionList.item(i).value;
    }
    alert(data);
}

//How To Move Items Between Lists with JavaScript 2 => cặp listbox 2
var selectedList2;
var availableList2;
function createListObjects2(sSelectedOptions, sAvailableOptions) {
    availableList2 = document.getElementById(sAvailableOptions);
    selectedList2 = document.getElementById(sSelectedOptions);
}
function delAttribute2() {
    //var selIndex = selectedList.selectedIndex;
    var selIndex;
    for (var i = selectedList2.length - 1; i >= 0; i--) {
        if (selectedList2.options[i].selected == true) {
            selIndex = selectedList2.options[i].index;
            if (selIndex < 0)
                return;
            availableList2.appendChild(selectedList2.options.item(selIndex))
        }
    }
    selectNone(selectedList2, availableList2);
    setSize(availableList2, selectedList2);
}
function addAttribute2() {
    //var addIndex = availableList.selectedIndex;
    var addIndex;
    for (var i = availableList2.length - 1; i >= 0; i--) {
        if (availableList2.options[i].selected == true) {
            addIndex = availableList2.options[i].index;
            if (addIndex < 0)
                return;
            selectedList2.appendChild(availableList2.options.item(addIndex));
        }
    }
    selectNone(selectedList2, availableList2);
    setSize(selectedList2, availableList2);
}
function delAll2() {
    var len = selectedList2.length - 1;
    for (i = len; i >= 0; i--) {
        availableList2.appendChild(selectedList2.item(i));
    }
    selectNone(selectedList2, availableList2);
    setSize(selectedList2, availableList2);

}
function addAll2() {
    var len = availableList2.length - 1;
    for (i = len; i >= 0; i--) {
        selectedList2.appendChild(availableList2.item(i));
    }
    selectNone(selectedList2, availableList2);
    setSize(selectedList2, availableList2);

}

//How To Move Items Between Lists with JavaScript 3 => cặp listbox 3
var selectedList3;
var availableList3;
function createListObjects3(sSelectedOptions, sAvailableOptions) {
    availableList3 = document.getElementById(sAvailableOptions);
    selectedList3 = document.getElementById(sSelectedOptions);
}
function delAttribute3() {
    //var selIndex = selectedList.selectedIndex;
    var selIndex;
    for (var i = selectedList3.length - 1; i >= 0; i--) {
        if (selectedList3.options[i].selected == true) {
            selIndex = selectedList3.options[i].index;
            if (selIndex < 0)
                return;
            availableList3.appendChild(selectedList3.options.item(selIndex))
        }
    }
    selectNone(selectedList3, availableList3);
    setSize(availableList3, selectedList3);
}
function addAttribute3() {
    //var addIndex = availableList.selectedIndex;
    var addIndex;
    for (var i = availableList3.length - 1; i >= 0; i--) {
        if (availableList3.options[i].selected == true) {
            addIndex = availableList3.options[i].index;
            if (addIndex < 0)
                return;
            selectedList3.appendChild(availableList3.options.item(addIndex));
        }
    }
    selectNone(selectedList3, availableList3);
    setSize(selectedList3, availableList3);
}
function delAll3() {
    var len = selectedList3.length - 1;
    for (i = len; i >= 0; i--) {
        availableList3.appendChild(selectedList3.item(i));
    }
    selectNone(selectedList3, availableList3);
    setSize(selectedList3, availableList3);

}
function addAll3() {
    var len = availableList3.length - 1;
    for (i = len; i >= 0; i--) {
        selectedList3.appendChild(availableList3.item(i));
    }
    selectNone(selectedList3, availableList3);
    setSize(selectedList3, availableList3);

}
//----------------------------------------------------
function delAttribute_QuangPNV() {
    //var selIndex = selectedList.selectedIndex;
    var selIndex;
    for (var i = selectedList.length - 1; i >= 0; i--) {
        if (selectedList.options[i].selected == true) {
            selIndex = selectedList.options[i].index;
            if (selIndex < 0)
                return;
            availableList.appendChild(selectedList.options.item(selIndex))
        }
    }
    selectNone(selectedList, availableList);
    setSize(availableList, selectedList);
    return false;
}

function addAttribute_QuangPNV() {
    //var addIndex = availableList.selectedIndex;
    var addIndex;
    for (var i = availableList.length - 1; i >= 0; i--) {
        if (availableList.options[i].selected == true) {
            addIndex = availableList.options[i].index;
            if (addIndex < 0)
                return;
            selectedList.appendChild(availableList.options.item(addIndex));
        }
    }
    selectNone(selectedList, availableList);
    setSize(selectedList, availableList);
    return false;
}
function delAll_QuangPNV() {
    var len = selectedList.length - 1;
    for (i = len; i >= 0; i--) {
        availableList.appendChild(selectedList.item(i));
    }
    selectNone(selectedList, availableList);
    setSize(selectedList, availableList);
    return false;
}
function addAll_QuangPNV() {
    var len = availableList.length - 1;
    for (i = len; i >= 0; i--) {
        selectedList.appendChild(availableList.item(i));
    }
    selectNone(selectedList, availableList);
    setSize(selectedList, availableList);
    return false;
}

//----------------------------------------------------

/*Cangtt - check value not used on list*/
function checkCboValue(Fields) {
    if (Fields.selectedIndex != -1) {
        var sText = Fields.options[Fields.selectedIndex].text;

        var sCompare = sText.substring(sText.length - 10, sText.length);
        var sCompareVN = sText.substring(sText.length - 5, sText.length);
        if (sCompare == '<not used>') {
            GetAlertTextPopUp('This selected value not used in list!')
            //GetAlertTextPopUp('Mục chọn không được sử dụng trong danh sách!')		
        }
        if (sCompareVN == '<KSD>') {
            //GetAlertTextPopUp('This selected value not used in list!')		
            GetAlertTextPopUp('Mục chọn không được sử dụng trong danh sách!')
        }
    }
}

function OnMouseOver(field,object) {
    try {
        var selected = $find(field).get_selectedItem().get_value();
        var item = $find(field).findItemByValue(selected);
        /* do selecteditem khong lay duoc attribute title nen phai thay the attribute title bang attribute Color1 */
        if ((item.get_attributes().getAttribute("Color1") != undefined) && (item.get_attributes().getAttribute("Color1") != ""))
            object.title = item.get_attributes().getAttribute("Color1");
    } catch (e) { }
}

/* ThanhDC - check value not used on RadComboBox list */
function checkRadCboValue(Fields) {
    if (Fields.selectedIndex != -1) {
        var sText = Fields.value;
        if(sText != "")
        {
            var sCompare = sText.substring(sText.length - 10, sText.length);
            var sCompareVN = sText.substring(sText.length - 5, sText.length);
            if (sCompare == '<not used>') {
                GetAlertTextPopUp('This selected value not used in list!')
                //GetAlertTextPopUp('Mục chọn không được sử dụng trong danh sách!')		
            }
            if (sCompareVN == '<KSD>') {
                //GetAlertTextPopUp('This selected value not used in list!')		
                GetAlertTextPopUp('Mục chọn không được sử dụng trong danh sách!')
            }
        }
    }
}

function checkEvent(e) {
    if (!e) var e = window.event;
    if (e.target) targ = e.target;
    else if (e.srcElement) targ = e.srcElement;
    showHideToolTip(targ, e, e.type)
}
// This function shows/hides the tooltip
function showHideToolTip(theDropDown, e, eType) {
    var toolTipObj = new Object();
    toolTipObj = document.getElementById("tooltip");
    toolTipObj.innerHTML = theDropDown.options[theDropDown.selectedIndex].value;
    if (eType == "mouseout") {
        toolTipObj.style.display = "none";
    } else {
        toolTipObj.style.display = "inline";
        toolTipObj.style.top = e.y + 15;
        toolTipObj.style.left = e.x + 10;
    }
}
function keySort(dropdownlist, caseSensitive) {
    // check the keypressBuffer attribute is defined on the dropdownlist 
    var undefined;
    if (dropdownlist.keypressBuffer == undefined) {
        dropdownlist.keypressBuffer = '';
    }
    // get the key that was pressed 
    var key = String.fromCharCode(window.event.keyCode);
    dropdownlist.keypressBuffer += key;
    if (!caseSensitive) {
        // convert buffer to lowercase
        dropdownlist.keypressBuffer = dropdownlist.keypressBuffer.toLowerCase();
    }
    // find if it is the start of any of the options 
    var optionsLength = dropdownlist.options.length;
    for (var n = 0; n < optionsLength; n++) {
        var optionText = dropdownlist.options[n].text;
        if (!caseSensitive) {
            optionText = optionText.toLowerCase();
        }
        if (optionText.indexOf(dropdownlist.keypressBuffer, 0) == 0) {
            dropdownlist.selectedIndex = n;
            return false; // cancel the default behavior since 
            // we have selected our own value 
        }
    }
    // reset initial key to be inline with default behavior 
    dropdownlist.keypressBuffer = key;
    return true; // give default behavior 
}
// HangTK [28/05/2009] thong tin chu ky luong (cua rieng du an PVFCCo_iHRP)
function getChuKyLuong(objThang, objNam, objTuNgay, objDenNgay) {
    var thang = document.getElementById(objThang).value;
    if (thang == '') {
        document.getElementById(objTuNgay).value = '';
        document.getElementById(objDenNgay).value = '';
        return;
    }
    var nam = document.getElementById(objNam).value;
    var thangFromDate = parseInt(thang) - 1;
    var thangToDate = thang;
    var namFromDate = nam;
    var namToDate = nam;

    if (thangFromDate == '0') {
        thangFromDate = 12;
        namFromDate = parseInt(nam) - 1;
    }

    if (thangFromDate < 10)
        thangFromDate = '0' + thangFromDate;
    if (thangToDate < 10)
        thangToDate = '0' + thangToDate;

    document.getElementById(objTuNgay).value = '27' + '/' + thangFromDate + '/' + namFromDate;
    document.getElementById(objDenNgay).value = '26' + '/' + thangToDate + '/' + namToDate;
}


function TableAutoCheck(obj, indexCheck) {
    if (obj.value != "") {
        var objRow = obj.parentNode.parentNode; //Lấy row chứa đối tượng
        objRow.cells[indexCheck].childNodes[0].checked = true;
    }
}

//Kiểm tra table có check chọn
function TableIsCheck(sTenTable, iCellIndex, bool) {
    var Table = document.getElementById(sTenTable);
    for (var i = 1; i < Table.rows.length; i++) {
        var check = Table.rows[i].cells[iCellIndex].childNodes[0].checked
        if (check == true)
            return true;
    }

    if (bool == true)
        alert("Vui lòng chọn ít nhất 1 mẫu tin!");

    return false;
}

//CheckAll cho table
function TableCheckAll(obj) //--obj: control html của checkbox;
{
    var Table = obj.parentNode.parentNode.parentNode; //Lấy table chứa đối tượng

    var iNumCotAn = 0; //-- số cột ẩn của table
    for (var i = 0; i < Table.rows[0].cells.length; i++) {
        if (Table.rows[0].cells[i].style.display == "none")
            iNumCotAn = iNumCotAn + 1;
    }

    for (var j = 1; j < Table.rows.length; j++) {

        var chk = Table.rows[j].cells[obj.parentNode.cellIndex + iNumCotAn].childNodes[0];
        chk.checked = obj.checked;
    }
}

//NgocLD: 07/08/2009 Check all cho control datagrid
function GridCheckAll(sTendataGrid, sTenCheckAll, sTenCheckBox) {
    var objTable = GetControl(sTendataGrid);

    var iRowNumber = objTable.rows.length;
    var index = 2;

    //--Dòng cuối có phải là dòng phân trang không

    if (objTable.rows[iRowNumber - 1].cells[0].colSpan > 1)
        iRowNumber = iRowNumber - 1;

    else
        index = index - 1;
    //--end--


    var objCheckAll = GetControl(sTendataGrid + "__ctl" + index + "_" + sTenCheckAll);
    for (var i = 1; i < iRowNumber; i++) {
        var chk = GetControl(sTendataGrid + "__ctl" + (i + index) + "_" + sTenCheckBox);
        if (chk.disabled == false)
            chk.checked = objCheckAll.checked;
    }
}

//NgocLD: 07/08/2009 Kiểm tra control datagrid có check chọn
function GridIsCheck(sTendatagList, sTenCheckBox, bool) {
    var objTable = GetControl(sTendatagList);

    var iRowNumber = objTable.rows.length;
    var index = 2;

    //--Dòng cuối có phải là dòng phân trang không
    if (objTable.rows[iRowNumber - 1].cells[0].colSpan > 1)
        iRowNumber = iRowNumber - 1;

    else
        index = index - 1;
    //--end--


    for (var i = 1; i < iRowNumber; i++) {
        var chk = GetControl(sTendatagList + "__ctl" + (i + index) + "_" + sTenCheckBox);
        if (chk.checked)
            return true;
    }

    if (bool == true)
        alert("Vui lòng chọn ít nhất 1 mẫu tin!");
    return false;
}


//NgocLD: 07/08/2009 Kiểm tra control datagrid có chọn thông tin yêu cầu
function GridIsNotNullAllControl(sTendataGrid, sTenCheckBox, sTenControl, sThongBao) {
    var objTable = GetControl(sTendataGrid);

    var iRowNumber = objTable.rows.length;
    var index = 2;

    //--Dòng cuối có phải là dòng phân trang không
    if (objTable.rows[iRowNumber - 1].cells[0].colSpan > 1)
        iRowNumber = iRowNumber - 1;

    else
        index = index - 1;
    //--end--

    for (var i = 1; i < iRowNumber; i++) {
        var chk = GetControl(sTendataGrid + "__ctl" + (i + index) + "_" + sTenCheckBox);
        if (chk.checked) {
            var obj = GetControl(sTendataGrid + "__ctl" + (i + index) + "_" + sTenControl);

            if (obj.type.toLowerCase() == "text") {
                if (obj.value == "") {
                    if (sThongBao != null)
                        alert("Vui lòng nhập " + sThongBao);
                    obj.focus();
                    return false;
                }
            }

            if (obj.type.toLowerCase().match("select") != null) {
                if (obj.options[obj.selectedIndex].value == "") {
                    if (sThongBao != null)
                        alert("Vui lòng chọn " + sThongBao);
                    obj.focus();
                    return false;
                }
            }
        }
    }
    return true;
}




//Ngọc LD: 09/07/2009
function IsNotNullControl(sTenControl, sThongBao) //input: kiểu string
{
    // Kiểm tra control (textbox, dropdownlist ) có thông tin hay không ?
    var obj = document.getElementById("_ctl0_" + sTenControl);
    if (obj.type.toLowerCase() == "text") {
        if (obj.value == "") {
            if (sThongBao != null)
                alert("Vui lòng nhập " + sThongBao);
            obj.focus();
            return false;
        }
    }

    if (obj.type.toLowerCase().match("select") != null) {
        if (obj.options[obj.selectedIndex].value == "") {
            if (sThongBao != null)
                alert("Vui lòng chọn " + sThongBao);
            obj.focus();
            return false;
        }
    }
    return true;
}

//Ngọc LD: 09/07/2009
function SetDateVN(iDay, iMonth, iYear) //inpt: kiểu tring ; return kiểu(Date)
{
    try {
        if (!(iDay >= 1 && iDay <= 31))
            throw "Ngay";

        if (!(iMonth >= 1 && iMonth <= 12))
            throw "Thang";

        if (iYear < 1)
            throw "Nam";

        var myDate = new Date();
        myDate.setFullYear(iYear, iMonth - 1, iDay);
        return myDate;
    }
    catch (err) {
        if (err == "Ngay")
            alert("Lỗi vi phạm Ngày");

        else if (err == "Thang")
            alert("Lỗi vi phạm Tháng");

        else if (err == "Nam")
            alert("Lỗi vi phạm Năm");

        else
            alert(err.discription);
        return null;
    }
}

//Ngọc LD: 09/07/2009
function ConvertDateVN(Date, c) //input: Date (kiểu Date); c(kiểu tring);return dd/MM/yyyy (kiểu string)
{
    var iDay = Date.getDate();
    iDay = iDay < 10 ? ("0" + iDay) : iDay;

    var iMonth = Date.getMonth() + 1;
    iMonth = iMonth < 10 ? ("0" + iMonth) : iMonth;

    var iYear = Date.getFullYear();

    if (c != null)
        return (iDay + c + iMonth + c + iYear);
    return (iDay + '/' + iMonth + '/' + iYear);
}


//Ngọc LD: 09/07/2009
function NgayNhoHon(sDate1, sDate2)//Kiểu dữ liệu của sDate1,sDate2: kiểu chuỗi dạng (dd/MM/yyyy)
{
    var Ngay1 = parseInt(sDate1.substring(0, 2), 10);
    var Thang1 = parseInt(sDate1.substring(3, 5), 10);
    var Nam1 = parseInt(sDate1.substring(6, 10), 10);

    var Ngay2 = parseInt(sDate2.substring(0, 2), 10);
    var Thang2 = parseInt(sDate2.substring(3, 5), 10);
    var Nam2 = parseInt(sDate2.substring(6, 10), 10);

    if (Nam1 < Nam2)
        return true;
    else if (Nam1 > Nam2)
        return false;
    else //Nam1 = Nam2
    {
        if (Thang1 < Thang2)
            return true;
        else if (Thang1 > Thang2)
            return false;
        else //Thang1 = Thang2
        {
            if (Ngay1 < Ngay2)
                return true;
            else
                return false;
        }
    }
}


//Ngọc LD: 09/07/2009
function NgayNhoHonBang(sDate1, sDate2)//Kiểu dữ liệu của sDate1,sDate2: kiểu chuỗi dạng (dd/MM/yyyy)
{
    var Ngay1 = parseInt(sDate1.substring(0, 2), 10);
    var Thang1 = parseInt(sDate1.substring(3, 5), 10);
    var Nam1 = parseInt(sDate1.substring(6, 10), 10);

    var Ngay2 = parseInt(sDate2.substring(0, 2), 10);
    var Thang2 = parseInt(sDate2.substring(3, 5), 10);
    var Nam2 = parseInt(sDate2.substring(6, 10), 10);


    //Ngày khác nhau
    if (Nam1 < Nam2)
        return true;
    else if (Nam1 > Nam2)
        return false;
    else //Nam1 = Nam2
    {
        if (Thang1 < Thang2)
            return true;
        else if (Thang1 > Thang2)
            return false;
        else //Thang1 = Thang2
        {
            if (Ngay1 <= Ngay2)
                return true;
            else
                return false;
        }
    }
}

//Ngọc LD: 09/07/2009
function NgayLonHon(sDate1, sDate2)//Kiểu dữ liệu của sDate1,sDate2: kiểu chuỗi dạng (dd/MM/yyyy)
{
    var Ngay1 = parseInt(sDate1.substring(0, 2), 10);
    var Thang1 = parseInt(sDate1.substring(3, 5), 10);
    var Nam1 = parseInt(sDate1.substring(6, 10), 10);

    var Ngay2 = parseInt(sDate2.substring(0, 2), 10);
    var Thang2 = parseInt(sDate2.substring(3, 5), 10);
    var Nam2 = parseInt(sDate2.substring(6, 10), 10);

    if (Nam1 > Nam2)
        return true;
    else if (Nam1 < Nam2)
        return false;
    else //Nam1 = Nam2
    {
        if (Thang1 > Thang2)
            return true;
        else if (Thang1 < Thang2)
            return false;
        else //Thang1 = Thang2
        {
            if (Ngay1 > Ngay2)
                return true;
            else
                return false;
        }
    }
}

//Ngọc LD: 09/07/2009
function NgayLonHonBang(sDate1, sDate2)//Kiểu dữ liệu của sDate1,sDate2: kiểu chuỗi dạng (dd/MM/yyyy)
{
    var Ngay1 = parseInt(sDate1.substring(0, 2), 10);
    var Thang1 = parseInt(sDate1.substring(3, 5), 10);
    var Nam1 = parseInt(sDate1.substring(6, 10), 10);

    var Ngay2 = parseInt(sDate2.substring(0, 2), 10);
    var Thang2 = parseInt(sDate2.substring(3, 5), 10);
    var Nam2 = parseInt(sDate2.substring(6, 10), 10);

    //Ngày khác nhau
    if (Nam1 > Nam2)
        return true;
    else if (Nam1 < Nam2)
        return false;
    else //Nam1 = Nam2
    {
        if (Thang1 > Thang2)
            return true;
        else if (Thang1 < Thang2)
            return false;
        else //Thang1 = Thang2
        {
            if (Ngay1 >= Ngay2)
                return true;
            else
                return false;
        }
    }
}

//Ngọc LD: 10/08/2009
function NgayNamTrongDoan(sDate, sDate1, sDate2)//Kiểu dữ liệu của sDate, sDate1,sDate2: kiểu chuỗi dạng (dd/MM/yyyy)
{
    if (NgayLonHon(sDate1, sDate2))
        return false;

    if (NgayNhoHon(sDate, sDate1))
        return false;

    if (NgayLonHon(sDate, sDate2))
        return false;

    return true;
}


//Ngọc LD: 09/07/2009
function GetControl(TenControl) {
    return document.getElementById("_ctl0_" + TenControl);
}

function GetValueControl(TenControl) {
    var obj = document.getElementById("_ctl0_" + TenControl);

    if (obj.type.toLowerCase() == "text")
        return obj.value;

    if (obj.type.toLowerCase().match("select") != null)
        return obj.options[obj.selectedIndex].value;
}

//Convert số về dạng số thập phân (với iNum là phần thập phân)
function CheckDecimal(obj, iNum) {
    //--yêu cầu obj.value là kiểu số

    //Bỏ số 0 ở các vị trí đầu tiên
    var lap = obj.value.length;
    for (var i = 0; i < lap; i++) {
        if (obj.value.indexOf('0') == 0)
            obj.value = obj.value.substring(1, obj.value.length);
    }

    if (obj.value == "")
        return;

    if (obj.value.indexOf('.') == -1) //--Nếu không có dấu '.'
    {
        obj.value += '.';
        for (var i = 0; i < iNum; i++)
            obj.value += '0';
    }

    else //--Nếu có dấu '.'
    {
        var iDem = 0;
        for (var i = 0; i < obj.value.length; i++) {
            if (obj.value[i] == '.')
                iDem++;
        }

        if (iDem >= 2) {
            alert("Giá trị không hợp lệ");
            obj.value = "";
            return;
        }

        else //Số chỉ có 1 dấu '.'
        {
            //--Dấu '.' ở vị trí đầu tiền --> Thêm 0 phía trước
            if (obj.value.indexOf('.') == 0)
                obj.value = '0' + obj.value;

            //--Dấu '.' ở vị trí cuối cùng --> Thêm 0 phía sau
            if (obj.value.indexOf('.') == obj.value.length - 1) {
                for (var i = 0; i < iNum; i++)
                    obj.value += '0';
            }
        }

        //Định dạng chính xác thập phân và làm tròn số		
        var iKetQua = parseFloat(obj.value, 10).toFixed(iNum);
        obj.value = iKetQua;
    }
}

// SonPQ add 20091224 show popup to get EmpID or UserID
function OpenPopUpEmpSearch(ctl, returnField) {
    CurWindow = window.open('FormPage.aspx?Ascx=Common/Form/EmpSearchPopup.ascx&Return=' + returnField + '&txtName=' + ctl.id, 'SearchEmp', 'toolbar=0,status=no,menubar=no,scrollbars=1,resizable=yes,copyhistory=yes,width=650,height=700,align=top');
    CurWindow.focus();
    return;
}
//TruyenNG:14/01/2011
// Hàm cắt các ký tự trắng ở đầu chuỗi
function LTrim(value) {
    var re = /\s*((\S+\s*)*)/;
    return value.replace(re, "$1");
}
// Hàm cắt ký tự trắng ở cuối chuỗi
function RTrim(value) {
    var re = /((\s*\S+)*)\s*/;
    return value.replace(re, "$1");
}
// Cắt các ký tự trắng ở đầu và cuối chuỗi
function TrimLR(value) {
    return LTrim(RTrim(value));
}
function CheckIsNull(obj) {
    if (document.getElementById('content_' + obj) == null)
        return true;
    if (TrimLR(document.getElementById('content_' + obj).value) == "") {
        $.notify("Không được để trống trường này", {
            className: 'error',
            globalPosition: 'bottom right'
        });
        document.getElementById('content_' + obj).value = "";
        setTimeout(function () { document.getElementById('content_' + obj).focus(); }, 0);
        return false;
    }
}

function CheckIsNull_SetColor(obj, MessCode) {
    if (document.getElementById('_ctl0_' + obj) == null)
        return true;
    if (TrimLR(document.getElementById('_ctl0_' + obj).value) == "") {
        GetAlertError(iTotal, DSAlert, MessCode);
        SetColorControl(document.getElementById('_ctl0_' + obj),1);
        document.getElementById('_ctl0_' + obj).value = "";
        document.getElementById('_ctl0_' + obj).focus();
        return false;
    }
    SetColorControl(document.getElementById('_ctl0_' + obj),2);
}

function CheckIsNull_Obj_SetColor(obj, blFocus, MessCode) {
    if (obj == null)
        return true;
    if (TrimLR(obj.value) == "") {
        if(MessCode != ""){
            GetAlertError(iTotal, DSAlert, MessCode);
        }
        SetColorControl(obj,1);
        obj.value = "";
        if(blFocus == true){
            obj.focus();
        }
        return false;
    }
    SetColorControl(obj,2);
}

function CheckIsNull_SetColor_ReadOnly(obj, MessCode) {
    if (document.getElementById('_ctl0_' + obj) == null)
        return true;
    if (TrimLR(document.getElementById('_ctl0_' + obj).value) == "") {
        GetAlertError(iTotal, DSAlert, MessCode);
        SetColorControl(document.getElementById('_ctl0_' + obj),1);
        document.getElementById('_ctl0_' + obj).value = "";
        document.getElementById('_ctl0_' + obj).focus();
        return false;
    }
    SetColorControl(document.getElementById('_ctl0_' + obj),3);
}

//QuangPNV: Ap dung cho Gio - Phut
function checkIsNullReturn00(strobj) {
    if (strobj.value == "") {
        strobj.value = "00";
    }
}

// Check is null & set focus RadComboBox - Telerik control	
function CheckIsNull_RCB(obj) {
    // get client id of RadComboBox
    var comboClientID = 'ctl00_content_' + obj;
    // get RadComboBox control by ClientID
    var combo = $find(comboClientID);
    if (combo != null) {
        // check is null  value of RadComboBox    
        if (combo.get_value() == "") {
            // display error message
            // set focus to input area of RadComboBox
            $.notify("Không được để trống trường này", {
                className: 'error',
                globalPosition: 'bottom right'
            });
            var inputArea = combo.get_inputDomElement();
            setTimeout(function () { inputArea.focus(); }, 0);

            return false;
        }
    }
    else {
//        alert(obj);
//        alert(comboClientID);
    }
    return true;
}

// QuangPNV: Check is null & set focus RadComboBox - Telerik control	
function CheckIsNull_SetColor_RCB(obj, MessCode) {
    // get client id of RadComboBox
    var comboClientID = '_ctl0_' + obj;
    var objClientID_Input = document.getElementById('_ctl0_' + obj + '_Input');
    // get RadComboBox control by ClientID
    var combo = $find(comboClientID);
    if (combo != null) {
        // check is null  value of RadComboBox    
        if (combo.get_value() == "") {
            if(objClientID_Input != null){                
                SetColorControl(objClientID_Input,1);
            }
            // display error message
            GetAlertError(iTotal, DSAlert, MessCode);                                    
            // set focus to input area of RadComboBox                                    
            var inputArea = combo.get_inputDomElement();
            inputArea.focus();

            return false;
        }
    }
    if(objClientID_Input != null){
        SetColorControl(objClientID_Input,2);
    }   
    return true;
}

//QuangPNV: Check is null & set focus RadComboBox - Telerik control
//Truyền thẳng tên đầy đủ của đối tượng: Ví dụ: _ctl0_EmpHeaderSearch1_cboLSHLevel1ID	
function CheckIsNull_RCB2(obj, MessCode) {    
    var comboClientID = obj;    
    var combo = $find(comboClientID);
    if (combo != null) {        
        if (combo.get_value() == "") {            
            GetAlertError(iTotal, DSAlert, MessCode);            
            try{                
                var inputArea = combo.get_inputDomElement();
                inputArea.focus();
            }catch(Error){}
            return false;
        }
    }
    else{}           
    return true;
}


 // Check is null & set focus RadComboBox - Telerik control	
function CheckIsNull_RCBGrid(obj, MessCode) {    
    var comboClientID = obj;
    // get RadComboBox control by ClientID
    var combo = $find(comboClientID);
    // check is null  value of RadComboBox
    if (combo.get_value() == "") {
        // display error message
        GetAlertError(iTotal, DSAlert, MessCode);
        // set focus to input area of RadComboBox
        var inputArea = combo.get_inputDomElement();
        inputArea.focus();
        return false;
    }
    return true;
}

//DanL : 20130711 ==> Check is null & set focus RadComboBox (Without alert message & focus) - Telerik control
function CheckIsNull_RCB_NoAlert(obj) {
    // get client id of RadComboBox
    var comboClientID = '_ctl0_' + obj;
    // get RadComboBox control by ClientID
    var combo = $find(comboClientID);
    // check is null  value of RadComboBox
    if (combo.get_value() == "")
        return false;
    return true;
}
    
function SearchListUser(obj, ListboxObj) {
    var lstListComp = document.getElementById(ListboxObj);
    var iTotalListItem = lstListComp.length;

    var lstListCompText = "";
    var sSubstring = obj.value.toUpperCase();

    for (var i = 0; i < iTotalListItem; i++) {
        lstListCompText = lstListComp.item(i).text.toUpperCase();
        var index = lstListCompText.indexOf(sSubstring);
        if (index != "-1") {
            if (lstListComp.item(i).getAttribute('disabled') == undefined) {
                document.getElementById(ListboxObj).selectedIndex = i;
                return false;
            }
        }
    }

    return false;
}

function SearchLeft(TextBoxObj, ListboxObj) {

    var lstListComp = document.getElementById(ListboxObj);
    var iTotalListItem = lstListComp.length;

    var lstListCompText = "";
    var sSubstring = document.getElementById(TextBoxObj).value.toUpperCase();

    var index = document.getElementById(ListboxObj).selectedIndex;

    for (var i = index - 1; i >= 0; i--) {
        lstListCompText = lstListComp.item(i).text.toUpperCase();
        var index = lstListCompText.indexOf(sSubstring);
        if (index != "-1") {
            if (lstListComp.item(i).getAttribute('disabled') == undefined)
                {
                    document.getElementById(ListboxObj).selectedIndex = i;
                    return false;
                }
        }
    }

    return false;
}

function SearchRight(TextBoxObj, ListboxObj) {

    var lstListComp = document.getElementById(ListboxObj);
    var iTotalListItem = lstListComp.length;

    var lstListCompText = "";
    var sSubstring = document.getElementById(TextBoxObj).value.toUpperCase();

    var index = document.getElementById(ListboxObj).selectedIndex;

    for (var i = index + 1; i < iTotalListItem; i++) {
        lstListCompText = lstListComp.item(i).text.toUpperCase();
        var index = lstListCompText.indexOf(sSubstring);
        if (index != "-1") {
            if (lstListComp.item(i).getAttribute('disabled') == undefined)
                {
                    document.getElementById(ListboxObj).selectedIndex = i;
                    return false;
                }
        }
    }
    return false;
}

function NoneCheckValid() {
    return true;
}

function DisableAllButton(button) {
    //20150326: TrangNT bổ sung xử lý: Nếu button đang disable (do source code disable) thì ko làm gì hết
    if (document.getElementById(button.replace(':', '_')).disabled == true)
        return false;
    //-------
    var Arr = new Array(278);
    Arr[0] = "_ctl0_btnSearch";
    Arr[1] = "_ctl0_btnView";
    Arr[2] = "_ctl0_btnAddNew";
    Arr[3] = "_ctl0_btnDetail";
    Arr[4] = "_ctl0_btnList";
    Arr[5] = "_ctl0_btnBack";
    Arr[6] = "_ctl0_btnSelect";
    Arr[7] = "_ctl0_btnChoose";
    Arr[8] = "_ctl0_btnClose";
    Arr[9] = "_ctl0_btnHistory";

    Arr[10] = "_ctl0_btnAdd";
    Arr[11] = "_ctl0_btnCreate";
    Arr[12] = "_ctl0_btnCalc";
    Arr[13] = "_ctl0_btnSave";
    Arr[14] = "_ctl0_btnChange";
    Arr[15] = "_ctl0_btnUpdate";
    Arr[16] = "_ctl0_btnCancel";
    Arr[17] = "_ctl0_btnFill";
    Arr[18] = "_ctl0_btnCopy";
    Arr[19] = "_ctl0_btnEdit";

    Arr[20] = "_ctl0_btnDel";
    Arr[21] = "_ctl0_btnRemove";
    Arr[22] = "_ctl0_btnDelete";
    Arr[23] = "_ctl0_btnApproved";
    Arr[24] = "_ctl0_btnReject";
    Arr[25] = "_ctl0_btnExport";
    Arr[26] = "_ctl0_btnImport";
    Arr[27] = "_ctl0_btnSubmit";
    Arr[28] = "_ctl0_btnTransfer";
    Arr[29] = "_ctl0_btnLock";
    
    Arr[30] = "_ctl0_btnUnLock";
    Arr[31] = "_ctl0_btnExtend";    
    Arr[32] = "_ctl0_btnProcess";
    Arr[33] = "_ctl0_btnAdd1";
    Arr[34] = "_ctl0_btnAdd2";
    Arr[35] = "_ctl0_btnExportAll";
    Arr[36] = "_ctl0_btnSave2";
    Arr[37] = "_ctl0_btnReCalc";
    Arr[38] = "_ctl0_btnFill2";
    Arr[39] = "_ctl0_btnFill_GioBatDauTT";
    
    Arr[40] = "_ctl0_btnFill_GioKetThucTT";
    Arr[41] = "_ctl0_btnFill_DienGiai";
    Arr[42] = "_ctl0_btnFill_";
    Arr[43] = "_ctl0_btnFill__";
    Arr[44] = "_ctl0_btnFill___";    
    Arr[45] = "_ctl0_btnFill_QuaNgaySauTT";
    Arr[46] = "_ctl0_btnFill1";
    Arr[47] = "_ctl0_btnFill3";
    Arr[48] = "_ctl0_btnFill4";
    Arr[49] = "_ctl0_btnFill5";
    
    Arr[50] = "_ctl0_btnFill6";
    Arr[51] = "_ctl0_btnFill7";
    Arr[52] = "_ctl0_btnFill8";
    Arr[53] = "_ctl0_btnFill9";
    Arr[54] = "_ctl0_btnFill10";
    Arr[55] = "_ctl0_btnFill11";
    Arr[56] = "_ctl0_btnFill12";
    Arr[57] = "_ctl0_btnFill13";
    Arr[58] = "_ctl0_btnFill14";
    Arr[59] = "_ctl0_btnFill15";
    
    Arr[60] = "_ctl0_btnFill16";
    Arr[61] = "_ctl0_btnFill17";
    Arr[62] = "_ctl0_btnFill18";
    Arr[63] = "_ctl0_btnFill19";
    Arr[64] = "_ctl0_btnFill20";
    Arr[65] = "_ctl0_btnFill21";
    Arr[66] = "_ctl0_btnFill22";
    Arr[67] = "_ctl0_btnFill23";
    Arr[68] = "_ctl0_btnFill24";
    Arr[69] = "_ctl0_btnSaveEx";
    
    Arr[70] = "_ctl0_btnDeleteEx";
    Arr[71] = "_ctl0_btnTransferEx";
    Arr[72] = "_ctl0_btnRejectEx";
    Arr[73] = "_ctl0_btnFill_TangCa";
    Arr[74] = "_ctl0_btnFill_GioNgayDK";
    Arr[75] = "_ctl0_btnFill_GioDemDK";
    Arr[76] = "_ctl0_btnFill_GioNghiBuDK";
    Arr[77] = "_ctl0_btnFill_GhiChu";
    Arr[78] = "_ctl0_btnFill_TuGio_TheoCa";
    Arr[79] = "_ctl0_btnFill_DenGio_TheoCa";
    
    Arr[80] = "_ctl0_btnCloseAll";
    Arr[81] = "_ctl0_btnExport_";
    Arr[82] = "_ctl0_btnApprove";
    Arr[83] = "_ctl0_btnImport_";
    Arr[84] = "_ctl0_btnFill_GioNghiBuDemDK";
    Arr[85] = "_ctl0_btnSearchOT";
    Arr[86] = "_ctl0_btnAddNewOT";
    Arr[87] = "_ctl0_btnDeleteOT";
    Arr[88] = "_ctl0_btnSearchP";
    Arr[89] = "_ctl0_btnAddNewP";
    
    Arr[90] = "_ctl0_btnDeleteP";
    Arr[91] = "_ctl0_btnSearchPTG";
    Arr[92] = "_ctl0_btnAddNewPTG";
    Arr[93] = "_ctl0_btnDeletePTG";
    Arr[94] = "_ctl0_btnSearchOff";
    Arr[95] = "_ctl0_btnAddNewOff";
    Arr[96] = "_ctl0_btnDeleteOff";
    Arr[97] = "_ctl0_btnSearchAll";
    Arr[98] = "_ctl0_btnAddNewAll";
    Arr[99] = "_ctl0_btnDeleteAll";

    Arr[100] = "_ctl0_btnReset";
    Arr[101] = "_ctl0_btnE_Save";
    Arr[102] = "_ctl0_btnE_Delete";
    Arr[103] = "_ctl0_btnE_DeleteFile";
    Arr[104] = "_ctl0_btnE_DeleteFileChung";
    Arr[105] = "_ctl0_btnE_DeleteFileBN";
    Arr[106] = "_ctl0_btnE_DeleteFileMN";
    Arr[107] = "_ctl0_btnDeleteFile";
    Arr[108] = "_ctl0_btnExportGrid";
    Arr[109] = "_ctl0_btnReject1Cap";
    
    Arr[110] = "_ctl0_btnSearch1";
    Arr[111] = "_ctl0_btnSave1";
    Arr[112] = "_ctl0_btnSave2";
    Arr[113] = "_ctl0_btnResetEx";
    Arr[114] = "_ctl0_btnTransfer_SMS";
    Arr[115] = "_ctl0_btnSaveGrid";
    Arr[116] = "_ctl0_btnExport2";
    Arr[117] = "_ctl0_btnTransferByGroup";
    Arr[118] = "_ctl0_btnBack1";
    Arr[119] = "_ctl0_btnBack2";

    Arr[120] = "_ctl0_btnFill_GioNgayTT";
    Arr[121] = "_ctl0_btnFill_GioDemTT";
    Arr[122] = "_ctl0_btnFill_LoaiTangCa";
    Arr[123] = "_ctl0_btnFill_KoTLChenhLechTT";
    Arr[124] = "_ctl0_btnReject1";
    Arr[125] = "_ctl0_btnApprove_XacNhan";
    Arr[126] = "_ctl0_btnReject_Huy";
    Arr[127] = "_ctl0_btnAddNewD";
    Arr[128] = "_ctl0_btnList_DS";
    Arr[129] = "_ctl0_btnSave_ChuyenNS";
    
    Arr[130] = "_ctl0_btnSave_ReLoad";
    Arr[131] = "_ctl0_btnNotApprove";
    Arr[132] = "_ctl0_btnAddnew";
    Arr[133] = "_ctl0_btnSearch_";
    Arr[134] = "_ctl0_btnImportCaNhan";
    Arr[135] = "_ctl0_btnImportNhapHo";
    Arr[136] = "_ctl0_btnAddAll";
    Arr[137] = "_ctl0_btnDeleteAll";
    Arr[138] = "_ctl0_btnSaveAndReset";  
    Arr[139] = "_ctl0_btnExport_TaoMaNV";
    
    Arr[140] = "_ctl0_btnSearch_1";     
    Arr[141] = "_ctl0_btnListHD";    
    Arr[142] = "_ctl0_btnE_Import";    
    Arr[143] = "_ctl0_btnSave3";       
    Arr[144] = "_ctl0_btnDelete1";       
    Arr[145] = "_ctl0_btnDelete2";         
    Arr[146] = "_ctl0_btnDelete3";         
    Arr[147] = "_ctl0_btnTransfer2";         
    Arr[148] = "_ctl0_btnTransfer1";           
    Arr[149] = "_ctl0_btnApprove1";  
    
    Arr[150] = "_ctl0_btnImport_Org"; 
    Arr[151] = "_ctl0_btnSaveRecord"; 
    Arr[152] = "_ctl0_btnApprove_Confirm"; 
    Arr[153] = "_ctl0_btnReject_Cancel"; 
    Arr[154] = "_ctl0_btnExport_BC"; 
    Arr[155] = "_ctl0_butExport"; 
    Arr[156] = "_ctl0_btnClose1"; 
    Arr[157] = "_ctl0_btnSave_Copy"; 
    Arr[158] = "_ctl0_btnSave_CapNhat"; 
    Arr[159] = "_ctl0_btnSearch_CDDaGan"; 
    
    Arr[160] = "_ctl0_btnSearchDetail"; 
    Arr[161] = "_ctl0_btnExportHDTrachNhiem"; 
    Arr[162] = "_ctl0_btnPdf"; 
    Arr[163] = "_ctl0_btnRejectUV"; 
    Arr[164] = "_ctl0_btnSave_GhiNhanKQSK"; 
    Arr[165] = "_ctl0_btnDelete_GhiNhanKQSK"; 
    Arr[166] = "_ctl0_btnTransferC"; 
    Arr[167] = "_ctl0_btnDetail_"; 
    Arr[168] = "_ctl0_btnSave_AddGrid"; 
    Arr[169] = "_ctl0_btnDelete_RemoveGrid"; 
    
    Arr[170] = "_ctl0_btnCloseSoPhieu"; 
    Arr[171] = "_ctl0_btnTransferC_"; 
    Arr[172] = "_ctl0_btnSaveQT"; 
    Arr[173] = "_ctl0_btnSave_TongHop"; 
    Arr[174] = "_ctl0_btnSave_TongHop_Tay"; 
    Arr[175] = "_ctl0_btnSaveLoaiThietBi"; 
    Arr[176] = "_ctl0_btnDeleteLoaiThietBi"; 
    Arr[177] = "_ctl0_btnSaveAll"; 
    Arr[178] = "_ctl0_btnSearchPhongHop"; 
    Arr[179] = "_ctl0_btnAddnew2"; 
    
    Arr[180] = "_ctl0_btnSearchList"; 
    Arr[181] = "_ctl0_btnPrint"; 
    Arr[182] = "_ctl0_btnRemoveAll"; 
    Arr[183] = "_ctl0_btnSearchLstEmp"; 
    Arr[184] = "_ctl0_btnCreateOld"; 
    Arr[185] = "_ctl0_btnSearchOption"; 
    Arr[186] = "_ctl0_btnAddNewSearch"; 
    Arr[187] = "_ctl0_btnExport_1"; 
    Arr[188] = "_ctl0_btnSaveEmpGroup";
    Arr[189] = "_ctl0_btnBackLKH";
    
    Arr[190] = "_ctl0_btnOpen"; 
    Arr[191] = "_ctl0_btnImport_MonHoc";
    Arr[192] = "_ctl0_btnImport_HocVien"; 
    Arr[193] = "_ctl0_btnDetails"; 
    Arr[194] = "_ctl0_btnImport_ChiPhi";
    Arr[195] = "_ctl0_btnE_Fill";
    Arr[196] = "_ctl0_btnE_Fill2"; 
    Arr[197] = "_ctl0_btnE_Fill3";
    Arr[198] = "_ctl0_btnExport1";
    Arr[199] = "_ctl0_btnCloseCourse";
    
    Arr[200] = "_ctl0_btnCloseSubject";
    Arr[201] = "_ctl0_btnCloseClass";
    Arr[202] = "_ctl0_btnTransferSubject";
    Arr[203] = "_ctl0_btnTransferClass";
    Arr[204] = "_ctl0_btnExport_BM";
    Arr[205] = "_ctl0_btnE_View";
    Arr[206] = "_ctl0_btnAddNewTemp";
    Arr[207] = "_ctl0_btnDeleteTemp";
    Arr[208] = "_ctl0_btnTransfer_Mail";
    Arr[209] = "_ctl0_btnTransfer_MailAttachFile";
    
    Arr[210] = "_ctl0_RE_CanHeaderSearch_btnSave_Add";
    Arr[211] = "_ctl0_RE_CanHeaderSearch_btnSave_Remove";
    Arr[212] = "_ctl0_RE_CanHeaderSearch_btnSave_RemoveAll";
    Arr[213] = "_ctl0_btnImport_Vertical";
    Arr[214] = "_ctl0_btnbtnTransferC";
    Arr[215] = "_ctl0_btnTransferNext";
    Arr[216] = "_ctl0_btnTransfer_Next";
    Arr[217] = "_ctl0_cmdSave";
    Arr[218] = "_ctl0_btnProcess_ThamGia";
    Arr[219] = "_ctl0_Export";
    
    Arr[220] = "_ctl0_btnProcess_TaoTenYC";
    Arr[221] = "_ctl0_btnSelectTournament";
    Arr[222] = "_ctl0_btnRemoveTournament";
    Arr[223] = "_ctl0_btnRemoveCandidate";
    Arr[224] = "_ctl0_btnProjectList";
    Arr[225] = "_ctl0_btnSelectCandidate";
    Arr[226] = "_ctl0_btnSet";
    Arr[227] = "_ctl0_btnSearchProject";
    Arr[228] = "_ctl0_btnAddNewProject";
    Arr[229] = "_ctl0_btnTransferE";
    
    Arr[230] = "_ctl0_btnExport_Can";
    Arr[231] = "_ctl0_btnSearch_LuongScale";
    Arr[232] = "_ctl0_btnSearch_GTBT";
    Arr[233] = "_ctl0_btnDelete_SI";
    Arr[234] = "_ctl0_btnImport_SIBefore";
    Arr[235] = "_ctl0_btnImport_SINo";
    Arr[236] = "_ctl0_btnUpdateStatus_SINo";   
    Arr[237] = "_ctl0_btnDelete_HI";
    Arr[238] = "_ctl0_btnImport_KCB";   
    Arr[239] = "_ctl0_btnE_SaveConfirm";
    
    Arr[240] = "_ctl0_spbtnImportThe";
    Arr[241] = "_ctl0_btnAddNew_LamMoi";
    Arr[242] = "_ctl0_btnExport_ToIMP";
    Arr[243] = "_ctl0_btnDetail_Gio";
    Arr[244] = "_ctl0_btnCreateSave";
    Arr[245] = "_ctl0_btnProcess_DienNhanh";
    Arr[246] = "_ctl0_btnCalc1";
    Arr[247] = "_ctl0_btnImportThanhToan";
    Arr[248] = "_ctl0_btnProcess_ChuyenDuyet";
    Arr[249] = "_ctl0_btnCalculate";
    
    Arr[250] = "_ctl0_btnImportDiem";
    Arr[251] = "_ctl0_btnImportChuyenCan";
    Arr[252] = "_ctl0_btnReturn";
    Arr[253] = "_ctl0_btnExportKPI";
    Arr[254] = "_ctl0_btnExportComp";
    Arr[255] = "_ctl0_btnExportGeneral";
    Arr[256] = "_ctl0_btnDetailTS";
    Arr[257] = "_ctl0_btnDetailTS_Gio";
    Arr[258] = "_ctl0_btnSave3";
    Arr[259] = "_ctl0_btnChuyenPhongNhanSu";
    
    Arr[260] = "_ctl0_btnChuyenPhongNS";
    Arr[261] = "_ctl0_btnAddNew2";
    Arr[262] = "_ctl0_btnView_Add";
    Arr[263] = "_ctl0_btnView_Remove";
    Arr[264] = "_ctl0_btnView_AddAll";
    Arr[265] = "_ctl0_btnView_RemoveAll";
    Arr[266] = "_ctl0_btnView_SelectAll";
    Arr[267] = "_ctl0_btnE_Search";
    Arr[268] = "_ctl0_btnE_Approve";
    Arr[269] = "_ctl0_btnE_Reject";
    Arr[270] = "_ctl0_btnE_Reset";
    Arr[271] = "_ctl0_btnE_Reject1Cap";
    Arr[272] = "_ctl0_btnE_Export";
    Arr[273] = "_ctl0_btnSave_E";
    Arr[274] = "_ctl0_btnRejectByGroup";
    Arr[275] = "_ctl0_btnSave_Detail";
    Arr[276] = "_ctl0_btnAddNew_Detail";
    Arr[277] = "_ctl0_btnDelete_Detail";
    
    for (i = 0; i < Arr.length; i++) {
        if (document.getElementById(Arr[i]) != null) {
            document.getElementById(Arr[i]).className = "disable";
            document.getElementById(Arr[i]).disabled = true;
            document.getElementById(Arr[i]).onclick = ignoreClick;
        }
    }        
    __doPostBack(button, '');
}

function DisableAllButton_MyPage(button) {
    var Arr = new Array(72);        
    //Ap dung cho MyPage
    Arr[0] = "_ctl0__ctl0_btnSearch";
    Arr[1] = "_ctl0__ctl0_btnReset";
    Arr[2] = "_ctl0__ctl0_btnApprove";    
    Arr[3] = "_ctl0__ctl0_btnReject";
    Arr[4] = "_ctl0__ctl0_btnReject1Cap";
    Arr[5] = "_ctl0__ctl0_btnE_Search";
    Arr[6] = "_ctl0__ctl0_btnE_Reset";
    Arr[7] = "_ctl0__ctl0_btnE_Approve";    
    Arr[8] = "_ctl0__ctl0_btnE_Reject";
    Arr[9] = "_ctl0__ctl0_btnE_Reject1Cap";
    
    Arr[10] = "_ctl0__ctl1_btnSearch";
    Arr[11] = "_ctl0__ctl1_btnReset";
    Arr[12] = "_ctl0__ctl1_btnApprove";    
    Arr[13] = "_ctl0__ctl1_btnReject";
    Arr[14] = "_ctl0__ctl1_btnReject1Cap"; 
    Arr[15] = "_ctl0__ctl1_btnE_Search";
    Arr[16] = "_ctl0__ctl1_btnE_Reset";
    Arr[17] = "_ctl0__ctl1_btnE_Approve";    
    Arr[18] = "_ctl0__ctl1_btnE_Reject";
    Arr[19] = "_ctl0__ctl1_btnE_Reject1Cap"; 
    
    Arr[20] = "_ctl0__ctl2_btnSearch";
    Arr[21] = "_ctl0__ctl2_btnReset";
    Arr[22] = "_ctl0__ctl2_btnApprove";    
    Arr[23] = "_ctl0__ctl2_btnReject";
    Arr[24] = "_ctl0__ctl2_btnReject1Cap";
    Arr[25] = "_ctl0__ctl2_btnE_Search";
    Arr[26] = "_ctl0__ctl2_btnE_Reset";
    Arr[27] = "_ctl0__ctl2_btnE_Approve";    
    Arr[28] = "_ctl0__ctl2_btnE_Reject";
    Arr[29] = "_ctl0__ctl2_btnE_Reject1Cap";
    
    Arr[30] = "_ctl0__ctl3_btnSearch";
    Arr[31] = "_ctl0__ctl3_btnReset";
    Arr[32] = "_ctl0__ctl3_btnApprove";    
    Arr[33] = "_ctl0__ctl3_btnReject";
    Arr[34] = "_ctl0__ctl3_btnReject1Cap";
    Arr[35] = "_ctl0__ctl3_btnE_Search";
    Arr[36] = "_ctl0__ctl3_btnE_Reset";
    Arr[37] = "_ctl0__ctl3_btnE_Approve";    
    Arr[38] = "_ctl0__ctl3_btnE_Reject";
    Arr[39] = "_ctl0__ctl3_btnE_Reject1Cap";
    
    Arr[40] = "_ctl0__ctl4_btnSearch";
    Arr[41] = "_ctl0__ctl4_btnReset";
    Arr[42] = "_ctl0__ctl4_btnApprove";    
    Arr[43] = "_ctl0__ctl4_btnReject";
    Arr[44] = "_ctl0__ctl4_btnReject1Cap";
    Arr[45] = "_ctl0__ctl4_btnE_Search";
    Arr[46] = "_ctl0__ctl4_btnE_Reset";
    Arr[47] = "_ctl0__ctl4_btnE_Approve";    
    Arr[48] = "_ctl0__ctl4_btnE_Reject";
    Arr[49] = "_ctl0__ctl4_btnE_Reject1Cap";
    
    Arr[50] = "_ctl0__ctl5_btnSearch";
    Arr[51] = "_ctl0__ctl5_btnReset";
    Arr[52] = "_ctl0__ctl5_btnApprove";    
    Arr[53] = "_ctl0__ctl5_btnReject";
    Arr[54] = "_ctl0__ctl5_btnReject1Cap";
    Arr[55] = "_ctl0__ctl5_btnE_Search";
    Arr[56] = "_ctl0__ctl5_btnE_Reset";
    Arr[57] = "_ctl0__ctl5_btnE_Approve";    
    Arr[58] = "_ctl0__ctl5_btnE_Reject";
    Arr[59] = "_ctl0__ctl5_btnE_Reject1Cap";
    
    Arr[60] = "_ctl0__ctl8_btnSearch";
    Arr[61] = "_ctl0__ctl8_btnReset";
    Arr[62] = "_ctl0__ctl8_btnApprove"; 
    Arr[63] = "_ctl0__ctl8_btnReject";
    Arr[64] = "_ctl0__ctl8_btnReject1Cap";
    Arr[65] = "_ctl0__ctl8_btnBack";    
    Arr[66] = "_ctl0__ctl8_btnE_Search";
    Arr[67] = "_ctl0__ctl8_btnE_Reset";
    Arr[68] = "_ctl0__ctl8_btnE_Approve"; 
    Arr[69] = "_ctl0__ctl8_btnE_Reject";
    Arr[70] = "_ctl0__ctl8_btnE_Reject1Cap";
    Arr[71] = "_ctl0__ctl8_btnE_Back";
                    
    for (i = 0; i < Arr.length; i++) {
        if (document.getElementById(Arr[i]) != null) {            
            document.getElementById(Arr[i]).style.display = "none";
            //document.getElementById(Arr[i]).disabled = true;
            //document.getElementById(Arr[i]).onclick = ignoreClick;                 
        }
    }
    
    //Khong dung hàm này cho trang MyPage, Vì nếu dùng thì trình duyệt Safari sẽ không gọi được các sự kiện Onlick        
//    var Browser = navigator.userAgent;
//    
//    alert(Browser);
//    
//    if (Browser.indexOf('Safari') == 0){    
//        __doPostBack(button, '');
//    }
}
// RadGrid
function groupExpanded(sender, args) {
    if ($telerik.isIE7) {
        $telerik.$("tr.rgGroupHeader:visible").removeClass("adjustedGroupHeader");
    }
}

function groupCollapsed(sender, args) {
    if ($telerik.isIE7) {
        $telerik.$("tr.rgGroupHeader:hidden").addClass("adjustedGroupHeader");
    }
}

//quanbm2 2011-12-28 : su dung cho checkboxList
function CheckAllCheckBoxList(CheckListID, objchkAll) {

    var objCheckList = document.getElementById(CheckListID);
    for (var i = 0; i < objCheckList.getElementsByTagName("input").length; i++) {
        document.getElementById(objCheckList.id + '_' + i).checked = objchkAll.checked;
    }
    return false;
}
//Lay value check chon cua RadioButtonList
function GetSelectedValueRadiobuttonList(objName) {
    var list = document.getElementById(objName);
    var options = list.getElementsByTagName("input");
    for (x = 0; x < options.length; ++x) {
        if (options[x].type == "radio" && options[x].checked) {
            return (options[x].value); // Do something more useful here.
            break;
        }
    }
}

//quanbm2 : su dung cho RadCombo - checkbox
function chkComboShowSelectedItem(cboId) {
    var combo = $find('_ctl0_' + cboId);
    if (combo == null) return;
    var comboItems = combo.get_items();
    var text = "";
    var value = "";
    for (var i = 0; i < comboItems.get_count(); i++) {
        var item = comboItems.getItem(i);
        var checkboxes = GetComboItemByID(item, "chkSelectItem");
        if (checkboxes != null && checkboxes.length > 0) {
            if (checkboxes[0].checked) {
                if (text != "") text = text + "; ";
                text = text + item.get_text();

                if (value != "") value += ";";
                value = value + item.get_value();
            }
        }
    }

    combo.trackChanges();
    combo.set_text(text);
    combo.set_value(value);
    combo.get_element().title = text;
    combo.commitChanges();
}

function GetComboItemByID(item, itemID) {
    var arrControl = new Array();
    //Get the 'div' representing the current RadComboBox Item.
    var itemDiv = item.get_element();
    //Get the collection of all 'input' elements in the 'div' (which are contained in the Item).
    var inputs = itemDiv.getElementsByTagName("input");

    for (var inputIndex = 0; inputIndex < inputs.length; inputIndex++) {
        var input = inputs[inputIndex];
        //Check the type of the current 'input' element. 
        if (input.type == "checkbox") {
            arrControl[arrControl.length] = input;
        }
    }

    return arrControl;
}

function GetCheckboxByComboID(cboId) {
    var combo = $find('_ctl0_' + cboId);
    if (combo == null) return;
    var comboItems = combo.get_items();
    var arrControl = new Array();

    for (var i = 0; i < comboItems.get_count(); i++) {
        var item = comboItems.getItem(i);
        var itemDiv = item.get_element();
        //Get the collection of all 'input' elements in the 'div' (which are contained in the Item).
        var inputs = itemDiv.getElementsByTagName("input");
        for (var inputIndex = 0; inputIndex < inputs.length; inputIndex++) {
            var input = inputs[inputIndex];
            //Check the type of the current 'input' element. 
            if (input.type == "checkbox") {
                arrControl[arrControl.length] = input;
            }
        }
    }

    return arrControl;
}

function chkComboSelectAllCombo(obj, cboID) {
    //    var checkboxes = GetControlByType("checkbox", cboID);
    var checkboxes = GetCheckboxByComboID(cboID);
    if (checkboxes == null) return;

    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = obj.checked;
    }

    chkComboShowSelectedItem(cboID);
}

function CheckIsNull_chkCombo(cboID, MessCode) {
    var checkboxes = GetControlByType("checkbox", cboID);
    var combo = $find("_ctl0_" + cboID);
    var inputArea;
    if (checkboxes == null) {
        if (combo != null) {
            GetAlertError(iTotal, DSAlert, MessCode);
            inputArea = combo.get_inputDomElement();
            inputArea.focus();
        }
        return false;
    }
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked)
            return true;
    }

    if (combo != null) {
        GetAlertError(iTotal, DSAlert, MessCode);
        inputArea = combo.get_inputDomElement();
        inputArea.focus();
    }

    return false;
}

function CheckIsNull_obj(obj, mess){
    if(obj.value=="")
    {
	    GetAlertError(iTotal, DSAlert, mess);
	    obj.focus();
	    return false;
    }
    else
	    return true;
}

function CheckIsOne_chkCombo(cboID, MessCode) {
    var checkboxes = GetControlByType("checkbox", cboID+'_i');//Cộng thêm _i để ko bị trùng với những combo có tên gần giống nhau trên 1 form (vd: cboLSLeaveTypeCode và cboLSLeaveTypeCode_Search)
    var combo = $find("_ctl0_" + cboID);
    var inputArea;
    if (checkboxes == null) {
        if (combo != null) {
            GetAlertError(iTotal, DSAlert, MessCode);
            inputArea = combo.get_inputDomElement();
            inputArea.focus();
        }
        return true;
    }
    var demChecked = 0;
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked)
            demChecked++;
    }
    if (demChecked == 0 || demChecked == 1)
        return true;
    else {
        if (combo != null) {
            GetAlertError(iTotal, DSAlert, MessCode);
            inputArea = combo.get_inputDomElement();
            inputArea.focus();
        }
        return false;
    }
}

function GetControlByType(type, prefix) {
    var element;
    var arrControl = new Array();
    for (var i = 0; i < document.forms[0].elements.length; i++) {
        element = document.forms[0].elements[i];
        if (element.type == type && element.id.indexOf(prefix) >= 0) {
            arrControl[arrControl.length] = element;
        }
    }
    return arrControl;
}
//end RadGrid

function CreateDate(Day, Month, Year) {
    if (Month == 1) {
        Month = 12;
        Year = Year - 1;
    }
    else {
        Month = Month - 1;
    }
    var date = new Date(Year, Month, Day);
    return date;
}

//HongTT7
//Tính ra khoảng cách từ ngày đến ngày-->trả ra kq là số ngày
function GetDays(fromdate, todate) {

    var arr1 = fromdate.split("/");
    var arr2 = todate.split("/");
    if (arr1 == null || arr1.length < 2) return;

    var iYear1 = eval(arr1[2]);
    var iMonth1 = eval(arr1[1]);
    var iDay1 = eval(arr1[0]);

    if (arr2 == null || arr2.length < 2) return;

    var iYear2 = eval(arr2[2]);
    var iMonth2 = eval(arr2[1]);
    var iDay2 = eval(arr2[0]);

//    var date1 = new Date(iMonth1.toString() + '-' + iDay1.toString() + '-' + iYear1.toString());
//    var date2 = new Date(iMonth2.toString() + '-' + iDay2.toString() + '-' + iYear2.toString());
    var date1 = CreateDate(iDay1, iMonth1, iYear1);
    var date2 = CreateDate(iDay2, iMonth2, iYear2);
    var days = Math.floor(((date2 - date1) / (60 * 60 * 24)) / 1000);

    return days;
}

function EnableLinkButton(linkbutton_) {
    try
        {
        var ua_ = navigator.userAgent.toLowerCase();
        if (ua_.indexOf("msie") == -1) {

            var linkButton = $('a[id$=' + linkbutton_ + ']');
            var disabled_ = linkButton.attr('disabled');
            //if (disabled_ == 'disabled') {
                linkButton.removeAttr('disabled');
            //}
            var myCustomAttr = linkButton.attr('myCustomAttr');
            if (myCustomAttr == undefined) {
                var id = linkButton.attr('id');
                while (id.indexOf("_") >= 0) {
                    id = id.replace("_", "$");
                }
                if (id.indexOf("$") == 0) {
                    id = "_" + id.substring(1, id.length);
                }
                myCustomAttr = "javascript:__doPostBack('" + id + "', '')";
                //myCustomAttr = "javascript:__doPostBack('" + linkbutton_ + "', '')";
            }

            linkButton.attr('href', myCustomAttr).removeClass('disable');
            var onclickevent = linkButton.attr('myCustomAttr_click');
            if (onclickevent != undefined) {
                linkButton.attr('onclick', onclickevent);
            }
        }
        else {
            document.getElementById('_ctl0_' + linkbutton_).removeAttribute("className", "disable");
            document.getElementById('_ctl0_' + linkbutton_).disabled = false;
        }
    }catch(Error){}
}


function DisableLinkButton(linkbutton_) {
    var ua_ = navigator.userAgent.toLowerCase();
    if (ua_.indexOf("msie") == -1) {
        var linkButton = $('a[id$=' + linkbutton_ + ']');        
        var disabled_ = linkButton.attr('disabled');
        var href;
        
        if (disabled_ == 'disabled') {
            var id = linkButton.attr('id');
            while (id.indexOf("_") >= 0) {
                id = id.replace("_", "$");
            }
            if (id.indexOf("$") == 0) {
                id = "_" + id.substring(1, id.length);
            }
            href = "javascript:__doPostBack('" + id + "', '')";
            
            linkButton.attr('myCustomAttr', href);
        }
        else {

            href = linkButton.attr('href');
        }
                        
        try
        {        
            linkButton.removeAttr('href').attr('myCustomAttr', href).addClass('disable'); 
        }
        catch(err){}
        try {
                document.getElementById('_ctl0_' + linkbutton_).onclick = ignoreClick;
            }
            catch (err) { }      
                                               
        RemoveOnClickLinkButtonDisabled();                
    }
    else {
        if(document.getElementById('_ctl0_' + linkbutton_) != null){
            document.getElementById('_ctl0_' + linkbutton_).setAttribute("className", "disable");
            document.getElementById('_ctl0_' + linkbutton_).disabled = true;
            try {
                document.getElementById('_ctl0_' + linkbutton_).onclick = ignoreClick;
            }
            catch (err) { }
        }
    }
}


function DisableLinkButton_PostBack(linkbutton_) {

    var ua_ = navigator.userAgent.toLowerCase();
    if (ua_.indexOf("msie") == -1) {
        var linkButton = $('a[id$=' + linkbutton_ + ']');
        var disabled_ = linkButton.attr('disabled');
        var href;

        if (disabled_ == 'disabled') {
            var id = linkButton.attr('id');
            while (id.indexOf("_") >= 0) {
                id = id.replace("_", "$");
            }
            if (id.indexOf("$") == 0) {
                id = "_" + id.substring(1, id.length);
            }
            href = "javascript:__doPostBack('" + id + "', '')";

            linkButton.attr('myCustomAttr', href);
        }
        else {

            href = linkButton.attr('href');
        }

        linkButton.removeAttr('href').attr('myCustomAttr', href).addClass('disable');
    }
    else {
        if(document.getElementById('_ctl0_' + linkbutton_) != null){
            document.getElementById('_ctl0_' + linkbutton_).setAttribute("className", "disable");
            document.getElementById('_ctl0_' + linkbutton_).disabled = true;
        }
    }
}

//SonNT28: bỏ qua sự kiện Click
function ignoreClick()
{
    return false;
}

//SonPQ: Ham tra ve nguyen trang cho chuoi co ki tu dac biet
function GiaiChuanHoaKiTuDacBietJS(str) {
    str = str.replace("&#39;", "'");
    return str;
}

//QuangPNV: Hàm điền nhanh dữ liệu xuống lưới 1 control
function FillData_RadGrid(RadGridName,objTypeControl1,objControlName1,objTypeControl2,objControlName2,ErrorCode) {            
    try
    {
        if (GridCheck_RadGrid('_ctl0_' + RadGridName, 'chkSelect') == false) {
            GetAlertError(iTotal, DSAlert, "0001");
            return false;
        }
        var ControlA = "";
        
        if(objTypeControl1.toUpperCase() == "TEXTBOX")        
            ControlA = document.getElementById('_ctl0_' + objControlName1);        
        else if (objTypeControl1.toUpperCase() == "RADCOMBOBOX")
            ControlA = $find('_ctl0_' + objControlName1);        
        else if (objTypeControl1.toUpperCase() == "CHECKBOX")
            ControlA = document.getElementById('_ctl0_' + objControlName1);
                                                                    
        var masterTable = $find('_ctl0_' + RadGridName).get_masterTableView();
        if (masterTable != null) {
            var count = masterTable.get_dataItems().length;
            if (count > 0) {                                                                                                                        
                for (i = 0; i < count; i++) {
                    var row = masterTable.get_dataItems()[i];
                    var chkSelect = row.findElement('chkSelect');
                    if (chkSelect.disabled == false) {
                        if (chkSelect.checked == true) {                                                        
                            if(objTypeControl2.toUpperCase() == "TEXTBOX")
                            {                                                                                                                                                                                                                                                               
                                row.findElement(objControlName2).value = ControlA.value;                         
                            }
                            else if (objTypeControl2.toUpperCase() == "DROPDOWNLIST")
                            {
                                var dropdownlist = row.findElement(objControlName2)
                                if(dropdownlist.disabled == false)
                                {
                                    dropdownlist.value = ControlA.get_value();
                                }
                            }                            
                            else if (objTypeControl2.toUpperCase() == "CHECKBOX")
                            {
                                row.findElement(objControlName2).checked = ControlA.checked; 
                            }                                                                                                                                                      
                        }
                    }
                }
            }
        }
    } 
    catch (Error) 
    {
        if(ErrorCode != "")
        {
            GetAlertError(iTotal, DSAlert, ErrorCode);    
        }
        return false;    
    }
    return false;
}

//QuangPNV: Hàm điền nhanh dữ liệu xuống lưới 1 control
function FillData_RadGrid_GioPhut(RadGridName,objHourName,objMinuteName,radHourName,radMinuteName,ErrorCode) {            
    try
    {
        if (GridCheck_RadGrid('_ctl0_' + RadGridName, 'chkSelect') == false) {
            GetAlertError(iTotal, DSAlert, "0001");
            return false;
        } 
           
        var Hour = 0;
        var Minute = 0;        
            Hour = document.getElementById('_ctl0_' + objHourName).value;
            Minute = document.getElementById('_ctl0_' + objMinuteName).value;
                                            
        var masterTable = $find('_ctl0_' + RadGridName).get_masterTableView();
        if (masterTable != null) {
            var count = masterTable.get_dataItems().length;
            if (count > 0) {                                                                                                                        
                for (i = 0; i < count; i++) {
                    var row = masterTable.get_dataItems()[i];
                    var chkSelect = row.findElement('chkSelect');
                    if (chkSelect.disabled == false) {
                        if (chkSelect.checked == true) {                                                        
                            row.findElement(radHourName).value = CheckFloat(Hour);
                            row.findElement(radMinuteName).value = CheckFloat(Minute);
                            LEN_HOUR(row.findElement(radHourName));
                            LEN_HOUR(row.findElement(radMinuteName));
                        }
                    }
                }
            }
        }
    } 
    catch (Error) 
    {
        if(ErrorCode != "")
        {
            GetAlertError(iTotal, DSAlert, ErrorCode);    
        }
        return false;    
    }
    return false;
}

//QuangPNV: 03/05/2013 : Kiểm tra trình duyệt đang sử dụng
function Check_BrowserName(){
    var Browser = navigator.userAgent;
    if (Browser.indexOf('MSIE') >= 0){
        Browser = 'MSIE';
    }
    else if (Browser.indexOf('Firefox') >= 0){
        Browser = 'Firefox';
    }
    else if (Browser.indexOf('Chrome') >= 0){
        Browser = 'Chrome';
    }
    else if (Browser.indexOf('Safari') >= 0){
        Browser = 'Safari';
    }
    else if (Browser.indexOf('Opera') >= 0){
        Browser = 'Opera';
    }
    else{
        Browser = 'UNKNOWN';
    }
    return Browser;
}

function Check_BrowserVersion()
{
   var index;
   var version = 0;
   var name = Check_BrowserName();
   var info = navigator.userAgent;
   index = info.indexOf(name) + name.length + 1;
   version = parseFloat(info.substring(index,index + 3));
   return version;
}

function SetColorControl(objControl,typeError)
{
    //QuangPNV: Thuộc tính ERROR đang áp dụng cho Điều chỉnh đăng ký làm ngoài giờ
    if(objControl != null && objControl != "ERROR")
    {
        if(typeError == 1)
        {
            objControl.style.background = '#ffff00';   
        }
        else if(typeError == 2)
        {
            objControl.style.background = '#ffffff';   
        }
        else if(typeError == 3)
        {
            objControl.style.background = '#eeeeee';   
        }    
    }
}
//End

//QuangPNV: KeyPress các Control trên lưới RadGrid
//e = event
//obj = this
//param1,param2,param3: biến Buffer
function EnterPress_RadGrid(e,obj,param1,param2,param3){        
    var GridName = obj.id.substring(0,obj.id.indexOf('__'));                
    var firstControl = GridName + '__ctl0__ctl';   
    var a = obj.id.replace(firstControl,'');
    
    //Loại lấy đúng trên Control trên lưới
    //Lấy vị trí của "_" để cắt lấy giá trị từ 0 -> "_"
    //Cắt chuỗi 0 -> "_"
    //Replace a bỏ các chuỗi từ 0 -> ""
    var idControl = a.replace(a.substring(0,a.indexOf('_') + 1),'')        
    a = a.replace('_' + idControl, '');
                                    
    //Key - Xuống = 40 / PageDown = 34; param1 = null: chỉ áp dụng cho TextBox
    if((e.keyCode == 40 || e.keyCode == 34) && param1 == null){       
        var b = CheckFloat(a) + 2;
        if(document.getElementById(firstControl + b.toString() + '_' + idControl) != null)
            document.getElementById(firstControl + b.toString() + '_' + idControl).focus();                
    }
    //Key - Lên = 38 / PageUp = 33; param1 = null: chỉ áp dụng cho TextBox
    else if((e.keyCode == 38 || e.keyCode == 33) && param1 == null){
        var b = CheckFloat(a) - 2; 
        if(document.getElementById(firstControl + b.toString() + '_' + idControl) != null)
            document.getElementById(firstControl + b.toString() + '_' + idControl).focus();
    }
    //Key - Insert (Lên) = 45; param1 = 1: chỉ áp dụng cho ComboBox    
    else if(e.keyCode == 45 && param1 == 1)
    {
        var b = CheckFloat(a) - 2; 
        if(document.getElementById(firstControl + b.toString() + '_' + idControl) != null)
            document.getElementById(firstControl + b.toString() + '_' + idControl).focus();                
    }
     //Key - Delete (Xuống) = 46; param1 = 1: chỉ áp dụng cho ComboBox    
    else if(e.keyCode == 46 && param1 == 1)
    {
        var b = CheckFloat(a) + 2; 
        if(document.getElementById(firstControl + b.toString() + '_' + idControl) != null)
            document.getElementById(firstControl + b.toString() + '_' + idControl).focus();                
    }
}
//NhanNH2 dùng cho Radcbo add new item tham khảo CanNew.ascx
function RCB_AddNewItem(combo, value, text) {
    var items = combo.get_items();
    //combo.trackChanges(); HuyenHB đã merge vì lỗi khi bấm tìm kiếm
    var comboItem = new Telerik.Web.UI.RadComboBoxItem();
    comboItem.set_text(text);
    comboItem.set_value(value);
    items.add(comboItem); 
    combo.commitChanges();           
 }

//QuangPNV: CheckBox
function CheckBoxCheck(obj, isChecked){
    if(obj != null){
        obj.checked = isChecked;
    }
}
function CheckBoxDisable(obj, isDisabled){
    if(obj != null){
        obj.disabled = isDisabled;        
    }
}
function CheckBoxDisplay(obj, isDisplay){        
    if(obj != null){
        if(isDisplay == true){
            obj.style.display = "";
            obj.nextSibling.style.display = "";
        } else {
            obj.style.display = "none";
            obj.nextSibling.style.display = "none";
        }
    }    
}
function DisplayControl(obj, isDisplay){        
    if(obj != null){
        if(isDisplay == true){
            obj.style.display = "";            
        } else {
            obj.style.display = "none";            
        }
    }    
}

function SetValueControl(obj,typeControl, sName, sParam1, sParam2, sParam3)
{    
    if (obj != null) {
        switch(typeControl.toUpperCase())
        {
            case "LINKBUTTON":
            case "LABEL":
                obj.innerHTML = sName;
                break;
        }        
    }
}  
    
//function checkShowTooltip(a) {
//    if (a != ''){
//        ddrivetip(a);
//    }
//    return false
//}

//QuangPNV: Khoa phím hoặc tổ hợp phím
function disableCtrlKeyCombination(e,usedCtrl,usedShift,usedAlt,isKyTu,sKyTu,forbiddenKeys)
{
    //list all CTRL + key combinations you want to disable
    /*var forbiddenKeys = new Array('i');*/
    var key;
    var isCtrl;
    var isShift;
    var isAlt;
                    
    if(window.event)
    {
        key = window.event.keyCode;     //IE
        if(window.event.ctrlKey)
            isCtrl = true;
        else
            isCtrl = false;
        
        if(window.event.shiftKey)
            isShift = true;
        else
            isShift = false;
            
        if(window.event.altKey)
            isAlt = true;
        else
            isAlt = false;
    }
    else
    {
        key = e.which;     //firefox
        if(e.ctrlKey)
            isCtrl = true;
        else
            isCtrl = false;
        
        if(e.shiftKey)
            isShift = true;
        else
            isShift = false;
        
        if(e.altKey)
            isAlt = true;
        else
            isAlt = false;
    }
            
    //if other key is in forbidenKeys array
    if( usedCtrl == false && usedShift == false && usedAlt == false && 
        isCtrl == false && isShift == false && isAlt == false)
    {        
        for(i=0; i<forbiddenKeys.length; i++)
        {
            if(isKyTu == true)
            {
                return true;
            }
            else
            {            
                if(forbiddenKeys[i].toLowerCase() == key)
                {
                    alert("This function ["+ sKyTu +"] is disabled here");
                    return false;
                }
            }
        }        
    }
    
    //if ctrl is pressed check if other key is in forbidenKeys array    	        	        
    else if(usedCtrl == true && usedShift == false && usedAlt == false && 
            isCtrl == true && isShift == false && isAlt == false)
    {
        for(i=0; i < forbiddenKeys.length; i++)
        {
            if(isKyTu == true)
            {
                if(forbiddenKeys[i].toLowerCase() == String.fromCharCode(key).toLowerCase())
                {
                    alert("This function [CTRL+"+ forbiddenKeys[i].toUpperCase() +"] is disabled here");
                    return false;
                }
            }
            else
            {
                if(forbiddenKeys[i].toLowerCase() == key)
                {
                    alert("This function [CTRL+"+ sKyTu +"] is disabled here");
                    return false;
                }   
            }
        }
    }
    
    //if shift is pressed check if other key is in forbidenKeys array    
    else if(usedCtrl == false && usedShift == true && usedAlt == false && 
            isCtrl == false && isShift == true && isAlt == false)
    {
        for(i=0; i < forbiddenKeys.length; i++)
        {
            if(isKyTu == true)
            {
                if(forbiddenKeys[i].toLowerCase() == String.fromCharCode(key).toLowerCase())
                {
                    alert("This function [SHIFT+"+ forbiddenKeys[i].toUpperCase() +"] is disabled here");
                    return false;
                }
            }
            else
            {
                if(forbiddenKeys[i].toLowerCase() == key)
                {
                    alert("This function [SHIFT+"+ sKyTu +"] is disabled here");
                    return false;
                }   
            }
        }
    }
    
    //if ctrl + shift is pressed check if other key is in forbidenKeys array
    else if(usedCtrl == true && usedShift == true && usedAlt == false && 
            isCtrl == true && isShift == true && isAlt == false)
    {
        for(i=0; i < forbiddenKeys.length; i++)
        {            
            if(isKyTu == true)
            {
                if(forbiddenKeys[i].toLowerCase() == String.fromCharCode(key).toLowerCase())
                {
                    alert("This function [CTRL+SHIFT+" + forbiddenKeys[i].toUpperCase() + "] is disabled here");
                    return false;
                }
            }
            else
            {
                if(forbiddenKeys[i].toLowerCase() == key)
                {
                    alert("This function [CTRL+SHIFT+" + sKyTu + "] is disabled here");
                    return false;
                }  
            }
        }
    }
       
    return true;
}

//TrangNT: 02/03/2017: Convert từ str sang kiểu date
function ConvertStringToDate(strDate) {
    var from = strDate.split("/");
    var f = new Date(from[2], from[1] - 1, from[0]);
    return f;
}

//TrangNT: 02/03/2017: Đếm số tháng giữa 2 ngày
function Noofmonths(strdate1, strdate2) {
    //debugger;
    try {
        if (strdate1 != "" && strdate2 != "") {
            var date1 = ConvertStringToDate(strdate1);
            var date2 = ConvertStringToDate(strdate2);
            var Nomonths;
            Nomonths = (date2.getFullYear() - date1.getFullYear()) * 12;
            Nomonths -= date1.getMonth() + 1;
            Nomonths += date2.getMonth() + 1; // we should add + 1 to get correct month number
            return Nomonths;
        }
        else
            return 0;
    }
    catch (error) { }
}

//20150505: Sort control
function sortChildrenDivsById(parentId, isSort, idGetControl) {
    //debugger;
    var parent;
    if (document.getElementById(parentId) != null)
        parent = document.getElementById(parentId);
    else parent = document.getElementById('_ctl0_' + parentId);
    if (parent != null) {
        var childrens = parent.children;
        var ojbs = [], i, len, sid = '';
        for (i = 0, len = childrens.length; i < len; i++) {
            var id = childrens[i].id;
            if (id != '') {
                try {

                    id = id.replace('_ctl0_', '');
                    var obj = {};
                    obj.id = id;
                    if (childrens[i].hasAttribute("data-index"))
                        obj.index = parseInt(childrens[i].attributes['data-index'].value, 10);

                    /*lấy chuỗi dữ liệu insert vào DB*/
                    var index = (i * 10).toString();
                    var style = childrens[i].style.cssText;
                    if (style.indexOf('display') > -1)
                        style = replaceAll(style, ' ', '').toLowerCase().toLowerCase().replace('display:none', '');//Remove thuộc tính display trong style
                    var note = childrens[i].attributes['data-note'].value;
                    var attVisible = childrens[i].attributes['data-visible'];
                    var attVisibleAll = childrens[i].attributes['data-visibleAll'];
                    var attVisibleFrmCtlID_Ref = childrens[i].attributes['data-VisibleFrmCtlID_Ref'];

                    var visible = '';
                    if (attVisible != null)
                        visible = attVisible.value;

                    var visibleAll = '';
                    if (attVisibleAll != null)
                        visibleAll = attVisibleAll.value;

                    var VisibleFrmCtlID_Ref = '';
                    if (attVisibleFrmCtlID_Ref != null)
                        VisibleFrmCtlID_Ref = attVisibleFrmCtlID_Ref.value;

                    //--Quét div cấp 2----------------------------------------------------------------------------
                    try {
                        var sidchildren = '', lenChild, j;
                        var childrensDiv;
                        if (document.getElementById(id) != null)
                            childrensDiv = document.getElementById(id).children;
                        else childrensDiv = document.getElementById('_ctl0_' + id).children;

                        if (childrensDiv != null && childrensDiv.length > 0) {
                            for (j = 0, lenChild = childrensDiv.length; j < lenChild; j++) {
                                var idChild = childrensDiv[j].id;
                                if (idChild != '') {

                                    idChild = idChild.replace('_ctl0_', '');
                                    /*lấy chuỗi dữ liệu div cấp 2 insert vào DB*/
                                    var indexChild = (j * 10).toString();
                                    var styleChild = childrensDiv[j].style.cssText;
                                    styleChild = replaceAll(styleChild, ' ', '').toLowerCase().replace('display:none', '');//Remove thuộc tính display trong style
                                    var noteChild = childrensDiv[j].attributes['data-note'].value;
                                    var attVisibleChild = childrensDiv[j].attributes['data-visible'];
                                    var attVisibleAllChild = childrensDiv[j].attributes['data-visibleAll'];
                                    var attVisibleFrmCtlID_RefChild = childrensDiv[j].attributes['data-VisibleFrmCtlID_Ref'];

                                    var visibleChild = '';
                                    if (attVisibleChild != null)
                                        visibleChild = attVisibleChild.value;

                                    var visibleAllChild = '';
                                    if (attVisibleAllChild != null)
                                        visibleAllChild = attVisibleAllChild.value;

                                    var VisibleFrmCtlID_RefChild = '';
                                    if (attVisibleFrmCtlID_RefChild != null)
                                        VisibleFrmCtlID_RefChild = attVisibleFrmCtlID_RefChild.value;

                                    sidchildren = sidchildren
                                    + (idChild == '' ? ' ' : idChild) + '*'
                                    + (indexChild == '' ? ' ' : indexChild) + '*'
                                    + (styleChild == '' ? ' ' : styleChild) + '*'
                                    + (noteChild == '' ? ' ' : noteChild) + '*'
                                    + (visibleChild == '' ? ' ' : visibleChild) + '*'
                                    + (visibleAllChild == '' ? ' ' : visibleAllChild) + '*'
                                    + (VisibleFrmCtlID_RefChild == '' ? ' ' : VisibleFrmCtlID_RefChild) + '#';

                                }
                            }
                        }
                    } catch (e) { }
                    //--End Quét cấp 2----------------------------------------------------------------------------
                    sid = sid
                        + (id == '' ? ' ' : id) + '@'
                        + (index == '' ? ' ' : index) + '@'
                        + (style == '' ? ' ' : style) + '@'
                        + (note == '' ? ' ' : note) + '@'
                        + (visible == '' ? ' ' : visible) + '@'
                        + (visibleAll == '' ? ' ' : visibleAll) + "@"
                        + (sidchildren == '' ? ' ' : sidchildren) + '@'
                        + (VisibleFrmCtlID_Ref == '' ? ' ' : VisibleFrmCtlID_Ref) + '$';
                    /*end lấy chuỗi dữ liệu insert vào DB*/

                    ojbs.push(obj);

                } catch (e) {
                }
            }
        }
    }
    //console.log(sid);
    if (isSort) {
        ojbs.sort(function (a, b) { return (a.index - b.index); });
        for (i = 0, len = ojbs.length; i < len; i++) {
            var Control;
            if (document.getElementById(ojbs[i].id) != null)
                Control = document.getElementById(ojbs[i].id);
            else Control = document.getElementById('_ctl0_' + ojbs[i].id);

            try {
                parent.appendChild(Control);
            } catch (e) { }
        }
    } else {
        document.getElementById('_ctl0_' + idGetControl).value = sid;
    }
}

function hideParentDivByChildrenDiv(parentId) {
    var divs;
    if (document.getElementById(parentId) != null)
        divs = document.getElementById(parentId);
    else divs = document.getElementById('_ctl0_' + parentId);
    for (var i = 0; i < divs.children.length; i++) {
        var div = divs.children[i];
        var divChildren = div.children;
        var countDisplayNone = 0;
        for (var j = 0; j < divChildren.length; j++) {
            if (divChildren[j].style.display == 'none')
                countDisplayNone++;
        }
        if (divChildren.length != 0 && divChildren.length == countDisplayNone) {
            div.style.cssText = div.style.cssText + ";display:none";
            div.setAttribute('data-notchangedisplay', "1");
        }
    }
}

function setIndexAndStyle(parentId, DS) {

    var divs;
    if (document.getElementById(parentId) != null)
        divs = document.getElementById(parentId);
    else divs = document.getElementById('_ctl0_' + parentId);

    for (var j = 0; j < DS[0].length; j++) {
        for (var i = 0; i < divs.children.length; i++) {
            var div = divs.children[i];
            var id = div.id;
            id = id.replace('_ctl0_', '');
            if (id.trim() == DS[0][j]) {

                /*Kiểm tra nếu các crl display none sẽ display none luon ctl cha*/
                var arrCtlChildren = div.children;
                var countCtl = 0;
                try {
                    countCtl = DS[5][j][0] != null ? DS[5][j][0].length : 0;
                } catch (e) {
                    countCtl = arrCtlChildren.length;
                }

                var countDisplayNone = 0;
                for (var x = 0; x < arrCtlChildren.length; x++) {
                    var displayValueCtlChildren = arrCtlChildren[x].style.display;
                    if (displayValueCtlChildren == 'none')
                        countDisplayNone++;
                }

                if (countCtl != 0 && countCtl == countDisplayNone) {
                    div.style.cssText = DS[2][j] + ';display:none;';
                }
                    /*end Kiểm tra nếu các crl display none sẽ display none luon ctl cha*/
                else {
                    /*Set style*/
                    try {
                        //Nếu set notchangedisplay trong cs thì replace style display = rỗng và cộng lại style sẵn có (style sẵn có là style thiết lập trong code cs)
                        if (div.attributes['data-notchangedisplay'].value == "1") {
                            //Lấy style hiện tại
                            var originalStyle = div.style.cssText;
                            //Lấy style display hiện tại
                            var originalDisplay = originalStyle.substring(originalStyle.indexOf("display"));
                            originalDisplay = originalDisplay.substring(0, originalDisplay.indexOf(";") + 1)

                            //Lấy style mới (thiết lập db)
                            var newStyle = DS[2][j];
                            //Lấy Style display mới
                            var newDisplay = newStyle.substring(newStyle.indexOf("display"));
                            newDisplay = newDisplay.substring(0, newDisplay.indexOf(";") + 1);
                            //Replace style mới = ""
                            newStyle = newStyle.replace(newDisplay, "");
                            //Gán style display hiện tại vào style mới
                            newStyle = newStyle + ";" + originalDisplay;
                            //Gán style mới (đã chính sửa) vào div
                            div.style.cssText = newStyle;
                        }
                        else
                            div.style.cssText = DS[2][j];
                    }
                    catch (error) {
                        div.style.cssText = DS[2][j];
                    }
                }
                /*Set Index*/
                if (div.hasAttribute("data-index"))
                    div.attributes['data-index'].value = DS[1][j];
                else {
                    var att = document.createAttribute("data-index");       // Create attribute
                    att.value = DS[1][j];                                       // Set the value of the class attribute
                    div.setAttributeNode(att);                                  // Add the class attribute to ctl
                }

                /*Set data-visible*/
                if (div.hasAttribute("data-visible"))
                    div.attributes['data-visible'].value = DS[3][j];
                else {
                    var att = document.createAttribute("data-visible");       // Create attribute
                    att.value = DS[3][j];                                       // Set the value of the class attribute
                    div.setAttributeNode(att);                                  // Add the class attribute to ctl
                }

                /*Set data-visibleAll*/
                if (div.hasAttribute("data-visibleAll"))
                    div.attributes['data-visibleAll'].value = DS[4][j];
                else {
                    var att = document.createAttribute("data-visibleAll");       // Create attribute
                    att.value = DS[4][j];                                       // Set the value of the class attribute
                    div.setAttributeNode(att);                                  // Add the class attribute to ctl
                }

                /*LamNT22-27082015 - Bổ sung xử lý đệ quy cho các div cấp tiếp theo*/
                if (DS[5] != null && DS[5][j] != null && DS[5][j].length > 0) {
                    setIndexAndStyle(id, DS[5][j]);
                }
                /*LamNT22-27082015 - Bổ sung xử lý đệ quy cho các div cấp tiếp theo*/


                break;
            }
        }
    }
    //
    if (parentId == 'DivColumn1')
        hideParentDivByChildrenDiv(parentId);

    sortChildrenDivsById(parentId, true, '');
    return false;
}

function ShowHideDivByUserGroupID(ctl, isShow, sUserGroupID) {
    var dataVisible, dataVisibleAll;
    dataVisible = ctl.attributes["data-visible"] === undefined ? '' : (ctl.attributes["data-visible"] != '' ? ctl.attributes["data-visible"].value : '1');
    dataVisibleAll = ctl.attributes["data-visibleAll"] === undefined ? '' : (ctl.attributes["data-visibleAll"] != '' ? ctl.attributes["data-visibleAll"].value : '1');
    datanotchangedisplay = ctl.attributes["data-notchangedisplay"] === undefined ? '' : ctl.attributes["data-notchangedisplay"].value;
    if (datanotchangedisplay != '1') {
        //Nếu dataVisible == 0 ẩn các account thường
        if (dataVisible == "0" && isShow) {
            if (sUserGroupID == 'admin')
                ctl.style.display = "";
            else
                ctl.style.display = "none";
        }
        else if (dataVisible == "" && isShow)
            ctl.style.display = "";
        else
            ctl.style.display = "none";
        //Nếu dataVisibleAll == 0 ẩn tất cả các account
        if (dataVisibleAll == "0")
            ctl.style.display = "none";
    }
}

//20160218
function SetVisibleByEye(DSEyes, parentId, idGetControl) {
    var allObj = document.all;
    for (var j = 0; j < allObj.length; j++) {
        var obj = allObj[j];

        if (obj.id != null && obj.id != "") {
            for (var i = 0; i < DSEyes[0].length; i++) {
                //Nếu control được con mắt lưu hiện thì hiện các div cha
                if (DSEyes[0][i] == obj.id.replace('_ctl0_', '') && DSEyes[1][i] == "1") {
                    //cha 1
                    if (obj.parentElement.hasAttribute("data-visible"))
                        obj.parentElement.removeAttribute("data-visible");
                    //cha 2 (ông)
                    if (obj.parentElement.parentElement.hasAttribute("data-visible"))
                        obj.parentElement.parentElement.removeAttribute("data-visible");
                    //cha 3 (cố)
                    if (obj.parentElement.parentElement.parentElement.hasAttribute("data-visible"))
                        obj.parentElement.parentElement.parentElement.removeAttribute("data-visible");
                }

                //Nếu Div thay thế cho Tr hoặc TD được con mắt lưu hiện thì hiện Div & các div cha lên
                var VisibleFrmCtlID_Ref;
                if (obj.hasAttribute("data-VisibleFrmCtlID_Ref"))
                    VisibleFrmCtlID_Ref = obj.attributes['data-VisibleFrmCtlID_Ref'].value;//Lấy ID tr đã lưu trong con mắt
                else
                    VisibleFrmCtlID_Ref = "";

                if (DSEyes[0][i] == VisibleFrmCtlID_Ref && DSEyes[1][i] == "1") {
                    if (obj.hasAttribute("data-visible"))
                        obj.removeAttribute("data-visible");
                    //cha 1
                    if (obj.parentElement.hasAttribute("data-visible"))
                        obj.parentElement.removeAttribute("data-visible");
                    //cha 2 (ông)
                    if (obj.parentElement.parentElement.hasAttribute("data-visible"))
                        obj.parentElement.parentElement.removeAttribute("data-visible");
                    //cha 3 (cố)
                    if (obj.parentElement.parentElement.parentElement.hasAttribute("data-visible"))
                        obj.parentElement.parentElement.parentElement.removeAttribute("data-visible");
                }
                    //Nếu Tr hoặc TD được con mắt lưu ẩn thì ẩn Div đi
                else if (DSEyes[0][i] == VisibleFrmCtlID_Ref && DSEyes[1][i] == "0") {
                    if (obj.hasAttribute("data-visible"))
                        obj.removeAttribute("data-visible");

                    var att = document.createAttribute("data-visible");       // Create attribute
                    att.value = "0";                                       // Set the value of the class attribute
                    obj.setAttributeNode(att);                                  // Add the class attribute to ctl
                }
            }
        }
    }
}

function replaceAll(str, find, replace) {
    return str.replace(new RegExp(find, 'g'), replace);
}
// RadGrid
function ClientResized(sender, eventArgs) {
    if (sender.ClientID != null) {
        $find(sender.ClientID).repaint();
    }
}
function getAge(sNgaySinh, sNgayChot) {
    var checkstr = "0123456789";
    var Datevalue = "";
    var DateTemp = "";
    var day;
    var month;
    var year;
    var i;
    DateValue = sNgaySinh;
    if (DateValue == "") return;
    /* Delete all chars except 0..9 */
    for (i = 0; i < DateValue.length; i++) {
        if (checkstr.indexOf(DateValue.substr(i, 1)) >= 0) {
            DateTemp = DateTemp + DateValue.substr(i, 1);
        }
    }
    DateValue = DateTemp;
    /* Always change date to 8 digits - string*/
    /* if year is entered as 2-digit / always assume 20xx */
    if (DateValue.length == 6) {
        DateValue = DateValue.substr(0, 4) + '20' + DateValue.substr(4, 2);
    }
    day = DateValue.substr(0, 2);
    month = DateValue.substr(2, 2);
    year = DateValue.substr(4, 4);
    var currentDate = new Date();/*NhanNH2 tìm theo ghi chú log : NhanQV_20062016*/

    if (sNgayChot != null && sNgayChot != "") {
        var arrToDate = sNgayChot.split('/');
        currentDate = new Date(arrToDate[2].toString() + '-' + arrToDate[1].toString() + '-' + arrToDate[0].toString())
    }

    var currentYear = currentDate.getFullYear();
    var currentMonth = currentDate.getMonth();
    var currentDay = currentDate.getDate();

    var calculatedAge = currentYear - year;
    if (currentMonth < month - 1) {
        calculatedAge--;
    }
    if (month - 1 == currentMonth && currentDay < day) {
        calculatedAge--;
    }
    return calculatedAge;
}
function FromSmallToYearValue(objFromYear, objToYear) {
    var ToDate, FromDate
    FromDate = '01/01/' + objFromYear
    if (objToYear == '')
        ToDate = '01/01/2100'
    else
        ToDate = '01/12/' + objToYear

    if ((!isBlank(FromDate)) && (!isBlank(ToDate))) {
        if (!IsSmallerOrEqual(FromDate, ToDate)) {
            //alert("FromDate must be less than ToDate!");
            //objToDate.focus()
            return false;
        }
        else
            return true;
    }
    else
        return true;
}

//TriTV 19-01-2018 Copy từ RadComboBox1 -> RadComboBox2
function CopyRadCombo(objRadCombo1, objRadCombo2) {

    if (objRadCombo1 != null && objRadCombo2 != null) {
        objRadCombo2.trackChanges();
        objRadCombo2.set_text(objRadCombo1.get_text());
        objRadCombo2.set_value(objRadCombo1.get_value());
        objRadCombo2.commitChanges();
    }

    return true;
}
function LeftMenu_F12OrClick_NotError() {
    if ($.cookie('LeftMenu') == 'true') {
        LeftMenu();
        setTimeout(function () { LeftMenu_CallBack(); }, 0);

    }
}
function LeftMenu_CallBack() {
    if ($.cookie('LeftMenu') == 'true') {
        LeftMenu_CallBack();
    }
    else {
        LeftMenu();
    }
}

//HuyenHB -- Thêm các phương thức xử lý dữ liệu với JSON
Common = function () {
    this.QuickSort =  {
        quickSort: function (items, left, right) {
            var len = arr.length,
            pivot,
            partitionIndex;
            if (left < right) {
                pivot = right;
                partitionIndex = partition(arr, pivot, left, right);

                //sort left and right
                quickSort(arr, left, partitionIndex - 1);
                quickSort(arr, partitionIndex + 1, right);
            }
            return arr;
        },
        partition: function (arr, pivot, left, right) {
            var pivotValue = arr[pivot],
            partitionIndex = left;

            for (var i = left; i < right; i++) {
                if (arr[i] < pivotValue) {
                    swap(arr, i, partitionIndex);
                    partitionIndex++;
                }
            }
            swap(arr, right, partitionIndex);
            return partitionIndex;
        },
        swap: function (arr, i, j) {
            var temp = arr[i];
            arr[i] = arr[j];
            arr[j] = temp;
        },
        sortElements: function (elements, callback) {
            var elems = [];
            for (var i = 0; i < elements.length; ++i) {
                var el = elements[i];
                elems.push(el);
            }
            var sorted = elems.sort(callback);
            return sorted;
        }
    }
    return this.Init();
};

Common.prototype = {
    Init: function () {

    },
    stringToJSON: function (input) {
        var result = [];

        //replace leading and trailing [], if present
        input = input.replace(/^\[/, '');
        input = input.replace(/\]$/, '');

        //change the delimiter to 
        input = input.replace(/},{/g, '};;;{');

        input = input.replace(/\\n/g, "\\n")
        .replace(/\\'/g, "\\'")
        .replace(/\\"/g, '\\"')
        .replace(/\\&/g, "\\&")
        .replace(/\\r/g, "\\r")
        .replace(/\\t/g, "\\t")
        .replace(/\\b/g, "\\b")
        .replace(/\\f/g, "\\f");
        // remove non-printable and other non-valid JSON chars
        input = input.replace(/[\u0000-\u0019]+/g, "");

        input = input.split(';;;');

        input.forEach(function (element) {
            // console.log(JSON.stringify(element));
            result.push(JSON.parse(element));
        }, this);

        return result;
    },
    store: function (namespace, data) {
        if (arguments.length > 1) {
            return localStorage.setItem(namespace, JSON.stringify(data));
        } else {
            var store = localStorage.getItem(namespace);
            return (store && JSON.parse(store)) || [];
        }
    },
    getIndexFromEl: function (el,localStorage) {
        try {
            var id = $(el).data('id');
            var todos = this.store(localStorage);
            var i = todos.length;
            while (i--) {
                if (todos[i].id === id) {
                    return i;
                }
            }
        }
        catch (e) { }
    },
    ShowLoading: function (selector, isShow) {
        if (isShow) {
            $(selector).show();
        } else {
            $(selector).hide();
        }
    },
    DisableButton: function (selector, isDisable) {
        if (isDisable) {
            $(selector).prop('disabled', true);
        } else {
            $(selector).prop('disabled', false);
        }
    },
    LoadingCount: 0, //Count loading request
    Empty: function (target) {
        if (target == null || target == undefined || target == "" || target.length == 0 || jQuery.trim(target).length == 0)
            return true;
        return false;
    },
    NewGuild: function () {
        var d = new Date().getTime();
        var uuid = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
            var r = (d + Math.random() * 16) % 16 | 0;
            d = Math.floor(d / 16);
            return (c == 'x' ? r : (r & 0x7 | 0x8)).toString(16);
        });
        return uuid;
    },
    Create2DArray: function (rows) {
        var arr = [];
        for (var i = 0; i < rows; i++) {
            arr[i] = [];
        }
        return arr;
    }
};
this.Common = window.Common = new Common();

