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
 
</script>
<div class="bjui-pageContent">
    <form action="${pageContext.request.contextPath}/range/<%if( request.getAttribute("range")==null){out.print("insert");}else{out.print("update");}%>" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
        <input type="hidden" name="custom.id" value="edce142bc2ed4ec6b623aacaf602a4de">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
                <tr>
                    <td>
                        <label for="j_custom_color" class="control-label x85">最小金额：</label>
                     	<input type="hidden" name="id" id="id"  value="${(range.id)}"   size="15"    >
                     	<input type="text" name="min" id="min"  value="${(range.amount_min)}"   size="15"    >
					</td>
                
                </tr>
                 <tr>
                    <td>
                        <label for="j_custom_color" class="control-label x85">最大金额：</label>
                     	<input type="text" name="max" id="max"  value="${(range.amount_max)}"   size="15"   >
					</td>
                
                </tr>
                 <tr>
                    <td>
                        <label for="j_custom_color" class="control-label x85">获取的收益率：</label>
                      	<input type="text" name="income" id="income"  value="${(range.income)}"   size="15"   >
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