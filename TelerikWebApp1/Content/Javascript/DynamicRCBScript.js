
//Declare
var index;
var comboID;
var RCB;
var childRCB;
var parentRCB;
var parentRCB2;
var context;
//End Declare

function GenerateRCB(comboID) {
    return $find(comboID);
}

function GetParentRCB(comboID) {
    return GenerateRCB(GetRCBInfo(comboID, 1));
}
function GetParentRCB2(comboID) {
    return GenerateRCB(GetRCBInfo(comboID, 3));
}

function GetRCBInfo(comboID, iType) {
    /*
    iType   0: get index
            1: get parent RCB ID
            2: get related ID field
            3: get parent RCB ID 2
            4: get related ID field 2
    */
    for (index = 0; index <= iRadComboNo; index++) {
        if (DSRadCombo[0][index] == comboID) {
            if (iType == 0)
                return index;
            if (iType == 1)
                return DSRadCombo[1][index];
            if (iType == 2)
                return DSRadCombo[2][index];
            if (iType == 3)
                return DSRadCombo[8][index];
            if (iType == 4)
                return DSRadCombo[9][index];
        }
    }
}

function ClearRelatedRCB(combo, eventArqs) {
    comboID = combo.get_id();
    var txt2ChaCombo = document.getElementById(comboID.replace('cbo', 'txtcbo'));
    var txt2ChaCombo_Value = "";
    if (txt2ChaCombo != null)
        txt2ChaCombo_Value = txt2ChaCombo.value;

    for (index = 0; index <= iRadComboNo; index++) {
        if (DSRadCombo[1][index] == comboID || (DSRadCombo[8][index] == comboID && txt2ChaCombo_Value.toUpperCase() != "FALSE"/*combo 2 cha*/)) {
            childRCB = GenerateRCB(DSRadCombo[0][index]);
            
            if (childRCB != null) {
                childRCB.set_text("");
                childRCB.clearItems();
            }
            else break;
            ClearRelatedRCB(childRCB,eventArqs);
        }
    }
}

function Related_OnClientRequesting(sender, eventArgs) {
    context = eventArgs.get_context();
    // Thiết lập context["Text"] cho RadComboBox thực hiện request
    context["Text"] = sender.get_text();
    // Thiết lập context["ID"] đối với các RadComboBox "Parent"
    comboID = sender.get_id();
    //Lấy related field
    var relatedField = GetRCBInfo(comboID, 2);
    var relatedField2 = GetRCBInfo(comboID, 4);
    //Lấy combo parent
    parentRCB = GetParentRCB(comboID);
    parentRCB2 = GetParentRCB2(comboID);
    //Xử lý context
    if (parent != null) {
        index = GetRCBInfo(comboID, 0);
        context[relatedField] = parentRCB.get_value();
        context["RelatedString"] = relatedField + "='" + parentRCB.get_value() + "'";
        context["TypeOfRCB"] = DSRadCombo[3][index];
        context["ValueFieldName"] = DSRadCombo[4][index];
        context["TextFieldName"] = DSRadCombo[5][index];
        context["CacheName"] = DSRadCombo[6][index];
        context["UsePermission"] = DSRadCombo[7][index];
        context["isDynamic"] = '1';
        //
        try
        {
            context[relatedField2] = parentRCB2.get_value();
            context["RelatedString2"] = relatedField2 + "='" + parentRCB2.get_value() + "'";
        }
        catch(error)
        {
            context[relatedField2] = "";
            context["RelatedString2"] = "";
        }

    }
}

function OnClientRequesting(sender, eventArgs) {
    index = GetRCBInfo(sender.get_id(), 0);
    context = eventArgs.get_context();
    context["Text"] = sender.get_text();
    context["TypeOfRCB"] = DSRadCombo[3][index];
    context["ValueFieldName"] = DSRadCombo[4][index];
    context["TextFieldName"] = DSRadCombo[5][index];
    context["CacheName"] = DSRadCombo[6][index];
    context["UsePermission"] = DSRadCombo[7][index];
    context["isDynamic"] = '1';
}