<%@ page language="java" isELIgnored="false" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登陆页面</title>

    <script type="text/javascript" src="/js/jquery.min.js"></script>

    <script>
        $(function () {
            $("#submitBtn").bind("click", function () {
                $.ajax({
                    url: '/toLogin',
                    type: 'POST',
                    data: {
                        "userName": $('#userName').val(),
                        "passWord": $('#passWord').val()
                    },
                    beforeSend: function () {
                        if ($('#userName').val() === '') {
                            alert("请输入用户名")
                        }
                        if ($('#passWord').val() === '') {
                            alert("请输入密码")
                        }
                    },
                    success: function (data) {
                        if (data.code === 0) {
                            window.location.href = '/resume/index';
                        } else {
                            alert(data.msg);
                        }
                    }
                })

            })
        })
    </script>
    <style>
        div {
            padding: 10px 10px 0 10px;
        }
    </style>
</head>
<body>
<div>
    <div>
        <h2>登陆</h2>
        <fieldset>
            用户名：<input type="text" name="userName" id="userName"/>
            <br/>
            &nbsp;&nbsp;&nbsp;密码：<input type="password" name="passWord" id="passWord"/>
            <br/>
            <input type="button" id="submitBtn" value="登陆"/>
        </fieldset>
    </div>
</div>
</body>
</html>