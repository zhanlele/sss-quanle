<%@ page language="java" isELIgnored="false" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>简历列表</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/waves.min.css"/>
    <link rel="stylesheet" href="/css/admin.css"/>
    <link rel="stylesheet" href="/css/material-design-iconic-font.min.css"/>
    <link rel="stylesheet" href="/css/bootstrap-table.min.css"/>
    <link rel="stylesheet" href="/css/jquery-confirm.min.css"/>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap-table.min.js"></script>
    <script type="text/javascript" src="/js/jquery-confirm.min.js"></script>
</head>
<body>
<div id="main">
    <div id="toolbar">
        <a class="waves-effect waves-button" href="javascript:void (0);"
           onclick="createResume()"><i class="zmdi zmdi-plus"></i>
            新增简历</a>
    </div>
    <table id="table"></table>
</div>
<script>
    var $table = $('#table');
    $(function () {
        // bootstrap table初始化
        $table.bootstrapTable({
            url: '/resume/list',
            queryParams: getQueryParam,
            height: getHeight(),
            sidePagination: 'server',
            pagination: true,
            pageNumber: 1,
            pageSize: 10,
            pageList: [10, 25, 50, 100],
            toolbar: '#toolbar',
            columns: [
                {field: 'ck', checkbox: true},
                {field: 'name', title: '名字'},
                {field: 'address', title: '地址'},
                {field: 'phone', title: '联系方式'},
                {
                    field: 'action',
                    title: '操作',
                    align: 'center',
                    formatter: 'actionFormatter',
                    clickToSelect: false
                }
            ]
        });
    });

    // 格式化操作按钮
    function actionFormatter(value, row, index) {
        return [
            '<a class="edit" href="javascript:;" onclick="editResume(' + row.id + ')" data-toggle="tooltip"  title="修改"><i class="glyphicon glyphicon-edit"></i></a>　',
            '<a class="delete" href="javascript:;" onclick="deleteResume(' + row.id + ')" data-toggle="tooltip"  title="删除"><i class="glyphicon glyphicon-remove"></i></a>'
        ].join('');
    }

    function getQueryParam() {
        return {
            pageNo: this.pageNumber,
            pageSize: this.pageSize,
        };
    }

    // 动态高度
    function getHeight() {
        return $(window).height() - 20;
    }

    var createDialog;

    function createResume() {
        createDialog = $.dialog({
            animationSpeed: 300,
            title: '新增简历',
            content: 'url:/resume/create',
            onContentReady: function () {
                initMaterialInput();
            }
        });
    }

    var editDialog;

    function editResume(id) {
        editDialog = $.dialog({
            animationSpeed: 300,
            title: '编辑简历',
            content: 'url:/resume/edit/' + id,
            onContentReady: function () {
                initMaterialInput();
            }
        });
    }

    function deleteResume(id) {
        var deleteDialog = $.confirm({
            type: 'red',
            animationSpeed: 300,
            title: false,
            content: '确认删除该简历吗？',
            buttons: {
                confirm: {
                    text: '确认',
                    btnClass: 'waves-effect waves-button',
                    action: function () {
                        $.ajax({
                            type: 'get',
                            url: '/resume/delete/' + id,
                            success: function (data) {
                                if (data.code === 0) {
                                    deleteDialog.close();
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
                },
                cancel: {
                    text: '取消',
                    btnClass: 'waves-effect waves-button'
                }
            }
        });
    }

    function initMaterialInput() {
        $('form input[type="text"]').each(function () {
            if ($(this).val() !== '') {
                $(this).parent().find('label').addClass('active');
            }
        });
    }
</script>
</body>
</html>