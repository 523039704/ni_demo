<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/DevTag.tld" prefix="DevTag"%>
 <script type="text/javascript">
	$(document).ready(function() {
		$("#roleID").val($("#role")[0].value);
	});
	
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
    <form action="/user/<%if( request.getAttribute("user")==null){out.print("insert");}else{out.print("update");}%>" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
        <input type="hidden" name="custom.id" value="edce142bc2ed4ec6b623aacaf602a4de">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
                <tr>
                    
                    <td>
						<input type=hidden id="id" name="id" value="${(user.id)}">
						<input type=hidden id="role" name="role" value="${(user.role)}">
                        <label for="j_custom_color" class="control-label x85">业务员姓名：</label>
                        <input type="text" name="username" id="username"  value="${(user.adminname)}" data-rule="required"  size="15"  >
                    </td>
                     <td>
                        <label for="j_custom_color" class="control-label x85">业务员姓名：</label>
                             <input type="text" name="realtname" id="realtname"  value="${(user.realname)}" data-rule="required"  size="15"  >
                    </td>
                   
                </tr>
                <tr>
                 <td >
                        <label class="control-label x85">业务员身份证号：</label>
                        <input type="text" name="numbercard" id="numbercard"  value="${(user.numbercard)}" data-rule="required"  size="15"  >
                    </td>
                    <td>
                        <label for="j_custom_name" class="control-label x85">业务员手机：</label>
                        <input type="text" name="phone" id="phone"  value="${(user.phone)}" data-rule="required" size="15">
                    </td>
                   
                </tr>
                <tr>
                 <td>
                        <label for="j_custom_fname" class="control-label x85">业务员Email</label>
                        <input type="text" name="email" id="email"  value="${(user.email)}" data-rule="required" size="15">
                    </td>
                    <td>
                        <label for="j_custom_lname" class="control-label x85">操作类型：</label>
       					       <DevTag:FormSelectRoleListTag/>
				     </td>
                </tr>
                 <tr>
                    <td>
                        <label for="j_custom_lname" class="control-label x85">设置分组：</label>
       					       <DevTag:FormSelectGroupListTag/>
				     </td>
               		<td>
                        <label for="j_custom_lname" class="control-label x85">是否为队长：</label>
       					<input type="radio" name="captain" id="captain" data-toggle="icheck" value="1" data-rule="checked" data-label="是&nbsp;&nbsp;">
                        <input type="radio" name="captain" id="captain" data-toggle="icheck" value="0" data-label="否" checked="checked">
				     </td>
                </tr>
                 <tr>
                            <td>
                           		<label for="j_custom_lname" class="control-label x185">用户所在城市：</label> 
	       					       <DevTag:FormSelectProvinceListTag/>
                                <select name="city" id="j_form_city2" data-toggle="selectpicker" data-nextselect="#j_form_area2" data-refurl="/zone/area?id={value}" data-emptytxt="--城市--">
                                    <option value="all">--城市--</option>
                                </select>
                                <select name="area" id="j_form_area2" data-toggle="selectpicker" data-emptytxt="--区县--">
                                    <option value="all">--区县--</option>
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