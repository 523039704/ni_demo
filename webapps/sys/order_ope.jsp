<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
 
	$(document).ready(function() {
		$("#ope").val($("#address1")[0].value);
	});
</script>
<div class="bjui-pageContent">
    <form action="${pageContext.request.contextPath}/order/insert" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
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
                        <select name="ope" id="ope" data-toggle="selectpicker" data-rule="required">
                                 <option value="">购买类型</option>
   						   		 <option value="1">基金</option>
 						  		 <option value="2">课程</option>
 						  		 <option value="3">P2P理财</option>
                        </select>
                    </td>
                     <td>
                        <label for="j_custom_birthday" class="control-label x85">产品名称：</label>
                        <input type="text" class="input" id="pname" name="pname"  value="${(messager.name)}"  readonly />
                    	<input type="hidden" class="input" id="id" name="id"  value="${(messager.id)}" />
                    	<input type="hidden" class="input" id="admin" name="admin"  value="${(messager.admin)}" />
                    	<input type="hidden" class="input" id="filiale" name="filiale"  value="${(messager.filiale)}" />
                    	<input type="hidden" class="input" id="agent" name="agent"  value="${(messager.agent)}" />
                    	<input type="hidden" class="input" id="business" name="business"  value="${(messager.business)}" />
                    	<input type="hidden" class="input" id="longtime" name="longtime"  value="${(messager.longtime)}" />
                        <c:if test="${param.ptoducti  eq '1'}"> 
                    	<input type="hidden" class="input" id="overdatetime" name="overdatetime"  value="${(messager.overdate)}" />
                    	<input type="hidden" class="input" id="income" name="income"  value="${(messager.income)}" />
                    	</c:if>
                 </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x85">金额：</label>
                        	<input type="text" class="input" id="price" name="price" size="50"   value="${(messager.price)}" placeholder="金额" data-rule="required" maxlength="11" />
                    </td>
                    <td>
                        <label for="j_custom_fname" class="control-label x85">状态：</label>
 						<select name="status" id="status" data-toggle="selectpicker" data-rule="required">
                                  <option value="">状态</option>
 						          <option value="0">未付款</option>
   						   		  <option value="1">已付款</option>
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