 function showProcessList(id) {
        layer.open({
            type: 2,
            title: "投诉处理记录",
            shade: [0],
            area: ['600px', '400px'],
            anim: 2,
            content: ['${pageContext.request.contextPath}/user/complaint/getProcessLogList.do?complaintId='+id, 'no'], //iframe的url，no代表不显示滚动条
        });
    }

    function audit(id) {
        layer.open({
            type: 1,
            title : "投诉/申诉受理",
            area: ['600px', '300px'],
            content: $('#audit_form_container'),
            btn: ['提交', '取消'],
            scrollbar: false,
            yes : function(index,layero){

                var processResult = $("#audit_form_container select option:selected").val();
                var processReason = $("#audit_form_container textarea").val();

                if(!processResult || processResult == ""){
                    layer.msg("处理结论必须选择",{icon:2});
                    return false;
                }
                if(!processReason || processReason == ""){
                    layer.msg("处理原因必须输入",{icon:2});
                    return false;
                }

                $.post("${pageContext.request.contextPath}/manage/complaint/audit.do?",{id:id,processResult:processResult,processReason:processReason},function (result) {
                    if(result.success){
                       layer.msg(result.msg, {icon: 1,},
                    function(){
                            window.location.reload();
                            layer.close(index);
                        });
                    }
                    else {
                        layer.msg(result.msg, {icon: 2});
                    }
                })
            },
            btn2 : function (index,layero) {
                window.location.reload();
                layer.close(index);
            }
        });


    }