<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ attribute name="name" type="java.lang.String" required="true" description="隐藏域名称（ID）" %>
<%@ attribute name="value" type="java.lang.String"  required="true" description="隐藏域值（ID）" %>
<%@ attribute name="labelName" type="java.lang.String" required="true" description="输入框名称（Name）" %>
<%@ attribute name="labelValue" type="java.lang.String" required="true" description="输入框值（Name）" %>
<%@ attribute name="title" type="java.lang.String" required="true" description="选择框标题" %>
<%@ attribute name="url" type="java.lang.String" required="true" description="树结构数据地址" %>
<%@ attribute name="required" type="java.lang.String" required="false"  description="是否添加required" %>
<input id="treeId"  type="hidden" name="${name}"  value="${value}"/>
<input id="treeLabel"  type="text"  name="${labelName}" value="${labelValue}" class="form-control ${required}"  readonly/>
<span class="input-group-addon"><i class="fa fa-search"></i></span>

<div class="modal fade" id="treeModal" tabindex="-1" role="basic" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">${title}</h4>
            </div>
            <div class="modal-body modal-tree">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn green btn-sm" id="modal-clear">清空</button>
                <button type="button" class="btn dark btn-outline btn-sm" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<script>

    $("#treeLabel").click(function(){
        // 正常打开
        $("#treeModal").modal('show');
        $.getJSON("${url}",function(result){
            if(result.code == "0"){
                $(".modal-tree").jstree({
                    "core": {
                        "themes": {
                            "responsive": false
                        },
                        "data": result.data
                    },
                    "plugins": ["types"]
                });
            }
        });
        $('.modal-tree').bind("activate_node.jstree", function (obj, e) {
            // 获取当前节点
            var currentNode = e.node;
            $("#treeId").val(currentNode.id);
            $("#treeLabel").val(currentNode.text);
            $("#treeModal").modal('hide');
        });
    });

    $("#modal-clear").click(function(){
        $("#treeId").val("");
        $("#treeLabel").val("");
        $("#treeModal").modal('hide');
    });
</script>