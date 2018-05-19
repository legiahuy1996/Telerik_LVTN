function onPostBack()
    {
        
        var y=generateRandomSequence();
        
        var hdnGuid=document.getElementById("hdnGuid");    
        if(hdnGuid !=null)
            hdnGuid.value=y;
    }


function generateRandomSequence() 
{ 
    var g = ""; 
    for(var i = 0; i < 32; i++) 
        g += Math.floor(Math.random() * 0xF).toString(0xF) 
    return g; 
} 
