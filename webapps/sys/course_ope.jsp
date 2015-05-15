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
    <form action="${pageContext.request.contextPath}/course/insert" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
        <input type="hidden" name="custom.id" value="edce142bc2ed4ec6b623aacaf602a4de">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
                <tr>
                    <td>
                        <label for="j_custom_color" class="control-label x85">课程名称：</label>
                        <input type="text" name="username" id="username" value="" data-toggle="colorpicker" data-bgcolor="true" size="15"  >
                    </td>
                
                </tr>
                <tr>
                 <td>
                        <label for="j_custom_birthday" class="control-label x85">起购日期：</label>
                        <input type="text" name="custom.birthday" id="j_custom_birthday" value="1980-08-08" data-toggle="datepicker" data-rule="required;date" size="15">
                    </td>
                     <td>
                        <label for="j_custom_birthday" class="control-label x85">截止日期：</label>
                        <input type="text" name="custom.birthday" id="j_custom_birthday" value="1980-08-08" data-toggle="datepicker" data-rule="required;date" size="15">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x85">金额：</label>
                        <input type="text" name="custom.name" id="j_custom_name" value="张三" data-rule="required" size="15">
                    </td>
                    <td>
                        <label for="j_custom_fname" class="control-label x85">人数：</label>
                        <input type="text" name="custom.fname" id="j_custom_fname" value="Zhang" data-rule="required;letters" size="15">
                    </td>
                </tr>
                <tr>
                <td>
                        <label for="j_custom_sale" class="control-label x85">服务费率：</label>
                          <input type="text" name="custom.fname" id="j_custom_fname" value="Zhang" data-rule="required;letters" size="15">
                   </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_birthday" class="control-label x85">产品详情：</label>
                        <textarea name="custom.note" id="j_custom_note" data-toggle="autoheight" cols="60" rows="1"></textarea>
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