<%@ page contentType="text/html; charset=utf-8" %>
<div id="editDialog" class="crudDialog">
    <form id="editForm" method="post">
        <input id="id" type="hidden" name="id" value="${resume.id}">
        <div class="form-group">
            <label for="name">名称</label>
            <input id="name" type="text" class="form-control" name="name" maxlength="20" value="${resume.name}">
        </div>
        <div class="form-group">
            <label for="address">地址</label>
            <input id="address" type="text" class="form-control" name="address" maxlength="20"
                   value="${resume.address}">
        </div>
        <div class="form-group">
            <label for="phone">联系方式</label>
            <input id="phone" type="text" class="form-control" name="phone" maxlength="300" value="${resume.phone}">
        </div>
        <div class="form-group text-right dialog-buttons">
            <a class="waves-effect waves-button" href="javascript:void (0);" onclick="editSubmit();">保存</a>
            <a class="waves-effect waves-button" href="javascript:void (0);" onclick="editDialog.close();">取消</a>
        </div>
    </form>
</div>
<script>
    function editSubmit() {
        $.ajax({
            type: 'post',
            url: '/resume/edit/',
            data: $('#editForm').serialize(),
            beforeSend: function () {
                if ($('#name').val() === '') {
                    $('#name').focus();
                    return false;
                }
            },
            success: function (data) {
                if (data.code === 0) {
                    editDialog.close();
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