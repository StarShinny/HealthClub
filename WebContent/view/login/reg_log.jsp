<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>健康俱乐部</title>
    <link rel="stylesheet" href="<%=request.getContextPath() + "/view/css/uikit.min.css"%>" />
    <link rel="stylesheet" href="<%=request.getContextPath() + "/view/css/notify.gradient.css"%>">
</head>

<body style="background-image: url(<%=request.getContextPath() + "/view/picture/background.jpg"%>); background-repeat: no-repeat; background-size: 1400px">
<div class="uk-grid" data-uk-grid-margin>
    <div class="uk-width-medium-2-6"><div class="uk-panel uk-panel-space"></div></div>
    <div class="uk-width-medium-3-6">
        <div class="uk-panel uk-panel-space" style="margin-top: 20%;">
            <!--<h3 class="uk-panel-title">Title</h3>-->
            <!--Lorem ipsum dolor sit amet, consectetur adipisicing elit. <code>.uk-panel-space</code>-->
            <div class="uk-form-row" style="padding-right: 100px;">
                	<img src="<%=request.getContextPath() + "/view/picture/health.png"%>" style="margin-right: 100px;">
                	</div>
                	
            <form class="uk-form" id="login" name="login" action="/HealthClub/view/login.action" method="post">
                <fieldset data-uk-margin>
                    <br>
                    <br>
                    <table class="uk-table" style="width: 280px;">
                        <tr class="uk-form-row">
                            <td class="uk-text-center">
                                <input type="text" name="user.name" placeholder="请输入用户名" autofocus required oninvalid="this.setCustomValidity('用户名不能为空.')">
                            </td>
                        </tr>
                        <tr class="uk-form-row">
                            <td class="uk-text-center">
                                <input type="password" name="user.password" placeholder="请输入密码" required oninvalid="this.setCustomValidity('密码不能为空.')">
                            </td>
                        </tr>
                        <tr class="uk-form-row">
                            <td class="uk-text-center">
                            	<select name="user.identity" id="user_identity">
								    <option value="1">会员</option>
								    <option value="2">俱乐部服务员</option>
								    <option value="3">俱乐部经理</option>
								</select>
                            </td>
                        </tr>
                        <tr class="uk-form-row">
                            <td class="uk-text-center">
                                <input class="uk-button uk-button-success uk-animation-fade" type="submit" value="登录"/>
                                <a class="uk-button uk-button-primary uk-animation-fade" href="#sign-up" data-uk-modal><i class="uk-icon-male"></i>注册</a>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </form>

            <!-- This is the modal -->
            <div id="sign-up" class="uk-modal">
                <div class="uk-modal-dialog uk-modal-dialog-slide">
                    <a href="" class="uk-modal-close uk-close"></a>
                    
                    <form id="register" name="register" action="/HealthClub/view/register.action" method="post">
                        <table class="uk-table">
                            <tr>
                                <td></td>
                                <td>
                                    填写您的注册信息
                                </td>
                            </tr>
                            <tr>
                                <td>用户名：</td>
                                <td><input type="text" name="user.name" class="uk-form-control" placeholder="请输入用户名" required oninvalid="this.setCustomValidity('用户名不能为空.')"></td>
                            </tr>
                            <tr>
                                <td>密码：</td>
                                <td><input type="password" name="user.password" class="uk-form-control" placeholder="请输入密码" required oninvalid="this.setCustomValidity('别忘了填写密码')"></td>
                            </tr>
                            <tr>
                                <td>确认密码：</td>
                                <td><input type="password" class="uk-form-control" placeholder="请确认密码" required oninvalid="this.setCustomValidity('请确认一下密码')"></td>
                            </tr>
                            <tr>
                                <td>性别：</td>
							    <td>
									<input type="radio" name="user.gender" id="register_user_gender男" value="男" checked/><label for="register_user_gender男">男</label>
									<input type="radio" name="user.gender" id="register_user_gender女" value="女"/><label for="register_user_gender女">女</label>
							    </td>
							</tr>
                            <tr>
                                <td>年龄：</td>
                                <td><input type="number" name="user.age" class="uk-form-control" value="20" min="18" step="1" required oninvalid="this.setCustomValidity('您的年龄')"></td>
                            </tr>
                            <tr>
                                <td>居住地：</td>
                                <td><input type="text" name="user.residence" class="uk-form-control" placeholder="请输入居住地" required oninvalid="this.setCustomValidity('您的居住地')"></td>
                            </tr>
                            <tr>
                                <td>办卡类型：</td>
                                <td>
									<input type="radio" name="user.card_type" id="register_user_card_type1" value="1" checked/><label for="register_user_card_type1">会员卡</label>
									<input type="radio" name="user.card_type" id="register_user_card_type2" value="2"/><label for="register_user_card_type2">家庭卡</label>
								</td>
                            </tr>
                            <tr>
                                <td>
                                    <button type="button" id="notify_info_btn" class="uk-button uk-width-1-1" data-message="" disabled data-title="注册须知">注册须知</button>
                                </td>
                                <td>
                                    <input id="notify_confirm" type="checkbox"> 我已阅读须知, 确认注册.
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <button id="reg_submit_btn" class="uk-button uk-button-success" disabled type="submit">注册</button>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="uk-width-medium-1-6"><div class="uk-panel uk-panel-space"></div></div>
</div>
<script type="text/javascript" src="<%=request.getContextPath() + "/view/js/jquery.js"%>"></script>
<script type="text/javascript" src="<%=request.getContextPath() + "/view/js/uikit.min.js"%>"></script>
<script type="text/javascript" src="<%=request.getContextPath() + "/view/js/notify.js"%>"></script>
<script type="text/javascript">
    $(function(){
        // 阅读须知的设置.
        $("body").on("click", ".uk-button[data-message]", function(){
            var icon = "<i class='uk-icon-info-circle'></i>";
            var title = $(this).data().title + "<br>";
            var info = $(this).data().message;
            var footer = "<p class='uk-h6'>阅读完后,点击即退出.</p>";

            $.UIkit.notify(
                    icon + title + info + footer,
                    {
                        // 停留位置
                        pos:"bottom-center",
                        // 窗口停留时长
                        timeout: 20 * 1000
                    });
        });

        // 获得注册须知.
        $.getJSON("<%=request.getContextPath()+"/view/js/notify_info.json"%>", function(data) {
            var notify_btn = $('#notify_info_btn')[0];
            notify_btn.setAttribute("data-message", data.content);
            notify_btn.disabled = !notify_btn.disabled;
        });

        // 确认须知之后，点击确认才能注册
        $('#notify_confirm')[0].onclick = function() {
            var reg_submit_btn = $('#reg_submit_btn')[0];
            reg_submit_btn.disabled = !reg_submit_btn.disabled;
        };
    });
</script>
</body>
</html>