<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/DevTag.tld" prefix="DevTag"%>
<script type="text/javascript">

$(document).ready(function() {
	$("#address").val($("#addressid")[0].value);
	$("#upe").val($("#upe1")[0].value);
	 

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
    <form action="/product/<%if( request.getAttribute("product")==null){out.print("insert");}else{out.print("update");}%>" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
                <tr>
                    <td>
                        <label for="j_custom_color" class="control-label x85">产品名称：</label>

						<input type=hidden id="id" name="id" value="${(product.id)}">
						<input type=hidden id="addressid" name="addressid" value="${(product.addressid)}">
						<input type=hidden id="upe1" name="upe1" value="${(product.upe)}">
                        <input type="text" name="name" id="name"  value="${(product.name)}"   size="15"  <%if( request.getAttribute("sid").equals("0")){out.print(" readonly");}%> >
                    </td>
                
                </tr>
                <tr>
                 <td>
                        <label for="j_custom_birthday" class="control-label x85">起购日期：</label>
                        <input type="text" name="begindate" id="begindate"  value="${(product.begindate)}" data-toggle="datepicker" data-rule="required;date" size="15" readonly="readonly" >
                    </td>
                     <td>
                        <label for="j_custom_birthday" class="control-label x85">截止日期：</label>
                        <input type="text" name="enddate" id="enddate"  value="${(product.enddate)}" data-toggle="datepicker" data-rule="required;date" size="15"  readonly="readonly" >
                    </td>
                </tr>
                 <tr>
                     <td>
                        <label for="j_custom_birthday" class="control-label x85">开始日期：</label>
                        <input type="text" name="strdate" id="strdate"  value="${(product.strdate)}" data-toggle="datepicker" data-rule="required;date" size="15"  readonly="readonly" >
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="j_custom_name" class="control-label x85">期限：</label>
                        <input type="text" name="datetime" id="datetime"  value="${(product.longtime)}" data-rule="required" size="15"  <%if( request.getAttribute("sid").equals("0")){out.print(" readonly");}%>><span>天</span>
                    </td>
                    <td>
                        <label for="j_custom_fname" class="control-label x85">起点金额：</label>
                        <input type="text" name="price" id="price" value="${(product.small_mony)}" data-rule="required" size="15"  <%if( request.getAttribute("sid").equals("0")){out.print(" readonly");}%>><span>万</span>
                    </td>
                </tr>
                <tr>
                <td>
                        <label for="j_custom_sale" class="control-label x85">地区：</label>
                        <select name="address" id="address" data-toggle="selectpicker" data-rule="required"  <%if( request.getAttribute("sid").equals("0")){out.print(" disabled");}%>>
                             <option value="-1">请选择地区</option>
   						  	 <option value="11">北京</option>
 						   	 <option value="12">上海</option>
 						   	 <option value="13">深圳</option>
                        </select>
                    </td>
                    <td>
                        <label for="j_custom_sale" class="control-label x85">是否推荐：</label>
                        <select name="upe" id="upe" data-toggle="selectpicker" data-rule="required"  <%if( request.getAttribute("sid").equals("0")){out.print(" disabled");}%>>
                                <option value="1">否</option>
 						   		<option value="2">是</option>
                        </select>
                    </td>
                </tr>
                
                <tr>
                <td> 
                        <label for="" class="control-label x85">年收益率:</label>
                        <input type="text" name="income" id="income" value="${(product.income)}" data-rule="required" size="15"  <%if( request.getAttribute("sid").equals("0")){out.print(" readonly");}%>><span>%</span>
                 </td>
                 
                </tr>
                  <tr>
                <td> 
                        <label for="" class="control-label x85">总公司服务率:</label>
                        <input type="text" name="admin" id="admin" value="${(product.admin)}" data-rule="required" size="15"  <%if( request.getAttribute("sid").equals("0")){out.print(" readonly");}%>><span>%</span>
                 </td>
                 <td> 
                        <label for="" class="control-label x85">分公司服务率:</label>
                        <input type="text" name="filiale" id="filiale" value="${(product.filiale)}" data-rule="required" size="15"  <%if( request.getAttribute("sid").equals("0")){out.print(" readonly");}%>><span>%</span>
                 </td>
                 <td> 
                        <label for="" class="control-label x85">代理商服务费率:</label>
                        <input type="text" name="agent" id="agent" value="${(product.agent)}" data-rule="required" size="15"  <%if( request.getAttribute("sid").equals("0")){out.print(" readonly");}%>><span>%</span>
                 </td>
                 <td> 
                        <label for="" class="control-label x85">业务员服务费率:</label>
                        <input type="text" name="business" id="business" value="${(product.business)}" data-rule="required" size="15"  <%if( request.getAttribute("sid").equals("0")){out.print(" readonly");}%>><span>%</span>
                 </td>
                </tr>
                <tr>
                    <td>
                        <label for="" class="control-label x85">产品详情：</label>
                        <textarea name="information" id="information" data-toggle="autoheight" cols="60" rows="5"  <%if( request.getAttribute("sid").equals("0")){out.print(" readonly");}%>>${(product.information)}</textarea>
                    </td>
                   
                </tr>
            </tbody>
        </table>
    </form>
</div>
<div class="bjui-pageFooter">
 <%if( request.getAttribute("sid").equals("1")){%>
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
        <li><button type="submit" class="btn-default" data-icon="save">保存</button></li>
    </ul>
 <%} %>   
</div>