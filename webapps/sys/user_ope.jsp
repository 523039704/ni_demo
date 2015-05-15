<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <script type="text/javascript">
function pic_upload_success(file, data) {
    var json = $.parseJSON(data)
    
    $(this).bjuiajax('ajaxDone', json)
    if (json[BJUI.keys.statusCode] == BJUI.statusCode.ok) {
        $('#j_custom_pic').val(json.filename).trigger('validate')
        $('#j_custom_span_pic').html('<img src="'+ json.filename +'" width="100" />')
    }
}
function do_OK(json, $form) {
    console.log(json)
    console.log($form)
}
//护照有效日期  = 签发日期 + 10年
$('#j_custom_issuedate').on('afterchange.bjui.datepicker', function(e, data) {
    var pattern = 'yyyy-MM-dd'
    var start   = end = data.value
    
    end.setFullYear(start.getFullYear() + 10)
    end.setDate(start.getDate() - 1)
    
    $('#j_custom_indate').val(end.formatDate(pattern))
})
</script>
<div class="bjui-pageContent">
    <form action="/user/insert" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
        <input type="hidden" name="custom.id" value="edce142bc2ed4ec6b623aacaf602a4de">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
                <tr>
                    
                    <td>
                        <label for="j_custom_color" class="control-label x85">业务员姓名：</label>
                        <input type="text" name="username" id="username" value="" data-toggle="colorpicker" data-bgcolor="true" size="15"  >
                    </td>
                     <td>
                        <label for="j_custom_color" class="control-label x85">业务员姓名：</label>
                             <input type="text" name="realtname" id="realtname" value="" data-toggle="colorpicker" data-bgcolor="true" size="15"  >
                    </td>
                   
                </tr>
                <tr>
                 <td >
                        <label class="control-label x85">业务员身份证号：</label>
                        <input type="text" name="numbercard" id="numbercard" value="" data-toggle="colorpicker" data-bgcolor="true" size="15"  >
                    </td>
                    <td>
                        <label for="j_custom_name" class="control-label x85">业务员手机：</label>
                        <input type="text" name="custom.name" id="j_custom_name" value="" data-rule="required" size="15">
                    </td>
                   
                </tr>
                <tr>
                 <td>
                        <label for="j_custom_fname" class="control-label x85">业务员Email</label>
                        <input type="text" name="custom.fname" id="j_custom_fname" value="" data-rule="required;letters" size="15">
                    </td>
                    <td>
                        <label for="j_custom_lname" class="control-label x85">操作类型：</label>
                    	 <select name="ope" id="ope"  data-toggle="selectpicker" data-rule="required">
       					   <option value="-1">请选择功能</option>
   						   <option value="1">子公司</option>
 						   <option value="2">代理商</option>
 						   <option value="3">业务员</option>
						</select>
				     </td>
                </tr>
            </tbody>
        </table>
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
        <li><button type="submit" class="btn-default" data-icon="save">保存</button></li>
    </ul>
</div>