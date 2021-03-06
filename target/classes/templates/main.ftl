<#import "parts/common.ftl" as c>


<@c.page>
<div class="form-row">
    <div class="form-group col-md-6">
        <form method="get" action="/main" class="form-inline">
            <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Search by tag">
            <button class="btn btn-primary ml-2" type="submit">Найти</button>
        </form>
    </div>
</div>
<a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Add new message
</a>
<div class="collapse" id="collapseExample">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" name="text" class="form-control" placeholder="Введите сообщение" />
            </div>
            <div class="form-group">
                <input type="text" name="tag" class="form-control" placeholder="Тэг">
            </div>
            <div class="custom-file">
                <input type="file" name="file" id="customFile">
                <label class="custom-file-label" for="customFile">Choose file</label>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <div class="form-group">
                <button class="btn btn-primary mt-2">Добавить</button>
            </div>
    </form>
    </div>
</div>
<div class="card-columns">
    <#list messages as message>
    <div class="card my-3">
        <div>
            <#if message.filename??>
                <img src="/img/${message.filename}" class="card-img-top">
            </#if>
        </div>
        <div class="m-2">
            <b>${message.id}</b>
            <span>${message.text}</span>
            <i>${message.tag}</i>
        </div>
        <div class="card-footer text-muted">
            <strong>${message.authorName}</strong>
        </div>
    </div>
    <#else>
    No message
    </#list>
</div>
</@c.page>