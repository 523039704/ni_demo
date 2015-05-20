<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="bjui-pageContent">
    <form action=""  class="pageForm" data-toggle="validate">
        <table class="table table-condensed table-hover">
            <tbody>
                <tr>
                    <td colspan="2" align="center"><h3>用户信息</h3></td>
                </tr>
                
                <tr>
                    <td>
                        <label for="nickname" class="control-label x90">昵称：</label>
                        <input type="text" name="nickname" id="nickname" value="${user.nickname}" data-rule="required;" size="20">
                    </td>
                    <td>
                        <label for="sex" class="control-label x85">性别：</label>
                        <input type="text" name="sex" id="sex" value="${user.sex}" data-rule="required;" size="20">
                    </td>
                </tr>
                <tr>
               		<td>
                        <label for="country" class="control-label x90">国家：</label>
                        <input type="text" name="country" id="country" value="${user.country}" data-rule="required;" size="20">
                    </td>
                    <td>
                        <label for="province" class="control-label x85">省：</label>
                        <input type="text" name="province" id="province" value="${user.province}" data-rule="required;" size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="city" class="control-label x90">市：</label>
                        <input type="text" name="city" id="city" value="${user.city}" data-rule="required;" size="20">
                    </td>
                    <td>
                        <label for="subscribe_time" class="control-label x85">关注时间：</label>
                        <input type="text" name="subscribe_time" id="subscribe_time" value="${user.subscribe_time}" data-rule="required;" size="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="subscribe_time" class="control-label x85">二维码：</label>
                        <img src="/decode/test.jpg" width="80px" height="80px">
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close">关闭</button></li>
    </ul>
</div>