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
    <form action="/course/<%if( request.getAttribute("course")==null){out.print("insert");}else{out.print("update");}%>" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
        <table class="table table-condensed table-hover" width="100%">
            <tbody>
                <tr>
                    <td>
                        <label for="" class="control-label x85">课程名称：</label>
                        <input type="hidden" name="id" id="id" value="${(course.id)}"   size="15"  >
                        <input type="text" name="name" id="name" value="${(course.name)}"   size="15"  <%if( request.getAttribute("sid").equals("0")){out.print(" readonly");}%> >
                    </td>
                
                 
                </tr>
                <tr>
                 <td>
                        <label for="" class="control-label x85">起购日期：</label>
                        <input type="text" name="createdatetime" id="createdatetime"value="${(course.createdatetime)}"   data-toggle="datepicker" data-rule="required;date" size="15" readonly>
                    </td>
                     <td>
                        <label for="" class="control-label x85">截止日期：</label>
                        <input type="text" name="coursedatetime" id="coursedatetime" value="${(course.coursedatetime)}"   data-toggle="datepicker" data-rule="required;date" size="15" readonly>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="" class="control-label x85">金额：</label>
                        <input type="text" name="price" id="price" value="${(course.price)}"  data-rule="required" size="15"  <%if( request.getAttribute("sid").equals("0")){out.print(" readonly");}%>>
                    </td>
                    <td>
                        <label for="" class="control-label x85">地区：</label>
                        <input type="text" name="peoples" id="peoples" value="${(course.peoples)}"   data-rule="required" size="15"  <%if( request.getAttribute("sid").equals("0")){out.print(" readonly");}%>>
                    </td>
                </tr>
                  <tr>
                <td> 
                        <label for="" class="control-label x85">总公司服务率:</label>
                        <input type="text" name="admin" id="admin" value="${(course.admin)}" data-rule="required" size="15"  <%if( request.getAttribute("sid").equals("0")){out.print(" readonly");}%>><span>%</span>
                 </td>
                 <td> 
                        <label for="" class="control-label x85">分公司服务率:</label>
                        <input type="text" name="filiale" id="filiale" value="${(course.filiale)}" data-rule="required" size="15"  <%if( request.getAttribute("sid").equals("0")){out.print(" readonly");}%>><span>%</span>
                 </td>
                 <td> 
                        <label for="" class="control-label x85">代理商服务费率:</label>
                        <input type="text" name="agent" id="agent" value="${(course.agent)}" data-rule="required" size="15"  <%if( request.getAttribute("sid").equals("0")){out.print(" readonly");}%>><span>%</span>
                 </td>
                 <td> 
                        <label for="" class="control-label x85">业务员服务费率:</label>
                        <input type="text" name="business" id="business" value="${(course.business)}" data-rule="required" size="15"  <%if( request.getAttribute("sid").equals("0")){out.print(" readonly");}%>><span>%</span>
                 </td>
                </tr>
                <tr>
                </tr>
                <tr>
                    <td>
                        <label for="" class="control-label x85">产品详情：</label>
                        <textarea name="summary" id="summary" data-toggle="" cols="60" rows="5"  data-rule="required" <%if( request.getAttribute("sid").equals("0")){out.print(" readonly");}%>>${(course.summary)}</textarea>
                    </td>
                   <%if( request.getAttribute("course")==null){%>
                     <td colspan="2">
                        <label class="control-label x85">课程照片：</label>
                        <div style="display: inline-block; vertical-align: middle;">
                            <div id="j_custom_pic_up" data-toggle="upload" data-uploader="/course/course_img" 
                                data-file-size-limit="1024000000"
                                data-file-type-exts="*.jpg;*.png;*.gif;*.mpg"
                                data-multi="true"
                                data-on-upload-success="pic_upload_success"
                                data-icon="cloud-upload"></div>
                            <input type="hidden" name="custom.pic" value="" id="j_custom_pic">
                            <span id="j_custom_span_pic"></span>
                        </div>
                    </td>
                    <%} else { %>
                       <td colspan="2">
                        <label class="control-label x85">课程照片：</label>
                        <img alt="" src="${(course.img)}" width="80" height="80">
                    </td>
                    <%} %>
                    
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