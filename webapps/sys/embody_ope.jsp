<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function() {
	$("#statusID").val($("#status")[0].value);
});


function pic_upload_success(file, data) {
    var json = $.parseJSON(data)
    
    $(this).bjuiajax('ajaxDone', json)
    if (json[BJUI.keys.statusCode] == BJUI.statusCode.ok) {
        $('#j_custom_pic').val(json.filename).trigger('validate')
    }
}
function do_OK(json, $form) {
    console.log(json)
    console.log($form)
}
 
</script>
<div class="bjui-pageContent">
    <form action="${pageContext.request.contextPath}/embody/update_embody>" id="j_custom_form" data-toggle ="validate" data-alertmsg="false">
        <input type="hidden" name="custom.id" value="edce142bc2ed4ec6b623aacaf602a4de">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
                <tr>
                    <td>
                        <label for="j_custom_color" class="control-label x85">提现用户名：</label>
                           <input type="hidden" name="status" id="status" value="${(embody.status)}"   size="15"  >
                           <input type="hidden" name="id" id="id" value="${(embody.id)}"   size="15"  >
                        <input type="text" name="uid" id="uid" value="${(embody.uid)}"   size="15"   readonly="readonly" > 
					</td>
                </tr>
                 <tr>
                    <td>
                        <label for="j_custom_color" class="control-label x85">提现银行卡：</label>
                          <input type="text" name="path" id="path" value="${(embody.price)}"   size="15"  readonly="readonly">
					</td>
                
                </tr>
      			 <tr>
                    <td>
                        <label for="j_custom_color" class="control-label x85">提现金额：</label>
                          <input type="text" name="price" id="price" value="${(embody.price)}"   size="15"readonly="readonly" >
					</td>
                
                </tr>
                 <tr>
                    <td>
                        <label for="j_custom_color" class="control-label x85">状态审核：</label>
                          <select name="statusID" id="statusID" data-toggle="selectpicker" data-rule="required"  >
                             <option value="">选择状态</option>
                             <option value="0">未审核</option>
   						  	 <option value="-1">审核失败</option>
 						   	 <option value="1">审核成功</option>
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