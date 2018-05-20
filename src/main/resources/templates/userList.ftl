<#import "parts/common.ftl" as c>



<@c.page>
List of user
<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Password</th>
            <th>Role</th>
            <th></th>
        </tr>
    </thead>
    <#list users as user>
        <tr>
            <td>${user.username}</td>
            <td>${user.password}</td>
            <td><#list user.roles as role>${role}<#sep>, </#list></td>
            <td><a href="/user/${user.id}">Edit</a></td>
        </tr>
    </#list>
</table>
</@c.page>