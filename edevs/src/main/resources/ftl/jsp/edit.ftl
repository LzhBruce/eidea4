<%--
User: ${user}
Date: ${datetime}
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/inc/taglib.jsp" %>
<div class="container-fluid" ng-controller="editCtrl">
    <div class="page-header">
        <ol class="breadcrumb">
            <li><a href="javascript:;"><i class="icon-fire"></i><eidea:label key="${model?uncap_first}.title"/></a></li>
        </ol>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <br>
            <form role="form" name="editForm" novalidate  ng-submit="save()">
                <#list propertyList as prop>
                <div class="form-group">
                    <label for="${prop.prop}" ><%--${prop.label}--%><eidea:label key="${prop.propertyLabel}"/></label>
                       <#if prop.booleanTag>
                            <input id="${prop.prop}" type="checkbox"  ng-true-value="'Y'" ng-false-value="'N'" ng-model="${model?uncap_first}Po.${prop.prop}">
                        <#else>
                        <#if prop.inputType==3>
                        <div class=" input-group date bootstrap-date">
                            <input type="text" class="form-control" id="${prop.prop}" placeholder="<eidea:message key="common.please.input"><eidea:param value="${prop.propertyLabel}" type="label"/></eidea:message>" ng-model="${model?uncap_first}Po.${prop.prop}"
                             uib-datepicker-popup="yyyy-MM-dd">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                        </div>
                            <#elseif  prop.inputType==4>
                            <div class="input-group date bootstrap-datetime">
                                <input type="text" class="form-control" id="${prop.prop}" placeholder="<eidea:message key="common.please.input"><eidea:param value="${prop.propertyLabel}" type="label"/></eidea:message>" ng-model="${model?uncap_first}Po.${prop.prop}"
                                uib-datepicker-popup="yyyy-MM-dd HH:mm:ss">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                            </div>
                        <#else>
                            <input type="text" class="form-control" id="${prop.prop}" placeholder="<eidea:message key="common.please.input"><eidea:param value="${prop.propertyLabel}" type="label"/></eidea:message>" ng-model="${model?uncap_first}Po.${prop.prop}" >
                        </#if>

                        </#if>
                </div>
                    </#list>


                <div class="form-group">
                    <p class="text-right">
                        <button type="reset" ng-click="create()"  class="btn btn-default btn-sm" ng-show="canAdd"><%--新建--%><eidea:label key="common.button.create"/></button>
                        <button type="submit" class="btn btn-default btn-sm" ng-show="canSave"><%--保存--%><eidea:label key="common.button.save"/></button>
                        <a href="#/list" class="btn btn-default btn-sm"><%--返回--%><eidea:label key="common.button.back"/></a>
                    </p>
                </div>
                <div class="form-group">
                    <p class="text-center" style="color: red">
                        {{message}}
                    </p>
                    <p>
                        <span ng-repeat="error in errors track by $index">
                            {{error.message}}
                        </span>
                    </p>
                </div>
            </form>
        </div>
    </div>
</div>