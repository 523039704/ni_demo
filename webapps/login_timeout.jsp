<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="bjui-pageContent">
    <form action="/login" data-toggle="validate" method="post">
        <hr>
        <div class="form-group">
            <label for="j_pwschange_oldpassword" class="control-label x85">用户名：</label>
            <input type="text" data-rule="required" name="name" value="" placeholder="用户名" size="20">
            <input type="hidden" data-rule="required" name="se" value="1" placeholder="用户名" size="20">
        </div>
        <div class="form-group">
            <label for="j_pwschange_oldpassword" class="control-label x85">密码：</label>
            <input type="password" data-rule="required" name="password" value="" placeholder="密码" size="20">
        </div>
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close">取消</button></li>
        <li><button type="submit" class="btn-default">提交</button></li>
    </ul>
</div>