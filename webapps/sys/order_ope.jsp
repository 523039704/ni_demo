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
    <form action="${pageContext.request.contextPath}/order/insert" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
        <input type="hidden" name="custom.id" value="edce142bc2ed4ec6b623aacaf602a4de">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
                <tr>
                    <td>
                        <label for="j_custom_color" class="control-label x85">客户名称：</label>
                   		 <input type="hidden" name="address1" id="address1"	value="${param.ptoducti}" />
                         <input type="text" class="input" id="username" name="username" size="31" placeholder="用户名称" data-validate="required:请填写登陆名称" />  
					</td>
                
                </tr>
                <tr>
                 <td>
                        <label for="j_custom_birthday" class="control-label x85">购买类型：</label>
                        <select name="address" id="address" data-toggle="selectpicker" data-rule="required">
                                 <option value="">购买类型</option>
   						   		 <option value="1">基金</option>
 						  		 <option value="2">课程</option>
 						  		 <option value="3">P2P理财</option>
                        </select>
                    </td>
                     <td>
                        <label for="j_custom_birthday" class="control-label x85">产品名称：</label>
                        <input type="text" class="input" id="numbercard" name="numbercard"  value="${(messager.name)}"  readonly />
                    	<input type="hidden" class="input" id="numbercard" name="numbercard"  value="${(messager.id)}" />
                 </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x85">金额：</label>
                        	<input type="text" class="input" id="phone" name="phone" size="50" placeholder="金额" data-validate="required:请输入购买金额数" maxlength="11" />
                    </td>
                    <td>
                        <label for="j_custom_fname" class="control-label x85">状态：</label>
 						<select name="address" id="address" data-toggle="selectpicker" data-rule="required">
                                  <option value="">状态</option>
   						   		  <option value="1">已付款</option>
 						          <option value="2">未付款</option>
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