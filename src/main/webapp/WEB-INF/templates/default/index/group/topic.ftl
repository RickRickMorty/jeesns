<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${groupTopic.title} - ${SITE_NAME} - Powered By JEESNS</title>
    <meta name="keywords" content="${SITE_KEYS}"/>
    <meta name="description" content="${SITE_DESCRIPTION}"/>
    <meta name="author" content="JEESNS"/>
    <link href="${base}/res/common/css/bootstrap.min.css" rel="stylesheet">
    <link href="${base}/res/common/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${base}/res/common/css/jeesns.css">
    <link rel="stylesheet" href="${base}/res/common/css/jeesns-skin.css">
    <!--[if lt IE 9]>
    <script src="${base}/res/common/js/html5shiv.min.js"></script>
    <script src="${base}/res/common/js/respond.min.js"></script>
    <![endif]-->
    <script src="${base}/res/common/js/jquery-2.1.1.min.js"></script>
    <script src="${base}/res/common/js/bootstrap.min.js"></script>
    <script src="${base}/res/plugins/layer/layer.js"></script>
    <script src="${base}/res/common/js/jquery.form.js"></script>
    <script src="${base}/res/common/js/jeesns.js"></script>
    <script>
        var base = "${base}";
        var groupTopicId = ${groupTopic.id};
    </script>
    <script src="${base}/res/modules/group.js"></script>
</head>

<body class="gray-bg">
<#include "/index/common/header.ftl"/>

<div class="wrapper wrapper-content article">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <ol class="breadcrumb">
                    <li><a href="${base}/">首页</a></li>
                    <li><a href="${base}/group/">群组</a></li>
                    <li><a href="${base}/group/detail/${groupTopic.group.id}">${groupTopic.group.name}</a></li>
                    <li class="active">${groupTopic.title}</li>
                </ol>
                <div class="ibox">
                    <div class="ibox-content">
                        <div class="pull-right">
                            <i class="fa fa-user"> </i> <a href="${base}/u/${groupTopic.member.id}">${groupTopic.member.name}</a>&nbsp;&nbsp;
                            <i class="fa fa-clock-o"></i> ${groupTopic.createTime?string('yyyy-MM-dd HH:mm')}&nbsp;&nbsp;
                            <i class="fa fa-eye"> </i> ${groupTopic.viewCount} 浏览
                        </div>
                        <div class="text-center groupTopic-title">
                            <h2>${groupTopic.title}</h2>
                        </div>
                        <div class="content"><p>${groupTopic.content}</p></div>
                        <div class="text-right">
                        <#if loginUser?? && loginUser.id==groupTopic.memberId>
                            <a href="${base}/group/topicEdit/${groupTopic.id}">编辑</a>
                        </#if>
                        <#if isPermission==1>
                            <a href="${base}/group/delete/${groupTopic.id}" confirm="确定要删除帖子吗？" target="_jeesnsLink">删除</a>
                        </#if>
                        </div>
                    </div>
                    <div class="ibox-content" id="comment">
                        <h3>评论</h3>
                        <hr>
                        <div class="row">
                            <div class="col-lg-12">
                                <form class="form-horizontal m-t jeesns_form" action="${base}/group/comment/${groupTopic.id}" method="post">
                                    <textarea rows="5" name="content" style="width:100%;" class="form-control" data-type="require" alt="评论内容"></textarea>
                                    <input type="submit" value="评论" class="pull-right btn btn-primary mg-t-10 jeesns-submit">
                                </form>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 mg-t-10" id="commentList">

                            </div>
                            <div class="col-lg-12 mg-t-10">
                                <button class="btn btn-primary btn-block m" id="moreComment" style="display: none"><i class="fa fa-arrow-down"></i> 加载更多</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<#include "/index/common/footer.ftl"/>
<script>
    $(document).ready(function () {
        var pageNo = 1;
        group.commentList(groupTopicId,pageNo);
        $("#moreComment").click(function () {
            pageNo ++;
            group.commentList(groupTopicId,pageNo);
        });
    });
</script>
</body>
</html>