<%@ page language="java" isELIgnored="false" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<div id="createDialog" class="crudDialog">
    <form id="createForm" method="post">
        <div class="form-group">
            <label for="name">名称</label>
            <input id="name" type="text" class="form-control" name="name" maxlength="300">
        </div>
        <div class="form-group">
            <label for="address">地址</label>
            <input id="address" type="text" class="form-control" name="address" maxlength="300">
        </div>
        <div class="form-group">
            <label for="phone">联系方式</label>
            <input id="phone" type="text" class="form-control" name="phone" maxlength="300">
        </div>
        <div class="form-group text-right dialog-buttons">
            <a class="waves-effect waves-button" href="javascript:void (0);" onclick="createSubmit();">保存</a>
            <a class="waves-effect waves-button" href="javascript:void (0);" onclick="createDialog.close();">取消</a>
        </div>
    </form>
</div>
<script>
    function createSubmit() {
        $.ajax({
            type: 'post',
            url: '/resume/create',
            data: $('#createForm').serialize(),
            beforeSend: function () {
                if ($('#name').val() === '') {
                    $('#name').focus();
                    return false;
                }
            },
            success: function (data) {
                if (data.code === 0) {
                    createDialog.close();
                    $table.bootstrapTable('refresh');
                } else {
                    $.confirm({
                        theme: 'dark',
                        animation: 'rotateX',
                        closeAnimation: 'rotateX',
                        title: false,
                        content: data.msg,
                        buttons: {
                            confirm: {
                                text: '确认',
                                btnClass: 'waves-effect waves-button waves-light'
                            }
                        }
                    });
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                $.confirm({
                    theme: 'dark',
                    animation: 'rotateX',
                    closeAnimation: 'rotateX',
                    title: false,
                    content: textStatus,
                    buttons: {
                        confirm: {
                            text: '确认',
                            btnClass: 'waves-effect waves-button waves-light'
                        }
                    }
                });
            }
        });
    }
</script>